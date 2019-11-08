class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :x_position 
      t.integer :y_position 
      t.string :piece_type
      t.string :color 
      t.integer :game_id 
      t.boolean :captured? 
      t.datetime :created_at 
      t.datetime :updated_at 
      t.timestamps
    end
  end
end
