local l_script_FirstAncestor_0 = script:FindFirstAncestor("FocusNavigationUtils");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.useLastInputMethod);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.Navigation);
local l_useNavigation_0 = v4.useNavigation;
local l_getRouteIsFocused_0 = v4.getRouteIsFocused;
local l_getCurrentNavigationState_0 = v4.getCurrentNavigationState;
local l_AvatarScreen_0 = require(l_Parent_0.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v10 = require(l_Parent_0.SharedFlags);
local l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 = v10.FFlagAXMigrateCatalogContextMenuFromRoactGamepad;
local l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 = v10.FFlagAXMigrateSaveOutfitPromptFromRoactGamepad;
local v13 = {
    [l_AvatarScreen_0.CatalogContextMenu] = true, 
    [l_AvatarScreen_0.SaveOutfitPrompt] = l_FFlagAXMigrateSaveOutfitPromptFromRoactGamepad_0 and true or nil, 
    [l_AvatarScreen_0.ColorAdjustment] = true
};
local function _(v14) --[[ Line: 27 ]] --[[ Name: getAvatarRouteIsFocused ]]
    -- upvalues: l_getRouteIsFocused_0 (copy), l_AppPage_0 (copy)
    return l_getRouteIsFocused_0(v14, l_AppPage_0.AvatarExperienceRoot);
end;
local function _(v16) --[[ Line: 31 ]] --[[ Name: getRouteInGreenList ]]
    -- upvalues: l_getCurrentNavigationState_0 (copy), v13 (copy)
    local v17 = l_getCurrentNavigationState_0(v16.state);
    local v18 = if v17 then v17.routeName else nil;
    if v18 then
        return v13[v18];
    else
        return false;
    end;
end;
return function() --[[ Line: 38 ]] --[[ Name: useDisableAutoFocus ]]
    -- upvalues: v2 (copy), l_useNavigation_0 (copy), l_getRouteIsFocused_0 (copy), l_AppPage_0 (copy), l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 (copy), l_getCurrentNavigationState_0 (copy), v13 (copy), l_useSelector_0 (copy)
    local v20 = v2();
    local v21 = l_useNavigation_0();
    local l_state_0 = v21.state;
    local v23 = l_getRouteIsFocused_0(l_state_0, l_AppPage_0.AvatarExperienceRoot);
    if v23 then
        if l_FFlagAXMigrateCatalogContextMenuFromRoactGamepad_0 then
            local v24 = l_getCurrentNavigationState_0(v21.state);
            local v25 = if v24 then v24.routeName else nil;
            v23 = not if v25 then v13[v25] else false;
        else
            v23 = true;
        end;
    end;
    l_state_0 = l_useSelector_0(function(v26) --[[ Line: 44 ]]
        return v26.CentralOverlay.OverlayType ~= nil;
    end);
    return v23 and not l_state_0 and v20 == "Gamepad";
end;