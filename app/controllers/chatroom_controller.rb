class ChatroomController < ApplicationController
  
  before_action :required_user
  
  
  def index
    @messages = Message.all
  end


end