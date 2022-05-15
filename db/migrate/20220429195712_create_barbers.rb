class CreateBarbers < ActiveRecord::Migration[7.0]
  def change
    create_table :barbers do |t| # создаем таблицу
      t.text :name # в ней создаем поля c типом текст

      t.timestamps # создает доп. столбцы в нашей bd
      # created_at <-- дата создания сущности
      # updated_at <-- дата обновления одного или нескольких полей
    end

    Barber.create :name => 'Jessie Pinkman' #данные в виде хэша
    Barber.create :name => 'Walter White'
    Barber.create :name => 'Gus Fring'

  end
end
