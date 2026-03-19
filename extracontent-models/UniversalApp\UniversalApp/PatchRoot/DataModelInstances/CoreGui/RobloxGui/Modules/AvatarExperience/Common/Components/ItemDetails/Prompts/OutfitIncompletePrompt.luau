local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v9 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v9.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v13 = v2.PureComponent:extend("OutfitIncompletePrompt");
v13.validateProps = v3.strictInterface({
    screenSize = v3.Vector2, 
    navigationCallback = v3.callback, 
    navigation = v3.table, 
    focusController = v3.optional(v3.table), 
    defaultChildRef = v3.optional(v3.table), 
    onOverlayClosed = v3.optional(v3.callback)
});
closePrompt = function(v14) --[[ Line: 43 ]] --[[ Name: closePrompt ]]
    -- upvalues: v12 (copy)
    v12.closeOverlay(v14);
end;
v13.init = function(v15) --[[ Line: 47 ]] --[[ Name: init ]]
    v15.onStay = function() --[[ Line: 48 ]]
        -- upvalues: v15 (copy)
        closePrompt(v15.props.navigation);
    end;
    v15.onLeave = function() --[[ Line: 52 ]]
        -- upvalues: v15 (copy)
        closePrompt(v15.props.navigation);
        v15.props.navigationCallback();
    end;
end;
v13.renderAlertLocalized = function(v16, v17) --[[ Line: 58 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v2 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v2.createElement(l_InteractiveAlert_0, {
        title = v17.outfitIncompleteTitle, 
        bodyText = v17.outfitIncompleteBody, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v16.onLeave, 
                        text = v17.leave
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v16.onStay, 
                        text = v17.stay
                    }
                }
            }
        }, 
        screenSize = v16.props.screenSize, 
        defaultChildRef = v16.props.defaultChildRef
    });
end;
v13.render = function(v18) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        outfitIncompleteTitle = "Feature.Avatar.Title.OutfitIncomplete", 
        outfitIncompleteBody = "Feature.Avatar.Label.OutfitIncomplete", 
        leave = "Feature.Chat.Action.Leave", 
        stay = "Feature.Chat.Action.Stay"
    })(function(v19) --[[ Line: 91 ]]
        -- upvalues: v18 (copy)
        return v18:renderAlertLocalized(v19);
    end);
end;
return (v8((v7((v4.connect(function(v20, _) --[[ Line: 96 ]]
    return {
        screenSize = v20.ScreenSize
    };
end, nil)(v13))))));