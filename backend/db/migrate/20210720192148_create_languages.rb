class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :name
      t.integer :course_id
    end
  end
end
