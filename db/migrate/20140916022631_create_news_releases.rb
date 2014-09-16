class CreateNewsReleases < ActiveRecord::Migration
  def change
    create_table :news_releases do |t|
      t.string :title
      t.date :released_on
      t.text :body

      t.timestamps
    end
  end
end
