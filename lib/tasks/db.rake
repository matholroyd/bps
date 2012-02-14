namespace :db do
  
  # This is to help while initially working on BPS. Should delete this later, as
  # will need to properly migrate data once have users. 
  task :rebuild do
    puts `rake db:drop db:create db:migrate`
    puts `rake db:drop db:create db:migrate RAILS_ENV=test`
  end
end