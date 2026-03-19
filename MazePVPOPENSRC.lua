if game.PlaceId ~= 89528376983973 then return end

-- Loader
if getgenv().OnionUILoaded then
    warn("Loaded")
    return
end
local success, err = pcall(function()

-- check
local function checkExecutor()
    if identifyexecutor then
        local name, version = identifyexecutor()
        return name .. " " .. version
    end
    return "Unknown Executor"
end

local executorName = checkExecutor()
getgenv().OnionUILoaded = true

-- Services
local UserInputService = game:GetService("UserInputService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Variables
local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart")
local crystalRemote = ReplicatedStorage:WaitForChild("CrystalRemote")
-- shit
local placeId = game.PlaceId
local gameInfo = MarketplaceService:GetProductInfo(placeId)
local gameName = gameInfo.Name


-- UI
local Modal = loadstring(game:HttpGet("https://github.com/lxte/Modal/releases/latest/download/main.lua"))()

local Window = Modal:CreateWindow({
    Title = "Onion",
    SubTitle = placeId .. " | " .. gameName .. " | " .. executorName,
    Size = UDim2.fromOffset(600,400),
    MinimumSize = Vector2.new(250,200),
    Transparency = 0,
    Icon = "rbxassetid://105450720095946",
})

local ScriptSettings = {
    NotificationKey = Enum.KeyCode.LeftControl
}

-- Ui
local fucker = Window:AddTab("fucker")

-- fucker title bitass
fucker:New("Title")({
    Title = "ffffffffffffff",
})


-- Settings Tab
local Settings = Window:AddTab("Settings")

Settings:New("Title")({
    Title = "Themes"
})

Settings:New("Dropdown")({
    Title = "Theme",
    Description = "Default theme options",
    Options = { "Light", "Dark", "Midnight", "Rose", "Emerald" },
    Callback = function(Theme)
        Window:SetTheme(Theme)
    end,
})

Settings:New("Button")({
    Title = "Set Custom GUI",
    Description = "This is to showcase how custom themes work (without the default ones)",
    Callback = function()
        -- Any section that has rotation as an option (like background) supports gradients (colorsequences)
        -- Any that don't have the rotation option - only support Color3 values
        
        local CustomTheme = {
            Mode = "Dark",
            Accent = Color3.fromRGB(255, 170, 70),
            Background = {
                Rotation = 120,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(22, 18, 14)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 8, 6))
                }),
                Line = {
                    Color = Color3.fromRGB(255, 200, 120),
                    Transparency = 0.9
                },
                OuterOutline = {
                    Transparency = 0,
                    Color = Color3.fromRGB(5, 4, 3),
                    Rotation = 0,
                },
                InnerOutline = {
                    Transparency = 0.78,
                    Color = Color3.fromRGB(170, 130, 90),
                    Rotation = 0,
                }
            },

            Text = {
                Title = {
                    Color = Color3.fromRGB(255, 245, 230),
                },
                Description = {
                    Color = Color3.fromRGB(205, 190, 170),
                }
            },

            Icons = {
                ActionButtons = {
                    Color = Color3.fromRGB(255, 215, 160),
                    Transparency = 0.18,
                }
            },

            Content = {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(24, 20, 16)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(16, 13, 10))
                }),
                
                Rotation = 240,
                ScrollBarColor = Color3.fromRGB(200, 160, 110),

                InnerOutline = {
                    Transparency = 0.92,
                    Color = Color3.fromRGB(160, 125, 85),
                    Rotation = 0,
                },

                OuterOutline = {
                    Transparency = 0,
                    Color = Color3.fromRGB(6, 5, 4),
                    Rotation = 0,
                },
            },

            Component = {
                Color = Color3.fromRGB(26, 22, 18),
                Rotation = 0,
            },

            Controls = {
                Color = Color3.fromRGB(36, 30, 24),
                Outline = Color3.fromRGB(48, 40, 32)
            },
        }

            
        Window:SetTheme(CustomTheme);
    end,
})

Settings:New("Button")({
    Title = "Destroy GUI",
    Description = "Click to remove the UI",
    Callback = function()
        getgenv().OnionUILoaded = nil
        Window:Destroy()
    end,
})

Window:SetTab("fucker")
Window:SetTheme("Midnight")


-- toggle
local toggle = fucker:New("Toggle")({
    Title = "Auto Crystal",
    Description = "whatever",
    State = false,

    Callback = function(state)
        getgenv().CrystalAura = state

        if state then
            task.spawn(function()
                while getgenv().CrystalAura do

                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if obj.Name == "Obsidiana_Colocada" then
                            crystalRemote:FireServer("Colocar", obj)
                        elseif obj.Name == "Crystal_Colocado" then
                            crystalRemote:FireServer("Detonar", obj)
                        end
                    end

                    task.wait(0.05)
                end
            end)
        end
    end
})


end)

if not success then
    warn("Load failed:", err)
    getgenv().OnionUILoaded = nil
end
