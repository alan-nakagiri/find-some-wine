class CreateWineAndWineries < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.references :wineries, index: true, null: false
      t.references :varietals
      
      t.string :name
      t.string :type
      t.string :vintage
      t.string :abv
      t.string :state
      t.string :notes

      t.timestamps
    end

    create_table :wineries do |t|
      t.references :wines, index: true, null: false

      t.string :name
      t.string :address
      t.decimal :longitude
      t.decimal :latitude
      t.string :phone
      t.string :email
      
      t.timestamps
    end

    create_table :users do |t|
      t.string :uid, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false

      t.timestamps
    end

    create_table :identities do |t|
      t.string   :email, null: false
      t.string   :password_digest, null: false
      t.string   :first_name
      t.string   :last_name
      t.string   :recovery_token
      t.datetime :recovery_token_expires_at
      
      t.timestamps
    end

    create_table :access_tokens do |t|
      t.references :users, index: true, null: false
      t.string :token, null: false
      t.datetime :expires_at
    end

    create_table :marked_wineries do |t|
      t.references :users, index: true, null: false
      t.integer :winery_id, null: false
      t.integer :rating
      t.string :state

      t.timestamps
    end

    create_table :marked_wines do |t|
      t.references :users, index: true, null: false
      t.integer :wine_id, null: false
      t.integer :rating
      t.string :state

      t.timestamps
    end

    create_table :varietals do |t|
      t.string :name

      t.timestamps
    end
  end
end
