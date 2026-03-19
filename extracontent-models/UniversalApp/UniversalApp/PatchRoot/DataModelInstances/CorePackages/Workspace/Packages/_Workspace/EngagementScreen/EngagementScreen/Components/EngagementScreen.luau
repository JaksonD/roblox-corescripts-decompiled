local l_Parent_0 = script:FindFirstAncestor("EngagementScreen").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_DividerWithText_0 = require(l_Parent_0.AuthCommon).Components.DividerWithText;
local v8 = require(script.Parent.SwitchAccountButton);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_AppLogging_0 = require(l_Parent_0.RoactServiceTags).AppLogging;
local l_TelemetryConfigs_0 = require(l_Parent_0.AuthAnalytics).TelemetryConfigs;
return function(v13) --[[ Line: 22 ]] --[[ Name: EngagementScreen ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_AppLogging_0 (copy), v1 (copy), l_TelemetryConfigs_0 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy), l_DividerWithText_0 (copy), v8 (copy)
    local v15 = l_useDesignTokens_0(function(v14) --[[ Line: 23 ]]
        return {
            headerFontStyle = v14.Semantic.Typography.Header, 
            footerFontStyle = v14.Semantic.Typography.Footer, 
            defaultTextColor = v14.Semantic.Color.Text.Default, 
            mutedTextColor = v14.Semantic.Color.Text.Muted, 
            engagementScreen = v14.LuaApps.EngagementScreen
        };
    end);
    local l_headerFontStyle_0 = v15.headerFontStyle;
    local v17 = l_useLocalization_0({
        continue = "CommonUI.Features.Label.EngagementScreen.Continue", 
        orYouCan = "CommonUI.Features.Labels.OrYouCan"
    });
    local v18 = l_useRoactService_0(l_AppLogging_0);
    local v19 = v1.useCallback(function() --[[ Line: 40 ]]
        -- upvalues: v18 (copy), l_TelemetryConfigs_0 (ref), v13 (copy)
        pcall(function() --[[ Line: 41 ]]
            -- upvalues: v18 (ref), l_TelemetryConfigs_0 (ref)
            v18:logRobloxTelemetryCounter(l_TelemetryConfigs_0.EngagementScreenContinueButtonClickedConfig, 1);
        end);
        v13.onContinue();
    end, {
        v13.onContinue, 
        v18
    });
    v1.useLayoutEffect(function() --[[ Line: 48 ]]
        -- upvalues: v18 (copy), l_TelemetryConfigs_0 (ref)
        v18:logEventOnce("engagement_screen_did_mount");
        v18:logRobloxTelemetryCounter(l_TelemetryConfigs_0.EngagementScreenMountTelemetryConfig, 1);
    end, {
        v18
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, if v13.renderBackground then v13.renderBackground() else nil, v1.createElement("ImageLabel", {
        Position = v15.engagementScreen.robloxLogoTextImagePosition, 
        Size = v15.engagementScreen.robloxLogoTextImageSize, 
        Image = v15.engagementScreen.robloxLogoTextImageUrl, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }), v1.createElement("Frame", {
        Position = v15.engagementScreen.buttonContainerPosition, 
        Size = UDim2.new(0, v15.engagementScreen.containerWidth, 0, v15.engagementScreen.containerHeight), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, v1.createElement("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Padding = UDim.new(0, v15.engagementScreen.buttonPadding)
    }), v1.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.PrimarySystem, 
        layoutOrder = 1, 
        text = v17.continue, 
        fontStyle = l_headerFontStyle_0, 
        standardSize = l_StandardButtonSize_0.Regular, 
        onActivated = v19
    }), if v13.onSwitchAccounts then v1.createElement(v1.Fragment, nil, v1.createElement(l_DividerWithText_0, {
        layoutOrder = 2, 
        size = UDim2.new(0, v15.engagementScreen.dividerWidth, 0, v15.engagementScreen.dividerHeight), 
        width = 0, 
        height = 0, 
        font = v15.footerFontStyle.Font, 
        fontSize = v15.footerFontStyle.FontSize, 
        color3 = v15.mutedTextColor.Color3, 
        transparency = v15.mutedTextColor.Transparency, 
        text = v17.orYouCan, 
        padding = v15.engagementScreen.dividerPadding
    }), v1.createElement(v8, {
        layoutOrder = 3, 
        fontStyle = l_headerFontStyle_0, 
        onActivated = v13.onSwitchAccounts
    })) else nil));
end;