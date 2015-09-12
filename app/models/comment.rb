class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  acts_as_token_authenticatable
  field :authentication_token

  belongs_to :question
  belongs_to :user

  field :text,          type: String

end
