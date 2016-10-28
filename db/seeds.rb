100.times do
  character = Faker::StarWars.character
  planet = Faker::StarWars.planet
  quote = Faker::StarWars.quote

  StarWar.create(
    character: character,
    planet: planet,
    quote: quote
  )
end