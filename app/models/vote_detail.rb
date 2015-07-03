class VoteDetail
  include Mongoid::Document
  belongs_to :question
 
  field :yes,         type: Boolean
  #field :no,          type: Integer, default: 0
end
