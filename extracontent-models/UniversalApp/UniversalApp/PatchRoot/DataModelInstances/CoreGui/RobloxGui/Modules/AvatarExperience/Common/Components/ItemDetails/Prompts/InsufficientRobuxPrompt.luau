local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactFitComponents_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents;
local l_FitFrameVertical_0 = l_RoactFitComponents_0.FitFrameVertical;
local l_FitTextLabel_0 = l_RoactFitComponents_0.FitTextLabel;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PerformXboxUpsell);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.RobuxAmountDisplay);
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v14.Style.withStyle;
local l_InteractiveAlert_0 = v14.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v14.App.Button.Enum.ButtonType;
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v19 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v19.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v19.Enums.ProductPurchaseSurface;
local v23 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FIntTTIUnifiedPurchaseSamplingRate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FIntTTIUnifiedPurchaseSamplingRate;
local v26 = l_GuiService_0:IsTenFootInterface();
local v27 = v3.PureComponent:extend("InsufficientRobuxPrompt");
v27.init = function(v28) --[[ Line: 47 ]] --[[ Name: init ]]
    -- upvalues: v18 (copy), v26 (copy)
    v28.closePrompt = function() --[[ Line: 48 ]]
        -- upvalues: v18 (ref), v28 (copy)
        v18.closeOverlay(v28.props.navigation);
    end;
    v28.buyRobux = function() --[[ Line: 52 ]]
        -- upvalues: v28 (copy), v26 (ref)
        v28.closePrompt();
        if v26 then
            v28.props.openXboxUpsell(v28.props.networking);
            return;
        else
            v28.props.openPurchaseRobuxPage(nil, v28.props.networking);
            return;
        end;
    end;
end;
v27.didMount = function(_) --[[ Line: 62 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), l_FIntTTIUnifiedPurchaseSamplingRate_0 (copy)
    if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
        local v30 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
        l_TimeToInteractiveTracker_0.trackEnd(v30, {
            samplingRateOverride = l_FIntTTIUnifiedPurchaseSamplingRate_0
        });
    end;
end;
v27.renderMiddle = function(v31, v32) --[[ Line: 71 ]] --[[ Name: renderMiddle ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_FitFrameVertical_0 (copy), l_RoactFitComponents_0 (copy), l_FitTextLabel_0 (copy), v13 (copy)
    local l_userRobux_0 = v31.props.userRobux;
    return l_withStyle_0(function(v34) --[[ Line: 74 ]]
        -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), l_RoactFitComponents_0 (ref), l_FitTextLabel_0 (ref), v32 (copy), v13 (ref), l_userRobux_0 (copy)
        local l_Font_0 = v34.Font;
        local l_Theme_0 = v34.Theme;
        local v37 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        return v3.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            margin = l_RoactFitComponents_0.Rect.quad(10, 0, 10, 0), 
            contentPadding = UDim.new(0, 30), 
            width = UDim.new(1, 0), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }, {
            CurrentBalanceLabel = v3.createElement(l_FitTextLabel_0, {
                width = l_FitTextLabel_0.Width.FitToText, 
                BackgroundTransparency = 1, 
                Font = l_Font_0.Body.Font, 
                Text = v32.currentBalanceLabel, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                TextSize = v37, 
                LayoutOrder = 0
            }), 
            RobuxContainer = v3.createElement(v13, {
                robuxAmountText = tostring(l_userRobux_0), 
                iconSize = v37, 
                textSize = v37, 
                padding = 10
            })
        });
    end);
end;
v27.renderAlertLocalized = function(v38, v39) --[[ Line: 110 ]] --[[ Name: renderAlertLocalized ]]
    -- upvalues: v3 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    return v3.createElement(l_InteractiveAlert_0, {
        title = v39.titleText, 
        bodyText = v39.messageText, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v38.closePrompt, 
                        text = v39.cancelButtonText
                    }, 
                    isDefaultChild = true
                }, 
                {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    props = {
                        onActivated = v38.buyRobux, 
                        text = v39.confirmButtonText
                    }
                }
            }
        }, 
        middleContent = function() --[[ Line: 132 ]] --[[ Name: middleContent ]]
            -- upvalues: v38 (copy), v39 (copy)
            return v38:renderMiddle(v39);
        end, 
        screenSize = v38.props.screenSize, 
        defaultChildRef = v38.props.defaultChildRef
    });
end;
v27.render = function(v40) --[[ Line: 140 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy)
    return l_withLocalization_0({
        titleText = "Feature.Catalog.Heading.InsufficientFunds", 
        currentBalanceLabel = "Feature.Catalog.Label.CurrentBalance", 
        messageText = "Feature.Catalog.Label.InsufficientFunds", 
        confirmButtonText = "Feature.GameDetails.Action.BuyRobux", 
        cancelButtonText = "Feature.Catalog.Action.Cancel"
    })(function(v41) --[[ Line: 147 ]]
        -- upvalues: v40 (copy)
        return v40:renderAlertLocalized(v41);
    end);
end;
v27 = v4.connect(function(v42, _) --[[ Line: 152 ]]
    local l_LocalUserId_0 = v42.LocalUserId;
    return {
        userRobux = v42.UserRobux[l_LocalUserId_0], 
        screenSize = v42.ScreenSize
    };
end, function(v45, v46) --[[ Line: 158 ]]
    -- upvalues: v23 (copy), v11 (copy)
    return {
        openPurchaseRobuxPage = function() --[[ Line: 160 ]] --[[ Name: openPurchaseRobuxPage ]]
            -- upvalues: v45 (copy), v23 (ref), v46 (copy)
            return v45(v23(nil, v46));
        end, 
        openXboxUpsell = function(v47) --[[ Line: 163 ]] --[[ Name: openXboxUpsell ]]
            -- upvalues: v45 (copy), v11 (ref)
            v45(v11(v47));
        end
    };
end)(v27);
return (v12((l_RoactServices_0.connect({
    networking = v9
})(v27))));