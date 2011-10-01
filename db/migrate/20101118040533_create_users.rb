class CreateUsers < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `users` (
                `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `company_id` INT(11) UNSIGNED NOT NULL COMMENT 'Foreign key to company table',           
                `name` varchar(80) NOT NULL default '',
                `company` varchar(80) NOT NULL default '',
                `title` varchar(255) NOT NULL default '',
                `department` varchar(128) NULL COMMENT 'Department the person works in',
                `email` varchar(255) DEFAULT '' NOT NULL, 
                `phone` varchar(100) DEFAULT '' NOT NULL, 
                `encrypted_password` varchar(128) DEFAULT '' NOT NULL,
                `password_salt` varchar(255) DEFAULT '' NOT NULL, 
                `reset_password_token` varchar(255),
                `remember_token` varchar(255), 
                `remember_created_at` datetime, 
                `sign_in_count` int(11) DEFAULT 0,
                `current_sign_in_at` datetime, 
                `last_sign_in_at` datetime, 
                `current_sign_in_ip` varchar(255),
                `last_sign_in_ip` varchar(255),
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
