# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...





# Set Up
- rails new wildlife-tracker -d postgresql -T
- cd wildlife-tracker
- git remote add origin https://github.com/learn-academy-2022-alpha/wildlife-tracker-tiffanydoh.git
- git checkout -b main
- git add . 
- git commit -m "initial commit"
- git push origin main 
- rails db:create
- bundle add rspec-rails
- rails generate rspec:install
- rails server


- rails g resource Animal common_name:string latin_name:string kingdom:string
- rm -rf app/views/animals
- rails routes 
- rails db:migrate
- rails c 
- Animal.create common_name:"Bob Cat", latin_name:"Lynx rufus", kingd
om:"Mammal"
- Animal.create common_name:"Black Bear", latin_name:"Ursus americanu
s", kingdom:"Mammal"
- Animal.create common_name:"Northern Pygmy Owl", latin_name:"Glaucid
ium californicum", kingdom:"Bird"


# In Postman: 
- get http://localhost:3000/animals
- get http://localhost:3000/animals/1
- post http://localhost:3000/animals
{
    "common_name":"Satyr Angelwing Butterfly",
    "latin_name":"Polygonia satyrus",
    "kingdom":null
}
- patch http://localhost:3000/animals/4
{
    "common_name":"Satyr Angelwing Butterfly",
    "latin_name":"Polygonia satyrus",
    "kingdom":"Insect"
}
- get http://localhost:3000/animals/4
- post http://localhost:3000/animals
{
    "common_name":"Satyr Angelwing Butterfly",
    "latin_name":"Polygonia satyrus",
    "kingdom":"Insect"
}
- get http://localhost:3000/animals/5

- delete http://localhost:3000/animals/4
 

 [
    {
        "id": 1,
        "common_name": "Bob Cat",
        "latin_name": "Lynx rufus",
        "kingdom": "Mammal",
        "created_at": "2022-03-25T00:07:52.239Z",
        "updated_at": "2022-03-25T00:07:52.239Z"
    },
    {
        "id": 2,
        "common_name": "Black Bear",
        "latin_name": "Ursus americanus",
        "kingdom": "Mammal",
        "created_at": "2022-03-25T00:09:22.225Z",
        "updated_at": "2022-03-25T00:09:22.225Z"
    },
    {
        "id": 3,
        "common_name": "Northern Pygmy Owl",
        "latin_name": "Glaucidium californicum",
        "kingdom": "Bird",
        "created_at": "2022-03-25T00:14:47.401Z",
        "updated_at": "2022-03-25T00:14:47.401Z"
    },
    {
        "id": 5,
        "common_name": "Satyr Angelwing Butterfly",
        "latin_name": "Polygonia satyrus",
        "kingdom": "Insect",
        "created_at": "2022-03-27T18:55:51.376Z",
        "updated_at": "2022-03-27T18:55:51.376Z"
    }
]


- rails g resource Sighting date:datetime latitude:string longitude:string animal_id:integer
- bob = Animal.first 
- bob.sightings.create date:"2022-02-05 06:30:10", latitude:"00000", longitude
:"00000"
- black = Animal.second
- black.sightings.create date:"2022-01-23 02:18:03", latitude:"00000", longitu
de:"00000"
- northern = Animal.third
- northern.sightings.create date:"2022-03-02 06:38:20", latitude:"00000", long
itude:"00000"
- satyr = Animal.find 5
- satyr.sightings.create date:"2022-03-20 03:05:10", latitude:"00000", longitu
de:"00000"


bob.as_json(include: :sightings)
black.as_json(include: :sightings)
northern.as_json(include: :sightings)
satyr.as_json(include: :sightings)

#For last story with start date and end date
`
class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end
  private 
    def sighting_params
        params.require(:sighting).permit(:date, :latitude, :longitude, :animal_id, :start_date, :end_date)
    end
end
`
http://localhost:3000/sightings?start_date=2022-01-01&end_date=2022-03-18
or use params tab
