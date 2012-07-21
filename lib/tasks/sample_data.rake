require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    20.times do |n|
      name = Faker::Company.name
      content = Faker::Lorem.paragraphs(3)
      Wiki.create!(:name => name,
                   :content => content)
    end
    
#    User.all(:limit => 6).each do |user|
#      50.times do
#        user.microposts.create!(:content => Faker::Lorem.sentence(5))
#      end
#    end
  end
end