require "sinatra"

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
    erb :contact, layout: :layout
end

get "/deals" do
    erb :deals, layout: :layout
end

get "/about" do
    erb :about, layout: :layout
end