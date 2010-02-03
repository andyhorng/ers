class Post < ActiveRecord::Base
  named_scope :post_type, lambda {|type| {:conditions => {:post_type => type} } } 
end
