local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = require(l_Modules_0.LuaApp.Themes.DeprecatedDarkTheme);
local v10 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v12 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForConfirmSignOut);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.withLocalization);
local v16 = require(l_Modules_0.LuaApp.Thunks.Authentication.EmailVerification.CheckEmailVerificationBeforeLogout);
local v17 = require(l_Modules_0.LuaApp.Thunks.Authentication.PhoneVerification.CheckPhoneVerification);
local v18 = require(l_Modules_0.LuaApp.Flags.GetFFlagEmailUpsellAtLogout);
local l_Button_0 = v3.App.Button.Button;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v21 = v1.PureComponent:extend("MoreLogOut");
local v22 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePhoneVerificationLogoutUpsell);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePhoneLogoutUpsellExperiment);
local v25 = require(l_Modules_0.LuaApp.Flags.FFlagEnableForcingEmailUpsellForPasswordlessUsers);
local v26 = require(l_Modules_0.LuaApp.Http.Requests.GetPasswordStatus);
local v27 = require(l_Modules_0.LuaApp.Flags.FFlagForcingEmailUpsellForPasswordlessUsersBypassIXP);
local v28 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_IXPService_0 = game:GetService("IXPService");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local v33 = require(script.Parent.DisconnectButton);
local l_GetFFlagUIBloxUseFoundationButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton;
local l_isFlyoutSidePanelEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP.isFlyoutSidePanelEnabled;
local v36 = require(l_Modules_0.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance);
local l_FFlagAuthSecExclusions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions;
v21.defaultProps = {
    layoutOrder = 1, 
    isPhoneLogoutUpsellEnabled = false, 
    isForceEmailUpsellForPasswordlessUsersEnabled = false, 
    shouldShowPhoneUpsell = false, 
    shouldDisableEmailUpsell = false
};
v21.validateProps = v4.strictInterface({
    buttonHeight = if l_isFlyoutSidePanelEnabled_0() then v4.optional(v4.integer) else v4.integer, 
    buttonMaxWidth = if l_isFlyoutSidePanelEnabled_0() then v4.optional(v4.integer) else v4.integer, 
    foundationButtonType = if l_isFlyoutSidePanelEnabled_0() then v4.optional(v4.string) else nil, 
    foundationButtonSize = if l_isFlyoutSidePanelEnabled_0() then v4.optional(v4.string) else nil, 
    item = v4.table, 
    layoutOrder = v4.optional(v4.integer), 
    position = v4.optional(v4.UDim2), 
    navigateDown = v4.callback, 
    logout = v4.callback, 
    showEmailBeforeLogout = v4.callback, 
    showPhoneBeforeLogout = v4.callback, 
    logoutWithoutShowConfirmation = v4.callback, 
    guiService = v4.union(v4.Instance, v4.table), 
    networkImpl = v4.callback, 
    willActivate = v4.optional(v4.callback), 
    showDisconnectButton = v4.boolean, 
    isPhoneLogoutUpsellEnabled = v4.boolean, 
    isForceEmailUpsellForPasswordlessUsersEnabled = v4.boolean, 
    shouldShowPhoneUpsell = v4.boolean, 
    shouldDisableEmailUpsell = v4.boolean, 
    appPolicy = v4.table
});
v21.init = function(v38) --[[ Line: 86 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v9 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v25 (copy), v27 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v24 (copy), v23 (copy)
    local l_guiService_0 = v38.props.guiService;
    local l_item_0 = v38.props.item;
    local l_networkImpl_0 = v38.props.networkImpl;
    v38.navigateDown = function() --[[ Line: 91 ]]
        -- upvalues: v38 (copy), l_item_0 (copy)
        v38.props.navigateDown({
            name = l_item_0.context.page
        });
    end;
    v38.showEmailVerificationOrLogout = function() --[[ Line: 97 ]]
        -- upvalues: v18 (ref), v38 (copy), l_networkImpl_0 (copy), l_guiService_0 (copy), v9 (ref)
        if v18() and not v38.props.shouldDisableEmailUpsell then
            v38.props.showEmailBeforeLogout(l_networkImpl_0, l_guiService_0, v9, v38.props.appPolicy);
            return;
        else
            v38.props.logout(l_networkImpl_0, l_guiService_0, v9);
            return;
        end;
    end;
    v38.showPhoneVerificationOrLogout = function() --[[ Line: 107 ]]
        -- upvalues: v38 (copy), l_networkImpl_0 (copy), l_guiService_0 (copy), v9 (ref)
        v38.props.showPhoneBeforeLogout(l_networkImpl_0, l_guiService_0, v9);
    end;
    v38.state = {
        hasNoPassword = false
    };
    v38.onActivated = function() --[[ Line: 115 ]]
        -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), v38 (copy), v25 (ref), v27 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v24 (ref), v23 (ref)
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LogoutButtonClickedConfig, 1);
        if v38.props.willActivate then
            v38.props.willActivate();
        end;
        if v25 and (v27 or v38.props.isForceEmailUpsellForPasswordlessUsersEnabled) and v38.state.hasNoPassword then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.LogoutLayer);
            v38.showEmailVerificationOrLogout();
            return;
        elseif v38.props.shouldShowPhoneUpsell then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.LogoutLayer);
            local v42 = v24() and v38.props.isPhoneLogoutUpsellEnabled;
            if v23() or v42 then
                v38.showPhoneVerificationOrLogout();
                return;
            else
                v38.showEmailVerificationOrLogout();
                return;
            end;
        else
            v38.showEmailVerificationOrLogout();
            return;
        end;
    end;
