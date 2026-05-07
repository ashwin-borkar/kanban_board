class Api::V1::CardsController < ApplicationController
  before_action :set_card, only: [:update, :destroy, :move, :reorder]

  def index
    cards = Card.includes(:column).ordered
    render json: cards
  end

  def create
    @card = Card.new(card_params)
    
    if @card.save
      BoardEvent.create!(
        event_type: 'card_created',
        card: @card,
        column_from: @card.column,
        column_to: @card.column,
        old_position: nil,
        new_position: @card.position,
        old_title: nil,
        new_title: @card.title,
        old_description: nil,
        new_description: @card.description,
        timestamp: Time.current
      )
      render json: @card, status: :created
    else
      render json: { errors: @card.errors }, status: :unprocessable_entity
    end
  end

  def update
    old_title = @card.title
    old_description = @card.description

    if @card.update(card_params)
      BoardEvent.create!(
        event_type: 'card_updated',
        card: @card,
        column_from: @card.column,
        column_to: @card.column,
        old_position: @card.position,
        new_position: @card.position,
        old_title: old_title,
        new_title: @card.title,
        old_description: old_description,
        new_description: @card.description,
        timestamp: Time.current
      )
      render json: @card
    else
      render json: { errors: @card.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    column_id = @card.column_id
    position = @card.position
    title = @card.title
    description = @card.description

    BoardEvent.create!(
      event_type: 'card_deleted',
      card_id: @card.id,
      column_from_id: column_id,
      column_to_id: column_id,
      old_position: position,
      new_position: nil,
      old_title: title,
      new_title: nil,
      old_description: description,
      new_description: nil,
      timestamp: Time.current
    )
    
    @card.destroy

    head :no_content
  end

  def move
    to_column = Column.find(params[:column_id])
    old_column = @card.column
    old_position = @card.position
    new_position = params[:position] || @card.position

    if @card.update(column: to_column, position: new_position)
      BoardEvent.create!(
        event_type: 'card_moved',
        card: @card,
        column_from: old_column,
        column_to: to_column,
        old_position: old_position,
        new_position: new_position,
        old_title: @card.title,
        new_title: @card.title,
        old_description: @card.description,
        new_description: @card.description,
        timestamp: Time.current
      )
      render json: @card
    else
      render json: { errors: @card.errors }, status: :unprocessable_entity
    end
  end

  def reorder
    old_position = @card.position
    new_position = params[:position]

    if @card.update(position: new_position)
      BoardEvent.create!(
        event_type: 'card_reordered',
        card: @card,
        column_from: @card.column,
        column_to: @card.column,
        old_position: old_position,
        new_position: new_position,
        old_title: @card.title,
        new_title: @card.title,
        old_description: @card.description,
        new_description: @card.description,
        timestamp: Time.current
      )
      render json: @card
    else
      render json: { errors: @card.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :description, :column_id, :position)
  end
end
