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
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagGuacControlPhoneUpsellEnabled);
local v26 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_IXPService_0 = game:GetService("IXPService");
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_TelemetryConfigs_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).TelemetryConfigs;
local v31 = require(script.Parent.DisconnectButton);
local l_GetFFlagUIBloxUseFoundationButton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton;
local l_isFlyoutSidePanelEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP.isFlyoutSidePanelEnabled;
local v34 = require(l_Modules_0.LuaApp.Flags.FFlagEnableVNGDUARSignupCompliance);
local l_FFlagAuthSecExclusions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions;
v21.defaultProps = {
    layoutOrder = 1, 
    isPhoneLogoutUpsellEnabled = false, 
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
    shouldShowPhoneUpsell = v4.boolean, 
    shouldDisableEmailUpsell = v4.boolean, 
    appPolicy = v4.table
});
v21.init = function(v36) --[[ Line: 80 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v9 (copy), l_default_0 (copy), l_TelemetryConfigs_0 (copy), v25 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v24 (copy), v23 (copy)
    local l_guiService_0 = v36.props.guiService;
    local l_item_0 = v36.props.item;
    local l_networkImpl_0 = v36.props.networkImpl;
    v36.navigateDown = function() --[[ Line: 85 ]]
        -- upvalues: v36 (copy), l_item_0 (copy)
        v36.props.navigateDown({
            name = l_item_0.context.page
        });
    end;
    v36.showEmailVerificationOrLogout = function() --[[ Line: 91 ]]
        -- upvalues: v18 (ref), v36 (copy), l_networkImpl_0 (copy), l_guiService_0 (copy), v9 (ref)
        if v18() and not v36.props.shouldDisableEmailUpsell then
            v36.props.showEmailBeforeLogout(l_networkImpl_0, l_guiService_0, v9, v36.props.appPolicy);
            return;
        else
            v36.props.logout(l_networkImpl_0, l_guiService_0, v9);
            return;
        end;
    end;
    v36.showPhoneVerificationOrLogout = function() --[[ Line: 101 ]]
        -- upvalues: v36 (copy), l_networkImpl_0 (copy), l_guiService_0 (copy), v9 (ref)
        v36.props.showPhoneBeforeLogout(l_networkImpl_0, l_guiService_0, v9);
    end;
    v36.onActivated = function() --[[ Line: 105 ]]
        -- upvalues: l_default_0 (ref), l_TelemetryConfigs_0 (ref), v36 (copy), v25 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v24 (ref), v23 (ref)
        l_default_0:logRobloxTelemetryCounter(l_TelemetryConfigs_0.LogoutButtonClickedConfig, 1);
        if v36.props.willActivate then
            v36.props.willActivate();
        end;
        if v25() then
            if v36.props.shouldShowPhoneUpsell then
                l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.LogoutLayer);
                local v40 = v24() and v36.props.isPhoneLogoutUpsellEnabled;
                if v23() or v40 then
                    v36.showPhoneVerificationOrLogout();
                    return;
                else
                    v36.showEmailVerificationOrLogout();
                    return;
                end;
            else
                v36.showEmailVerificationOrLogout();
                return;
            end;
        else
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.LogoutLayer);
            local v41 = v24() and v36.props.isPhoneLogoutUpsellEnabled;
            if v23() or v41 then
                v36.showPhoneVerificationOrLogout();
                return;
            else
                v36.showEmailVerificationOrLogout();
                return;
            end;
        end;
    end;
end;
v21.render = function(v42) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: v15 (copy), l_isFlyoutSidePanelEnabled_0 (copy), v1 (copy), v5 (copy), v31 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (copy)
    local l_buttonHeight_0 = v42.props.buttonHeight;
    local l_buttonMaxWidth_0 = v42.props.buttonMaxWidth;
    local l_item_1 = v42.props.item;
    local l_layoutOrder_0 = v42.props.layoutOrder;
    local l_position_0 = v42.props.position;
    return v15({
        logOutText = l_item_1.textKey
    })(function(v48) --[[ Line: 148 ]]
        -- upvalues: l_isFlyoutSidePanelEnabled_0 (ref), v42 (copy), v1 (ref), v5 (ref), l_layoutOrder_0 (copy), l_position_0 (copy), l_buttonHeight_0 (copy), l_buttonMaxWidth_0 (copy), v31 (ref), l_Button_0 (ref), l_ButtonType_0 (ref), l_GetFFlagUIBloxUseFoundationButton_0 (ref)
        if l_isFlyoutSidePanelEnabled_0() and v42.props.foundationButtonType then
            return (v1.createElement(v5.Button, {
                text = v48.logOutText, 
                variant = v42.props.foundationButtonType, 
                LayoutOrder = l_layoutOrder_0, 
                onActivated = v42.onActivated, 
                isDisabled = false, 
                size = v42.props.foundationButtonSize, 
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
                    LogOutButton = if v42.props.showDisconnectButton then v1.createElement(v31) else v1.createElement(l_Button_0, {
                        buttonType = l_ButtonType_0.Secondary, 
                        isDisabled = false, 
                        isLoading = false, 
                        onActivated = v42.onActivated, 
                        size = UDim2.new(1, 0, l_GetFFlagUIBloxUseFoundationButton_0() and 0 or 1, if l_GetFFlagUIBloxUseFoundationButton_0() then l_buttonHeight_0 else 0), 
                        text = v48.logOutText
                    })
                })
            }));
        end;
    end);
