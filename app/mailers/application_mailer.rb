class ApplicationMailer < ActionMailer::Base
  default from: 'https://api-immocoin.herokuapp.com'
  layout 'mailer'
end