end;
v21.didMount = function(v43) --[[ Line: 146 ]] --[[ Name: didMount ]]
    -- upvalues: v25 (copy), v26 (copy)
    if v25 then
        v26(v43.props.networkImpl):andThen(function(v44) --[[ Line: 148 ]]
            -- upvalues: v43 (copy)
            v43:setState({
                hasNoPassword = v44.responseBody.valid == false
            });
        end, function() --[[ Line: 152 ]]

        end);
    end;
end;
v21.render = function(v45) --[[ Line: 156 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), l_isFlyoutSidePanelEnabled_0 (copy), v1 (copy), v5 (copy), v33 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (copy)
    local l_buttonHeight_0 = v45.props.buttonHeight;
    local l_buttonMaxWidth_0 = v45.props.buttonMaxWidth;
    local l_item_1 = v45.props.item;
    local l_layoutOrder_0 = v45.props.layoutOrder;
    local l_position_0 = v45.props.position;
    return v15({
        logOutText = l_item_1.textKey
    })(function(v51) --[[ Line: 165 ]]
        -- upvalues: l_isFlyoutSidePanelEnabled_0 (ref), v45 (copy), v1 (ref), v5 (ref), l_layoutOrder_0 (copy), l_position_0 (copy), l_buttonHeight_0 (copy), l_buttonMaxWidth_0 (copy), v33 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_GetFFlagUIBloxUseFoundationButton_0 (ref)
        if l_isFlyoutSidePanelEnabled_0() and v45.props.foundationButtonType then
            return (v1.createElement(v5.Button, {
                text = v51.logOutText, 
                variant = v45.props.foundationButtonType, 
                LayoutOrder = l_layoutOrder_0, 
                onActivated = v45.onActivated, 
                isDisabled = false, 
                size = v45.props.foundationButtonSize, 
                width = UDim.new(1, 0)
            }));
        else
            return (v1.createElement("Frame", {
                BackgroundTransparency = 1, 
                Position = l_position_0, 
                LayoutOrder = l_layoutOrder_0, 
                Size = UDim2.new(1, 0, 0, l_buttonHeight_0)
            }, {
                UIListLayout = v1.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                LogOutButtonFrame = v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0)
                }, {
                    UISizeConstraint = v1.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(l_buttonMaxWidth_0, l_buttonHeight_0)
                    }), 
                    LogOutButton = if v45.props.showDisconnectButton then v1.createElement(v33) else v1.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.Secondary, 
                        isDisabled = false, 
                        isLoading = false, 
                        onActivated = v45.onActivated, 
                        size = UDim2.new(1, 0, l_GetFFlagUIBloxUseFoundationButton_0() and 0 or 1, if l_GetFFlagUIBloxUseFoundationButton_0() then l_buttonHeight_0 else 0), 
                        text = v51.logOutText
                    })
                })
            }));
        end;
    end);
