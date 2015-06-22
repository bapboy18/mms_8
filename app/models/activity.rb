class Activity < ActiveRecord::Base
  enum action: [:admin_create, :admin_update, :admin_destroy]
end
