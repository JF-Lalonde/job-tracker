class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :jobs, :categories
  end
end
