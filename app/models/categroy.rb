class Categroy < ActiveRecord::Base
	def change
		create_table:categories do |t|
			t.string :name
			t.integer :position
			t.timetamps
		end

		add_column :events, :categroy_id, :integer
		add_index :events, :categroy_id
	end

end
