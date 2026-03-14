local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Rodux_0 = v1.Rodux;
local l_Cryo_0 = v1.Cryo;
local l_Parent_0 = script.Parent.Parent;
local v5 = require(l_Parent_0.Actions.OpenNativeClosePrompt);
local v6 = require(l_Parent_0.Actions.CloseNativeClosePrompt);
local v7 = require(l_Parent_0.Actions.SetMenuIconTooltipOpen);
return l_Rodux_0.createReducer({
    closingApp = false, 
    menuIconTooltipOpen = false
}, {
    [v5.name] = function(v8, _) --[[ Line: 17 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v8, {
            closingApp = true
        });
    end, 
    [v6.name] = function(v10, _) --[[ Line: 22 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v10, {
            closingApp = false
        });
    end, 
    [v7.name] = function(v12, v13) --[[ Line: 27 ]]
        -- upvalues: l_Cryo_0 (copy)
        return l_Cryo_0.Dictionary.join(v12, {
            menuIconTooltipOpen = v13.menuIconTooltipOpen
        });
    end
});