local KING_LEGACY_SCRIPT = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/KingLegacy.lua"


local PlaceScripts = {
    [89528376983973] = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/MazePVPOPENSRC.lua",
    [14807448145] = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/ThaiBanCity.lua",
    [103854444055060] = "https://raw.githubusercontent.com/umrfyn/Onion-Research/refs/heads/main/SilentAssassins.lua",

    [4520749081] = KING_LEGACY_SCRIPT, -- Sea 1
    [6381829480] = KING_LEGACY_SCRIPT, -- Sea 2
    [15759515082] = KING_LEGACY_SCRIPT -- Sea 3
}

local url = PlaceScripts[game.PlaceId]
if not url then return nil end

local success = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not success then
    return nil
end
