require 'sinatra'
require 'pry'
require 'series_timer'

get "/next/*" do
  serie = params[:splat].join(" ")
  SeriesTimer::SeriesManager.countdown(serie)
end

get "/all/*" do
  serie = params[:splat].join(" ")
  SeriesTimer::SeriesManager.all(serie).join("<br>")
end

get "/last/*" do
  serie = params[:splat].join(" ")
  SeriesTimer::SeriesManager.last_episode(serie)
end

get "/serie/*" do
  serie = params[:splat].join(" ")
  "Last episode on air: #{SeriesTimer::SeriesManager.last_episode(serie)}<br>
  <br><br> 
  Next episode on air: #{SeriesTimer::SeriesManager.countdown(serie)}<br>
  <br><br> 
  #{SeriesTimer::SeriesManager.all(serie).join("<br>")}"
end
