local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v3 = require(l_Actions_0.AddPlayer);
local v4 = require(l_Actions_0.RemovePlayer);
local v5 = require(l_Actions_0.SetPlayerLeaderstat);
local function v10(v6, v7, v8) --[[ Line: 10 ]] --[[ Name: createKey ]]
    local v9 = nil;
    if v7 ~= nil and v8 ~= nil and v8[v6.UserId] ~= nil then
        v9 = v8[v6.UserId][v7];
    end;
    return {
        name = v6.DisplayName:upper(), 
        stat = v9 and tonumber(v9) or v9
    };
end;
return function(v11, v12, v13) --[[ Line: 22 ]] --[[ Name: PlayerKeys ]]
    -- upvalues: v10 (copy), v3 (copy), v5 (copy), v1 (copy), v4 (copy)
    local v14 = v13.gameStats[1] and v13.gameStats[1].name or nil;
    if not v11 or v14 ~= v11.primaryStat then
        local v15 = {};
        for _, v17 in pairs(v13.players) do
            v15[v17] = v10(v17, v14, v13.playerStats);
        end;
        return {
            primaryStat = v14, 
            keys = v15
        };
    elseif v12.type == v3.name or v12.type == v5.name then
        return {
            primaryStat = v14, 
            keys = v1.Dictionary.join(v11.keys, {
                [v12.player] = v10(v12.player, v14, v13.playerStats)
            })
        };
    elseif v12.type == v4.name then
        return {
            primaryStat = v14, 
            keys = v1.Dictionary.join(v11.keys, {
                [v12.player] = v1.None
            })
        };
    else
        return v11;
    end;
end;