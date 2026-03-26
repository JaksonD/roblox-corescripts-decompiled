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
local l_FFlagAXDurablesForMIS_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesForMIS;
return v2.memo(function(v25) --[[ Line: 57 ]] --[[ Name: BuyActionBar ]]
    -- upvalues: v19 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v2 (copy), l_useNavigation_0 (copy), l_useInputType_0 (copy), l_useDispatch_0 (copy), v22 (copy), v9 (copy), v13 (copy), l_AvatarScreen_0 (copy), v14 (copy), v15 (copy), v8 (copy), l_sendAXCounterV2_0 (copy), v10 (copy), v16 (copy), v20 (copy), l_FFlagAXDurablesSupport_0 (copy), v12 (copy), l_FFlagAXDurablesForMIS_0 (copy), v11 (copy)
    v19();
    local v26 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v27, v28 = v2.useState(false);
    local v29 = l_useNavigation_0();
    local v30 = l_useInputType_0();
    local v31 = l_useDispatch_0();
    local v33 = v2.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v22 (ref), v28 (copy), v30 (copy), v9 (ref), v13 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v26 (copy)
        if v22 then
            v28(false);
        else
            v28(true);
        end;
        local v32 = v30 == v9.InputType.Gamepad;
        v13("BuyActionBar", v32);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v32 then
            v26.captureFocus();
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v26, 
        v30
    });
    local v37 = v2.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v29 (copy), l_AvatarScreen_0 (ref), v25 (copy), v33 (copy), v31 (copy), v14 (ref), v28 (copy)
        local v34 = v29.getParam("fromProfile");
        local v35 = v29.state.routeName == l_AvatarScreen_0.TryOnItem;
        local v36 = v34 or v35;
        v31(v14(function() --[[ Line: 86 ]]
            -- upvalues: v29 (ref), l_AvatarScreen_0 (ref), v25 (ref), v33 (ref), v36 (copy), v35 (copy)
            v29.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = v25.itemId, 
                itemType = v25.itemType, 
                onOverlayClosed = v33, 
                centered = v36, 
                hideItemDetailsButtonVisible = v35, 
                itemDetailsPeekViewRefs = v25.itemDetailsPeekViewRefs
            });
        end));
        v28(true);
    end, {
        v31, 
        v25.itemDetailsPeekViewRefs, 
        v33, 
        v25.itemType, 
        v25.itemId, 
        v29
    });
    local v38 = nil;
    if v15.isEnabled() and v8.readTestVariable(v15.ShowShareButtonOnActionBar) then
        local v39 = v2.useCallback(function() --[[ Line: 107 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v10 (ref), v25 (copy)
            l_sendAXCounterV2_0(v10.Counter.ShareButtonProfileration.ShareButtonClicked, {
                itemId = v25.itemId, 
                itemType = v25.itemType
            });
        end, {
            v25.itemId, 
            v25.itemType
        });
        v38 = v16(v25.itemId, v25.itemType, false, v39);
    end;
    local v40 = v20(v33, v25.itemId, v25.itemType, if l_FFlagAXDurablesSupport_0 then v25.selectedTimedOptionDays else nil, if l_FFlagAXDurablesSupport_0 then v25.hidePrice else nil, if l_FFlagAXDurablesSupport_0 then v25.showTimedOptionInBuyButton else nil);
    if l_FFlagAXDurablesSupport_0 and v25.timedOptions then
        return v2.createElement(v12, {
            timedOptions = v25.timedOptions, 
            buttonProps = v40, 
            onSelectedDaysChanged = v25.setSelectedTimedOptionDays, 
            selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v25.selectedTimedOptionIndexInReducer else nil
        });
    else
        return v2.createElement(v11, {
            ZIndex = v25.ZIndex, 
            leftPadding = v25.leftPadding, 
            rightPadding = v25.rightPadding, 
            topPadding = v25.topPadding, 
            bottomPadding = v25.bottomPadding or 0, 
            showMoreButton = v25.showMoreButton or true, 
            showMiddleButton = v38 and true or nil, 
            onMiddleButtonActivated = if v38 then v38.onActivated else nil, 
            middleButtonIcon = if v38 then v38.icon else nil, 
            buttonProps = v40, 
            onMoreButtonActivated = v37, 
            isMoreButtonSelected = v27, 
            hideGradient = v25.hideGradient, 
            showSecondaryButton = if l_FFlagAXDurablesForMIS_0 then v25.showSecondaryButton else nil, 
            secondaryButtonText = if l_FFlagAXDurablesForMIS_0 then v25.secondaryButtonText else nil, 
            onSecondaryButtonActivated = if l_FFlagAXDurablesForMIS_0 then v25.onSecondaryButtonActivated else nil
        });
    end;
end);