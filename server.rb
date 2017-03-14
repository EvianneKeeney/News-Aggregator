require 'sinatra'
require 'pry'
require 'CSV'

set :bind, '0.0.0.0'  # bind to all interfaces


get '/articles/new' do
  @article = CSV.readlines("articles.csv")
  erb :new_article_post_page
end

post '/articles/new' do

  CSV.open('articles.csv', 'a') do |csv|
    csv << params.values
  end

  redirect '/articles/new'
end

get '/articles' do
  @article = CSV.readlines('articles.csv')
  erb :index
end
