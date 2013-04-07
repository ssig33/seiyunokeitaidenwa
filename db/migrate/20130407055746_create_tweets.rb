class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :json
      t.string :url
      t.timestamps
    end
    add_index :tweets, :url
  end
end
