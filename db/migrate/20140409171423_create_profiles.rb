class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :picture
      t.string :avatar

      t.timestamps
    end
  end
end
