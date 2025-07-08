task.spawn(function()
wait(100)
    
    while true do
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeca130/doors-my-version-nightmareMode./refs/heads/main/Silent.lua"))()
        end)
        wait(150)
    end
end)
