fx_version 'cerulean'
game 'gta5'

description 'Clothing'
version '0.9'

shared_scripts {
    'shared/config.lua',
    'shared/peds.lua',
}

server_scripts {
    'server/database.lua',
	'server/main.lua',
}

client_scripts {
    'client/main.lua',
}

ui_page 'web/build/index.html'

files {
  'web/build/index.html',
  'web/build/**/*',
  'web/public/**/*'
}


lua54 'yes'