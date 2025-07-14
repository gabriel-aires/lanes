require 'rails_helper'

RSpec.describe DeleteArchivedCardsJob, type: :job do
  before do
    board = Board.create!(title: 'test_board')
    lane = board.lanes.create!(title: 'test_lane')
    %w[a b c d].each_with_index { |title, position| lane.cards.create!(title:, position:) }
    Card.where(title: %w[c d]).update_all(archived_at: Time.current)
  end

  it 'deletes archived cards' do
    expect(Rails.logger).to receive(:info).with /Deleted 2 archived tasks/
    expect { described_class.new.perform }.to change(Card, :count).by(-2)
  end
end
