class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :email, null: false
      t.text :body, null: false #null false means required

      t.timestamps null: false
    end
  end
end
