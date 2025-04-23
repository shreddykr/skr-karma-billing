fx_version 'cerulean'
game 'gta5'
lua54 'yes'

description 'Fine Menu for Karma-Biling'
author 'shreddykr'

shared_script '@ox_lib/init.lua'

client_script 'client.lua'
server_script {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
