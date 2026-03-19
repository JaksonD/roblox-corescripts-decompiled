local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_selectAdjustableLastTryOnItem_0 = v4.State.Selectors.selectAdjustableLastTryOnItem;
local v7 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Hooks.useAccessoryAdjustmentQuickButtonFtux);
local l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP;
return function() --[[ Line: 18 ]]
    -- upvalues: v3 (copy), l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0 (copy), v7 (copy), l_useSelector_0 (copy), l_selectAdjustableLastTryOnItem_0 (copy), v2 (copy)
    local v9 = v3.readTestVariable(l_AXEnableAccessoryAdjustmentDuringTryOnIXP_0.EnabledForUser);
    local v10 = v7();
    local v11 = l_useSelector_0(l_selectAdjustableLastTryOnItem_0);
    v2.useEffect(function() --[[ Line: 26 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if v9 and v10 and v10.shouldShowFirstTimeGlow() then
            task.delay(10, function() --[[ Line: 32 ]]
                -- upvalues: v10 (ref)
                v10.completeFirstTimeGlow();
            end);
        end;
    end, {
        v9, 
        v10
    });
    return {
        shouldEnableAccessoryAdjustmentDuringTryOn = v9, 
        adjustableLastTryOnItemId = v11, 
        accessoryAdjustmentQuickButtonFtux = v10
    };
end;