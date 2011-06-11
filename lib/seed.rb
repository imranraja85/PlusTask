module Seed
  #populate a DB table with data from a csv file (for either seed ata or bootstrap tasks)
  def table_from_csv(file, has_file_path = false)
    (file = Rails.root.to_s + '/lib/bootstrap/csv/' + file + '.csv') if !has_file_path
    if File.exists?(file)
      ActiveRecord::Base.connection.execute("SET foreign_key_checks=0;")
      table_name = File.basename(file, ".csv")
      ActiveRecord::Base.connection.execute("
        LOAD DATA INFILE
        '#{file}'
        INTO TABLE #{table_name}
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\\n'
      ")
      puts "Seeding the #{table_name} table"
      ActiveRecord::Base.connection.execute("SET foreign_key_checks=1;")
    else
      puts "File does not exist: #{file}"
    end 
  end 

  def table_to_csv(table, seed_type = 'bootstrap', overwrite = FALSE)
      temp_filename = "/tmp/#{Time.now.to_f.to_s}"
      folder_path = (seed_type == 'seed' ? '/db/seed/csv/' : '/lib/bootstrap/csv/')
      filename = Rails.root.to_s + folder_path + table + '.csv'
      ActiveRecord::Base.connection.execute("
        SELECT *
        FROM #{table}
        INTO OUTFILE '#{temp_filename}'
        FIELDS TERMINATED BY ','
        LINES TERMINATED BY '\\n';
      ")
      if File.exists?(filename) && !overwrite
        puts "File already exists in #{folder_path} - if you want to over write use OVERWRITE=true"
      else
        puts "Creating file #{filename}"
        FileUtils.cp(temp_filename, filename)
      end
    end
end
  
