local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.AddTeam);
local v5 = require(l_Actions_0.RemoveTeam);
local v6 = require(l_Actions_0.SetTeamColor);
return (v1.createReducer({}, {
    [v4.name] = function(v7, v8) --[[ Line: 13 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v7, {
            [v8.team] = v8.team.TeamColor
        });
    end, 
    [v5.name] = function(v9, v10) --[[ Line: 19 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v9, {
            [v10.team] = v2.None
        });
    end, 
    [v6.name] = function(v11, v12) --[[ Line: 25 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v11, {
            [v12.team] = v12.teamColor
        });
    end
}));