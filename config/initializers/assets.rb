# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( html5shiv.min.js )
Rails.application.config.assets.precompile += %w( respond.min.js )
Rails.application.config.assets.precompile += %w( logo.png )
Rails.application.config.assets.precompile += %w( banner01.jpg )
Rails.application.config.assets.precompile += %w( details_howto_image.jpg )
Rails.application.config.assets.precompile += %w( common_scripts_min.js )
Rails.application.config.assets.precompile += %w( functions.js )
Rails.application.config.assets.precompile += %w( jquery.sliderPro.min.js )
Rails.application.config.assets.precompile += %w( slider-pro.min.css )
Rails.application.config.assets.precompile += %w( map.js )
Rails.application.config.assets.precompile += %w( infobox.js )
Rails.application.config.assets.precompile += %w( admin.min.css )

Rails.application.config.assets.precompile += %w( openhand.cur )
Rails.application.config.assets.precompile += %w( closedhand.cur )
Rails.application.config.assets.precompile += %w( blank.gif )

Rails.application.config.assets.precompile += %w( icon_ccv.gif )
Rails.application.config.assets.precompile += %w( cards.png )
