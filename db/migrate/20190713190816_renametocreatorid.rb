class Renametocreatorid < ActiveRecord::Migration[6.0]
  def change
    change_table :events do |t|
      t.rename :users_id, :creator_id
    end
  end
end
