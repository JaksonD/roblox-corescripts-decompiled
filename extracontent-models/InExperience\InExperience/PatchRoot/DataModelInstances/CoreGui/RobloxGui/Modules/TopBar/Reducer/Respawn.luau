local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Flags.FFlagTopBarDeprecateRespawnRodux) then
    return nil;
else
    local v2 = require(l_CorePackages_0.Packages.Rodux);
    local l_Actions_0 = script.Parent.Parent.Actions;
    local v4 = require(l_Actions_0.SetRespawnBehaviour);
    return v2.createReducer({
        enabled = true, 
        customCallback = nil
    }, {
        [v4.name] = function(_, v6) --[[ Line: 20 ]]
            return {
                enabled = v6.respawnEnabled, 
                customCallback = v6.customCallback
            };
        end
    });
end;