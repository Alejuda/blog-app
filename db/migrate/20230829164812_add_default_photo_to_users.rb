class AddDefaultPhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, default: "https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder.jpg"
  end
end
