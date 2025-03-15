class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    # Always a locomotive of ID 1
    # All others have a random ID greater than 1
    # Move first two to end
    # Put |missing_wagons| into the rest
    first, second, id_one, *rest = each_wagons_id
    [id_one, *missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(endpoints, **stops)
    {**endpoints, stops: stops.sort.to_h.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
