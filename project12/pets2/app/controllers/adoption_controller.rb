class AdoptionController < ApplicationController
  skip_before_filter :require_login
  include CurrentSelection
  before_action :set_selection
  def index
		@cats = Cat.order(:name)
  end
end
