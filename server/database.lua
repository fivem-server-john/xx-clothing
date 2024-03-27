function Database()
    local self = {}

    self.Init = function()
        exports.oxmysql:executeSync(
            [[
            CREATE TABLE IF NOT EXISTS clothing_playeroutfit (
                id INT AUTO_INCREMENT PRIMARY KEY,
                citizenid VARCHAR(50),
                outfitname VARCHAR(255),
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
                components TEXT,
                props TEXT
            )
            ]]
        )

        exports.oxmysql:executeSync(
            [[
            CREATE TABLE IF NOT EXISTS clothing_prefabs (
                id INT AUTO_INCREMENT PRIMARY KEY,
                
            )
            ]]
        )
    end

    return self
end