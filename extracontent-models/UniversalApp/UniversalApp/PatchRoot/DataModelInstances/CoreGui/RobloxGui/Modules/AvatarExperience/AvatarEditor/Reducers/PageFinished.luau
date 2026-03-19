local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetPageFinished);
return v2.createReducer({}, {
    [v4.name] = function(v5, v6) --[[ Line: 13 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v5, {
            [v6.assetTypeId] = v6.isFinished
        });
    end
});