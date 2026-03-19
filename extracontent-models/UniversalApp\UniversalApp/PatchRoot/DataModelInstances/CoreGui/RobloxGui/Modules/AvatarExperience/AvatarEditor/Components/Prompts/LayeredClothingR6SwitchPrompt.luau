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
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v17 = v2.PureComponent:extend("LayeredClothingR6SwitchPrompt");
v17.validateProps = v4.strictInterface({
    onOverlayClosed = v4.optional(v4.callback), 
    defaultChildRef = v4.optional(v4.table), 
    focusController = v4.optional(v4.table), 
    navigation = v4.table, 
    screenSize = v4.Vector2, 
    setAvatarType = v4.callback, 
    removeLayeredClothing = v4.callback
});
v17.init = function(v18) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), v8 (copy)
    v18.switchToR6 = function() --[[ Line: 56 ]]
        -- upvalues: v18 (copy), v14 (ref)
        v18.props.removeLayeredClothing();
        v18.props.setAvatarType(v14.AvatarType.R6);
        v18.closePrompt();
    end;
    v18.closePrompt = function() --[[ Line: 62 ]]
        -- upvalues: v8 (ref), v18 (copy)
        v8.closeOverlay(v18.props.navigation);
    end;
end;
v17.renderLocalized = function(v19, v20) --[[ Line: 67 ]] --[[ Name: renderLocalized ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v20.titleText, 
        bodyText = v20.bodyText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v19.closePrompt, 
                        text = v20.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v19.switchToR6, 
                        text = v20.confirmButtonText
                    }
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v19.props.screenSize, 
        defaultChildRef = v19.props.defaultChildRef
    });
end;
v17.render = function(v21) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Common.AlertsAndOptions.Title.Warning", 
        bodyText = "Feature.Avatar.Label.LayeredClothingSwitchR6Warning", 
        confirmButtonText = "CommonUI.Controls.Action.Confirm", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v22) --[[ Line: 101 ]]
        -- upvalues: v21 (copy)
        return v21:renderLocalized(v22);
    end);
end;
return (v11((v10((v3.connect(function(v23, _) --[[ Line: 106 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v23.ScreenSize
    };
end, function(v25) --[[ Line: 112 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy)
    return {
        setAvatarType = function(v26) --[[ Line: 114 ]] --[[ Name: setAvatarType ]]
            -- upvalues: v25 (copy), v12 (ref)
            v25(v12(v26));
        end, 
        removeLayeredClothing = function() --[[ Line: 117 ]] --[[ Name: removeLayeredClothing ]]
            -- upvalues: v25 (copy), v13 (ref)
            v25(v13());
        end
    };
end)(v17))))));