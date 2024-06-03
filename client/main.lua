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

RegisterNUICallback('characterDataChanged', function(data, cb)
    local identifier = data.identifier
    local component = data.component
    local variant = data.variant

    print("Identifier: " .. identifier)
    print("Component: " .. component)
    print("Model: " .. Peds[component])

    if identifier == "ped" then
        local modelHash = GetHashKey(Peds[component])
        LoadModel(modelHash)
        SetPlayerModel(PlayerId(), modelHash)
        SetModelAsNoLongerNeeded(modelHash)
    end

    if identifier == "custom-ped" then
        -- SetPlayerModel(PlayerId(), GetHashKey(Peds[component]))
    end
end)

function LoadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(10)
    end
end

function GetCharacterCreatorData() 
    return {
        peds = Peds,
        customPeds = CustomPeds,
    }
end

Citizen.CreateThread(function()
    while true do
        
        Citizen.Wait(1)
        if (IsControlJustPressed(0, 38)) then
            OpenCharacterCreator()
        end

    end
end)