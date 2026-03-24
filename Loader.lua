local KING_LEGACY_SCRIPT = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/KingLegacy.lua"

local PlaceScripts = {
    [89528376983973] = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/MazePVPOPENSRC.lua",
    [14807448145]    = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/ThaiBanCity.lua",
    [103854444055060]= "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/SilentAssassins.lua",
}

local url = PlaceScripts[game.PlaceId] or KING_LEGACY_SCRIPT

local success, err = pcall(function()
    local src = game:HttpGet(url)
    local fn = loadstring(src)
    if fn then
        fn()
    else
        error("loadstring failed")
    end
end)

if not success then
    warn("Script failed:", err)
end
