local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v17 = v3.PureComponent:extend("EquipOutfitConfirmation");
local v18 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagFixAvatarCostumeChange);
v17.validateProps = v6.strictInterface({
    outfitInfo = v6.table, 
    onOverlayClosed = v6.optional(v6.callback), 
    onEquip = v6.optional(v6.callback), 
    screenSize = v6.Vector2, 
    equipOutfit = v6.callback, 
    defaultChildRef = v6.optional(v6.table), 
    focusController = v6.optional(v6.table), 
    analytics = v6.optional(v6.table), 
    navigation = v6.table
});
v17.init = function(v19) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v16 (copy)
    v19.equipCostume = function() --[[ Line: 48 ]]
        -- upvalues: v19 (copy), v18 (ref)
        local l_outfitInfo_0 = v19.props.outfitInfo;
        local l_analytics_0 = v19.props.analytics;
        local l_navigation_0 = v19.props.navigation;
        if v18() then
            v19.closePrompt();
            local v23 = v19.props.equipOutfit(l_outfitInfo_0, l_analytics_0, l_navigation_0, nil);
            if v19.props.onEquip then
                v19.props.onEquip(v23);
                return;
            end;
        else
            local v24 = v19.props.equipOutfit(l_outfitInfo_0, l_analytics_0, l_navigation_0, nil);
            if v19.props.onEquip then
                v19.props.onEquip(v24);
            end;
            v19.closePrompt();
        end;
    end;
    v19.closePrompt = function() --[[ Line: 69 ]]
        -- upvalues: v16 (ref), v19 (copy)
        v16.closeOverlay(v19.props.navigation);
    end;
end;
v17.renderLocalized = function(v25, v26) --[[ Line: 74 ]] --[[ Name: renderLocalized ]]
    -- upvalues: v3 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v3.createElement(l_InteractiveAlert_0, {
        title = v26.titleText, 
        bodyText = v26.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v25.closePrompt, 
                        text = v26.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v25.equipCostume, 
                        text = v26.confirmButtonText
                    }
                }
            }
        }, 
        screenSize = v25.props.screenSize, 
        defaultChildRef = v25.props.defaultChildRef
    });
end;
v17.render = function(v27) --[[ Line: 101 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Action.Switch", 
        messageText = "Feature.Avatar.Message.EquipCostumeConfirmation", 
        confirmButtonText = "Feature.Avatar.Action.Switch", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v28) --[[ Line: 107 ]]
        -- upvalues: v27 (copy)
        return v27:renderLocalized(v28);
    end);
end;
v17 = v12((v13((v4.connect(function(v29, _) --[[ Line: 112 ]]
    return {
        screenSize = v29.ScreenSize
    };
end, function(v31) --[[ Line: 116 ]]
    -- upvalues: v15 (copy)
    return {
        equipOutfit = function(v32, v33, v34, v35) --[[ Line: 118 ]] --[[ Name: equipOutfit ]]
            -- upvalues: v31 (copy), v15 (ref)
            local v36 = {
                outfitInfo = v32, 
                analytics = v33, 
                navigation = v34, 
                isSelected = v35
            };
            return v31(v15(v36));
        end
    };
end)(v17)))));
return (l_RoactServices_0.connect({
    analytics = v10
})(v17));