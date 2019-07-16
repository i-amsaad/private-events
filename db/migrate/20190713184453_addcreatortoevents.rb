class Addcreatortoevents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :users, foreign_key: true
  end
end
