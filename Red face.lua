game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Define spawner ======---

local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V1/Source.lua"))()

---====== Create entity ======---

local entity = Spawner.createEntity({
    CustomName = "Red Face",
    Model = "https://github.com/fnaclol/sussy-bois/raw/main/FireBrand3.rbxm", -- Your entity's model url here ("rbxassetid://1234567890" or GitHub raw url)
    Speed = 160,
    MoveDelay = 6,
    HeightOffset = 0,
    CanKill = true,
    KillRange = 100,
    SpawnInFront = false,
    ShatterLights = true,
    FlickerLights = {
        Enabled = true,
        Duration = 5
    },
    Cycles = {
        Min = 2,
        Max = 2,
        Delay = 1
    },
    CamShake = {
        Enabled = true,
        Values = {1.5, 20, 0.1, 1},
        Range = 10
    },
    ResistCrucifix = false,
    BreakCrucifix = true,
    DeathMessage = {"You died to Silence", "hide!", "..", "....", "becareful, ok?"},
    IsCuriousLight = false
})

---====== Debug ======---

entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned")
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned")
    achievementGiver({
    Title = "RED FACE",
    Desc = "survive from red face",
    Reason = " , ",
    Image = "rbxassetid://0"
})
end

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
