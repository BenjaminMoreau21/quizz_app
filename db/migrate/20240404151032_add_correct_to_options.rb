class AddCorrectToOptions < ActiveRecord::Migration[7.1]
  def change
    add_column :options, :correct, :boolean, default: false
  end
end