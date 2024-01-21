local AutoJoinTeam = "Pirates"

local function setPlayerTeam(teamName)
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player.PlayerGui
    local backpack = player.Backpack
    local character = player.Character

    replicatedStorage.Remotes["CommF_"]:InvokeServer("SetTeam", teamName)

    local elementsToShow = {
        "RaceEnergy", "Compass", "Energy", "AlliesButton", "Code",
        "CrewButton", "HomeButton", "Mute", "Settings", "MenuButton",
        "Beli", "Fragments", "Level", "HP"
    }

    local chooseTeamFrame = playerGui.Main:FindFirstChild("ChooseTeam")
    if chooseTeamFrame then
        chooseTeamFrame:Destroy()
    end

    for _, elementName in pairs(elementsToShow) do
        local element = playerGui.Main[elementName]
        if element then
            element.Visible = (elementName == "RaceEnergy") and (backpack:FindFirstChild("Awakening") or character:FindFirstChild("Awakening")) or true
        end
    end

    local camera = game:GetService("Workspace").CurrentCamera
    camera.CameraType = Enum.CameraType.Custom
    camera.CameraSubject = character.Humanoid
    camera.CFrame = character.HumanoidRootPart.CFrame
end

setPlayerTeam(AutoJoinTeam)

-- Your second script
_G.Team = "Pirates"
_G.FpsBoost = true
_G.Webhook = "https://discord.com/api/webhooks/1191342591954931733/s3S1bOl8Vei5fUdM0zXOJrSleuZ-Vo0-dP6A4s7kMGKDDiCLUkRfij7gWXyVSDlejn-Z"

getgenv().Chatkill = {
    ".",
    ""
}
getgenv().Region_Hop = {
    ["Enable"] = true,
    ["Region"] = "Singapore"
}

_G.Setting = {
        ["Start Hunting"] = true, -- Bro wtf don't turn it off
    ["Ken Haki"] = true,
    ["WhiteScreen"] = false,
    ["FruitStuff"] = true, -- Auto Buy and Store Fruits
    ["Run"] = 3500, -- As the name, you'll run when the health below ...
    ["MaxHealth"] = 5000,
    ["Time&Bounty Counter"] = true,
    ["Click Delay"] = 0,
    ["SkipPlayerWhenBeingLowHealth"] = false,
    ["Check"] = {
        ["V4 Players"] = true,
        ["Portal Users"] = false,
        ["Buddha Users"] = false
    },
    ["Theme"] = { -- You can get RGB colors from "Color Picker" on google
        ["Default"] = "YaeMiko", -- Use this if you don't know how to customize the theme, get themes on: https://github.com/clgtmm/ThemeBuilds
        ["Custom Theme"] = {
            ["Enable"] = false, -- Set this "false" if not knowing how to customize the theme
            ["Color"] = {
                ["Title Color"] = Color3.fromRGB(0, 170, 255),
                ["Title-Back Color"] = Color3.fromRGB(0, 85, 255),
                ["Button Color"] = Color3.fromRGB(0, 0, 255),
                ["Stats Color"] = {
                    ["Text Color"] = Color3.fromRGB(0, 170, 255),
                    ["Text Stroke"] = Color3.fromRGB(30, 56, 203)
                }
            }
        }
    },
    ["Melee"] = {
        ["Time"] = 0.8,
        ["Enable"] = true,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0.75},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["C"] = {["Enable"] = true, ["HoldTime"] = 0}
    },
    ["Fruit"] = {
        ["Time"] = 1,
        ["Enable"] = false,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["V"] = {["Enable"] = false, ["HoldTime"] = 0},
        ["F"] = {["Enable"] = false, ["HoldTime"] = 0}
    },
    ["Sword"] = {
        ["Time"] = 0.5,
        ["Enable"] = true,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0.4},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
    },
    ["Gun"] = {
        ["Time"] = 2,
        ["Enable"] = false,
        ["GunMode"] = false,
        ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
        ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
    }
}

delay(360, function()
    if not game.Workspace:FindFirstChild("HiHiHi") then
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
end)

repeat wait() until game:IsLoaded()

loadstring(game:HttpGet("https://raw.githubusercontent.com/clgtmm/AutoBounty/main/main.lua"))()
