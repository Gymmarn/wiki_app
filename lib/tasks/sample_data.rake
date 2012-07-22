require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    65.times do |n|
      name = Faker::Company.name
      content = Faker::Lorem.paragraphs(3)
      Wiki.create!(:name => name,
                   :content => content)
    end
    
    Wiki.all(:limit => 15).each do |wiki|
      35.times do
        wiki.comments.create!(:content => Faker::Lorem.sentence(5))
      end
    end
  end
end