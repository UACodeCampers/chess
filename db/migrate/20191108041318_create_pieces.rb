class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :x_position 
      t.integer :y_position 
      t.integer :starting_position_x
      t.integer :starting_position_y 

      t.string :piece_type
      t.string :color 
      t.integer :game_id 
      t.boolean :captured? 
   
      t.timestamps
    end
  end
end
