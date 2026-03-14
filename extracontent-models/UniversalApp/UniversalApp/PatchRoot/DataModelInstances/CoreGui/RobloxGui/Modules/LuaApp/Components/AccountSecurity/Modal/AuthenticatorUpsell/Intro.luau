local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v7 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v8 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalButtonConfig);
local v9 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.ModalState);
local v10 = require(l_Modules_0.LuaApp.Enum.AccountSecurity.PromptAssignmentAction);
local v11 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v12 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.LuaApp.Thunks.AccountSecurity.UpdatePromptAssignment);
local v15 = require(l_Modules_0.LuaApp.withLocalization);
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local l_Images_0 = v4.App.ImageSet.Images;
local l_IconSize_0 = v4.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = v4.App.ImageSet.getIconSize;
local l_getIconSizeUDim2_0 = v4.App.ImageSet.getIconSizeUDim2;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v22 = {
    action = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellSetupAuthenticatorButtonMessage", 
    descriptionEnd = "Feature.AccountSecurityPrompt.Description.ChangeYourPassword", 
    descriptionStart = "Feature.AccountSecurityPrompt.Description.UnusualActivity", 
    header = "Feature.AccountSecurityPrompt.Header.AuthenticatorUpsellWelcomeMessage", 
    keepBadActorsOutHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellBadActorHeadline", 
    keepBadActorsOutMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellBadActorMessage", 
    protectGamesRobuxHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellProtectRobuxHeadline", 
    protectGamesRobuxMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellProtectRobuxMessage", 
    twoFactorsBetterThanOneHeadline = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwoFactorHeadline", 
    twoFactorsBetterThanOneMessage = "Feature.AccountSecurityPrompt.Label.AuthenticatorUpsellTwoFactorMessage"
};
local v23 = v2.PureComponent:extend("Intro");
local l_XLarge_0 = l_IconSize_0.XLarge;
local v25 = l_getIconSize_0(l_XLarge_0) + 6 - 13;
local v26 = UDim.new(0, 10);
local v27 = UDim.new(0, 3);
local v28 = UDim.new(6, 6);
v23.init = function(v29) --[[ Line: 52 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v10 (copy)
    v29:setState({
        requestInFlight = false
    });
    v29.continueToAuthenticatorAppScreen = function(_) --[[ Line: 59 ]]
        -- upvalues: v29 (copy), v9 (ref)
        return function() --[[ Line: 60 ]]
            -- upvalues: v29 (ref), v9 (ref)
            v29:setState({
                requestInFlight = true
            });
            v29.props.navigateToModalState(v9.AuthenticatorUpsellInstallApps);
        end;
    end;
    v29.closeCallback = function() --[[ Line: 70 ]]
        -- upvalues: v29 (copy), v10 (ref)
        v29.props.updatePromptAssignment(v29.props.networking, v29.props.promptType, v10.DismissPrompt);
    end;
end;
v23.render = function(v31) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v15 (copy), v22 (copy), v2 (copy), v6 (copy), v26 (copy), v28 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), l_getIconSizeUDim2_0 (copy), l_XLarge_0 (copy), v27 (copy), v7 (copy), v25 (copy), v8 (copy), l_ButtonType_0 (copy)
    local l_requestInFlight_0 = v31.state.requestInFlight;
    return v4.Style.withStyle(function(_) --[[ Line: 82 ]]
        -- upvalues: v15 (ref), v22 (ref), v2 (ref), v6 (ref), v31 (copy), v26 (ref), v28 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_getIconSizeUDim2_0 (ref), l_XLarge_0 (ref), v27 (ref), v7 (ref), v25 (ref), v8 (ref), l_requestInFlight_0 (copy), l_ButtonType_0 (ref)
        return v15(v22)(function(v34) --[[ Line: 83 ]]
            -- upvalues: v2 (ref), v6 (ref), v31 (ref), v26 (ref), v28 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_getIconSizeUDim2_0 (ref), l_XLarge_0 (ref), v27 (ref), v7 (ref), v25 (ref), v8 (ref), l_requestInFlight_0 (ref), l_ButtonType_0 (ref)
            return v2.createElement(v6, {
                title = v34.header, 
                closeCallback = v31.closeCallback, 
                makeBodyFragment = function(v35) --[[ Line: 87 ]] --[[ Name: makeBodyFragment ]]
                    -- upvalues: v2 (ref), v26 (ref), v28 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), l_getIconSizeUDim2_0 (ref), l_XLarge_0 (ref), v27 (ref), v7 (ref), v25 (ref), v34 (copy)
                    return v2.createFragment({
                        ROWS_WRAPPER = v2.createElement("Frame", {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Transparency = 1
                        }, {
                            WrappingListWrapper = v2.createElement("UIListLayout", {
                                FillDirection = Enum.FillDirection.Vertical, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                Padding = v26
                            }), 
                            FIRST_ROW = v2.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Transparency = 1
                            }, {
                                WrappingListB = v2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v28
                                }), 
                                Left_ProtectGamesRobuxImage = v2.createElement(l_ImageSetLabel_0, {
                                    Image = l_Images_0["icons/graphic/connectdevices_2xl"], 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_XLarge_0)
                                }), 
                                SubFrame = v2.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Transparency = 1
                                }, {
                                    ASubList = v2.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Vertical, 
                                        Padding = v27
                                    }), 
                                    Right_TwoFactorsTextA = v2.createElement(v7, {
                                        contentWidth = v35 - v25, 
                                        text = v34.twoFactorsBetterThanOneHeadline, 
                                        useBold = true, 
                                        alignLeft = true
                                    }), 
                                    Right_TwoFactorsTextB = v2.createElement(v7, {
                                        contentWidth = v35 - v25, 
                                        text = v34.twoFactorsBetterThanOneMessage, 
                                        useBold = false, 
                                        alignLeft = true
                                    })
                                })
                            }), 
                            SECOND_ROW = v2.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Transparency = 1
                            }, {
                                WrappingListB = v2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v28
                                }), 
                                Left_ProtectGamesRobuxImage = v2.createElement(l_ImageSetLabel_0, {
                                    Image = l_Images_0["icons/graphic/gamesanditems_2xl"], 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_XLarge_0)
                                }), 
                                SubFrame = v2.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Transparency = 1
                                }, {
                                    ASubList = v2.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Vertical, 
                                        Padding = v27
                                    }), 
                                    Right_ProtectGamesRobuxHeadline = v2.createElement(v7, {
                                        contentWidth = v35 - v25, 
                                        text = v34.protectGamesRobuxHeadline, 
                                        useBold = true, 
                                        alignLeft = true
                                    }), 
                                    Right_ProtectGamesRobuxMessage = v2.createElement(v7, {
                                        contentWidth = v35 - v25, 
                                        text = v34.protectGamesRobuxMessage, 
                                        useBold = false, 
                                        alignLeft = true
                                    })
                                })
                            }), 
                            THIRD_ROW = v2.createElement("Frame", {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Transparency = 1
                            }, {
                                WrappingListC = v2.createElement("UIListLayout", {
                                    FillDirection = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                                    Padding = v28
                                }), 
                                Left_KeepBadActorsImage = v2.createElement(l_ImageSetLabel_0, {
                                    Image = l_Images_0["icons/graphic/blocktheft_2xl"], 
                                    BorderSizePixel = 0, 
                                    BackgroundTransparency = 1, 
                                    Size = l_getIconSizeUDim2_0(l_XLarge_0)
                                }), 
                                SubFrame = v2.createElement("Frame", {
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Transparency = 1
                                }, {
                                    ASubList = v2.createElement("UIListLayout", {
                                        FillDirection = Enum.FillDirection.Vertical, 
                                        Padding = v27
                                    }), 
                                    Right_TwoFactorsTextA = v2.createElement(v7, {
                                        contentWidth = v35 - v25, 
                                        text = v34.keepBadActorsOutHeadline, 
                                        useBold = true, 
                                        alignLeft = true
                                    }), 
                                    Right_TwoFactorsTextB = v2.createElement(v7, {
                                        contentWidth = v35 - v25, 
                                        text = v34.keepBadActorsOutMessage, 
                                        useBold = false, 
                                        alignLeft = true
                                    })
                                })
                            })
                        })
                    });
                end, 
                buttonConfig = v8({
                    {
                        isDisabled = l_requestInFlight_0, 
                        isLoading = l_requestInFlight_0, 
                        onActivated = v31.continueToAuthenticatorAppScreen(v34), 
                        text = v34.action, 
                        type = l_ButtonType_0.PrimarySystem
                    }
                })
            });
        end);
    end);
end;
v23 = v3.connect(function(_, _) --[[ Line: 226 ]]
    return {};
end, function(v38) --[[ Line: 228 ]]
    -- upvalues: v5 (copy), v14 (copy)
    return {
        closeOverlay = function() --[[ Line: 230 ]] --[[ Name: closeOverlay ]]
            -- upvalues: v38 (copy), v5 (ref)
            return v38(v5());
        end, 
        updatePromptAssignment = function(v39, v40, v41) --[[ Line: 233 ]] --[[ Name: updatePromptAssignment ]]
            -- upvalues: v38 (copy), v14 (ref)
            return v38(v14(v39, v40, v41));
        end
    };
end)(v23);
return (l_RoactServices_0.connect({
    analytics = v11, 
    networking = v12
})(v23));