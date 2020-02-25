class Policy < ApplicationPolicy
  config.autoload_paths += Dir[Rails.root.join('app', 'policies', '*.rb')]
end
