require 'authlogic'
require 'securerandom'

namespace :casein do

  namespace :users do

    desc "Create default admin user"
    task create_admin: :environment do

      raise "Usage: specify email address, e.g. rake [task] email=mail@caseincms.com [(optional) password=mypassword]" unless ENV.include?("email")
      password = ENV['password'] || SecureRandom.hex
      admin = Casein::AdminUser.new({ login: 'admin', name: 'Admin', email: ENV['email'], access_level: $CASEIN_USER_ACCESS_LEVEL_ADMIN, password: password, password_confirmation: password })

      unless admin.save
        puts "[Casein] Failed: check that the 'admin' account doesn't already exist."
      else
        puts "[Casein] Created new admin user with username 'admin' and password '#{password}'"
      end
    end

    desc "Remove all users"
    task remove_all: :environment do
      users = Casein::AdminUser.all
      num_users = users.size
      users.destroy_all
      puts "[Casein] Removed #{num_users} user(s)"
    end

  end

end
