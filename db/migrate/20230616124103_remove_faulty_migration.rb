class RemoveFaultyMigration < ActiveRecord::Migration[7.0]
  def up
    execute "DELETE FROM schema_migrations WHERE version = '20230609095310'"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
