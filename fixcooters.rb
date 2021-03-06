def calc(scooters:, c:, p:)
  diff = c - p
  scooters.sort! { |a, b| b <=> a }

  if c >= scooters[0]
    # If the manager can handle the most busy district alone
    scooters.shift
  else
    # The manager should be either where his presence results on a multiple of P
    # or as close to that as possible, from the districts with more scooters
    manager = scooters.find_index { |scoots| (scoots - diff).to_f % p == 0 } || scooters.index(scooters.max_by { |scoots| (scoots - diff).fdiv(p) % 1 })
    scooters[manager] -= c
  end

  { fleet_engineers: scooters.inject(0) { |result, scoots| result + scoots.fdiv(p).ceil } }
end

result = calc({ scooters: [8, 14, 7, 19, 17], c: 12, p: 7 })
expected = { fleet_engineers: 9 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [15, 10], c: 12, p: 5 })
expected = { fleet_engineers: 3 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [11, 15, 13, 9, 10], c: 9, p: 5 })
expected = { fleet_engineers: 11 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [11, 15, 13, 7, 14, 25], c: 9, p: 5 })
expected = { fleet_engineers: 17 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [11, 15, 13, 7, 17, 25], c: 9, p: 5 })
expected = { fleet_engineers: 18 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [11, 15, 13, 10], c: 9, p: 5 })
expected = { fleet_engineers: 9 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [11, 15, 13, 14], c: 9, p: 5 })
expected = { fleet_engineers: 10 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [11, 15, 13], c: 9, p: 5 })
expected = { fleet_engineers: 7 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [13, 15, 22], c: 200, p: 5 })
expected = { fleet_engineers: 6 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [13, 15, 20], c: 20, p: 5 })
expected = { fleet_engineers: 6 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [13, 15, 19], c: 16, p: 5 })
expected = { fleet_engineers: 7 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [13, 17, 23], c: 2, p: 15 })
expected = { fleet_engineers: 4 }
raise "ERROR: result should've been #{expected} but was #{result}" unless result == expected

p 'ALL PASSED!'
