local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()


-- Create entity
local entity = Spawner.createEntity({
    CustomName = "236", -- Custom name of your entity
    Model = "rbxassetid://15131092250", -- Can be GitHub file or rbxassetid
    Speed = 200, -- Percentage, 100 = default Rush speed
    DelayTime = 8, -- Time before starting cycles (seconds)
    HeightOffset = 5,
    CanKill = true,
    NoDieOnCrouching = false,
    NoHiding = false,
    AntiCrucifix = false,
    KillRange = 30,
    OneRoom = false,
    DieOnLook = false,
    BreakLights = true,
    BackwardsMovement = false,
     MovementDeath = {
        false, -- Turned On?
        '1',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'
    },
    FlickerLights = {
        true, -- Enabled/Disabled
        80 -- Time (seconds)
    },
    Cycles = {
        Min = 1,
        Max = 1,
        WaitTime = 5,
    },
    CamShake = {
        true, -- Enabled/Disabled
        {3.5, 20, 0.1, 1}, -- Shake values (don't change if you don't know)
        100, -- Shake start distance (from Entity to you)
    },
    Jumpscare = {
        false, -- Enabled/Disabled
        {
            Type = "1", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon
            Image1 = "rbxassetid://14546302778", -- Image1 url
            Image2 = "rbxassetid://13328029517", -- Image2 url
            Shake = true,
            Sound1 = {
                "0", -- SoundId Link or Roblox ID
                { Volume = 0 }, -- Sound properties
            },
            Sound2 = {
                "6343741731", -- SoundId Link or Roblox ID
                { Volume = 3 }, -- Sound properties
            },
            Flashing = {
                true, -- Enabled/Disabled
                Color3.fromRGB(48, 25, 52), -- Color
            },
            Tease = {
                false, -- Enabled/Disabled
                Min = 1,
                Max = 1,
            },
        },
    },
    Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )
    DiffrentMessages = false,
    CustomDialog = {  
        {"Claim has seen you.", "It will consume anyone on sight.", "It takes a bit to fully spawn in", "so you can use that to your advantage."}, -- Death Messages
        {"Stop Dieing"},
        {"Bruh", "Use what you have learned from Rush!"},
        {"It seems like Template is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!"},
         {"I have told You What to do", "YOU JUST HAVE A SKILL ISSUE"}
    }
})

-----[[ Advanced Sctipting ]]-----

entity.Debug.OnEntityMoving = function(Invincible,Hiding,plrCollisionPoint)
print("Invincible: "..tostring(Invincible))
print("Player to Entity Collision (None hiding Point): "..tostring(plrCollisionPoint))
print("Hiding: "..tostring(Hiding))
end
       
entity.Debug.OnEntitySpawned = function()
    print("Entity has spawned:")
end

entity.Debug.OnEntityDespawned = function()
    print("Entity has despawned:")

---====== Load achievement giver ======---
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "#++_-#!_",
    Desc = "(_(_(_+3(_(_-2_+#!3&+2",
    Reason = "Survive the Entity _7_+3;$+&$",
    Image = "rbxassetid://13328029517"
})
Followed:Destroy()
end

entity.Debug.OnEntityFinishedRebound = function()
    print("Entity has finished rebound:")
end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)
    print("Entity:", "has entered room:",room)
end

entity.Debug.OnLookAtEntity = function()
    print("Player has looked at entity:")
end

entity.Debug.OnDeath = function()
    warn("Player has died.")
    local func, setupval, getinfo, typeof, getgc, next = nil, debug.setupvalue or setupvalue, debug.getinfo or getinfo, typeof, getgc, next

for i,v in next, getgc(false) do
    if typeof(v) == "function" then
        local info = getinfo(v)
        if info.currentline == 54 and info.nups == 2 and info.is_vararg == 0 then
            func = v
            break
        end
    end
end

local function DeathHint(hints, type: string)
    setupval(func, 1, hints)
    if type ~= nil then
        setupval(func, 2, type)
    end
end

DeathHint({
    "You died to who you Call Bluyer",
    "Closets Wont work! So try running",
    "Its form is incomprehensible to a human upclose...",
    "..-so avoid Eye Contact"
}, "Blue") -- "Blue" or "Yellow"
end

------------------------

-- Run the created entity
Spawner.runEntity(entity)
