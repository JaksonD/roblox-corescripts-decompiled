local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.AddPlayerToTeam);
local v5 = require(l_Actions_0.RemovePlayerFromTeam);
local v6 = require(l_Actions_0.RemovePlayer);
return (v1.createReducer({}, {
    [v4.name] = function(v7, v8) --[[ Line: 12 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            [v8.player.UserId] = v8.team
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 18 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            [v10.player.UserId] = v2.None
        });
    end, 
    [v6.name] = function(v11, v12) --[[ Line: 24 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v11, {
            [v12.player.UserId] = v2.None
        });
    end
}));