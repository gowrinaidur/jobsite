class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.integer :status
      t.timestamps
    end
  end
end
