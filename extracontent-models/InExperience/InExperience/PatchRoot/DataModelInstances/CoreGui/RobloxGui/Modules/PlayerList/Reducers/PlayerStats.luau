local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.AddPlayer);
local v5 = require(l_Actions_0.RemovePlayer);
local v6 = require(l_Actions_0.SetPlayerLeaderstat);
return (v1.createReducer({}, {
    [v4.name] = function(v7, v8) --[[ Line: 13 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            [v8.userId] = {}
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 19 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            [v10.userId] = v2.None
        });
    end, 
    [v6.name] = function(v11, v12) --[[ Line: 25 ]]
        -- upvalues: v2 (copy)
        if v11[v12.userId] == nil then
            return v11;
        else
            return v2.Dictionary.join(v11, {
                [v12.userId] = v2.Dictionary.join(v11[v12.userId], {
                    [v12.leaderstat] = v12.value
                })
            });
        end;
    end
}));