class Chargify::Loops::Engine < Rails::Engine
  engine_name :chargify_loops

  paths['app/controllers'] << 'app/controllers'
  paths['config']          << 'config'
end
