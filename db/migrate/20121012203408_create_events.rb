class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.string :type
      t.string :state, :default => "pending"
      t.string :title
      t.string :topic
      t.string :host
      t.text :description
      t.datetime :begins_at, :null => true
      t.datetime :ends_at, :null => true
      t.integer :hours
      t.string :hours_per, :default => "week"
      t.string :availability
      t.datetime :registration_ends_at
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.boolean :location_private
      t.boolean :location_varies
      t.integer :age_min
      t.integer :age_max
      t.integer :registration_min
      t.integer :registration_max
      t.timestamps
    end
  end
end
