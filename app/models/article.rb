# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base

  has_many :taggings
  has_many :tags, through: :taggings

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
