require_relative "./config/environment"

def reload!
  require_all "app"  
end

require_all "app"

Pry.start