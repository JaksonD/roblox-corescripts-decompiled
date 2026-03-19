local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_Modules_0.AvatarExperience.Common.Context.AppliedDescription.useAppliedDescriptionValueContext);
local v4 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.AccessoryAdjustmentUtils);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local function v7(v6) --[[ Line: 14 ]] --[[ Name: selectAllowedAATypes ]]
    -- upvalues: v5 (copy)
    return v6.AvatarExperience.AvatarEditor.AvatarSettings[v5.AvatarSettings.accessoryRefinementTypes];
end;
return function() --[[ Line: 18 ]] --[[ Name: useAdjustableAccessories ]]
    -- upvalues: l_useSelector_0 (copy), v7 (copy), v3 (copy), v4 (copy)
    local v8 = l_useSelector_0(v7);
    local v9 = v3();
    local v10 = v9 and v9.appliedDescriptionBinding and v9.appliedDescriptionBinding:getValue();
    local v11 = {};
    if v10 then
        v11 = v4.getAdjustableAccessories(v10, v8);
    end;
    return v11;
end;