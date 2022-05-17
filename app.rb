require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# Создаем подключение к базе данных

set :database, {adapter: "sqlite3", database: "barbershop.db"}

# Создаем сущность Клиент

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
 @barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
  erb :visit
end

post '/visit' do

c = Client.new params[:client] #в квадратных скобках может быть все что угодно, главное чтобы в представлении было то же самое
c.save

  erb "<h2>Спасибо что записались!</h2>"

end