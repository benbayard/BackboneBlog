class AddAttachmentToPost < ActiveRecord::Migration
  def change
    add_attachment :posts, :flair
  end
end
