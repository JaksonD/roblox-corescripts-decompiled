local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Cryo_0 = v1.Cryo;
local l_Rodux_0 = v1.Rodux;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.SetGameNameAndDescription);
return l_Rodux_0.createReducer({
    name = "Game", 
    description = ""
}, {
    [v5.name] = function(v6, v7) --[[ Line: 15 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v6, {
            name = v7.gameName, 
            description = v7.gameDescription
        });
    end
});