local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v6 = require(l_CorePackages_0.Packages.React);
local l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXColorAdjustmentButtonShouldAccountForTryOns;
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v9 = if l_FFlagAXColorAdjustmentButtonShouldAccountForTryOns_0 then v8.State.Selectors.selectTryOnBodyIds else require(l_Modules_0.AvatarExperience.Common.Selectors.selectTryOnBodyIds);
local v10 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectDefaultTryOnBodyColorsToggled);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.DefaultTryOnBodyColorsToggled);
local _ = require(script.Parent.ColorAdjustmentPage);
local function v18(v13) --[[ Line: 24 ]] --[[ Name: selectColorPickerAvailable ]]
    -- upvalues: v9 (copy)
    local v14 = v9(v13);
    if #v14 == 0 then
        return true;
    else
        for _, v16 in v14 do
            local v17 = v13.AvatarExperience.Common.BundleInfos[v16];
            if v17 and v17.isRecolorable then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v23(v19) --[[ Line: 38 ]] --[[ Name: selectDefaultColorCheckboxAvailable ]]
    -- upvalues: v9 (copy)
    for _, v21 in (v9(v19)) do
        local v22 = v19.AvatarExperience.Common.BundleInfos[v21];
        if v22 and v22.isRecolorable then
            return true;
        end;
    end;
    return false;
end;
return function() --[[ Line: 49 ]] --[[ Name: useColorAdjustmentPageProps ]]
    -- upvalues: l_useNavigation_0 (copy), v6 (copy), l_useSelector_0 (copy), v18 (copy), v10 (copy), v23 (copy), l_useDispatch_0 (copy), v11 (copy)
    local v24 = l_useNavigation_0();
    local v25 = v6.useCallback(function() --[[ Line: 51 ]]
        -- upvalues: v24 (copy)
        v24.pop();
    end, {
        v24
    });
    local v26 = l_useSelector_0(v18);
    local v27 = l_useSelector_0(v10);
    local v28 = l_useSelector_0(v23);
    local v29 = l_useDispatch_0();
    local v30 = v6.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v29 (copy), v11 (ref), v27 (copy)
        v29(v11(not v27));
    end, {
        v29, 
        v27
    });
    return {
        onBackButtonPressed = v25, 
        colorPickerAvailable = v26, 
        defaultColorCheckboxAvailable = v28, 
        defaultColorChecked = v27, 
        onDefaultColorCheckboxActivated = v30
    };
end;