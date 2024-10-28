fx_version 'cerulean'
game 'gta5'

author 'Zyfi'
description 'ZyfiDEV Carwipe'
version '1.1.0'

-- Dependencies (if using pNotify or other notification systems, add them here)
dependencies {
    -- Example: 'notify here'
    'pNotify'
}

-- Client and server scripts
client_scripts {
    'client/client.lua'
}

server_scripts {
    'config.lua',
    'server/server.lua'
}

-- Shared locales
shared_scripts {
    'locales/en.lua',
    'locales/nl.lua',
    'locales/fr.lua',
    'config.lua'
}
