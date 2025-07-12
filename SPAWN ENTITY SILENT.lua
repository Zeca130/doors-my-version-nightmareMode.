task.spawn(function()
wait(300)
    
    while true do
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeca130/doors-my-version-nightmareMode./refs/heads/main/Silent.lua"))()
        end)
        wait(380)
    end
end)
