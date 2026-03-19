local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetRemoteUprankedItems);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return v2.createReducer({}, {
    [v4.name] = function(_, v7) --[[ Line: 12 ]]
        -- upvalues: v3 (copy)
        v3.isType(v7.uprankedItems, "table", "items data must be a table.");
        return v7.uprankedItems;
    end
});