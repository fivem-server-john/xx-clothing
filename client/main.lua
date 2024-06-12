local previousSkinData = {}
local currentSkinData = {
    ["face"] =                 {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["face2"] =                {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["facemix"] =              {skinMix = 0, shapeMix = 0, defaultSkinMix = 0.0, defaultShapeMix = 0.0},
    ["pants"] =                {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["hair"] =                 {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["eyebrows"] =             {item = -1,   texture = 1,  defaultItem = -1,     defaultTexture = 1},
    ["beard"] =                {item = -1,   texture = 1,  defaultItem = -1,     defaultTexture = 1},
    ["blush"] =                {item = -1,   texture = 1,  defaultItem = -1,     defaultTexture = 1},
    ["lipstick"] =             {item = -1,   texture = 1,  defaultItem = -1,     defaultTexture = 1},
    ["makeup"] =               {item = -1,   texture = 1,  defaultItem = -1,     defaultTexture = 1},
    ["ageing"] =               {item = -1,   texture = 0,  defaultItem = -1,     defaultTexture = 0},
    ["arms"] =                 {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["t-shirt"] =              {item = 1,    texture = 0,  defaultItem = 1,      defaultTexture = 0},
    ["torso2"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["vest"] =                 {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["bag"] =                  {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["shoes"] =                {item = 0,    texture = 0,  defaultItem = 1,      defaultTexture = 0},
    ["mask"] =                 {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["hat"] =                  {item = -1,   texture = 0,  defaultItem = -1,     defaultTexture = 0},
    ["glass"] =                {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["ear"] =                  {item = -1,   texture = 0,  defaultItem = -1,     defaultTexture = 0},
    ["watch"] =                {item = -1,   texture = 0,  defaultItem = -1,     defaultTexture = 0},
    ["bracelet"] =             {item = -1,   texture = 0,  defaultItem = -1,     defaultTexture = 0},
    ["accessory"] =            {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["decals"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["eye_color"] =            {item = -1,   texture = 0,  defaultItem = -1,     defaultTexture = 0},
    ["moles"] =                {item = 0,    texture = 0,  defaultItem = -1,     defaultTexture = 0},
    ["nose_0"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["nose_1"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["nose_2"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["nose_3"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["nose_4"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["nose_5"] =               {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["cheek_1"] =              {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["cheek_2"] =              {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["cheek_3"] =              {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["eye_opening"] =          {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["lips_thickness"] =       {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["jaw_bone_width"] =       {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["eyebrown_high"] =        {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["eyebrown_forward"] =     {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["jaw_bone_back_lenght"] = {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["chimp_bone_lowering"] =  {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["chimp_bone_lenght"] =    {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["chimp_bone_width"] =     {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["chimp_hole"] =           {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
    ["neck_thikness"] =        {item = 0,    texture = 0,  defaultItem = 0,      defaultTexture = 0},
}

local cam = nil
local currentZoomType = ZoomType.Face
local currentZoomLevel = 0.0

AddEventHandler('xx-character-selector:characterCreated', function()
    OpenCharacterCreator()
end)

function CreateCam()
    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 0, true, true)
end


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

function CharacterSkinChanged(identifier, component, variant)
    SetCurrentCharacterSkin(identifier, component, variant)
end

function SetCurrentCharacterSkin(identifier, component, variant)
    local playerPed = PlayerPedId()

    if identifier == "ped" then
        local modelHash = GetHashKey(Peds[component])
        LoadModel(modelHash)
        SetPlayerModel(PlayerId(), modelHash)
        SetModelAsNoLongerNeeded(modelHash)
    end

    if identifier == "custom-ped" then
        -- SetPlayerModel(PlayerId(), GetHashKey(Peds[component]))
    end

    --Cloth
    if identifier == "torso2" then
        SetPedComponentVariation(playerPed, 11, component, variant, 0)
    elseif identifier == "t-shirt" then
        SetPedComponentVariation(playerPed, 8, component, variant, 0)
    elseif identifier == "arms" then
        SetPedComponentVariation(playerPed, 3, component, variant, 0)
    elseif identifier == "pants" then
        SetPedComponentVariation(playerPed, 4, component, variant, 0)
    elseif identifier == "shoes" then
        SetPedComponentVariation(playerPed, 6, component, variant, 0)
    end

    --Props
    if identifier == "hat" then
        SetPedPropIndex(playerPed, 0, component, variant, true)
    elseif identifier == "glasses" then
        SetPedPropIndex(playerPed, 1, component, variant, true)
    elseif identifier == "mask" then
        SetPedComponentVariation(playerPed, 1, component, variant, 0)
    elseif identifier == "vest" then
        SetPedComponentVariation(playerPed, 9, component, variant, 0)
    elseif identifier == "bag" then
        SetPedComponentVariation(playerPed, 5, component, variant, 0)
    end

    --FAce
    if identifier == "hair" then
        SetPedComponentVariation(playerPed, 2, component, 0, 0)
        SetPedHairColor(playerPed, variant, variant)
    elseif identifier == "beard" then
        SetPedHeadOverlay(playerPed, 1, component, 1.0)
        SetPedHeadOverlayColor(playerPed, 1, 1, variant, 0)
    elseif identifier == "eyebrows" then
        SetPedHeadOverlay(playerPed, 2, component, 1.0)
        SetPedHeadOverlayColor(playerPed, 2, 1, variant, 0)
    end
end

RegisterNuiCallback('OnScrollChange', function(data, cb)
    local zoomLocation = 1
    if data.location == "face" then
        zoomLocation = ZoomType.Face
    elseif data.location == "body" then
        zoomLocation = ZoomType.Body
    elseif data.location == "legs" then
        zoomLocation = ZoomType.Legs
    end
    
    if currentZoomLevel == 0.0 then
        currentZoomType = zoomLocation
    end
    currentZoomLevel = currentZoomLevel + 0.1

    UpdateCamPostion(currentZoomType, currentZoomLevel)

end)

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
    CharacterSkinChanged(identifier, component, variant)
    
end)

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
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