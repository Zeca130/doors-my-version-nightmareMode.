local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local billboardGui = Instance.new("BillboardGui")
billboardGui.Size = UDim2.new(0, 200, 0, 50)
billboardGui.Adornee = hrp
billboardGui.AlwaysOnTop = true
billboardGui.Parent = hrp

local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = "script done!"
textLabel.TextColor3 = Color3.new(1, 0, 0)
textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
textLabel.TextStrokeTransparency = 0
textLabel.TextScaled = true
textLabel.Parent = billboardGui

delay(10, function()
    billboardGui:Destroy()
end)
