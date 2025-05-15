class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:collection, :contact]

  def index
  end

  def collection
  end

  def contact
  end
end
