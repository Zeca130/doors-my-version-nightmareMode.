game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(0, 206, 209)
game.Lighting.MainColorCorrection.Contrast = 10
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(0.0), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(0, 206, 209)})
TW:Play()
wait(1)

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Silent",
    Model = "rbxassetid://74636951548803", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 160,
    MoveDelay = 0.1,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 90,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 20
    },
    Cycles = {
        Min = 4,
        Max = 6,
        Delay = 1.5
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 500
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died to who called Smiler", "That one is very fast", "Try hide from it at any costs", "You can do it!", "Try better next times!"},
    IsCuriousLight = true
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
local cue2 = Instance.new("Sound")
    cue2.Parent = game.Workspace
    cue2.Name = "Spawn"
    cue2.SoundId = "rbxassetid://9125713501"
    cue2.Volume = 4.5
    cue2.PlaybackSpeed = 1.2
    cue2:Play()
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned")
local cue2 = Instance.new("Sound")
    cue2.Parent = game.Workspace
    cue2.Name = "Spawn"
    cue2.SoundId = "rbxassetid://9125713501"
    cue2.Volume = 4.5
    cue2.PlaybackSpeed = 20
    cue2:Play()
end
wait(1)
game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(0, 0, 255)
game.Lighting.MainColorCorrection.Contrast = 10
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()
local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()

entity.Debug.OnEntityStartMoving = function()
    print("Entity started moving")
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity finished rebound")
end

entity.Debug.OnEntityEnteredRoom = function(room)
    print("Entity entered room:", room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player looking at entity")
end

entity.Debug.OnDeath = function()
    print("Player has died")
end

--[[
    NOTE: By overwriting 'OnUseCrucifix', the default crucifixion will be ignored and this function will be called instead

    entity.Debug.OnUseCrucifix = function()
        print("Custom crucifixion script here")
    end
]]--

---====== Run entity ======---

Spawner.runEntity(entity)
