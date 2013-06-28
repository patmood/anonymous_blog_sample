class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |f|
      f.string  :name
    end
  end
end
