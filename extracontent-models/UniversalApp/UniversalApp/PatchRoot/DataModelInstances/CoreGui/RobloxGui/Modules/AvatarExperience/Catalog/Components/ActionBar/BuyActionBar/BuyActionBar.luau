local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useFocusController_0 = require(l_CorePackages_0.Packages.RoactGamepad).useFocusController;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_useInputType_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useInputType;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v8 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v9 = require(l_Modules_0.LuaApp.Constants);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBar);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBarWithTimedOptions);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v14 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v15 = require(l_Modules_0.AvatarExperience.Experiments.AXShareButtonOnActionBarIXP);
local v16 = require(l_Modules_0.AvatarExperience.Common.Hooks.useShareButton);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v19 = require(script.Parent.useFetchRobuxOnMount);
local v20 = require(script.Parent.useBuyActionBarButtonProps);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v22 = game:DefineFastFlag("AXFixItemDetailsMoreButtonHighlighted", false);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
return v2.memo(function(v24) --[[ Line: 52 ]] --[[ Name: BuyActionBar ]]
    -- upvalues: v19 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v2 (copy), l_useNavigation_0 (copy), l_useInputType_0 (copy), l_useDispatch_0 (copy), v22 (copy), v9 (copy), v13 (copy), l_AvatarScreen_0 (copy), v14 (copy), v15 (copy), v8 (copy), l_sendAXCounterV2_0 (copy), v10 (copy), v16 (copy), v20 (copy), l_FFlagAXDurablesSupport_0 (copy), v12 (copy), v11 (copy)
    v19();
    local v25 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v26, v27 = v2.useState(false);
    local v28 = l_useNavigation_0();
    local v29 = l_useInputType_0();
    local v30 = l_useDispatch_0();
    local v32 = v2.useCallback(function() --[[ Line: 60 ]]
        -- upvalues: v22 (ref), v27 (copy), v29 (copy), v9 (ref), v13 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v25 (copy)
        if v22 then
            v27(false);
        else
            v27(true);
        end;
        local v31 = v29 == v9.InputType.Gamepad;
        v13("BuyActionBar", v31);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v31 then
            v25.captureFocus();
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v25, 
        v29
    });
    local v36 = v2.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v28 (copy), l_AvatarScreen_0 (ref), v24 (copy), v32 (copy), v30 (copy), v14 (ref), v27 (copy)
        local v33 = v28.getParam("fromProfile");
        local v34 = v28.state.routeName == l_AvatarScreen_0.TryOnItem;
        local v35 = v33 or v34;
        v30(v14(function() --[[ Line: 81 ]]
            -- upvalues: v28 (ref), l_AvatarScreen_0 (ref), v24 (ref), v32 (ref), v35 (copy), v34 (copy)
            v28.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = v24.itemId, 
                itemType = v24.itemType, 
                onOverlayClosed = v32, 
                centered = v35, 
                hideItemDetailsButtonVisible = v34, 
                itemDetailsPeekViewRefs = v24.itemDetailsPeekViewRefs
            });
        end));
        v27(true);
    end, {
        v30, 
        v24.itemDetailsPeekViewRefs, 
        v32, 
        v24.itemType, 
        v24.itemId, 
        v28
    });
    local v37 = nil;
    if v15.isEnabled() and v8.readTestVariable(v15.ShowShareButtonOnActionBar) then
        local v38 = v2.useCallback(function() --[[ Line: 102 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v10 (ref), v24 (copy)
            l_sendAXCounterV2_0(v10.Counter.ShareButtonProfileration.ShareButtonClicked, {
                itemId = v24.itemId, 
                itemType = v24.itemType
            });
        end, {
            v24.itemId, 
            v24.itemType
        });
        v37 = v16(v24.itemId, v24.itemType, false, v38);
    end;
    local v39 = v20(v32, v24.itemId, v24.itemType, if l_FFlagAXDurablesSupport_0 then v24.selectedTimedOptionDays else nil, if l_FFlagAXDurablesSupport_0 then v24.hidePrice else nil, if l_FFlagAXDurablesSupport_0 then v24.showTimedOptionInBuyButton else nil);
    if l_FFlagAXDurablesSupport_0 and v24.timedOptions then
        return v2.createElement(v12, {
            timedOptions = v24.timedOptions, 
            buttonProps = v39, 
            onSelectedDaysChanged = v24.setSelectedTimedOptionDays
        });
    else
        return v2.createElement(v11, {
            ZIndex = v24.ZIndex, 
            leftPadding = v24.leftPadding, 
            rightPadding = v24.rightPadding, 
            topPadding = v24.topPadding, 
            bottomPadding = v24.bottomPadding or 0, 
            showMoreButton = v24.showMoreButton or true, 
            showMiddleButton = v37 and true or nil, 
            onMiddleButtonActivated = if v37 then v37.onActivated else nil, 
            middleButtonIcon = if v37 then v37.icon else nil, 
            buttonProps = v39, 
            onMoreButtonActivated = v36, 
            isMoreButtonSelected = v26, 
            hideGradient = v24.hideGradient
        });
    end;
end);