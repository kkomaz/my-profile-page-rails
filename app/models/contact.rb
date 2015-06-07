class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\\-])@([\w\-]\.)([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true #for spam bots

  def headers
    {
        :subject => "Contact Form",
        :to => "leeajl006@gmail.com",
        :from => %("#{name}" <#{email}>)
    }
  end
end