end;
v21 = v2.connect(function(_, _) --[[ Line: 196 ]]

end, function(v51) --[[ Line: 196 ]]
    -- upvalues: v11 (copy), v16 (copy), v12 (copy), v10 (copy), v22 (copy), v17 (copy)
    return {
        navigateDown = function(v52) --[[ Line: 198 ]] --[[ Name: navigateDown ]]
            -- upvalues: v51 (copy), v11 (ref)
            v51(v11(v52));
        end, 
        showEmailBeforeLogout = function(v53, v54, v55, v56) --[[ Line: 201 ]] --[[ Name: showEmailBeforeLogout ]]
            -- upvalues: v51 (copy), v16 (ref), v12 (ref), v10 (ref), v22 (ref)
            v51(v16(v53, v54, v56)):andThen(function() --[[ Line: 202 ]]
                -- upvalues: v51 (ref), v12 (ref), v10 (ref), v53 (copy), v54 (copy), v22 (ref), v55 (copy)
                v51(v12(function() --[[ Line: 203 ]]
                    -- upvalues: v51 (ref), v10 (ref), v53 (ref), v54 (ref), v22 (ref)
                    v51(v10(v53, v54, v22.MoreLogOut));
                end, v55));
            end, function() --[[ Line: 206 ]]

            end);
        end, 
        showPhoneBeforeLogout = function(v57, v58, v59) --[[ Line: 208 ]] --[[ Name: showPhoneBeforeLogout ]]
            -- upvalues: v51 (copy), v17 (ref), v12 (ref), v10 (ref), v22 (ref)
            v51(v17(v57, v58)):andThen(function() --[[ Line: 209 ]]
                -- upvalues: v51 (ref), v12 (ref), v10 (ref), v57 (copy), v58 (copy), v22 (ref), v59 (copy)
                v51(v12(function() --[[ Line: 210 ]]
                    -- upvalues: v51 (ref), v10 (ref), v57 (ref), v58 (ref), v22 (ref)
                    v51(v10(v57, v58, v22.MoreLogOut));
                end, v59));
            end, function() --[[ Line: 213 ]]

            end);
        end, 
        logout = function(v60, v61, v62) --[[ Line: 215 ]] --[[ Name: logout ]]
            -- upvalues: v51 (copy), v12 (ref), v10 (ref), v22 (ref)
            v51(v12(function() --[[ Line: 216 ]]
                -- upvalues: v51 (ref), v10 (ref), v60 (copy), v61 (copy), v22 (ref)
                v51(v10(v60, v61, v22.MoreLogOut));
            end, v62));
        end, 
        logoutWithoutShowConfirmation = function(v63, v64) --[[ Line: 220 ]] --[[ Name: logoutWithoutShowConfirmation ]]
            -- upvalues: v51 (copy), v10 (ref), v22 (ref)
            v51(v10(v63, v64, v22.MoreLogOut));
        end
    };
end)(v21);
v21 = l_RoactAppPolicy_0.connect(function(v65, _) --[[ Line: 226 ]]
    -- upvalues: v25 (copy), l_FFlagAuthSecExclusions_0 (copy), v34 (copy)
    return {
        showDisconnectButton = v65.getShowDisconnectButton(), 
        shouldShowPhoneUpsell = if not not v25() or l_FFlagAuthSecExclusions_0 then v65.getShouldShowPhoneUpsell() else false, 
        shouldDisableEmailUpsell = if not not v34 or l_FFlagAuthSecExclusions_0 then v65.getDisableLogOutEmailUpsell() else false, 
        appPolicy = v65
    };
end)(v21);
v21 = v26.connectUserLayer({
    l_AppUserLayers_0.LogoutLayer
}, function(v67, _) --[[ Line: 241 ]]
    -- upvalues: l_AppUserLayers_0 (copy)
    return {
        isPhoneLogoutUpsellEnabled = (v67[l_AppUserLayers_0.LogoutLayer] or {}).IsPhoneLogoutUpsellEnabled
    };
end)(v21);
return l_RoactServices_0.connect({
    guiService = l_AppGuiService_0, 
    networkImpl = v13
})(v21);