require 'sinatra'
require 'pony'

before do
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
end

whitelist = ENV['WHITELIST'].split

set :protection, :origin_whitelist => whitelist

Pony.options = {
  :via => :smtp,
  :via_options => {
    :address => ENV['HOST'],
    :port => ENV['PORT'],
    :domain => ENV['DOMAIN'],
    :user_name => ENV['USERNAME'],
    :password => ENV['PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
}

get '/' do
  'you have reached the test!'
end

post '/' do
  email = ""
  params.each do |value|
    email += "#{value[0]}: #{value[1]}\n"
  end
  puts email
  Pony.mail(
    :to => ENV['RECIPIENTS'],
    :from => ENV['FROM'],
    :subject => ENV['SUBJECT'],
    :body => email
  )
end
