require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

# Создаем подключение к базе данных

set :database, {adapter: "sqlite3", database: "barbershop.db"}

# Создаем сущность Клиент

class Client < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
# функция  парм-тр1  парм-тр2 
#           символ     хэш
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
  @c = Client.new params[:client]
  erb :visit
end

post '/visit' do

  @c = Client.new params[:client] #в квадратных скобках может быть все что угодно, главное чтобы в представлении было то же самое

  if @c.save # этот метод перед тем как созранить выполняет валидацию надо только ее настроить
    erb "<h2>Спасибо что записались!</h2>"
  else
    @error = @c.errors.full_messages.first
    erb :visit
  end

end

get '/barber/:id' do
  @barber = Barber.find(params[:id])
  erb :barber
end

get '/bookings' do
  @clients = Client.order('created_at DESC')

  erb :bookings
end

get '/client/:id' do
  @client = Client.find(params[:id])
  erb :client
end








