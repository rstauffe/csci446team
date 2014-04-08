class Selection < ActiveRecord::Base
	has_many :adopted_pets, dependent: :destroy
  
  def add_cat(cat_id)
  	#Find the cat in the database if it exists
  	current_cat = adopted_pets.find_by(cat_id: cat_id)
  	#If the cat doesn't exist in the database, build it.
  	#If the cat already exists, don't do anything. You can only consdier one pet.
    unless current_cat
    	current_cat = adopted_pets.build(cat_id: cat_id)
    end
 end

end
