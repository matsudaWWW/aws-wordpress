require 'FileUtils'

node[:deploy].each do |app_name, deploy|

  # composer_package "#{deploy[:deploy_to]}/current" do
  #   action :install
  # end

  # purge_before_symlink %w{web/app/uploads web/app/cache web/app/w3tc-config}
  # create_dirs_before_symlink %w{web/app/uploads web/app/cache web/app/w3tc-config}
  # symlinks  "web/app/uploads" => "web/app/uploads",
  #           "web/app/cache" => "web/app/cache",
  #           "web/app/w3tc-config" => "web/app/w3tc-config",
  #           ".env" => ".env",
  #           "web/.htaccess" => "web/.htaccess"


  if File.exist?("#{node[:symlink_path]}/web/app/uploads")
    FileUtils.rm_rf("#{deploy[:deploy_to]}/#{node[:release_path]}/web/app/uploads")
    link "#{deploy[:deploy_to]}/#{node[:release_path]}/web/app/uploads" do
      to "#{node[:symlink_path]}/web/app/uploads"
      group group deploy[:group]
      if platform?("ubuntu")
        owner "www-data"
      elsif platform?("amazon")
        owner "apache"
      end  
    end
  end  

  if File.exist?("#{node[:symlink_path]}/.env")
    FileUtils.rm_rf("#{deploy[:deploy_to]}/#{node[:release_path]}/.env")
    link "#{deploy[:deploy_to]}/#{node[:release_path]}/.env" do
      to "#{node[:symlink_path]}/.env"
      group group deploy[:group]
      if platform?("ubuntu")
        owner "www-data"
      elsif platform?("amazon")
        owner "apache"
      end  
    end
  end  

  # link "#{deploy[:deploy_to]}/#{node[:release_path]}/web/app/uploads" do
  #   to "#{node[:symlink_path]}/web/app/uploads"
  #   group group deploy[:group]
  #   if platform?("ubuntu")
  #     owner "www-data"
  #   elsif platform?("amazon")
  #     owner "apache"
  #   end  
  # end

  # link "#{deploy[:deploy_to]}/#{node[:release_path]}/web/app/uploads" do
  #   to "#{node[:symlink_path]}/web/app/uploads"
  #   group group deploy[:group]
  #   if platform?("ubuntu")
  #     owner "www-data"
  #   elsif platform?("amazon")
  #     owner "apache"
  #   end  
  # end

  # link "#{deploy[:deploy_to]}/#{node[:release_path]}/web/app/uploads" do
  #   to "#{node[:symlink_path]}/web/app/uploads"
  #   group group deploy[:group]
  #   if platform?("ubuntu")
  #     owner "www-data"
  #   elsif platform?("amazon")
  #     owner "apache"
  #   end  
  # end

  # link "#{deploy[:deploy_to]}/#{node[:release_path]}/web/app/uploads" do
  #   to "#{node[:symlink_path]}/web/app/uploads"
  #   group group deploy[:group]
  #   if platform?("ubuntu")
  #     owner "www-data"
  #   elsif platform?("amazon")
  #     owner "apache"
  #   end  
  # end


end  

# %w{.env web/.htaccess}




# deploy "/my/apps/dir/deploy" do
#   # Use a local repo if you prefer
#   repo "/path/to/gitrepo/typo/"
#   environment "RAILS_ENV" => "production"
#   revision "HEAD"
#   action :deploy
#   migration_command "rake db:migrate --trace"
#   migrate true
#   restart_command "touch tmp/restart.txt"
#   create_dirs_before_symlink  %w{tmp public config deploy}

#   # You can use this to customize if your app has extra configuration files
#   # such as amqp.yml or app_config.yml
#   symlink_before_migrate  "config/database.yml" => "config/database.yml"

#   # If your app has extra files in the shared folder, specify them here
#   symlinks  "system" => "public/system",
#             "pids" => "tmp/pids",
#             "log" => "log",
#             "deploy/before_migrate.rb" => "deploy/before_migrate.rb",
#             "deploy/before_symlink.rb" => "deploy/before_symlink.rb",
#             "deploy/before_restart.rb" => "deploy/before_restart.rb",
#             "deploy/after_restart.rb" => "deploy/after_restart.rb"
# end