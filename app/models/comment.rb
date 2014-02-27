class Comment < ActiveRecord::Base
  belongs_to :model
  belongs_to :post
end
