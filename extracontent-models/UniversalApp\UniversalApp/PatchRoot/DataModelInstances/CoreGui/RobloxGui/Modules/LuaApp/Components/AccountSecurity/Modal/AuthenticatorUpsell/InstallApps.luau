local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v7 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v9 = require(l_Modules_0.LuaApp.Thunks.OpenWebview);
local v10 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v11 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.PromptConstants);
local v12 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v13 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v16 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSizeUDim2_0 = v4.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v22 = {
    action = "Feature.AccountSecurityPrompt.Action.AuthenticatorUpsellNextButtonMessage", 
    downloadInstruction = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellDownloadInstruction", 
    header = "Feature.AccountSecurityPrompt.Header.AuthenticatorUpsellDownloadAuthenticator", 
    googleAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellGoogleOption", 
    microsoftAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellMicrosoftOption", 
    twilioAuthenticator = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwilioOption", 
    settingsTitle = "CommonUI.Features.Label.Settings"
};
local v23 = v2.PureComponent:extend("InstallApps");
local l_Medium_0 = l_IconSize_0.Medium;
local v25 = l_Images_0["icons/status/success"];
local v26 = UDim.new(0, 10);
v23.init = function(v27) --[[ Line: 43 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy), v10 (copy)
    v27:setState({
        requestInFlight = false
    });
    v27.continueToAuthenticatorAppScreen = function(v28) --[[ Line: 50 ]]
        -- upvalues: v27 (copy), v11 (ref), v10 (ref)
        return function() --[[ Line: 51 ]]
            -- upvalues: v27 (ref), v11 (ref), v28 (copy), v10 (ref)
            v27:setState({
                requestInFlight = true
            });
            v27.props.openWebView(v11.getWebViewUrlAccountSettings(), v28.settingsTitle);
            v27.props.closeOverlay();
            v27.props.updatePromptAssignment(v27.props.networking, v27.props.promptType, v10.DismissPrompt);
        end;
    end;
    v27.closeCallback = function() --[[ Line: 67 ]]
        -- upvalues: v27 (copy), v10 (ref)
        v27.props.updatePromptAssignment(v27.props.networking, v27.props.promptType, v10.DismissPrompt);
    end;
end;
v23.render = function(v29) --[[ Line: 76 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v16 (copy), v22 (copy), v2 (copy), v6 (copy), v7 (copy), v26 (copy), l_ImageSetLabel_0 (copy), v25 (copy), l_getIconSizeUDim2_0 (copy), l_Medium_0 (copy), v8 (copy), l_ButtonType_0 (copy)
    local l_requestInFlight_0 = v29.state.requestInFlight;
    return v4.Style.withStyle(function(v31) --[[ Line: 79 ]]
        -- upvalues: v16 (ref), v22 (ref), v2 (ref), v6 (ref), v29 (copy), v7 (ref), v26 (ref), l_ImageSetLabel_0 (ref), v25 (ref), l_getIconSizeUDim2_0 (ref), l_Medium_0 (ref), v8 (ref), l_requestInFlight_0 (copy), l_ButtonType_0 (ref)
        local l_Color_0 = v31.Theme.SystemPrimaryDefault.Color;
        return v16(v22)(function(v33) --[[ Line: 81 ]]
            -- upvalues: v2 (ref), v6 (ref), v29 (ref), v7 (ref), v26 (ref), l_ImageSetLabel_0 (ref), v25 (ref), l_Color_0 (copy), l_getIconSizeUDim2_0 (ref), l_Medium_0 (ref), v8 (ref), l_requestInFlight_0 (ref), l_ButtonType_0 (ref)
            return v2.createElement(v6, {
                title = v33.header, 
                closeCallback = v29.closeCallback, 
                makeBodyFragment = function(v34) --[[ Line: 85 ]] --[[ Name: makeBodyFragment ]]
                    -- upvalues: v2 (ref), v7 (ref), v33 (copy), v26 (ref), l_ImageSetLabel_0 (ref), v25 (ref), l_Color_0 (ref), l_getIconSizeUDim2_0 (ref), l_Medium_0 (ref)
                    return v2.createFragment({
                        BEFORE_TEXT = v2.createElement(v7, {
                            layoutOrder = 1, 
                            contentWidth = v34, 
                            text = v33.downloadInstruction, 
                            useBold = true
                        }), 
                        ROWS_WRAPPER = v2.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Transparency = 1, 
                            LayoutOrder = 2
                        }, {
                            WrappingListWrapper = v2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                                Padding = v26
                            }), 
                            FIRST_ROW = v2.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Transparency = 1
                            }, {
                                WrappingListA = v2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v26
                                }), 
                                CheckmarkIconA = v2.createElement(l_ImageSetLabel_0, {
                                    Image = v25, 
                                    BorderSizePixel = 0, 
                                    ImageColor3 = l_Color_0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_Medium_0)
                                }), 
                                MicrosoftAuthenticator = v2.createElement(v7, {
                                    contentWidth = 0, 
                                    text = v33.microsoftAuthenticator, 
                                    useBold = true, 
                                    alignLeft = true
                                })
                            }), 
                            SECOND_ROW = v2.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Transparency = 1
                            }, {
                                WrappingListB = v2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v26
                                }), 
                                CheckmarkIconB = v2.createElement(l_ImageSetLabel_0, {
                                    Image = v25, 
                                    BorderSizePixel = 0, 
                                    ImageColor3 = l_Color_0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_Medium_0)
                                }), 
                                GoogleAuthenticator = v2.createElement(v7, {
                                    contentWidth = 0, 
                                    text = v33.googleAuthenticator, 
                                    useBold = true, 
                                    alignLeft = true
                                })
                            }), 
                            THIRD_ROW = v2.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Transparency = 1
                            }, {
                                WrappingListC = v2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v26
                                }), 
                                CheckmarkIconC = v2.createElement(l_ImageSetLabel_0, {
                                    Image = v25, 
                                    BorderSizePixel = 0, 
                                    ImageColor3 = l_Color_0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_Medium_0)
                                }), 
                                TwilioAuthenticator = v2.createElement(v7, {
                                    contentWidth = 0, 
                                    text = v33.twilioAuthenticator, 
                                    useBold = true, 
                                    alignLeft = true
                                })
                            })
                        })
                    });
                end, 
                buttonConfig = v8({
                    {
                        isDisabled = l_requestInFlight_0, 
                        isLoading = l_requestInFlight_0, 
                        onActivated = v29.continueToAuthenticatorAppScreen(v33), 
                        text = v33.action, 
                        type = l_ButtonType_0.PrimarySystem
                    }
                })
            });
        end);
    end);
end;
v23 = v3.connect(function(_, _) --[[ Line: 190 ]]
    return {};
end, function(v37) --[[ Line: 192 ]]
    -- upvalues: v5 (copy), v9 (copy), v15 (copy)
    return {
        closeOverlay = function() --[[ Line: 194 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v37 (copy), v5 (ref)
            return v37(v5());
        end, 
        openWebView = function(v38, v39) --[[ Line: 197 ]] --[[ Name: openWebView ]]
            -- upvalues: v37 (copy), v9 (ref)
            return v37(v9(v38, v39));
        end, 
        updatePromptAssignment = function(v40, v41, v42) --[[ Line: 200 ]] --[[ Name: updatePromptAssignment ]]
            -- upvalues: v37 (copy), v15 (ref)
            return v37(v15(v40, v41, v42));
        end
    };
end)(v23);
return (l_RoactServices_0.connect({
    analytics = v12, 
    networking = v13
})(v23));