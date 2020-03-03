class AddBioAndWeblinkToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :text
    add_column :users, :weblink, :string
  end
end
