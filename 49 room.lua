local targetRoom = 48
repeat game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait() until game.ReplicatedStorage.GameData.LatestRoom.Value == targetRoom
loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeca130/doors-my-version-nightmareMode./refs/heads/main/LIBRARY.lua"))()
