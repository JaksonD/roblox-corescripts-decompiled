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
local l_logOnOverlayClosed_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed;
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v15 = require(l_Modules_0.AvatarExperience.Experiments.AXShareButtonOnActionBarIXP);
local v16 = require(l_Modules_0.AvatarExperience.Common.Hooks.useShareButton);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v21 = require(script.Parent.useFetchRobuxOnMount);
local v22 = require(script.Parent.useBuyActionBarButtonProps);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v24 = game:DefineFastFlag("AXFixItemDetailsMoreButtonHighlighted", false);
local v25 = game:DefineFastFlag("AXNoTimedOptionsForOwnedItems", false);
local l_FFlagAXDurablesForMIS_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesForMIS;
return v2.memo(function(v27) --[[ Line: 60 ]] --[[ Name: BuyActionBar ]]
    -- upvalues: v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v2 (copy), l_useNavigation_0 (copy), l_useInputType_0 (copy), l_useDispatch_0 (copy), v24 (copy), v9 (copy), l_logOnOverlayClosed_0 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy), v15 (copy), v8 (copy), l_sendAXCounterV2_0 (copy), v10 (copy), v16 (copy), v22 (copy), v20 (copy), v25 (copy), l_useSelector_0 (copy), v12 (copy), l_FFlagAXDurablesForMIS_0 (copy), v11 (copy)
    v21();
    local v28 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v29, v30 = v2.useState(false);
    local v31 = l_useNavigation_0();
    local v32 = l_useInputType_0();
    local v33 = l_useDispatch_0();
    local v35 = v2.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v24 (ref), v30 (copy), v32 (copy), v9 (ref), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v28 (copy)
        if v24 then
            v30(false);
        else
            v30(true);
        end;
        local v34 = v32 == v9.InputType.Gamepad;
        l_logOnOverlayClosed_0("BuyActionBar", v34);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v34 then
            v28.captureFocus();
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v28, 
        v32
    });
    local v39 = v2.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v31 (copy), l_AvatarScreen_0 (ref), v27 (copy), v35 (copy), v33 (copy), l_NavigateWithLock_0 (ref), v30 (copy)
        local v36 = v31.getParam("fromProfile");
        local v37 = v31.state.routeName == l_AvatarScreen_0.TryOnItem;
        local v38 = v36 or v37;
        v33(l_NavigateWithLock_0(function() --[[ Line: 89 ]]
            -- upvalues: v31 (ref), l_AvatarScreen_0 (ref), v27 (ref), v35 (ref), v38 (copy), v37 (copy)
            v31.navigate(l_AvatarScreen_0.CatalogContextMenu, {
                itemId = v27.itemId, 
                itemType = v27.itemType, 
                onOverlayClosed = v35, 
                centered = v38, 
                hideItemDetailsButtonVisible = v37, 
                itemDetailsPeekViewRefs = v27.itemDetailsPeekViewRefs
            });
        end));
        v30(true);
    end, {
        v33, 
        v27.itemDetailsPeekViewRefs, 
        v35, 
        v27.itemType, 
        v27.itemId, 
        v31
    });
    local v40 = nil;
    if v15.isEnabled() and v8.readTestVariable(v15.ShowShareButtonOnActionBar) then
        local v41 = v2.useCallback(function() --[[ Line: 110 ]]
            -- upvalues: l_sendAXCounterV2_0 (ref), v10 (ref), v27 (copy)
            l_sendAXCounterV2_0(v10.Counter.ShareButtonProfileration.ShareButtonClicked, {
                itemId = v27.itemId, 
                itemType = v27.itemType
            });
        end, {
            v27.itemId, 
            v27.itemType
        });
        v40 = v16(v27.itemId, v27.itemType, false, v41);
    end;
    local v42 = v22(v35, v27.itemId, v27.itemType, v27.selectedTimedOptionDays, v27.hidePrice, v27.showTimedOptionInBuyButton);
    local v45 = v2.useCallback(function(v43) --[[ Line: 129 ]]
        -- upvalues: v20 (ref), v27 (copy)
        local v44 = v20(v43.AvatarExperience.Common, v27.itemId, v27.itemType);
        return v44 and v44.isOwned and not v44.expirationTime or false;
    end, {
        v27.itemId, 
        v27.itemType
    });
    local v46 = if v25 then l_useSelector_0(v45) else nil;
    if if v25 then v27.timedOptions and not v46 else v27.timedOptions then
        return v2.createElement(v12, {
            timedOptions = v27.timedOptions, 
            itemId = if l_FFlagAXDurablesForMIS_0 then v27.itemId else nil, 
            itemType = if l_FFlagAXDurablesForMIS_0 then v27.itemType else nil, 
            buttonProps = v42, 
            onSelectedDaysChanged = v27.setSelectedTimedOptionDays, 
            selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 then v27.selectedTimedOptionIndexInReducer else nil
        });
    else
        return v2.createElement(v11, {
            ZIndex = v27.ZIndex, 
            leftPadding = v27.leftPadding, 
            rightPadding = v27.rightPadding, 
            topPadding = v27.topPadding, 
            bottomPadding = v27.bottomPadding or 0, 
            showMoreButton = v27.showMoreButton or true, 
            showMiddleButton = v40 and true or nil, 
            onMiddleButtonActivated = if v40 then v40.onActivated else nil, 
            middleButtonIcon = if v40 then v40.icon else nil, 
            buttonProps = v42, 
            onMoreButtonActivated = v39, 
            isMoreButtonSelected = v29, 
            hideGradient = v27.hideGradient, 
            showSecondaryButton = if l_FFlagAXDurablesForMIS_0 then v27.showSecondaryButton else nil, 
            secondaryButtonText = if l_FFlagAXDurablesForMIS_0 then v27.secondaryButtonText else nil, 
            onSecondaryButtonActivated = if l_FFlagAXDurablesForMIS_0 then v27.onSecondaryButtonActivated else nil
        });
    end;
end);