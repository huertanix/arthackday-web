class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])

    if @message.valid?
      if @message.deliver
        redirect_to root_path, :notice => 'Message has been sent.'
      else
        redirect_to root_path, :notice => 'Message could not be sent. Try emailing arthackday@gmail.com for now.'
      end
    else
      render 'index'
    end
  end
end