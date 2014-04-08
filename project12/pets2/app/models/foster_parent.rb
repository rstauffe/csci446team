class FosterParent < ActiveRecord::Base
	#Make the variables accessable so that we can fill our forms with them
  validates :name, :address, :email, presence: true
end
