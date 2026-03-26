local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetAvatarType);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.RemoveLayeredClothing);
local v14 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RemoveMakeup);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_FFlagAXBlockMakeupEquipR6_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlockMakeupEquipR6;
local v19 = v2.PureComponent:extend("LayeredClothingR6SwitchPrompt");
v19.validateProps = v4.strictInterface({
    onOverlayClosed = v4.optional(v4.callback), 
    defaultChildRef = v4.optional(v4.table), 
    focusController = v4.optional(v4.table), 
    navigation = v4.table, 
    screenSize = v4.Vector2, 
    setAvatarType = v4.callback, 
    removeLayeredClothing = v4.callback, 
    removeMakeup = if l_FFlagAXBlockMakeupEquipR6_0 then v4.callback else nil
});
v19.init = function(v20) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXBlockMakeupEquipR6_0 (copy), v15 (copy), v8 (copy)
    v20.switchToR6 = function() --[[ Line: 61 ]]
        -- upvalues: v20 (copy), l_FFlagAXBlockMakeupEquipR6_0 (ref), v15 (ref)
        v20.props.removeLayeredClothing();
        if l_FFlagAXBlockMakeupEquipR6_0 then
            v20.props.removeMakeup();
        end;
        v20.props.setAvatarType(v15.AvatarType.R6);
        v20.closePrompt();
    end;
    v20.closePrompt = function() --[[ Line: 70 ]]
        -- upvalues: v8 (ref), v20 (copy)
        v8.closeOverlay(v20.props.navigation);
    end;
end;
v19.renderLocalized = function(v21, v22) --[[ Line: 75 ]] --[[ Name: renderLocalized ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v22.titleText, 
        bodyText = v22.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v21.closePrompt, 
                        text = v22.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v21.switchToR6, 
                        text = v22.confirmButtonText
                    }
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v21.props.screenSize, 
        defaultChildRef = v21.props.defaultChildRef
    });
end;
v19.render = function(v23) --[[ Line: 103 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Common.AlertsAndOptions.Title.Warning", 
        bodyText = "Feature.Avatar.Label.LayeredClothingSwitchR6Warning", 
        confirmButtonText = "CommonUI.Controls.Action.Confirm", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v24) --[[ Line: 109 ]]
        -- upvalues: v23 (copy)
        return v23:renderLocalized(v24);
    end);
end;
return (v11((v10((v3.connect(function(v25, _) --[[ Line: 114 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v25.ScreenSize
    };
end, function(v27) --[[ Line: 120 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy), l_FFlagAXBlockMakeupEquipR6_0 (copy), v14 (copy)
    return {
        setAvatarType = function(v28) --[[ Line: 122 ]] --[[ Name: setAvatarType ]]
            -- upvalues: v27 (copy), v12 (ref)
            v27(v12(v28));
        end, 
        removeLayeredClothing = function() --[[ Line: 125 ]] --[[ Name: removeLayeredClothing ]]
            -- upvalues: v27 (copy), v13 (ref)
            v27(v13());
        end, 
        removeMakeup = l_FFlagAXBlockMakeupEquipR6_0 and function() --[[ Line: 129 ]]
            -- upvalues: v27 (copy), v14 (ref)
            v27(v14());
        end or nil
    };
end)(v19))))));