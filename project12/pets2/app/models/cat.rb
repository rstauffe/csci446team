class Cat < ActiveRecord::Base
  STATUS_TYPES = ['Available', 'Fostered']
  	#these will validate that the cats that are being created by users have the correct pararmeters
	validates :name, :breed, :description, :image_url, :status, presence: true
	validates :description, uniqueness: true
	#allow us to check to make sure that the image is a gif, jpg, or png
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'must be a URL for GIF, JPG, or PNG image.'
	}
  validates :status, inclusion: STATUS_TYPES
	
	has_many :adopted_pets
	
	before_destroy :ensure_not_referenced_by_any_adopted_pet

	#Add the new instance of the cat to the list of cats
  def self.latest
    Cat.order(:updated_at).last
  end
  
  private
  	#This makes sure that an instznce of a cat is not already inside of the db
	def ensure_not_referenced_by_any_adopted_pet
		if adopted_pets.empty?
			return true
		else
			errors.add(:base, 'Adopted pets present')
			return false
		end
	end
end
