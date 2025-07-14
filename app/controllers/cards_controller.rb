class CardsController < ApplicationController
  before_action :set_card, only: %i[edit update archive]

  def create
    @card = Card.create!(card_params.merge(position: Card.count))
    redirect_to board_path(@card.board)
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to board_path(@card.board)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def archive
    @card.update!(archived_at: Time.current)
    redirect_to board_path(@card.board)
  end

  def sort
    lane = Lane.find(params[:lane_id])

    params[:ids].each_with_index do |card_id, position|
      card = Card.find(card_id)
      card.update!(position:, lane_id: lane.id)
    end

    head :ok
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:lane_id, :title, :description)
  end
end
