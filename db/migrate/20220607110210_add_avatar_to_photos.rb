class AddAvatarToPhotos < ActiveRecord::Migration[5.2]
 def up
    add_attachment :photos, :avatar
  end
 
  def down
    remove_attachment :photos, :avatar
  end
 end
