# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

boards = [
  { title: "Work",  color: "bg-orange-500" },
  { title: "Personal", color: "bg-green-500" }
]

lane_titles = [ 'To Do', 'In Progress', 'Review', 'Test', 'Blocked', 'Ready to Release', 'Done' ]
task_count = 0

boards.each do |b|
  board = Board.create!(b)
  lane_titles.each_with_index do |title, i|
    lane = board.lanes.create!(title:, position: i)
    3.times do |j|
      task_count += 1
      lane.cards.create!(
        title: "#{b[:title]} task #{task_count}",
        description: "Short description for #{b[:title].downcase} task #{task_count}",
        position: j
      )
    end
  end
end
