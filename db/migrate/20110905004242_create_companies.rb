class CreateCompanies < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `companies` (
                `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `name` varchar(80) NOT NULL default '',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`),
                UNIQUE KEY `idx_name` (`name`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :companies
  end
end
