class VoteDetail
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :question
  #validates :ip, uniqueness: {scope: [:question]}

  field :yes,         type: Boolean
  field :ip,          type: String
  field :seen,        type: Boolean, default: false

end
