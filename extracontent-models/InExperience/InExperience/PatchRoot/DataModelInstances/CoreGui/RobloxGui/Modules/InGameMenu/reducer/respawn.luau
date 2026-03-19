local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Cryo_0 = v1.Cryo;
local l_Rodux_0 = v1.Rodux;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetRespawning);
local v6 = require(l_Parent_0.Actions.SetRespawnBehavior);
local v7 = require(l_Parent_0.Actions.SetMenuOpen);
local v8 = require(l_Parent_0.Actions.SetCurrentPage);
return l_Rodux_0.createReducer({
    dialogOpen = false, 
    enabled = true, 
    customCallback = nil
}, {
    [v5.name] = function(v9, v10) --[[ Line: 20 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v9, {
            dialogOpen = v10.respawning
        });
    end, 
    [v7.name] = function(v11, v12) --[[ Line: 25 ]]
        -- upvalues: l_Cryo_0 (copy)
        if not v12.menuOpen then
            return l_Cryo_0.Dictionary.join(v11, {
                dialogOpen = false
            });
        else
            return v11;
        end;
    end, 
    [v8.name] = function(v13, _) --[[ Line: 35 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v13, {
            dialogOpen = false
        });
    end, 
    [v6.name] = function(v15, v16) --[[ Line: 40 ]]
        local l_dialogOpen_0 = v15.dialogOpen;
        if not v16.respawnEnabled then
            l_dialogOpen_0 = false;
        end;
        return {
            customCallback = v16.customCallback, 
            enabled = v16.respawnEnabled, 
            dialogOpen = l_dialogOpen_0
        };
    end
});