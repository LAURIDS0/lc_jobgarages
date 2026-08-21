fx_version 'cerulean'
game 'gta5'

author 'LC Development'
description 'LC Job Garages'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',

    'config/config.lua',

    'config/police_ls/*.lua',
    'config/police_ls_special/*.lua',
    'config/police_ls_halo/*.lua',
    'config/ems_sandy/*.lua',
    'config/sheriff_sandy/*.lua',

    'config/jobgarages.lua'
}

client_scripts {
    'client/vehicles.lua',
    'client/jobgarages.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/jobgarages.lua'
}

dependencies {
    'ox_lib',
    'ox_inventory',
    'qbx_core',
    'qbx_vehiclekeys',
    'oxmysql'
}