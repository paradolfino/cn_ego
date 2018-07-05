class AddSlugToParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :slug, :string
  end
end
