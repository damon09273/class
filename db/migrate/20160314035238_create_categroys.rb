class CreateCategroys < ActiveRecord::Migration
  def change
    create_table :categroys do |t|
			t.string :name
			t.integer :position
			t.timetamps
	end

	add_column :events, :categroy_id, :integer
	# 在哪一個table加column
	add_index :events, :categroy_id
  end
end
