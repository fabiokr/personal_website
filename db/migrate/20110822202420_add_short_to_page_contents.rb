class AddShortToPageContents < ActiveRecord::Migration
  def change
    change_table :manageable_content_page_contents do |t|
      t.boolean :short, :default => false
    end
  end
end
