class House < ActiveRecord::Base
  scope :select_outline_geojson, -> { select('"houses".*, ST_AsGeoJSON("houses"."outline") AS "outline_geojson"') }
  scope :near, ->(latitude, longitude, distance = 5500) { where("ST_DWithin(\"houses\".\"outline\", ST_GeographyFromText('SRID=4326;POINT(%f %f)'), %d)" % [longitude, latitude, distance]) }

  def outline_geojson=(outline_geojson)
    self.outline = ActiveRecord::Base.connection.execute(ActiveRecord::Base.send(:sanitize_sql_array, ['SELECT ST_GeomFromGeoJSON(?);', outline_geojson])).first['st_geomfromgeojson']
  end
end
