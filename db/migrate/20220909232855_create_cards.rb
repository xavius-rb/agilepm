class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.references :project, null: false, foreign_key: true
      t.string :code, index: true
      t.string :summary
      t.string :state, index: true

      t.timestamps
    end
  end
end
