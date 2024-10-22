class AddDeviseToUsers < ActiveRecord::Migration[7.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      # t.string :email, null: false, default: "" # Не потрібно, оскільки email вже є в CreateUsers
      # t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      # Інші стовпці...
    end

    # Видалення рядка, що додає індекс
    # add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token, unique: true
    # add_index :users, :unlock_token, unique: true
  end

  def self.down
    # Можливо, ви захочете видалити індекси тут
    remove_index :users, :reset_password_token
    # remove_index :users, :email if exists
    raise ActiveRecord::IrreversibleMigration
  end
end
