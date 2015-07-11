class VoteDetail
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :question

  field :yes,         type: Boolean
  field :ip,          type: String

end
