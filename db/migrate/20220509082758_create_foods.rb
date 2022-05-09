class CraeteFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.postion :position
      t.integer :size
    end
  end
end
