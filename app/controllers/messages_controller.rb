class MessagesController < ApplicationController
  def index
    @message = Message.new
  end

  def create
    message = Message.new(params[:contact_form])

    if message.valid?
      if message.deliver
        redirect_to root_path, :notice => 'Message has been sent.'
      else
        redirect_to root_path, :notice => 'Message could not be sent. Try emailing arthackday@gmail.com for now.'
      end
    else
      # todo: error message display
    end
  end
end