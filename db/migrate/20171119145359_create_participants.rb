class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :country
      t.string :postcode
      t.date :birthdate
      t.references :user, index: {unique: true }, foreign_key: true
      t.timestamps
      t.index [ :first_name, :last_name, :birthdate], :unique => true
    end
  end
end