end;
v21 = v2.connect(function(_, _) --[[ Line: 213 ]]

end, function(v54) --[[ Line: 213 ]]
    -- upvalues: v11 (copy), v16 (copy), v12 (copy), v10 (copy), v22 (copy), v17 (copy)
    return {
        navigateDown = function(v55) --[[ Line: 215 ]] --[[ Name: navigateDown ]]
            -- upvalues: v54 (copy), v11 (ref)
            v54(v11(v55));
        end, 
        showEmailBeforeLogout = function(v56, v57, v58, v59) --[[ Line: 218 ]] --[[ Name: showEmailBeforeLogout ]]
            -- upvalues: v54 (copy), v16 (ref), v12 (ref), v10 (ref), v22 (ref)
            v54(v16(v56, v57, v59)):andThen(function() --[[ Line: 219 ]]
                -- upvalues: v54 (ref), v12 (ref), v10 (ref), v56 (copy), v57 (copy), v22 (ref), v58 (copy)
                v54(v12(function() --[[ Line: 220 ]]
                    -- upvalues: v54 (ref), v10 (ref), v56 (ref), v57 (ref), v22 (ref)
                    v54(v10(v56, v57, v22.MoreLogOut));
                end, v58));
            end, function() --[[ Line: 223 ]]

            end);
        end, 
        showPhoneBeforeLogout = function(v60, v61, v62) --[[ Line: 225 ]] --[[ Name: showPhoneBeforeLogout ]]
            -- upvalues: v54 (copy), v17 (ref), v12 (ref), v10 (ref), v22 (ref)
            v54(v17(v60, v61)):andThen(function() --[[ Line: 226 ]]
                -- upvalues: v54 (ref), v12 (ref), v10 (ref), v60 (copy), v61 (copy), v22 (ref), v62 (copy)
                v54(v12(function() --[[ Line: 227 ]]
                    -- upvalues: v54 (ref), v10 (ref), v60 (ref), v61 (ref), v22 (ref)
                    v54(v10(v60, v61, v22.MoreLogOut));
                end, v62));
            end, function() --[[ Line: 230 ]]

            end);
        end, 
        logout = function(v63, v64, v65) --[[ Line: 232 ]] --[[ Name: logout ]]
            -- upvalues: v54 (copy), v12 (ref), v10 (ref), v22 (ref)
            v54(v12(function() --[[ Line: 233 ]]
                -- upvalues: v54 (ref), v10 (ref), v63 (copy), v64 (copy), v22 (ref)
                v54(v10(v63, v64, v22.MoreLogOut));
            end, v65));
        end, 
        logoutWithoutShowConfirmation = function(v66, v67) --[[ Line: 237 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v54 (copy), v10 (ref), v22 (ref)
            v54(v10(v66, v67, v22.MoreLogOut));
        end
    };
end)(v21);
v21 = l_RoactAppPolicy_0.connect(function(v68, _) --[[ Line: 243 ]]
    -- upvalues: v36 (copy), l_FFlagAuthSecExclusions_0 (copy)
    return {
        showDisconnectButton = v68.getShowDisconnectButton(), 
        shouldShowPhoneUpsell = v68.getShouldShowPhoneUpsell(), 
        shouldDisableEmailUpsell = if not not v36 or l_FFlagAuthSecExclusions_0 then v68.getDisableLogOutEmailUpsell() else false, 
        appPolicy = v68
    };
end)(v21);
v21 = v28.connectUserLayer({
    l_AppUserLayers_0.LogoutLayer
}, function(v70, _) --[[ Line: 256 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    local v72 = v70[l_AppUserLayers_0.LogoutLayer] or {};
    return {
        isPhoneLogoutUpsellEnabled = v72.IsPhoneLogoutUpsellEnabled, 
        isForceEmailUpsellForPasswordlessUsersEnabled = v72.IsForceEmailUpsellForPasswordlessUsersEnabled
    };
end)(v21);
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networkImpl = v13
})(v21);