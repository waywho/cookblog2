module Casein
  class AdminUserSession < ::Authlogic::Session::Base
    include ActiveModel::Conversion 
    extend ActiveModel::Naming
    def persisted? 
      false 
    end
  end
end
