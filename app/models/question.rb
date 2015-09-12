class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :category#, index: true
  has_many :vote_details, dependent: :destroy
  has_many :comments, dependent: :destroy
  paginates_per 10

  acts_as_token_authenticatable
  field :authentication_token

  field :text,            type: String
  field :vote_count,      type: Integer
  field :vote_count_last_seen,    type: Integer, default: 0
  #field :category,        type: String



end
