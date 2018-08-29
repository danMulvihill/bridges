require "sinatra"
require "sendgrid-ruby"

get "/" do 
    erb :home, layout: :layout
   
end


get "/contact" do
    erb :contact, layout: :layout
end

post "/contact" do
    puts "params are "+params.inspect
    @yname = params[:yname]
    @message = params[:message]
    # @email = params[:email]

    from = SendGrid::Email.new(email: 'bryan.king@nycda.com')
    to = SendGrid::Email.new(email: 'dmulvihill3@gmail.com')
    subject = 'Thank you for purchasing from Bridges, Inc.'
    content = SendGrid::Content.new(type: 'text/plain', value: "Our Sales representative will get back to you soon.")
    mail = SendGrid::Mail.new(from, subject, to, content)

    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    puts response.status_code
    puts response.body
    # puts response.parsed_body
    # puts response.headers

    erb :contact, layout: :layout
end

get "/deals" do
    erb :deals, layout: :layout
end

get "/about" do
    erb :about, layout: :layout
end