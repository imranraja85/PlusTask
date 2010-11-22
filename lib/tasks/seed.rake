require 'fileutils'            
require "#{Rails.root.to_s}/lib/seed"
include Seed

namespace :seed do             
  desc 'dump a database table to a .csv file to use for seed data'
  task :table_to_csv => :environment do
    ENV['table'] || raise("you must provide a table to dump")
    Seed::table_to_csv(ENV['table'], 'seed', ENV['OVERWRITE'])
  end
end

