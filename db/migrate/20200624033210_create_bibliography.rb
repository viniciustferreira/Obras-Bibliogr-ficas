class CreateBibliography < ActiveRecord::Migration[6.0]
  def change
    create_table :bibliographies do |t|
      t.string :name, index: true
      t.timestamps
    end
  end
end
