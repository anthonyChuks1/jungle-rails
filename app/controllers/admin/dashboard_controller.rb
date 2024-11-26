
class Admin::DashboardController < ApplicationController  
  before_action :authenticate

  private

  def authenticate
    http_basic_authenticate_with(name:"Jungle", password:"book")
  end
  def show
  end
end
