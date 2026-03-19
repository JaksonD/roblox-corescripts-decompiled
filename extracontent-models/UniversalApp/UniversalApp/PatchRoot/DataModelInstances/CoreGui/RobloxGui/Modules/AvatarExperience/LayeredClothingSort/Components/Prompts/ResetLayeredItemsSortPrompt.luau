local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v13 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local v14 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.LayeredMakeupSortUtils);
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v16 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.EquipOutfit);
local v18 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v21 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_FFlagAXCustomizeMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport;
local v24 = v2.PureComponent:extend("ResetLayeredItemsSortPrompt");
v24.validateProps = v5.strictInterface({
    screenSize = v5.Vector2, 
    lastSavedSort = v5.table, 
    equippedAssets = v5.optional(v5.table), 
    tryOnItems = if l_FFlagAXCustomizeMakeupSupport_0 then v5.optional(v5.table) else nil, 
    removedList = if l_FFlagAXCustomizeMakeupSupport_0 then v5.optional(v5.table) else nil, 
    setCurrentSort = v5.callback, 
    equipOutfit = v5.callback, 
    clearRemovedItems = v5.callback, 
    sendAnalytics = v5.callback, 
    setOrderForTryOns = if l_FFlagAXCustomizeMakeupSupport_0 then v5.callback else nil, 
    analytics = v5.table, 
    navigation = v5.table, 
    avatarRoute = if l_FFlagAXCustomizeMakeupSupport_0 then v5.table else nil, 
    focusController = v5.optional(v5.table), 
    defaultChildRef = v5.optional(v5.table), 
    onOverlayClosed = v5.optional(v5.callback)
});
v24.init = function(v25) --[[ Line: 64 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_AvatarScreen_0 (copy), v14 (copy), v13 (copy), v12 (copy)
    v25.resetToDefault = function() --[[ Line: 65 ]]
        -- upvalues: v25 (copy), l_FFlagAXCustomizeMakeupSupport_0 (ref), l_AvatarScreen_0 (ref), v14 (ref), v13 (ref)
        v25.props.sendAnalytics(v25.props.analytics.avatarRefineLayersResetConfirm);
        if l_FFlagAXCustomizeMakeupSupport_0 and v25.props.avatarRoute.current.name == l_AvatarScreen_0.LayeredMakeupSort then
            local v26 = v14.getEquippedAssetsBasedOnSortTable(v25.props.lastSavedSort, v25.props.equippedAssets, v25.props.tryOnItems, v25.props.removedList);
            local v27 = v14.getTryOnItemsOrderBasedOnSortTable(v25.props.lastSavedSort, v25.props.tryOnItems);
            v25.props.equipOutfit(v26);
            v25.props.setOrderForTryOns(v27);
        else
            local v28 = v13.formatForEquipOutfit(v25.props.lastSavedSort, v25.props.equippedAssets);
            v25.props.equipOutfit(v28);
        end;
        v25.props.setCurrentSort(v25.props.lastSavedSort);
        v25.props.clearRemovedItems();
        v25.closePrompt();
    end;
    v25.closePrompt = function() --[[ Line: 96 ]]
        -- upvalues: v12 (ref), v25 (copy)
        v12.closeOverlay(v25.props.navigation);
    end;
end;
v24.renderAlertLocalized = function(v29, v30) --[[ Line: 101 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v30.title, 
        bodyText = v30.body, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v29.closePrompt, 
                        text = v30.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v29.resetToDefault, 
                        text = v30.resetButtonText
                    }
                }
            }
        }, 
        screenSize = v29.props.screenSize, 
        defaultChildRef = v29.props.defaultChildRef
    });
end;
v24.render = function(v31) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        title = "Feature.Avatar.Title.LCSortReset", 
        body = "Feature.Avatar.Message.LCSortResetBody", 
        cancelButtonText = "Feature.Catalog.Action.Cancel", 
        resetButtonText = "CommonUI.Messages.Action.Reset"
    })(function(v32) --[[ Line: 134 ]]
        -- upvalues: v31 (copy)
        return v31:renderAlertLocalized(v32);
    end);
end;
v24 = v3.connect(function(v33, _) --[[ Line: 139 ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy)
    return {
        screenSize = v33.ScreenSize, 
        equippedAssets = v33.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        tryOnItems = if l_FFlagAXCustomizeMakeupSupport_0 then v33.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems else nil, 
        lastSavedSort = v33.AvatarExperience.LayeredClothingSort.LastSavedSort, 
        removedList = if l_FFlagAXCustomizeMakeupSupport_0 then v33.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList else nil
    };
end, function(v35) --[[ Line: 151 ]]
    -- upvalues: v15 (copy), v16 (copy), v17 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v18 (copy), v21 (copy)
    return {
        setCurrentSort = function(v36) --[[ Line: 153 ]] --[[ Name: setCurrentSort ]]
            -- upvalues: v35 (copy), v15 (ref)
            v35(v15(v36));
        end, 
        clearRemovedItems = function() --[[ Line: 156 ]] --[[ Name: clearRemovedItems ]]
            -- upvalues: v35 (copy), v16 (ref)
            v35(v16());
        end, 
        equipOutfit = function(v37) --[[ Line: 159 ]] --[[ Name: equipOutfit ]]
            -- upvalues: v35 (copy), v17 (ref)
            v35(v17(v37, false));
        end, 
        setOrderForTryOns = l_FFlagAXCustomizeMakeupSupport_0 and function(v38) --[[ Line: 163 ]]
            -- upvalues: v35 (copy), v18 (ref)
            v35(v18(v38));
        end or nil, 
        sendAnalytics = function(v39) --[[ Line: 167 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v35 (copy), v21 (ref)
            v35(v21(v39));
        end
    };
end)(v24);
v24 = v10((v11((l_RoactServices_0.connect({
    analytics = v20
})(v24)))));
if l_FFlagAXCustomizeMakeupSupport_0 then
    v24 = v9(v24);
end;
return v24;