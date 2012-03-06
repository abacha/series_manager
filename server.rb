require 'sinatra'
require 'pry'
require 'series_timer'

get "/next/*" do
  serie = params[:splat].join(" ")
  `series_timer -c "#{serie}"`
end

get "/all/*" do
  serie = params[:splat].join(" ")
  `series_timer -a "#{serie}"`.gsub("\n", "<br>")
end

get "/last/*" do
  serie = params[:splat].join(" ")
  `series_timer -l "#{serie}"`
end
