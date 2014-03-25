class Selection < ActiveRecord::Base
	has_many :adopted_pets, dependent: :destroy
  
  def add_cat(cat_id)
  	current_cat = adopted_pets.find_by(cat_id: cat_id)
    unless current_cat
    	current_cat = adopted_pets.build(cat_id: cat_id)
    end
 end

end
