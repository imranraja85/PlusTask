class CreateUploadedFiles < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `uploaded_files` (
                `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `user_id` SMALLINT(5) UNSIGNED COMMENT 'foreign key for user',
                `asset_file_name` varchar(255) NOT NULL default '' COMMENT 'Description of the project',
                `asset_content_type` varchar(255) NOT NULL default '' COMMENT 'Description of the project',
                `asset_file_size` INT(11) UNSIGNED COMMENT 'ID of the project owner',
                `asset_updated_at` DATETIME NULL COMMENT 'Datetime of latest update',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)
    execute up_sql
  end

  def self.down
    drop_table :uploaded_files
  end
end
