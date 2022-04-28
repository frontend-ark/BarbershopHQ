class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :client do |t| # создаем таблицу
      t.text :name # в ней создаем поля c типом текст
      t.text :phone
      t.text :datestamp
      t.text :barber
      t.text :color

      t.timestapms # создает доп. столбцы в нашей bd
      # created_at <-- дата создания сущности
      # updated_at <-- дата обновления одного или нескольких полей
    end
  end
end
