class CreateComments < ActiveRecord::Migration
  def self.up
    up_sql = %Q(CREATE TABLE `comments` (
                `id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,           
                `commentable_id` INT(11) UNSIGNED NOT NULL,           
                `commentable_type` VARCHAR(255) COMMENT 'Model this comment belongs to',
                `user_id` INT(11) COMMENT 'ID of the user who wrote the comment',
                `comment` VARCHAR(255) COMMENT 'Actual comment text',
                `updated_at` TIMESTAMP NULL COMMENT 'Datetime of latest update',
                `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Datetime of creation.',
                PRIMARY KEY  (`id`)
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8;)

    execute up_sql  
  end

  def self.down
    drop_table :comments
  end
end
