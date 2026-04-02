local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_TextService_0 = game:GetService("TextService");
local l_Roact_0 = v1.Roact;
local l_RoactRodux_0 = v1.RoactRodux;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_RobloxAppEnums_0 = v1.RobloxAppEnums;
local l_AppPage_0 = l_RobloxAppEnums_0.AppPage;
local l_RoactServices_0 = v1.RoactServices.RoactServices;
local l_AppLinking_0 = v1.RoactServiceTags.AppLinking;
local l_NavigateDown_0 = v1.NavigationRodux.Thunks.NavigateDown;
local l_NotificationType_0 = l_RobloxAppEnums_0.NotificationType;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_ArgCheck_0 = v1.ArgCheck;
local v15 = require(script.Parent.DEPRECATED_ImageSetLabel);
local l_withLocalization_0 = v1.Localization.withLocalization;
local l_FFlagEnableModularizedUserAgreementsList_0 = v1.SharedFlags.FFlagEnableModularizedUserAgreementsList;
local l_GetFFlagVngTOSRevisedEnabled_0 = v1.SharedFlags.GetFFlagVngTOSRevisedEnabled;
local v19 = game:DefineFastFlag("TrimLongTitleForTOSEnabled", false);
local l_RoactAppPolicy_0 = v1.UniversalAppPolicy.RoactAppPolicy;
local l_FitFrame_0 = v1.FitFrame;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local v25 = game:DefineFastFlag("FixLocalizationOfStudioTermsForVNGSKU", false);
local v26 = nil;
v26 = if v25 then {
    TermsOfService = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService", 
    PrivacyPolicy = "CommonUI.UserAgreements.Popup.Agreement.PrivacyPolicy", 
    StudioTermsForVNGSKU = "CommonUI.UserAgreements.Popup.Agreement.StudioTermsForVNGSKU"
} else {
    TermsOfService = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService", 
    PrivacyPolicy = "CommonUI.UserAgreements.Popup.Agreement.PrivacyPolicy"
};
local v27 = l_Roact_0.PureComponent:extend("UserAgreementsListItem");
v27.validateProps = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    Size = if not l_GetFFlagVngTOSRevisedEnabled_0() then l_t_0.UDim2 else nil, 
    agreement = l_t_0.strictInterface({
        id = l_t_0.string, 
        agreementType = l_t_0.string, 
        clientType = l_t_0.string, 
        displayUrl = l_t_0.string, 
        regulationType = l_t_0.string
    }), 
    minHeight = l_t_0.optional(l_t_0.integer), 
    margin = l_t_0.optional(l_t_0.strictInterface({
        top = l_t_0.integer, 
        right = l_t_0.integer, 
        bottom = l_t_0.integer, 
        left = l_t_0.integer
    })), 
    navigateDown = l_t_0.callback, 
    agreementTypeExists = l_t_0.optional(l_t_0.boolean), 
    useExternalBrowserForDisclaimerLinks = l_t_0.optional(l_t_0.boolean), 
    linking = l_t_0.optional(l_t_0.table), 
    hideLink = l_t_0.optional(l_t_0.boolean), 
    checkBoxPresent = l_t_0.optional(l_t_0.boolean)
});
v27.defaultProps = {
    margin = l_FitFrame_0.Rect.square(0), 
    agreementTypeExists = false
};
openExternalBrowser = function(v28, v29) --[[ Line: 96 ]] --[[ Name: openExternalBrowser ]]
    -- upvalues: l_ArgCheck_0 (copy)
    l_ArgCheck_0.isNotNil(v28, "linking");
    l_ArgCheck_0.isType(v29, "string", "url");
    v28:openURL(v29);
