class CreateSupportRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :support_requests do |t|
      t.string :email, comment: "Email of the submitter"
      t.string :subject, comment: "Subject for their support email"
      t.text :body, comment: "Body for their support email"
      t.references :order,
               foreign_key: true,
               comment: "Their most recent order, if applicable"
      t.timestamps
    end
  end
end
