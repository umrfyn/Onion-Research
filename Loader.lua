local PlaceScripts = {
    [0000000] = "https://raw.githubusercontent.com/umrfyn"
}

local url = PlaceScripts[game.PlaceId]
if not url then return nil end

local success = pcall(function()
    loadstring(game:HttpGet(url))()
end)

if not success then
    return nil
end
