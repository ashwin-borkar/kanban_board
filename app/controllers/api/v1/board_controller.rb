class Api::V1::BoardController < ApplicationController
  def state
    columns = Column.ordered.includes(:cards)
    render json: columns, include: :cards
  end

  def state_at
    timestamp = Time.parse(params[:timestamp])
    
    # Get all events up to the timestamp
    events = BoardEvent.before_timestamp(timestamp).chronological
    
    # Start with current state and apply events in reverse to reconstruct past state
    # Actually, we need to apply events forward from the beginning
    # But since we want the state at a specific timestamp, we need to find the last state
    
    # Better approach: Get all cards that existed at that time
    # and reconstruct their state based on events
    
    reconstructed_state = reconstruct_state_at(timestamp)
    
    render json: reconstructed_state
  end

  def events
    limit = params[:limit] || 50
    events = BoardEvent.chronological.limit(limit)
    render json: events
  end

  private

  def reconstruct_state_at(timestamp)
    # Get all cards that existed at the timestamp
    # A card existed if it was created before timestamp and not deleted before timestamp
    
    card_states = {}
    
    # Get all events up to timestamp
    events = BoardEvent.before_timestamp(timestamp).chronological
    
    events.each do |event|
      card_id = event.card_id
      
      case event.event_type
      when 'card_created'
        card_states[card_id] = {
          id: card_id,
          title: event.new_title,
          description: event.new_description,
          column_id: event.column_to_id,
          position: event.new_position
        }
      when 'card_updated'
        if card_states[card_id]
          card_states[card_id][:title] = event.new_title
          card_states[card_id][:description] = event.new_description
        end
      when 'card_moved'
        if card_states[card_id]
          card_states[card_id][:column_id] = event.column_to_id
          card_states[card_id][:position] = event.new_position
        end
      when 'card_reordered'
        if card_states[card_id]
          card_states[card_id][:position] = event.new_position
        end
      when 'card_deleted'
        card_states.delete(card_id)
      end
    end
    
    # Group cards by column
    columns = Column.ordered
    columns_with_cards = columns.map do |column|
      {
        id: column.id,
        name: column.name,
        position: column.position,
        cards: card_states.values.select { |card| card[:column_id] == column.id }.sort_by { |card| card[:position] }
      }
    end
    
    columns_with_cards
  end
end
