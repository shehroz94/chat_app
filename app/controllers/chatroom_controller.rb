class ChatroomController < ApplicationController
  
  before_action :required_user
  
  
  def index
    @message = Message.new
    @messages = Message.all
  end


end