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