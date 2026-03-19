local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.BackButtonAction);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.connectFakeBackButton);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v11 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.backButton");
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely);
local v13 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
local v14 = require(l_Modules_0.LuaApp.Thunks.InstantResetNavigationHistory);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v16 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v18 = v4.Component:extend("BackButtonHandler");
v18.validateProps = v6.strictInterface({
    navigation = v6.table, 
    avatarExperienceActive = v6.boolean, 
    resetNavigationHistory = v6.optional(v6.callback), 
    instantResetNavigationHistory = v6.optional(v6.callback), 
    avatarRoute = v6.optional(v6.table), 
    EventForTests = v6.optional(v6.table)
});
v18.init = function(v19) --[[ Line: 46 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v8 (copy), l_AvatarScreen_0 (copy), v10 (copy), l_GuiService_0 (copy), v7 (copy), v9 (copy)
    v19.backButtonConnection = nil;
    v19.onBackButtonPressed = function() --[[ Line: 50 ]]
        -- upvalues: v19 (copy), v11 (ref), v8 (ref), l_AvatarScreen_0 (ref), v10 (ref), l_GuiService_0 (ref), v7 (ref)
        local l_navigation_0 = v19.props.navigation;
        local v21 = v19:getBackButtonAction();
        v11:info("pressed: {}", v21);
        if v21 == v8.GoBack then
            local l_prevNavPage_0 = v19.props.avatarRoute.current.params.prevNavPage;
            local l_prevNavHistory_0 = v19.props.avatarRoute.current.params.prevNavHistory;
            if l_prevNavPage_0 and l_prevNavHistory_0 then
                if rawget(l_AvatarScreen_0, l_prevNavPage_0) then
                    l_navigation_0.navigate(l_prevNavPage_0);
                    return;
                else
                    v19.props.resetNavigationHistory(l_prevNavHistory_0);
                    return;
                end;
            else
                v10.closeFocusedScreen(l_navigation_0);
                return;
            end;
        elseif v21 == v8.Unhandled then
            l_GuiService_0:BroadcastNotification("", v7.BACK_BUTTON_NOT_CONSUMED);
            return;
        elseif v21 == v8.NoOp then
            return;
        else
            v11:warning("Invalid back button action: {}", v21);
            return;
        end;
    end;
    v9(v19.onBackButtonPressed);
end;
v18.getBackButtonAction = function(v24) --[[ Line: 83 ]] --[[ Name: getBackButtonAction ]]
    -- upvalues: v12 (copy), v8 (copy)
    local l_navigation_1 = v24.props.navigation;
    return v12(l_navigation_1).backButtonAction or v8.GoBack;
end;
v18.render = function(_) --[[ Line: 89 ]] --[[ Name: render ]]
    return nil;
end;
v18.didMount = function(v27) --[[ Line: 93 ]] --[[ Name: didMount ]]
    if v27.props.avatarExperienceActive then
        v27:connectBackButton();
    end;
end;
v18.didUpdate = function(v28, v29, _) --[[ Line: 99 ]] --[[ Name: didUpdate ]]
    if v29.avatarExperienceActive ~= v28.props.avatarExperienceActive then
        if v28.props.avatarExperienceActive then
            v28:connectBackButton();
            return;
        else
            v28:disconnectBackButton();
        end;
    end;
end;
v18.willUnmount = function(v31) --[[ Line: 109 ]] --[[ Name: willUnmount ]]
    v31:disconnectBackButton();
end;
v18.connectBackButton = function(v32) --[[ Line: 113 ]] --[[ Name: connectBackButton ]]
    -- upvalues: v11 (copy), l_GuiService_0 (copy)
    if v32.backButtonConnection then
        return;
    else
        v11:info("connected");
        pcall(function() --[[ Line: 121 ]]
            -- upvalues: v32 (copy), l_GuiService_0 (ref)
            if v32.props.EventForTests then
                v32.backButtonConnection = v32.props.EventForTests:Connect(v32.onBackButtonPressed);
                return;
            else
                v32.backButtonConnection = l_GuiService_0.ShowLeaveConfirmation:Connect(v32.onBackButtonPressed);
                return;
            end;
        end);
        return;
    end;
end;
v18.disconnectBackButton = function(v33) --[[ Line: 131 ]] --[[ Name: disconnectBackButton ]]
    -- upvalues: v11 (copy)
    v11:info("disconnected");
    if v33.backButtonConnection then
        v33.backButtonConnection:Disconnect();
        v33.backButtonConnection = nil;
    end;
end;
local function v38(v34, _) --[[ Line: 140 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local l_history_0 = v34.Navigation.history;
    local v37 = l_history_0[#l_history_0];
    return {
        avatarExperienceActive = v37[#v37].name == l_AvatarScreen_0.AvatarExperienceRoot
    };
end;
local function v42(v39) --[[ Line: 151 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v13 (copy), v14 (copy)
    return {
        resetNavigationHistory = function(v40) --[[ Line: 153 ]] --[[ Name: resetNavigationHistory ]]
            -- upvalues: v39 (copy), v13 (ref)
            return v39(v13(nil, v40));
        end, 
        instantResetNavigationHistory = function(v41) --[[ Line: 156 ]] --[[ Name: instantResetNavigationHistory ]]
            -- upvalues: v39 (copy), v14 (ref)
            return v39(v14(nil, v41));
        end
    };
end;
v18 = v16(v18);
return (v5.connect(v38, v42)(v18));