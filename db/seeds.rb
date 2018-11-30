# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cab = Varietal.create(name: 'Cabernet Sauvignon')
cab_franc = Varietal.create(name: 'Cabernet Franc')
merlot = Varietal.create(name: 'Merlot')
pinot = Varietal.create(name: 'Pinot Noir')
zin = Varietal.create(name: 'Zinfandel')
sangio = Varietal.create(name: 'Sangiovesse')
syrah = Varietal.create(name: 'Syrah')
grenache = Varietal.create(name: 'Grenache')
malbec = Varietal.create(name: 'Malbec')
tempranillo = Varietal.create(name: 'Tempranillo')
petit_verdot = Varietal.create(name: 'Petit Verdot')

chard = Varietal.create(name: 'Chardonnay')
sav_blanc = Varietal.create(name: 'Sauvignon Blanc')
pinot_gri = Varietal.create(name: 'Pinot Grigio')
riesling = Varietal.create(name: 'Riesling')
moscato = Varietal.create(name: 'Moscato')
gewurztraminer = Varietal.create(name: 'Gewurztraminer')
viognier = Varietal.create(name: 'Viognier')

mondavi = Winery.create(
  name: 'Robert Mondavi',
  address: '7801 St Helena Hwy',
  city: 'Oakville',
  state: 'CA',
  zipcode: '94562',
  phone: '8887666328'
)

mondavi_cab = Wine.create(
  winery: mondavi,
  name: 'Robert Mondavi Winery Cabernet Sauvignon',
  vintage: '2016',
  abv: '14.5',
  category: 'Cabernet Sauvignon'
)

mondavi_cab.wine_profiles.create(varietal_id: cab.id, ratio: 0.85)
mondavi_cab.wine_profiles.create(varietal_id: petit_verdot.id, ratio: 0.07)
mondavi_cab.wine_profiles.create(varietal_id: merlot.id, ratio: 0.05)
mondavi_cab.wine_profiles.create(varietal_id: cab_franc.id, ratio: 0.03)

mondavi_chard = Wine.create(
  winery: mondavi,
  name: 'Robert Mondavi Winery Reserve Chardonnay Carneros',
  vintage: '2016',
  abv: '14.5',
  category: 'Chardonnay'
)
mondavi_chard.wine_profiles.create(varietal_id: chard.id, ratio: 1.0)

mondavi_merlot = Wine.create(
  winery: mondavi,
  name: 'Robert Mondavi Winery Merlot',
  vintage: '2016',
  abv: '14.5',
  category: 'Merlot'
)

mondavi_merlot.wine_profiles.create(varietal_id: merlot.id, ratio: 0.76)
mondavi_merlot.wine_profiles.create(varietal_id: cab.id, ratio: 0.24)

artesa = Winery.create(
  name: 'Artesa',
  address: '1345 Henry Rd',
  city: 'Napa',
  state: 'CA',
  zipcode: '94559',
  phone: '7072241668'
)

artesa_pinot = Wine.create(
  winery: artesa,
  name: 'Estate Vineyard Pinot Noir Los Carneros',
  vintage: '2016',
  abv: '14.1',
  category: 'Pinot Noir'
)
artesa_pinot.wine_profiles.create(varietal_id: pinot.id, ratio: 1.0)

artesa_rive = Wine.create(
  winery: artesa,
  name: 'Rive Gauche',
  vintage: '2014',
  abv: '15.0',
  category: 'Cabernet Sauvignon'
)
artesa_rive.wine_profiles.create(varietal_id: cab.id, ratio: 0.89)
artesa_rive.wine_profiles.create(varietal_id: petit_verdot.id, ratio: 0.05)
artesa_rive.wine_profiles.create(varietal_id: merlot.id, ratio: 0.05)
artesa_rive.wine_profiles.create(varietal_id: malbec.id, ratio: 0.01)

artesa_pin = Wine.create(
  winery: artesa,
  name: 'Pinnacle',
  vintage: '2014',
  abv: '14.6',
  category: 'Other Red'
)

artesa_pin.wine_profiles.create(varietal_id: cab.id, ratio: 0.30)
artesa_pin.wine_profiles.create(varietal_id: petit_verdot.id, ratio: 0.15)
artesa_pin.wine_profiles.create(varietal_id: merlot.id, ratio: 0.52)
artesa_pin.wine_profiles.create(varietal_id: malbec.id, ratio: 0.03)
