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

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
