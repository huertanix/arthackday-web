class Message < MailForm::Base
  attribute :email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :subject, :validate => true
  attribute :body, :validate => true

  #attr_accessible :email, :subject, :body

  def headers
    {
      :subject => %(#{subject}),
      :to => "arthackday@gmail.com",
      :from => %(#{email})
    }
  end
end