local PlaceScripts = {
    [155615604] = "https://raw.githubusercontent.com/4levy/Elystra.wtf/refs/heads/main/PL.lua",
    [77837537595343] = "https://raw.githubusercontent.com/4levy/Elystra.wtf/refs/heads/main/BannaTown.lua",
    [114116662845070] = "https://raw.githubusercontent.com/4levy/Elystra.wtf/refs/heads/main/CityBanna.lua",
    [14807448145] = "https://raw.githubusercontent.com/umrfyn/Elystra.wtf/refs/heads/main/ThaiBanCity.txt",
    [103854444055060] = "https://raw.githubusercontent.com/umrfyn/Elystra.wtf/refs/heads/main/SilentAssassins.lua",
    [89528376983973] = "https://raw.githubusercontent.com/umrfyn/Elystra.wtf/refs/heads/main/MazePVPOPENSRC.lua"
}

local url = PlaceScripts[game.PlaceId]
if not url then return nil end

local success = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not success then
    return nil
end
