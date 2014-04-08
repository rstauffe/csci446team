class AdoptedPet < ActiveRecord::Base
	belongs_to :cat
	belongs_to :selection
  #allows for the promary if and the foriegn key to be accessed from other classess which will allow us to get the cat to be viewable
  attr_accessible :cat_id, :selection_id
end
