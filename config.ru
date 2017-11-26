require './fixcooters'
require 'json'

run Proc.new { |env| [
  '200',
  {'Content-Type' => 'application/json'},
  [
    calc({
      scooters: env['QUERY_STRING'].split('&')[0].gsub('%20', '').split('scooters=')[1].split(",").map(&:to_i),
      c: env['QUERY_STRING'].split('&')[1].split('C=')[1].to_i,
      p: env['QUERY_STRING'].split('&')[2].split('P=')[1].to_i
    }).to_json
  ]
]}
