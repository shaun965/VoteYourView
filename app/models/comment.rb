class Comment
  include Mongoid::Document
  belongs_to :question
  belongs_to :user
 
  field :text,          type: String

end
