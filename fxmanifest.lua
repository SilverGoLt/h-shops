--[[ FX Information ]]--
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
games {
    "gta5",
    "rdr3"
}

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

--[[ Resource Information ]]--
name         'ox_core'
version      '0.1.'
note          'Fork of ox_core by project-unk'
description  'What have I done?'
license      'GPL-3.0-or-later'
author       'overextended, project-unk'
repository   'https://github.com/project-unk/ox_core_redm'

--[[ Manifest ]]--
dependencies {
	'/server:5104',
	'/onesync',
}

shared_scripts {
	'@ox_lib/init.lua',
  'shared/**.lua',
}

client_scripts {
  'client/*.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
  'server/*.lua'
}

ui_page 'http://127.0.0.1:5173'