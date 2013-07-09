class Member < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many  :contents
  has_many  :photos

end
