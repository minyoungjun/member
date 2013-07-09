class Content < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to  :member

end
