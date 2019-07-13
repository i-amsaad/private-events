class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
    	t.date :date, :null => false 
    	t.text :description, :null => false 
    	t.timestamps
    end
  end
end
