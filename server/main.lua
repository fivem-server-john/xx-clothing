local UTILS = exports['xx-utils']:GetObject()
local PlayerManagement = exports['xx-playermanagement']:GetObject()

local DATABASE = Database()

Citizen.CreateThread(function()
    DATABASE.Init()
end)

function SaveCurrentPlayerSkin(citizenId, model, skin , props) 
    DATABASE.SaveCurrentPlayerSkin(citizenId, model, skin, props)
end

UTILS.CreateCallback('xx-clothing:loadCurrentPlayerOutfit', function(source, cb)
    local src = source
    local Player = PlayerManagement.GetPlayerByServerId(src)

    if not Player then 
        cb(false)
    end

    local result  = DATABASE.GetCurrentPlayerData(Player.citizenId)

    cb(result)
end)