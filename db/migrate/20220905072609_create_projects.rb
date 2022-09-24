class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :code, index: true
      t.bigint :card_count, index: true, default: 0

      t.timestamps
    end
  end
end
