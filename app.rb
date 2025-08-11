require "sinatra"
require_relative "ai"

set :bind, "0.0.0.0"
set :port, 4567

get "/" do
  erb :index
end

post "/recommend" do
  tea_ai = TeaAI.new
  @recommendation = tea_ai.recommend_tea(params[:situation])
  erb :index
end
