class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')

    create_table :accounts, id: :uuid, comment: "アカウント" do |t|
      t.string :first_name, null: false, comment: '名'
      t.string :last_name, null: false, comment: '姓'
      t.string :email, null: false, comment: 'メールアドレス'
      t.string :password_digest, null: false, comment: 'パスワードのハッシュ値'
      t.integer :role, null: false, default: 0, comment: '役割'

      t.timestamps
    end

    add_index :accounts, :email, unique: true
  end
end
