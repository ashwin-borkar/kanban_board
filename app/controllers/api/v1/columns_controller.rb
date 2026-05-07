class Api::V1::ColumnsController < ApplicationController
  def index
    columns = Column.ordered
    render json: columns
  end
end
