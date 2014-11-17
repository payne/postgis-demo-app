class EnablePostgis < ActiveRecord::Migration
  def up
    execute 'CREATE EXTENSION postgis;'
    execute 'CREATE EXTENSION postgis_topology;'
  end

  def down
    execute 'DROP EXTENSION postgis;'
    execute 'DROP EXTENSION postgis_topology;'
  end
end
