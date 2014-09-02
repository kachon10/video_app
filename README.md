== README

Model file:

video.jpg

Note:  Video/Ad object will contain like/dislike/view/click object with the corresponding count in their objects.  

Instructions:

1.  Install PostgreSQL server with configuration:
  development:
    adapter: postgresql
    encoding: unicode
    database: videoapp_development
    host: localhost
    pool: 5
    username: video
    password: video

2.  bundle install
3.  bundle rake db:migrate
4.  bundle rake test:prepare #for testing

Unittest:

1.  rspec spec/

Run server:

1.  bundle exec rails s  #(visit http://localhost:3000/ for the front page)

Sample:

http://whispering-falls-9031.herokuapp.com/
