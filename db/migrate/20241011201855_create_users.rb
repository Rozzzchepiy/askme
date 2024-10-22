class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      # Додайте інші поля, якщо потрібно

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end