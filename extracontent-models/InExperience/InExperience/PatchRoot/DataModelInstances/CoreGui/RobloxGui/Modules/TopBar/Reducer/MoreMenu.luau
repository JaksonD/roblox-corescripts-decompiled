local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Rodux);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateMoreMenuRodux) then
    return nil;
else
    local l_Actions_0 = script.Parent.Parent.Actions;
    local v5 = require(l_Actions_0.SetMoreMenuOpen);
    local v6 = require(l_Actions_0.SetBackpackOpen);
    local v7 = require(l_Actions_0.SetEmotesOpen);
    local v8 = require(l_Actions_0.SetLeaderboardOpen);
    local v9 = require(l_Actions_0.SetEmotesEnabled);
    local v10 = {
        open = false, 
        backpackOpen = false, 
        leaderboardOpen = false, 
        emotesOpen = false, 
        emotesEnabled = true
    };
    return (v1.createReducer(v10, {
        [v5.name] = function(v11, v12) --[[ Line: 30 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v11, {
                open = v12.open
            });
        end, 
        [v6.name] = function(v13, v14) --[[ Line: 36 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v13, {
                open = false, 
                backpackOpen = v14.open
            });
        end, 
        [v7.name] = function(v15, v16) --[[ Line: 43 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v15, {
                open = false, 
                emotesOpen = v16.open
            });
        end, 
        [v9.name] = function(v17, v18) --[[ Line: 50 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v17, {
                emotesEnabled = v18.enabled
            });
        end, 
        [v8.name] = function(v19, v20) --[[ Line: 56 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v19, {
                open = false, 
                leaderboardOpen = v20.open
            });
        end
    }));
end;