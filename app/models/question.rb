class Question
  include Mongoid::Document
  belongs_to :user
  has_many :vote_details, dependent: :destroy

  field :text,            type: String
  field :category,        type: String



end
