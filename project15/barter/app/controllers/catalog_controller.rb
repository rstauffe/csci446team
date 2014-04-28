class CatalogController < ApplicationController
  skip_before_filter :require_login
  def index
    @items = Item.order(:name)
  end
end
