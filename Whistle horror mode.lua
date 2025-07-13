local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
    Entity = {
        Name = "Flower",
        Asset = "rbxassetid://87984943504200",
        HeightOffset = 0
    },
    Lights = {
        Flicker = {
            Enabled = false,
            Duration = 1
        },
        Shatter = true,
        Repair = false
    },
    Earthquake = {
        Enabled = false
    },
    CameraShake = {
        Enabled = true,
        Range = 100,
        Values = {1.5, 20, 0.1, 1}
    },
    Movement = {
        Speed = 56,
        Delay = 0,
        Reversed = false
    },
    Rebounding = {
        Enabled = false,
        Type = "Ambush",
        Min = 1,
        Max = 1,
        Delay = 2
    },
    Damage = {
        Enabled = true,
        Range = 40,
        Amount = 125
    },
    Crucifixion = {
        Enabled = true,
        Range = 40,
        Resist = false,
        Break = true
    },
    Death = {
        Type = "Guiding",
        Hints = {"ME GO PLAY SKIBIDI TOILET", "GOODBYE", "STUPID YOU DIE BY A WEAK ENTITY", "HERE IS NOT FOR NOOB"},
        Cause = ""
    }
})

entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("DO YOU HEAR THE WHISTLE", true)

    local cue2 = Instance.new("Sound")
    cue2.Parent = game.Workspace
    cue2.Name = "Spawn"
    cue2.SoundId = "rbxassetid://116519796488654"
    cue2.Volume = 10
    cue2.PlaybackSpeed = 1
    cue2:Play()

    game.Lighting.MainColorCorrection.Contrast = 3
    game.Lighting.MainColorCorrection.Saturation = 3
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
    game.Players.LocalPlayer.Character.Humanoid:TakeDamage(10)
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime then
        print("Entity entered room: ".. room.Name .." for the first time")
    else
        print("Entity re-entered room: ".. room.Name)
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
    if lineOfSight then
        print("Player is looking at entity")
    else
        print("Player view is obstructed")
    end

    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Overlay = Instance.new("ImageLabel")
    local Face = Instance.new("ImageLabel")

    JumpscareGui.Name = "JumpscareGui"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    JumpscareGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    Background.Name = "Background"
    Background.BackgroundColor3 = Color3.fromRGB(3, 25, 99)
    Background.BorderSizePixel = 1
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 999
    Background.Parent = JumpscareGui

    Overlay.Name = "Overlay"
    Overlay.BackgroundTransparency = 1
    Overlay.Size = UDim2.new(1, 0, 1, 0)
    Overlay.Position = UDim2.new(0, 0, 0, 0)
    Overlay.Image = "rbxassetid://236542974"
    Overlay.ImageTransparency = 0.7
    Overlay.ZIndex = 998
    Overlay.Parent = Background

    Face.Name = "Face"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0, 150, 0, 150)
    Face.Image = "rbxassetid://0"
    Face.ZIndex = 1000
    Face.ImageTransparency = 0
    Face.Parent = Background

    local scare = Instance.new("Sound")
    scare.Name = "MyEarsBurn"
    scare.SoundId = "rbxassetid://372770465"
    scare.PlaybackSpeed = 1
    scare.Volume = 999
    scare.Parent = JumpscareGui

    local shift = Instance.new("PitchShiftSoundEffect")
    shift.Octave = 1
    shift.Parent = scare

    local distort = Instance.new("DistortionSoundEffect")
    distort.Level = 0.3
    distort.Parent = scare

    local eq = Instance.new("EqualizerSoundEffect")
    eq.HighGain = 10
    eq.MidGain = 10
    eq.LowGain = 3.7
    eq.Parent = scare

    task.spawn(function()
        while JumpscareGui.Parent do
            Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            task.wait(math.random(25, 100) / 1000)
            Background.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            task.wait(math.random(25, 100) / 1000)
        end
    end)

    local overlayImages = {
        "rbxassetid://184251462",
        "rbxassetid://11158773538"
    }

    task.spawn(function()
        local i = 1
        while JumpscareGui.Parent do
            Overlay.Image = overlayImages[i]
            i = i % #overlayImages + 1
            task.wait(0)
        end
    end)

    game.TweenService:Create(Face, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(2.9, 0, 2.5, 0),
        ImageTransparency = 0
    }):Play()

    task.spawn(function()
        local originalPos = Face.Position
        for i = 1, 15 do
            local offsetX = math.random(-3, 3)
            local offsetY = math.random(-3, 3)
            Face.Position = originalPos + UDim2.new(0, offsetX, 0, offsetY)
            task.wait(0.03)
        end
        Face.Position = originalPos
    end)

    scare:Play()
    task.wait(0.1)
    JumpscareGui:Destroy()
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound then
        print("Entity has started rebounding")
    else
        print("Entity has finished rebounding")
    end
end)

entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
    game.Players.LocalPlayer.Character.Humanoid:TakeDamage(400)
end)

entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
    game.Players.LocalPlayer.Character.Humanoid:TakeDamage(400)
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
    if newHealth == 0 then
        print("Entity has killed the player")
        local cue2 = Instance.new("Sound")
        cue2.Parent = game.Workspace
        cue2.Name = "Spawn"
        cue2.SoundId = "rbxassetid://7861818231"
        cue2.Volume = 1
        cue2.PlaybackSpeed = 0.9
        cue2:Play()
    else
        print("Entity has damaged the player")
    end
end)

entity:Run()
