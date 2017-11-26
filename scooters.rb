def calc(scooters:, c:, p:)
  fleet_engineers = 0
  # complexes = scooters.select { |sc| sc > p }
  # fleet_engineers += (scooters.length - complexes.length)
  complexes = scooters

  complexes.sort![-1] -= c

  fleet_engineers += complexes.inject(0) { |mem, var| mem + var.fdiv(p).ceil }

  { fleet_engineers: fleet_engineers }
end

result = calc({ scooters: [8, 5, 14, 7, 19, 17], c: 12, p: 7 })
expected = { fleet_engineers: 10 }
raise "ERRO: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [15, 10], c: 12, p: 5 })
expected = { fleet_engineers: 3 }
raise "ERRO: result should've been #{expected} but was #{result}" unless result == expected

result = calc({ scooters: [11, 15, 13], c: 9, p: 5 })
expected = { fleet_engineers: 7 }
raise "ERRO: result should've been #{expected} but was #{result}" unless result == expected

p 'ALL PASSED!'
