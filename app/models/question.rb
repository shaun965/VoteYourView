class Question
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  belongs_to :category#, index: true
  has_many :vote_details, dependent: :destroy
  has_many :comments, dependent: :destroy

  field :text,            type: String
  #field :category,        type: String



end
