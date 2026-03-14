local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v5.Focusable;
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.GamepadFocusHandlerForPage);
local v15 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceView);
local v16 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.ExternalNavigationHandler);
local v19 = require(l_Modules_0.AvatarExperience.Common.Actions.SetPlayEmoteInBackground);
local v20 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v23 = v4.PureComponent:extend("AvatarBackground");
v23.defaultProps = {
    playEmote = true, 
    isVisible = true, 
    isTopBarVisible = true
};
v23.validateProps = v8.strictInterface({
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v8.optional(v8.table), 
    title = v8.optional(v8.string), 
    playEmote = v8.optional(v8.boolean), 
    isVisible = v8.optional(v8.boolean), 
    renderContent = v8.optional(v8.callback), 
    isTopBarSecondary = v8.optional(v8.boolean), 
    isTopBarVisible = v8.optional(v8.boolean), 
    deviceOrientation = v8.string, 
    currentCharacter = v8.Instance, 
    setPlayEmoteInBackground = v8.callback, 
    navigateBackInAppRoute = v8.callback, 
    avatarRoute = v8.optional(v8.table), 
    detail = v8.optional(v8.string), 
    navigation = v8.table
});
v23.init = function(v24) --[[ Line: 66 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v5 (copy), v16 (copy)
    v24.focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v24.props.focusController or v5.createFocusController();
    v24.backButtonPressed = function() --[[ Line: 72 ]]
        -- upvalues: v24 (copy)
        v24.props.navigateBackInAppRoute(true);
    end;
    v24.backButton = v16.makeBackButton(v24.backButtonPressed);
    v24.renderContent = function() --[[ Line: 78 ]]
        -- upvalues: v24 (copy)
        if v24.props.renderContent then
            local l_currentCharacter_0 = v24.props.currentCharacter;
            return v24.props.renderContent({
                character = l_currentCharacter_0
            });
        else
            return nil;
        end;
    end;
end;
v23.renderTopBarWithLocalized = function(v26) --[[ Line: 89 ]] --[[ Name: renderTopBarWithLocalized ]]
    -- upvalues: l_withLocalization_0 (copy)
    if v26.props.title then
        return l_withLocalization_0({
            title = v26.props.title
        })(function(v27) --[[ Line: 93 ]]
            -- upvalues: v26 (copy)
            return v26:renderTopBar(v27.title);
        end);
    else
        return v26:renderTopBar("");
    end;
end;
v23.renderTopBar = function(v28, v29) --[[ Line: 100 ]] --[[ Name: renderTopBar ]]
    -- upvalues: v4 (copy), v16 (copy)
    return v4.createElement(v16.Container, {
        isSecondary = v28.props.isTopBarSecondary, 
        titleText = v29, 
        transparentBackground = true, 
        leftItem = v28.backButton
    });
end;
v23.renderAvatarExperienceView = function(v30, v31) --[[ Line: 109 ]] --[[ Name: renderAvatarExperienceView ]]
    -- upvalues: v4 (copy), v15 (copy), v18 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v14 (copy)
    return v4.createElement(v15, {
        topBar = v31 and v30:renderTopBarWithLocalized() or nil, 
        bottomBarEnabled = false, 
        isSceneFullView = true, 
        isUIFullView = false
    }, {
        ExternalNavigationHandler = v4.createElement(v18, {
            navigation = v30.props.navigation
        }), 
        GamepadFocusHandlerForPage = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v4.createElement(v14, {
            focusController = v30.focusController
        })
    });
end;
v23.renderMainView = function(v32) --[[ Line: 127 ]] --[[ Name: renderMainView ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v4 (copy)
    if not (v32.props.deviceOrientation == l_DeviceOrientationMode_0.Portrait) then
        return v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1)
        }, {
            TopBar = if not v32.props.isTopBarVisible then nil else v32:renderTopBarWithLocalized(), 
            AEView = v32:renderAvatarExperienceView(false)
        });
    else
        return v32:renderAvatarExperienceView(v32.props.isTopBarVisible);
    end;
end;
v23.render = function(v33) --[[ Line: 144 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_Focusable_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ExternalEventConnection_0 (copy), l_GuiService_0 (copy), v17 (copy)
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v33.focusController
    }, {
        BackButtonConnection = v4.createElement(l_ExternalEventConnection_0, {
            event = l_GuiService_0.ShowLeaveConfirmation, 
            callback = v33.backButtonPressed
        }), 
        NavigationEventsLogger = v4.createElement(v17, {
            pageName = "AvatarBackground"
        }), 
        Mainview = v33:renderMainView(), 
        Content = v33.renderContent()
    });
end;
v23.didUpdate = function(v34, v35) --[[ Line: 162 ]] --[[ Name: didUpdate ]]
    if v34.props.playEmote ~= v35.playEmote then
        v34.props.setPlayEmoteInBackground(v34.props.playEmote);
    end;
end;
v23.didMount = function(v36) --[[ Line: 171 ]] --[[ Name: didMount ]]
    v36.props.setPlayEmoteInBackground(v36.props.playEmote);
end;
return v13((v11((v7.connect(function(v37) --[[ Line: 175 ]] --[[ Name: mapStateToProps ]]
    return {
        deviceOrientation = v37.DeviceOrientation, 
        currentCharacter = v37.AvatarExperience.AvatarScene.Character.CurrentCharacter
    };
end, function(v38) --[[ Line: 182 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v19 (copy), v20 (copy)
    return {
        setPlayEmoteInBackground = function(v39) --[[ Line: 184 ]] --[[ Name: setPlayEmoteInBackground ]]
            -- upvalues: v38 (copy), v19 (ref)
            v38(v19(v39));
        end, 
        navigateBackInAppRoute = function(v40) --[[ Line: 187 ]] --[[ Name: navigateBackInAppRoute ]]
            -- upvalues: v38 (copy), v20 (ref)
            v38(v20(v40));
        end
    };
end)(v23)))));