end;
v27.init = function(v30) --[[ Line: 103 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_FFlagEnableModularizedUserAgreementsList_0 (copy)
    local v31, v32 = l_Roact_0.createBinding(false);
    v30.buttonPressed = v31;
    v30.updateButtonPressed = v32;
    v30.onButtonInputBegan = function(_, v34) --[[ Line: 106 ]]
        -- upvalues: v30 (copy)
        if v34.UserInputType == Enum.UserInputType.Touch or v34.UserInputType == Enum.UserInputType.MouseButton1 then
            if v30.buttonPressed:getValue() then
                return;
            else
                v30.updateButtonPressed(true);
            end;
        end;
    end;
    v30.onButtonInputEnded = function() --[[ Line: 118 ]]
        -- upvalues: v30 (copy)
        if v30.buttonPressed:getValue() then
            v30.updateButtonPressed(false);
        end;
    end;
    v30.showLinkText = function() --[[ Line: 124 ]]
        -- upvalues: l_FFlagEnableModularizedUserAgreementsList_0 (ref), v30 (copy)
        if l_FFlagEnableModularizedUserAgreementsList_0 then
            return not v30.props.hideLink and not v30.props.agreementTypeExists;
        else
            return not v30.props.agreementTypeExists;
        end;
    end;
end;
v27.renderWithProviders = function(v35, v36, v37) --[[ Line: 133 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagEnableModularizedUserAgreementsList_0 (copy), l_GetFFlagVngTOSRevisedEnabled_0 (copy), l_TextService_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v15 (copy), l_Roact_0 (copy), v19 (copy), l_AppPage_0 (copy), l_NotificationType_0 (copy), l_StyledTextLabel_0 (copy)
    local l_LayoutOrder_0 = v35.props.LayoutOrder;
    local l_Size_0 = v35.props.Size;
    local v40 = v35.props.minHeight or 55;
    local l_margin_0 = v35.props.margin;
    local l_agreement_0 = v35.props.agreement;
    local v43 = v35.props.checkBoxPresent or false;
    local l_Font_0 = v37.Font;
    local l_Theme_0 = v37.Theme;
    local l_Tokens_0 = v37.Tokens;
    local v47 = -(l_margin_0.left + l_margin_0.right + 14);
    local v48 = if l_FFlagEnableModularizedUserAgreementsList_0 and v43 then l_Tokens_0.Global.FontSize_100 else l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v49 = 20 / v48;
    local v50 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
    local v51 = 14 / v50;
    local l_displayUrl_0 = l_agreement_0.displayUrl;
    local l_agreementTitle_0 = v36.agreementTitle;
    local l_shortTitle_0 = v36.shortTitle;
    local l_v40_0 = v40;
    if l_GetFFlagVngTOSRevisedEnabled_0() and v35.state.titleTextWidth and v35.state.titleTextWidth > 100 then
        l_v40_0 = math.max(v40, l_TextService_0:GetTextSize(l_agreementTitle_0, v48, l_Font_0.Body.Font, Vector2.new(v35.state.titleTextWidth, 1e999)).Y + 20 + l_margin_0.top + l_margin_0.bottom);
    end;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    if l_FFlagEnableModularizedUserAgreementsList_0 then
        v56 = l_ImageSetLabel_0;
        v57 = 3;
        v58 = l_Images_0["icons/navigation/pushRight"];
    else
        v56 = v15;
        v57 = 1;
        v58 = "LuaApp/icons/navigation/pushRight_small";
    end;
    local function v62(v59, v60, v61) --[[ Line: 188 ]] --[[ Name: createImageElement ]]
        -- upvalues: l_Roact_0 (ref), l_margin_0 (copy), l_FFlagEnableModularizedUserAgreementsList_0 (ref), l_Theme_0 (copy)
        return l_Roact_0.createElement(v59, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 14 * v60, 0, 14 * v60), 
            Position = UDim2.new(1, -l_margin_0.right, 0.5, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v61, 
            ImageColor3 = if l_FFlagEnableModularizedUserAgreementsList_0 then l_Theme_0.UIEmphasis.Color else l_Theme_0.SecondaryDefault.Color, 
            ImageTransparency = l_FFlagEnableModularizedUserAgreementsList_0 and 0 or l_Theme_0.SecondaryDefault.Transparency
        });
    end;
    return l_Roact_0.createElement("ImageButton", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = if l_GetFFlagVngTOSRevisedEnabled_0() then UDim2.new(1, 0, 0, l_v40_0) else l_Size_0, 
        AutoButtonColor = false, 
        BackgroundColor3 = v37.Theme.BackgroundOnPress.Color, 
        BackgroundTransparency = v35.buttonPressed:map(function(v63) --[[ Line: 210 ]]
            -- upvalues: v37 (copy)
            return v63 and v37.Theme.BackgroundOnPress.Transparency or 1;
        end), 
        BorderSizePixel = 0, 
        [l_Roact_0.Event.InputBegan] = v35.onButtonInputBegan, 
        [l_Roact_0.Event.InputEnded] = v35.onButtonInputEnded, 
        [l_Roact_0.Event.Activated] = function() --[[ Line: 216 ]]
            -- upvalues: v35 (copy), l_displayUrl_0 (copy), l_agreementTitle_0 (copy), v19 (ref), l_shortTitle_0 (copy), l_AppPage_0 (ref), l_NotificationType_0 (ref)
            if v35.props.useExternalBrowserForDisclaimerLinks then
                openExternalBrowser(v35.props.linking, l_displayUrl_0);
                return;
            else
                local l_l_agreementTitle_0_0 = l_agreementTitle_0;
                if v19 and string.len(l_agreementTitle_0) > 30 then
                    l_l_agreementTitle_0_0 = (not (l_shortTitle_0 ~= nil) or l_shortTitle_0 == "") and "Terms" or l_shortTitle_0;
                end;
                v35.props.navigateDown({
                    name = l_AppPage_0.GenericWebPage, 
                    detail = l_displayUrl_0, 
                    extraProps = {
                        title = l_l_agreementTitle_0_0, 
                        notificationType = l_NotificationType_0.OPEN_CUSTOM_WEBVIEW
                    }
                });
                return;
            end;
        end
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_margin_0.top), 
            PaddingBottom = UDim.new(0, l_margin_0.bottom), 
            PaddingLeft = UDim.new(0, l_margin_0.left), 
            PaddingRight = if l_FFlagEnableModularizedUserAgreementsList_0 and v43 then UDim.new(0, l_margin_0.right * 2) else UDim.new(0, 0)
        }), 
        TextLayout = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, v47, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TitleText = if l_GetFFlagVngTOSRevisedEnabled_0() then l_Roact_0.createElement(l_StyledTextLabel_0, {
                layoutOrder = 1, 
                size = UDim2.new(1, 0, 0, 0), 
                text = l_agreementTitle_0, 
                fontStyle = l_Font_0.Body, 
                colorStyle = l_Theme_0.TextMuted, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center, 
                textTruncate = Enum.TextTruncate.None, 
                automaticSize = Enum.AutomaticSize.Y, 
                onAbsoluteSizeChange = function(v65) --[[ Line: 265 ]] --[[ Name: onAbsoluteSizeChange ]]
                    -- upvalues: v35 (copy)
                    local l_AbsoluteSize_0 = v65.AbsoluteSize;
                    if v35.state.titleTextWidth ~= l_AbsoluteSize_0.X then
                        v35:setState({
                            titleTextWidth = l_AbsoluteSize_0.X
                        });
                    end;
                end
            }) else l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(l_FFlagEnableModularizedUserAgreementsList_0 and v43 and 0.9 or 1, 0, 0, l_FFlagEnableModularizedUserAgreementsList_0 and 40 or 20), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_agreementTitle_0, 
                Font = if l_FFlagEnableModularizedUserAgreementsList_0 then l_Font_0.Body.Font else l_Font_0.Header2.Font, 
                TextSize = v48, 
                LineHeight = v49, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = l_FFlagEnableModularizedUserAgreementsList_0 and true or false, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            LinkText = v35.showLinkText() and l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_displayUrl_0, 
                Font = l_Font_0.Header2.Font, 
                TextSize = v50, 
                LineHeight = v51, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = 0.5, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or nil
        }), 
        RightImage = v62(v56, v57, v58)
    });
