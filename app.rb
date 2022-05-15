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

get '/' do
	erb :index
end