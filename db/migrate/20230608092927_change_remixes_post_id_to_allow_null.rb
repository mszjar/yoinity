class ChangeRemixesPostIdToAllowNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :remixes, :post_id, true
  end
end
