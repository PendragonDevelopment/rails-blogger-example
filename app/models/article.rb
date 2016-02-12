# == Schema Information
#
# Table name: articles
#
#  id                      :integer          not null, primary key
#  title                   :string
#  body                    :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  blog_image_file_name    :string
#  blog_image_content_type :string
#  blog_image_file_size    :integer
#  blog_image_updated_at   :datetime
#

class Article < ActiveRecord::Base

  has_many :taggings
  has_many :tags, through: :taggings
  has_attached_file :blog_image, styles: {
                                          medium: "300x300", thumb: "100x100>" },
                                          default_url: "/images/:style/missing.png"

  validates_attachment_content_type :blog_image, content_type: /\Aimage\/.*\Z/

  validates_presence_of :title

  def tag_list
    tags.collect {|tag| tag.name }.join(', ')
  end

  def tag_list=(tag_strings)
    tag_names = tag_strings.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
