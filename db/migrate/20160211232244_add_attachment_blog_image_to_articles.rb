class AddAttachmentBlogImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :blog_image
    end
  end

  def self.down
    remove_attachment :articles, :blog_image
  end
end
