namespace :bootstrap do        
  desc 'require the necessary files AFTER loading the environment'
    task :setup => :environment do  
      require 'factory_girl' #requires Factories
      Dir[RAILS_ROOT + "/spec/factories/*.rb"].each {|file| require file}
      Dir[RAILS_ROOT + "/lib/bootstrap/*.rb"].each {|file| require file} #Require bootstrap sub-classes
    end                        

  desc 'dump a database table to .csv file to use for bootstrap data'
  task :table_to_csv => :environment do
    ENV['TABLE'] || raise("must provide a table to dump, e.g. TABLE=sales_periods")
    Seed::table_to_csv(ENV['TABLE'], 'bootstrap', ENV['OVERWRITE'])
  end

  desc 'populate a database table with a .csv file in lib/bootstrap/csv/'
  task :table_from_csv => :environment do
    ENV['TABLE'] || raise("must provide a table, e.g. TABLE=sales_periods, and there must be a .csv with teh same name in lib/bootstrap/csv")
    Seed::table_from_csv(ENV['TABLE'])
  end
end


