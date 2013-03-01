class CreateDocumentsUsers < ActiveRecord::Migration
  def change
    create_table :documents_users, :id => false do |t|
      t.references :document
      t.references :user
    end
  end
end
