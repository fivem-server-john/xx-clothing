local DATABASE = Database()

Citizen.CreateThread(function()
    DATABASE.Init()
end)