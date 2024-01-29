class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :desc
      t.boolean :is_done, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
