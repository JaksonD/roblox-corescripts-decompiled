local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v4 = require(l_Actions_0.AddPlayer);
local v5 = require(l_Actions_0.RemovePlayer);
return (v1.createReducer({}, {
    [v4.name] = function(v6, v7) --[[ Line: 11 ]]
        -- upvalues: v2 (copy)
        return v2.List.join(v6, {
            v7.player
        });
    end, 
    [v5.name] = function(v8, v9) --[[ Line: 15 ]]
        -- upvalues: v2 (copy)
        return v2.List.filter(v8, function(v10) --[[ Line: 16 ]]
            -- upvalues: v9 (copy)
            return v10 ~= v9.player;
        end);
    end
}));