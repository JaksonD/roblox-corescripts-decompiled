local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v4 = require(l_Modules_0.AvatarExperience.AccessoryAdjustment.Selectors.selectAssetTypeId);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_memoize_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).memoize;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local v9 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils_0 = v9.FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils;
local l_FFlagAXProvideAccessoryAdjustmentDefaults_0 = v9.FFlagAXProvideAccessoryAdjustmentDefaults;
local l_FFlagAXAccessoryAdjustmentReturnOnNil_0 = v9.FFlagAXAccessoryAdjustmentReturnOnNil;
local v13 = {
    position = {
        xPosition = -0.25, 
        yPosition = -0.25, 
        zPosition = -0.25
    }, 
    rotation = {
        xRotation = -15, 
        yRotation = -30, 
        zRotation = -30
    }, 
    scale = {
        xScale = 0.8, 
        yScale = 0.8, 
        zScale = 0.8
    }
};
local v16 = l_memoize_0(function(v14, v15) --[[ Line: 39 ]]
    return v15[string.lower((string.sub(v14, 1, 1))) .. string.sub(v14, 2)];
end);
return function(v17) --[[ Line: 48 ]]
    -- upvalues: v3 (copy), v4 (copy), l_FFlagAXAccessoryAdjustmentReturnOnNil_0 (copy), v13 (copy), v5 (copy), l_FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils_0 (copy), l_FFlagAXProvideAccessoryAdjustmentDefaults_0 (copy), l_mutedError_0 (copy), v16 (copy)
    local v18 = v17.AvatarExperience.AvatarEditor.AvatarSettings[v3.AvatarSettings.accessoryRefinementLowerBounds];
    local v19 = v4(v17);
    if l_FFlagAXAccessoryAdjustmentReturnOnNil_0 and not v19 then
        return v13;
    else
        local v20 = v5.AssetTypeIdStringToName[v19];
        if l_FFlagAXRemoveMemoizeFromAccessoryAdjustmentUtils_0 then
            if l_FFlagAXProvideAccessoryAdjustmentDefaults_0 and not v20 then
                l_mutedError_0((("[selectLowerAdjustmentLimits] No accessory type name found for asset type id: %*"):format(v19)));
                return v13;
            else
                return v18[string.lower((string.sub(v20, 1, 1))) .. string.sub(v20, 2)];
            end;
        else
            return v16(v20, v18);
        end;
    end;
end;