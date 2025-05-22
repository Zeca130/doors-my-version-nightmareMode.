loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeca130/Doors-mode/refs/heads/main/Entity3.txt?token=GHSAT0AAAAAADEHFJJ27DRILQERU4BRO7BI2BOHANQ
loadstring(game:HttpGet("https://raw.githubusercontent.com/DoorsHubs/Doors-Hubs/refs/heads/main/Hardcore%20Sprint%20System%20(PC%20and%20Mobile%20Adaptation).lua.txt"))()
local screenGui = Instance.new("ScreenGui")
local textLabel1 = Instance.new("TextLabel")
local textLabel2 = Instance.new("TextLabel")

screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

textLabel1.Parent = screenGui
textLabel1.Size = UDim2.new(0, 300, 0, 70)
textLabel1.Position = UDim2.new(0.5, -150, 0.6, -35)
textLabel1.BackgroundTransparency = 1
textLabel1.Text = "Script loaded"
textLabel1.TextColor3 = Color3.fromRGB(255, 220, 150)
textLabel1.TextSize = 28
textLabel1.Font = Enum.Font.SourceSansBold
textLabel1.TextTransparency = 1

textLabel2.Parent = screenGui
textLabel2.Size = UDim2.new(0, 300, 0, 70)
textLabel2.Position = UDim2.new(0.5, -150, 0.6, -35)
textLabel2.BackgroundTransparency = 1
textLabel2.Text = "Created by Zeca140XX"
textLabel2.TextColor3 = Color3.fromRGB(255, 220, 150)
textLabel2.TextSize = 28
textLabel2.Font = Enum.Font.SourceSansBold
textLabel2.TextTransparency = 1

for i = 0, 1, 0.05 do
    textLabel1.TextTransparency = 1 - i
    wait(0.05)
end

wait(2)

for i = 0, 1, 0.05 do
    textLabel1.TextTransparency = i
    wait(0.05)
end

for i = 0, 1, 0.05 do
    textLabel2.TextTransparency = 1 - i
    wait(0.05)
end

wait(2)

for i = 0, 1, 0.05 do
    textLabel2.TextTransparency = i
    wait(0.05)
end
while true do
    task.wait(200)
    loadstring(game:HttpGet("https://pastebin.com/raw/yMVAwKk2"))()
        end
