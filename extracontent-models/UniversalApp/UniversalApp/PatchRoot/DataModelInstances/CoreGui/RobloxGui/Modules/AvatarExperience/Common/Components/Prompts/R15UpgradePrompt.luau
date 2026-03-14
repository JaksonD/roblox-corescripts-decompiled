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
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local v17 = game:DefineFastFlag("AXFixR15PromptDismiss", false);
local v18 = v2.PureComponent:extend("R15UpgradePrompt");
v18.validateProps = v4.strictInterface({
    bodyTextKey = v4.string, 
    onSwitchSelected = v4.optional(v4.callback), 
    onOverlayClosed = v4.optional(v4.callback), 
    onOverlayClosedPostClose = v4.optional(v4.callback), 
    defaultChildRef = v4.optional(v4.table), 
    focusController = v4.optional(v4.table), 
    navigation = v4.table, 
    screenSize = v4.Vector2, 
    setAvatarType = v4.callback, 
    toggleEquipAsset = v4.callback
});
v18.init = function(v19) --[[ Line: 61 ]] --[[ Name: init ]]
    -- upvalues: v14 (copy), v8 (copy)
    v19.switchToR15 = function() --[[ Line: 62 ]]
        -- upvalues: v19 (copy), v14 (ref)
        v19.props.setAvatarType(v14.AvatarType.R15);
        if v19.props.onSwitchSelected then
            v19.props.onSwitchSelected();
        end;
        v19.closePrompt();
    end;
    v19.closePrompt = function() --[[ Line: 70 ]]
        -- upvalues: v8 (ref), v19 (copy)
        v8.closeOverlay(v19.props.navigation);
        if v19.props.onOverlayClosedPostClose then
            v19.props.onOverlayClosedPostClose();
        end;
    end;
end;
v18.renderLocalized = function(v20, v21) --[[ Line: 78 ]] --[[ Name: renderLocalized ]]
    -- upvalues: v17 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    if v17 then
        return v2.createElement("TextButton", {
            Size = UDim2.fromScale(1, 1), 
            Transparency = 1, 
            Selectable = false, 
            [v2.Event.Activated] = v20.closePrompt
        }, {
            InteractiveAlert = v2.createElement(l_InteractiveAlert_0, {
                title = v21.titleText, 
                bodyText = v21.bodyText, 
                buttonStackInfo = {
                    buttons = {
                        {
                            props = {
                                onActivated = v20.closePrompt, 
                                text = v21.cancelButtonText
                            }, 
                            isDefaultChild = true
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                onActivated = v20.switchToR15, 
                                text = v21.confirmButtonText
                            }
                        }
                    }
                }, 
                position = UDim2.fromScale(0.5, 0.5), 
                screenSize = v20.props.screenSize, 
                defaultChildRef = v20.props.defaultChildRef
            })
        });
    else
        return v2.createElement(l_InteractiveAlert_0, {
            title = v21.titleText, 
            bodyText = v21.bodyText, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            onActivated = v20.closePrompt, 
                            text = v21.cancelButtonText
                        }, 
                        isDefaultChild = true
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v20.switchToR15, 
                            text = v21.confirmButtonText
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v20.props.screenSize, 
            defaultChildRef = v20.props.defaultChildRef
        });
    end;
end;
v18.render = function(v22) --[[ Line: 141 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Feature.Avatar.Label.SwitchToR15", 
        bodyText = v22.props.bodyTextKey, 
        confirmButtonText = "Feature.Avatar.Action.Switch", 
        cancelButtonText = "Feature.Avatar.Action.Cancel"
    })(function(v23) --[[ Line: 147 ]]
        -- upvalues: v22 (copy)
        return v22:renderLocalized(v23);
    end);
end;
return (v11((v10((v3.connect(function(v24, _) --[[ Line: 152 ]] --[[ Name: mapStateToProps ]]
    return {
        screenSize = v24.ScreenSize
    };
end, function(v26) --[[ Line: 158 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v12 (copy), v13 (copy)
    return {
        setAvatarType = function(v27) --[[ Line: 160 ]] --[[ Name: setAvatarType ]]
            -- upvalues: v26 (copy), v12 (ref)
            v26(v12(v27));
        end, 
        toggleEquipAsset = function(v28, v29, v30) --[[ Line: 163 ]] --[[ Name: toggleEquipAsset ]]
            -- upvalues: v26 (copy), v13 (ref)
            v26(v13(v28, v29, v30));
        end
    };
end)(v18))))));