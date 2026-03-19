local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.RoactRodux);
local v4 = require(l_Parent_0.UIBlox);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_LinkButton_0 = v4.App.Button.LinkButton;
local l_ContextualMenu_0 = v4.App.Menu.ContextualMenu;
local l_MenuDirection_0 = v4.App.Menu.MenuDirection;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local l_AppLinking_0 = require(l_Parent_0.RoactServiceTags).AppLinking;
local l_RoactServices_0 = require(l_Parent_0.RoactServices).RoactServices;
local l_RoactAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).RoactAppPolicy;
local v13 = require(l_Parent_0.Cryo);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_FFlagFoundationStylingOnSignUp_0 = require(l_Parent_0.SharedFlags).FFlagFoundationStylingOnSignUp;
local v18 = require(l_script_FirstAncestor_0.Enums.DisclaimerLinksVariant);
local v19 = require(l_script_FirstAncestor_0.Components.FitChildren);
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v22 = require(l_script_FirstAncestor_0.Enums.TransitionAnimation);
local l_withLocalization_0 = require(l_Parent_0.Localization).withLocalization;
local l_withStyle_0 = v4.Style.withStyle;
local v25 = require(l_script_FirstAncestor_0.Thunks.OpenExternalBrowser);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v27 = require(l_Parent_0.AuthAnalytics);
local l_authFormInteraction_0 = v27.Events.authFormInteraction;
local l_EventStreamConstants_0 = v27.EventStreamConstants;
local v30 = require(script.Parent.DisclaimerLinkButtons);
local v31 = require(l_script_FirstAncestor_0.Components.RegisterAuditContent);
local v32 = require(l_script_FirstAncestor_0.Components.RegisterAdditionalAuditContent);
local l_GetFFlagEnableAuditForSinglePageSignUp_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableAuditForSinglePageSignUp;
local v34 = game:DefineFastFlag("HideHyphenInDisclaimerLinks", false);
local v35 = {
    [v18.Default] = "TextDefault", 
    [v18.Link] = nil
};
local v36 = v2.PureComponent:extend("DisclaimerLinks");
v36.init = function(v37) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v25 (copy), l_AppPage_0 (copy), v22 (copy), l_UrlBuilder_0 (copy), l_authFormInteraction_0 (copy), l_EventStreamConstants_0 (copy)
    v37.openDisclaimerLink = function(v38) --[[ Line: 61 ]]
        -- upvalues: v37 (copy), v25 (ref), l_AppPage_0 (ref), v22 (ref)
        if v37.props.useExternalBrowserForDisclaimerLinks then
            v25(v37.props.linking, v38);
            return;
        else
            v37.props.navigateDown({
                name = l_AppPage_0.GenericWebPage, 
                detail = v38, 
                extraProps = {
                    title = "", 
                    transitionAnimation = v22.SlideInFromRight
                }
            });
            return;
        end;
    end;
    v37.openTermsLink = function() --[[ Line: 76 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v37 (copy), l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref)
        local v39 = l_UrlBuilder_0.static.about.terms();
        if v37.props.ctx then
            l_authFormInteraction_0(v37.props.ctx, l_EventStreamConstants_0.Field.TermsOfService, v37.props.state);
        end;
        v37.openDisclaimerLink(v39);
    end;
    v37.openPrivacyLink = function() --[[ Line: 84 ]]
        -- upvalues: l_UrlBuilder_0 (ref), v37 (copy), l_authFormInteraction_0 (ref), l_EventStreamConstants_0 (ref)
        local v40 = l_UrlBuilder_0.static.about.privacy();
        if v37.props.ctx then
            l_authFormInteraction_0(v37.props.ctx, l_EventStreamConstants_0.Field.PrivacyPolicy, v37.props.state);
        end;
        v37.openDisclaimerLink(v40);
    end;
end;
v36.render = function(v41) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), l_UiMode_0 (copy), l_FFlagFoundationStylingOnSignUp_0 (copy), v35 (copy), l_Text_0 (copy), v19 (copy), v2 (copy), l_ImageSetLabel_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (copy), v31 (copy), v32 (copy), l_UrlBuilder_0 (copy), l_ContextualMenu_0 (copy), l_MenuDirection_0 (copy), l_LinkButton_0 (copy), v34 (copy), v13 (copy), v30 (copy)
    local l_isDualLayout_0 = v41.props.isDualLayout;
    local l_LoginView_0 = v41.props.tokens.LuaApps.LoginView;
    local v44 = if l_LoginView_0 then l_LoginView_0.boxPadding else 4;
    return l_withLocalization_0({
        termsOfUseText = "CommonUI.Features.Label.Terms", 
        termsOfUseTextLong = "CommonUI.Features.Label.TermsOfUse", 
        privacyPolicyText = "CommonUI.Features.Label.Privacy", 
        privacyPolicyTextLong = "CommonUI.Features.Label.PrivacyPolicy"
    })(function(v45) --[[ Line: 104 ]]
        -- upvalues: l_withStyle_0 (ref), v41 (copy), l_UiMode_0 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v35 (ref), l_isDualLayout_0 (copy), l_Text_0 (ref), v44 (copy), v19 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_LoginView_0 (copy), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v31 (ref), v32 (ref), l_UrlBuilder_0 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_LinkButton_0 (ref), v34 (ref), v13 (ref), v30 (ref)
        return l_withStyle_0(function(v46) --[[ Line: 105 ]]
            -- upvalues: v41 (ref), l_UiMode_0 (ref), l_FFlagFoundationStylingOnSignUp_0 (ref), v35 (ref), l_isDualLayout_0 (ref), v45 (copy), l_Text_0 (ref), v44 (ref), v19 (ref), v2 (ref), l_ImageSetLabel_0 (ref), l_LoginView_0 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v31 (ref), v32 (ref), l_UrlBuilder_0 (ref), l_ContextualMenu_0 (ref), l_MenuDirection_0 (ref), l_LinkButton_0 (ref), v34 (ref), v13 (ref), v30 (ref)
            local v47 = v41.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
            local l_LayoutOrder_0 = v41.props.LayoutOrder;
            local v49 = if l_FFlagFoundationStylingOnSignUp_0 then v35[v41.props.variant] else nil;
            local l_BaseSize_0 = v46.Font.BaseSize;
            local v51 = l_isDualLayout_0 and "CommonUI.Features.Label.TermsOfUse" or "CommonUI.Features.Label.Terms";
            local v52 = l_isDualLayout_0 and "CommonUI.Features.Label.PrivacyPolicy" or "CommonUI.Features.Label.Privacy";
            local v53 = if l_isDualLayout_0 then v45.termsOfUseTextLong else v45.termsOfUseText;
            local v54 = if l_isDualLayout_0 then v45.privacyPolicyTextLong else "<b>" .. v45.privacyPolicyText .. "</b>";
            local l_Font_0 = v46.Font.Header2.Font;
            local v56 = l_Text_0.GetTextWidth(" ", l_Font_0, l_BaseSize_0) / 2;
            local v57 = l_Text_0.GetTextWidth("-", l_Font_0, l_BaseSize_0);
            local v58 = l_Text_0.GetTextHeight(v45.privacyPolicyText, l_Font_0, l_BaseSize_0) + v44;
            if l_isDualLayout_0 then
                v58 = 2 * (l_Text_0.GetTextHeight(v45.privacyPolicyText, l_Font_0, l_BaseSize_0) + 2 * v44);
            end;
            local v59 = l_isDualLayout_0 and "Frame" or v19.FitFrame;
            local function v60() --[[ Line: 139 ]]
                -- upvalues: v2 (ref), l_ImageSetLabel_0 (ref), l_LoginView_0 (ref), v46 (copy)
                return {
                    Image = v2.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(0, l_LoginView_0.disclaimerIconSize, 0, l_LoginView_0.disclaimerIconSize), 
                        Position = UDim2.fromOffset(0, 0), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        ScaleType = Enum.ScaleType.Fit, 
                        Image = l_LoginView_0.linkIcon, 
                        ImageColor3 = v46.Theme.UIEmphasis.Color, 
                        ImageTransparency = 0
                    })
                };
            end;
            local function v61() --[[ Line: 154 ]]
                -- upvalues: v41 (ref), l_GetFFlagEnableAuditForSinglePageSignUp_0 (ref), v31 (ref), v53 (copy), v2 (ref), v51 (copy), v54 (copy), v52 (copy), l_isDualLayout_0 (ref), v45 (ref), v32 (ref), l_UrlBuilder_0 (ref)
                if not v41.props.enableAuditContentCapture or not l_GetFFlagEnableAuditForSinglePageSignUp_0() then
                    return {};
                else
                    return {
                        TermsAuditContent = v31 and v53 and v2.createElement(v31, {
                            translationKey = v51, 
                            translatedSourceString = v53
                        }), 
                        PrivacyAuditContent = v31 and v54 and v2.createElement(v31, {
                            translationKey = v52, 
                            translatedSourceString = if l_isDualLayout_0 then v45.privacyPolicyTextLong else v45.privacyPolicyText
                        }), 
                        TermsLinkAuditContent = v32 and v2.createElement(v32, {
                            contentKey = "termsLink", 
                            value = l_UrlBuilder_0.static.about.terms()
                        }), 
                        PrivacyLinkAuditContent = v32 and v2.createElement(v32, {
                            contentKey = "privacyLink", 
                            value = l_UrlBuilder_0.static.about.privacy()
                        })
                    };
                end;
            end;
            local function v62() --[[ Line: 187 ]]
                -- upvalues: v2 (ref), v56 (copy), l_isDualLayout_0 (ref), l_ContextualMenu_0 (ref), v53 (copy), v46 (copy), v41 (ref), l_LoginView_0 (ref), v60 (copy), v54 (copy), l_MenuDirection_0 (ref), l_LinkButton_0 (ref), v49 (copy), v34 (ref), v57 (copy), l_Font_0 (copy), l_BaseSize_0 (copy)
                return {
                    UIListLayout = v2.createElement("UIListLayout", {
                        Padding = UDim.new(0, v56), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = if l_isDualLayout_0 then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = if l_isDualLayout_0 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    ContextualMenu = if l_isDualLayout_0 then v2.createElement(l_ContextualMenu_0, {
                        buttonProps = {
                            {
                                text = v53, 
                                fontStyle = v46.Font.Header1, 
                                onActivated = v41.openTermsLink, 
                                rightSideGadgetSize = Vector2.new(l_LoginView_0.disclaimerIconSize + l_LoginView_0.disclaimerPadding, l_LoginView_0.disclaimerIconSize), 
                                renderRightSideGadget = v60
                            }, 
                            {
                                text = v54, 
                                fontStyle = v46.Font.Header1, 
                                onActivated = v41.openPrivacyLink, 
                                rightSideGadgetSize = Vector2.new(l_LoginView_0.disclaimerIconSize + l_LoginView_0.disclaimerPadding, l_LoginView_0.disclaimerIconSize), 
                                renderRightSideGadget = v60
                            }
                        }, 
                        open = true, 
                        stayOnActivated = true, 
                        isElementBackgroundVisible = false, 
                        isElementDividerVisible = false, 
                        closeBackgroundVisible = false, 
                        topElementRounded = false, 
                        bottomElementRounded = false, 
                        horizontalAlignment = Enum.HorizontalAlignment.Center, 
                        menuDirection = l_MenuDirection_0.Down, 
                        contextMenuWidthOverride = UDim.new(1, 0), 
                        elementHeight = l_LoginView_0.disclaimerElementHeight, 
                        openPositionX = UDim.new(0, 0), 
                        openPositionY = UDim.new(0, 0), 
                        screenSize = Vector2.new(0, 0)
                    }) else nil, 
                    TermsOfUse = if not l_isDualLayout_0 then v2.createElement(l_LinkButton_0, {
                        text = v53, 
                        size = if l_isDualLayout_0 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0), 
                        fontStyle = "Header2", 
                        layoutOrder = 1, 
                        underlineAlwaysEnabled = true, 
                        onActivated = v41.openTermsLink, 
                        colorStyleDefault = v49, 
                        colorStyleHover = v49
                    }) else nil, 
                    Hyphen = if not l_isDualLayout_0 then v2.createElement("TextLabel", {
                        BackgroundTransparency = 1, 
                        Text = v34 and " " or "-", 
                        Size = UDim2.new(0, v57, 1, 0), 
                        Font = l_Font_0, 
                        TextColor3 = v46.Theme.TextEmphasis.Color, 
                        TextTransparency = v46.Theme.TextEmphasis.Transparency, 
                        TextSize = l_BaseSize_0, 
                        LayoutOrder = 2
                    }) else nil, 
                    PrivacyPolicy = if not l_isDualLayout_0 then v2.createElement(l_LinkButton_0, {
                        text = v54, 
                        size = if l_isDualLayout_0 then UDim2.new(1, 0, 0.5, 0) else UDim2.new(0, 0, 1, 0), 
                        fontStyle = "Header2", 
                        layoutOrder = 3, 
                        underlineAlwaysEnabled = true, 
                        onActivated = v41.openPrivacyLink, 
                        colorStyleDefault = v49, 
                        colorStyleHover = v49
                    }) else nil
                };
            end;
            if v47 then
                if l_GetFFlagEnableAuditForSinglePageSignUp_0() then
                    return v2.createFragment(v13.Dictionary.join({
                        DisclaimerLinkButtons = v2.createElement(v30, {
                            textTos = v53, 
                            activatedTos = v41.openTermsLink, 
                            textPrivacy = v54, 
                            activatedPrivacy = v41.openPrivacyLink, 
                            fillDirection = v41.props.fillDirection, 
                            layoutOrder = l_LayoutOrder_0, 
                            tokens = l_LoginView_0
                        })
                    }, (v61())));
                else
                    return v2.createElement(v30, {
                        textTos = v53, 
                        activatedTos = v41.openTermsLink, 
                        textPrivacy = v54, 
                        activatedPrivacy = v41.openPrivacyLink, 
                        fillDirection = v41.props.fillDirection, 
                        layoutOrder = l_LayoutOrder_0, 
                        tokens = l_LoginView_0
                    });
                end;
            else
                local v63 = {
                    fitAxis = if not l_isDualLayout_0 then v19.FitAxis.Width else nil, 
                    Size = UDim2.new(1, 0, 0, v58), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = l_LayoutOrder_0
                };
                if l_GetFFlagEnableAuditForSinglePageSignUp_0() then
                    return v2.createElement(v59, v63, v13.Dictionary.join(v62(), (v61())));
                else
                    return v2.createElement(v59, v63, (v62()));
                end;
            end;
        end);
    end);
end;
v36 = v3.connect(function(_, _) --[[ Line: 326 ]]
    return {};
end, function(v66) --[[ Line: 328 ]]
    -- upvalues: l_NavigateDown_0 (copy)
    return {
        navigateDown = function(v67) --[[ Line: 330 ]] --[[ Name: navigateDown ]]
            -- upvalues: v66 (copy), l_NavigateDown_0 (ref)
            return v66(l_NavigateDown_0(v67));
        end
    };
end)(v36);
v36 = l_RoactAppPolicy_0.connect(function(v68) --[[ Line: 336 ]]
    return {
        useExternalBrowserForDisclaimerLinks = v68.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v36);
local v69 = l_RoactServices_0.connect({
    linking = l_AppLinking_0
})(v36);
return function(v70) --[[ Line: 347 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useUiModeInfo_0 (copy), v2 (copy), v69 (copy), v13 (copy)
    local v71 = l_useDesignTokens_0();
    local v72 = l_useUiModeInfo_0();
    return v2.createElement(v69, v13.Dictionary.join({
        tokens = v71, 
        uiModeInfo = v72
    }, v70));
end;