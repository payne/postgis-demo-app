class AddOutlineToHouses < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE "houses" ADD COLUMN "outline" geography(Polygon,4326);'
  end

  def down
    execute 'ALTER TABLE "houses" DROP COLUMN "outline";'
  end
end
