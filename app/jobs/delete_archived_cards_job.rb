require "sidekiq-scheduler"

class DeleteArchivedCardsJob < ApplicationJob
  def perform
    count = Card.archived.delete_all
    Rails.logger.info "Deleted #{count} archived tasks."
  end
end
