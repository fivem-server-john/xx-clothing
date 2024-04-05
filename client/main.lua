AddEventHandler('xx-character-selector:characterCreated', function()
    OpenCharacterCreator()
end)


function OpenCharacterCreator() 
    SendNUIMessage({
        action = "setMenuVisible",
        data = {
            menuType = 1,
            visible = true
        }
    })

    SetNuiFocus(true, true)
end

RegisterNUICallback('fetchMenuData', function(data, cb)
    local dataType = data.type

    if dataType == 1 then
        local characterCreatorData = GetCharacterCreatorData()
        cb(characterCreatorData)
    end

end)

function GetCharacterCreatorData() 
    return {
        peds = Peds,
        customPeds = CustomPeds,
    }
end