function Database()
    local self = {}

    self.Init = function()
        exports.oxmysql:executeSync(
            [[
            CREATE TABLE IF NOT EXISTS clothing_playeroutfit (
                id INT AUTO_INCREMENT PRIMARY KEY,
                citizenid VARCHAR(50),
                model VARCHAR(255),
                skin TEXT,
                props TEXT
            )
            ]]
        )

        exports.oxmysql:executeSync(
            [[
            CREATE TABLE IF NOT EXISTS clothing_outfits (
                id INT AUTO_INCREMENT PRIMARY KEY,
                owner VARCHAR(50),
                outfitname VARCHAR(255),
                model VARCHAR(255),
                skin TEXT,
                props TEXT
            )
            ]]
        )

        exports.oxmysql:executeSync(
            [[
            CREATE TABLE IF NOT EXISTS clothing_prefabs (
                id INT AUTO_INCREMENT PRIMARY KEY
                
            )
            ]]
        )
    end

    self.GetCurrentPlayerData = function(citizenid)
        local result = exports.oxmysql:executeSync('SELECT * FROM clothing_playeroutfit WHERE citizenid = ?', { citizenid })

        if not result[1] then
            exports.oxmysql:execute('INSERT INTO clothing_playeroutfit (citizenid, model, skin, props) VALUES (?, ?, ?, ?)', { citizenid, 'mp_m_freemode_01', '{}', '{}' })
            return false
        end

        local data = {
            model = result[1].model,
            skin = json.decode(result[1].skin),
            props = json.decode(result[1].props)
        }

        return data
    end

    self.SaveCurrentPlayerSkin = function(citizenid, model, skin, props)
        exports.oxmysql:execute('UPDATE clothing_playeroutfit SET model = ?, skin = ?, props = ? WHERE citizenid = ?', { model, json.encode(skin), json.encode(props), citizenid })
    end

    return self
end