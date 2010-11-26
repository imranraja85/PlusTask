class CreateUsers < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `users` (
                `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `name` varchar(80) NOT NULL default '',
                `email` varchar(128) NOT NULL default '',
                `role` ENUM('Admin','HeadManager','Manager','Employee') DEFAULT 'Employee',
                `department` varchar(128) NULL COMMENT 'Department the person works in',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`),
                UNIQUE KEY `index_people_on_email` (`email`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :users
  end
end
