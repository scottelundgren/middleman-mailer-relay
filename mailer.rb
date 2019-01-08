require 'uri'
require 'sinatra'
require 'pony'
require 'dotenv/deployment'

before do
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
end

whitelist = URI.extract(ENV['WHITELIST'])

set :protection, :origin_whitelist => whitelist

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => ENV['SMTP_HOST'],
    :port => ENV['SMTP_PORT'],
    :domain => URI.parse(whitelist.first).host,
    :user_name => ENV['SMTP_USERNAME'],
    :password => ENV['SMTP_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

get '/' do
  redirect URI.parse(whitelist.first)
end

post '/' do
  email = ""
  params.each do |value|
    # honeypot field to prevent spam
    if value[0] == 'zipcode'
      if value[1].present?
        return #bot filled in invisible field, do not send email
      else
        next #field is empty, send but do not include this one
      end
    else
    email += "#{value[0]}: #{value[1]}\n"
  end
  puts email
  Pony.mail(
    :to => ENV['RECIPIENTS'],
    :from => ENV['SENDER'],
    :subject => ENV['SUBJECT'],
    :body => email
  )
end
