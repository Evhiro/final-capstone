class CreateLogins < ActiveRecord::Migration[7.1]
  def change
    create_table :logins, id: :uuid do |t|
      t.string "email"
      t.string "password_digest"
      t.string "account_type"
      t.timestamps
    end
  end
end
