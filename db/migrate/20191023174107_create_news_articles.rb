class CreateNewsArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.text :description
      t.integer :view_count
      t.datetime :published_at

      t.timestamps
    end
  end
end
