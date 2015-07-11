class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :question
  belongs_to :user

  field :text,          type: String

end
