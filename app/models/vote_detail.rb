class VoteDetail
  include Mongoid::Document
  belongs_to :question
 
  field :yes,         type: Boolean
  field :ip,          type: String

end
