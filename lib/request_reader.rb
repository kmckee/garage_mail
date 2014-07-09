class RequestReader
  def initialize
    Mail.defaults do
      retriever_method :pop3, :address    => "pop.gmail.com",
        :port       => 995,
        :user_name  => Secrets::GmailUsername,
        :password   => Secrets::GmailPassword,
        :enable_ssl => true
    end
  end
  def get_latest_request
    latest_email = Mail.all.last
    latest_email = nil if latest_email == [] # for some reason this is an empty array sometimes...
    latest_email != nil ? latest_email.subject : nil
  end
end
