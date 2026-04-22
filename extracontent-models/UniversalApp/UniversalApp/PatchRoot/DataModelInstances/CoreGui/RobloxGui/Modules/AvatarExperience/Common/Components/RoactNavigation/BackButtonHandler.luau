local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v8 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.BackButtonAction);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.connectFakeBackButton);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v12 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.backButton");
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely);
local v14 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v15 = require(l_Modules_0.LuaApp.Thunks.InstantResetNavigationHistory);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v17 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v20 = v4.Component:extend("BackButtonHandler");
v20.validateProps = v6.strictInterface({
    navigation = v6.table, 
    avatarExperienceActive = v6.boolean, 
    resetNavigationHistory = v6.optional(v6.callback), 
    instantResetNavigationHistory = v6.optional(v6.callback), 
    avatarRoute = v6.optional(v6.table), 
    EventForTests = v6.optional(v6.table)
});
v20.init = function(v21) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v9 (copy), l_AvatarScreen_0 (copy), v11 (copy), l_GuiService_0 (copy), v8 (copy), v10 (copy)
    v21.backButtonConnection = nil;
    v21.onBackButtonPressed = function() --[[ Line: 52 ]]
        -- upvalues: v21 (copy), v12 (ref), v9 (ref), l_AvatarScreen_0 (ref), v11 (ref), l_GuiService_0 (ref), v8 (ref)
        local l_navigation_0 = v21.props.navigation;
        local v23 = v21:getBackButtonAction();
        v12:info("pressed: {}", v23);
        if v23 == v9.GoBack then
            local l_prevNavPage_0 = v21.props.avatarRoute.current.params.prevNavPage;
            local l_prevNavHistory_0 = v21.props.avatarRoute.current.params.prevNavHistory;
            if l_prevNavPage_0 and l_prevNavHistory_0 then
                if rawget(l_AvatarScreen_0, l_prevNavPage_0) then
                    l_navigation_0.navigate(l_prevNavPage_0);
                    return;
                else
                    v21.props.resetNavigationHistory(l_prevNavHistory_0);
                    return;
                end;
            else
                v11.closeFocusedScreen(l_navigation_0);
                return;
            end;
        elseif v23 == v9.Unhandled then
            l_GuiService_0:BroadcastNotification("", v8.BACK_BUTTON_NOT_CONSUMED);
            return;
        elseif v23 == v9.NoOp then
            return;
        else
            v12:warning("Invalid back button action: {}", v23);
            return;
        end;
    end;
    v10(v21.onBackButtonPressed);
end;
v20.getBackButtonAction = function(v26) --[[ Line: 85 ]] --[[ Name: getBackButtonAction ]]
    -- upvalues: v13 (copy), v9 (copy)
    local l_navigation_1 = v26.props.navigation;
    return v13(l_navigation_1).backButtonAction or v9.GoBack;
end;
v20.render = function(_) --[[ Line: 91 ]] --[[ Name: render ]]
    return nil;
end;
v20.didMount = function(v29) --[[ Line: 95 ]] --[[ Name: didMount ]]
    if v29.props.avatarExperienceActive then
        v29:connectBackButton();
    end;
end;
v20.didUpdate = function(v30, v31, _) --[[ Line: 101 ]] --[[ Name: didUpdate ]]
    if v31.avatarExperienceActive ~= v30.props.avatarExperienceActive then
        if v30.props.avatarExperienceActive then
            v30:connectBackButton();
            return;
        else
            v30:disconnectBackButton();
        end;
    end;
end;
v20.willUnmount = function(v33) --[[ Line: 111 ]] --[[ Name: willUnmount ]]
    v33:disconnectBackButton();
end;
v20.connectBackButton = function(v34) --[[ Line: 115 ]] --[[ Name: connectBackButton ]]
    -- upvalues: v12 (copy), l_GuiService_0 (copy)
    if v34.backButtonConnection then
        return;
    else
        v12:info("connected");
        pcall(function() --[[ Line: 123 ]]
            -- upvalues: v34 (copy), l_GuiService_0 (ref)
            if v34.props.EventForTests then
                v34.backButtonConnection = v34.props.EventForTests:Connect(v34.onBackButtonPressed);
                return;
            else
                v34.backButtonConnection = l_GuiService_0.ShowLeaveConfirmation:Connect(v34.onBackButtonPressed);
                return;
            end;
        end);
        return;
    end;
end;
v20.disconnectBackButton = function(v35) --[[ Line: 133 ]] --[[ Name: disconnectBackButton ]]
    -- upvalues: v12 (copy)
    v12:info("disconnected");
    if v35.backButtonConnection then
        v35.backButtonConnection:Disconnect();
        v35.backButtonConnection = nil;
    end;
end;
local function v41(v36, _) --[[ Line: 142 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreen_0 (copy)
    local v38 = nil;
    if l_FFlagUseNavigationSelectors_0 then
        v38 = l_Selectors_0.selectCurrentLegacyPage(v36);
    else
        local l_history_0 = v36.Navigation.history;
        local v40 = l_history_0[#l_history_0];
        v38 = v40[#v40];
    end;
    return {
        avatarExperienceActive = v38.name == l_AvatarScreen_0.AvatarExperienceRoot
    };
end;
local function v45(v42) --[[ Line: 158 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v14 (copy), v15 (copy)
    return {
        resetNavigationHistory = function(v43) --[[ Line: 160 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v42 (copy), v14 (ref)
            return v42(v14(nil, v43));
        end, 
        instantResetNavigationHistory = function(v44) --[[ Line: 163 ]] --[[ Name: instantResetNavigationHistory ]]
            -- upvalues: v42 (copy), v15 (ref)
            return v42(v15(nil, v44));
        end
    };
end;
v20 = v17(v20);
return (v5.connect(v41, v45)(v20));