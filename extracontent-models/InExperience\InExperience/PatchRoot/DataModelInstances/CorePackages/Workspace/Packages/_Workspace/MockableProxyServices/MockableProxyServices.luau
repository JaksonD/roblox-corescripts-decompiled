local v1 = {
    ["jest.config"] = script["jest.config"], 
    game = game, 
    waitProxy = function(v0) --[[ Line: 4 ]] --[[ Name: waitProxy ]]
        wait(v0);
    end, 
    settingsProxy = function() --[[ Line: 7 ]] --[[ Name: settingsProxy ]]
        return settings();
    end
};
setmetatable(v1, {
    __index = function(_, v3) --[[ Line: 13 ]] --[[ Name: __index ]]
        return game:GetService(v3);
    end
});
return v1;