end;
v27.render = function(v67) --[[ Line: 317 ]] --[[ Name: render ]]
    -- upvalues: v26 (ref), l_withLocalization_0 (copy), l_withStyle_0 (copy)
    local v68 = v26[v67.props.agreement.agreementType] or "CommonUI.UserAgreements.Popup.DefaultAgreementTitle";
    return l_withLocalization_0({
        agreementTitle = v68, 
        shortTitle = "CommonUI.UserAgreements.Popup.TitleOnWebview"
    })(function(v69) --[[ Line: 327 ]]
        -- upvalues: l_withStyle_0 (ref), v67 (copy)
        return l_withStyle_0(function(v70) --[[ Line: 328 ]]
            -- upvalues: v67 (ref), v69 (copy)
            return v67:renderWithProviders(v69, v70);
        end);
    end);
end;
v27 = l_RoactAppPolicy_0.connect(function(v71) --[[ Line: 334 ]]
    return {
        useExternalBrowserForDisclaimerLinks = v71.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v27);
v27 = l_RoactServices_0.connect({
    linking = l_AppLinking_0
})(v27);
return (l_RoactRodux_0.connect(nil, function(v72) --[[ Line: 344 ]]
    -- upvalues: l_NavigateDown_0 (copy)
    return {
        navigateDown = function(v73) --[[ Line: 346 ]] --[[ Name: navigateDown ]]
            -- upvalues: v72 (copy), l_NavigateDown_0 (ref)
            v72(l_NavigateDown_0(v73));
        end
    };
end)(v27));