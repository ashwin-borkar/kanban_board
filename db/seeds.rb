# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create the 5 required columns
columns_data = [
  { name: 'Backlog', position: 1 },
  { name: 'To Do', position: 2 },
  { name: 'In Progress', position: 3 },
  { name: 'In Review', position: 4 },
  { name: 'Done', position: 5 }
]

columns_data.each do |column_data|
  Column.find_or_create_by!(name: column_data[:name]) do |column|
    column.position = column_data[:position]
  end
end
