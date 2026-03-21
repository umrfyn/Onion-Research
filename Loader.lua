local PlaceScripts = {
    [89528376983973] = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/MazePVPOPENSRC.lua",
    [14807448145] = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/ThaiBanCity.lua",
    [103854444055060] = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/SilentAssassins.lua"
}

local url = PlaceScripts[game.PlaceId]
if not url then return nil end

local success = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not success then
    return nil
end
