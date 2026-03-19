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
local v25 = {
    TermsOfService = "CommonUI.UserAgreements.Popup.Agreement.TermsOfService", 
    PrivacyPolicy = "CommonUI.UserAgreements.Popup.Agreement.PrivacyPolicy"
};
local v26 = l_Roact_0.PureComponent:extend("UserAgreementsListItem");
v26.validateProps = l_t_0.strictInterface({
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
v26.defaultProps = {
    margin = l_FitFrame_0.Rect.square(0), 
    agreementTypeExists = false
};
openExternalBrowser = function(v27, v28) --[[ Line: 86 ]] --[[ Name: openExternalBrowser ]]
    -- upvalues: l_ArgCheck_0 (copy)
    l_ArgCheck_0.isNotNil(v27, "linking");
    l_ArgCheck_0.isType(v28, "string", "url");
    v27:openURL(v28);
end;
v26.init = function(v29) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: l_Roact_0 (copy), l_FFlagEnableModularizedUserAgreementsList_0 (copy)
    local v30, v31 = l_Roact_0.createBinding(false);
    v29.buttonPressed = v30;
    v29.updateButtonPressed = v31;
    v29.onButtonInputBegan = function(_, v33) --[[ Line: 96 ]]
        -- upvalues: v29 (copy)
        if v33.UserInputType == Enum.UserInputType.Touch or v33.UserInputType == Enum.UserInputType.MouseButton1 then
            if v29.buttonPressed:getValue() then
                return;
            else
                v29.updateButtonPressed(true);
            end;
        end;
    end;
    v29.onButtonInputEnded = function() --[[ Line: 108 ]]
        -- upvalues: v29 (copy)
        if v29.buttonPressed:getValue() then
            v29.updateButtonPressed(false);
        end;
    end;
    v29.showLinkText = function() --[[ Line: 114 ]]
        -- upvalues: l_FFlagEnableModularizedUserAgreementsList_0 (ref), v29 (copy)
        if l_FFlagEnableModularizedUserAgreementsList_0 then
            return not v29.props.hideLink and not v29.props.agreementTypeExists;
        else
            return not v29.props.agreementTypeExists;
        end;
    end;
end;
v26.renderWithProviders = function(v34, v35, v36) --[[ Line: 123 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagEnableModularizedUserAgreementsList_0 (copy), l_GetFFlagVngTOSRevisedEnabled_0 (copy), l_TextService_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v15 (copy), l_Roact_0 (copy), v19 (copy), l_AppPage_0 (copy), l_NotificationType_0 (copy), l_StyledTextLabel_0 (copy)
    local l_LayoutOrder_0 = v34.props.LayoutOrder;
    local l_Size_0 = v34.props.Size;
    local v39 = v34.props.minHeight or 55;
    local l_margin_0 = v34.props.margin;
    local l_agreement_0 = v34.props.agreement;
    local v42 = v34.props.checkBoxPresent or false;
    local l_Font_0 = v36.Font;
    local l_Theme_0 = v36.Theme;
    local l_Tokens_0 = v36.Tokens;
    local v46 = -(l_margin_0.left + l_margin_0.right + 14);
    local v47 = if l_FFlagEnableModularizedUserAgreementsList_0 and v42 then l_Tokens_0.Global.FontSize_100 else l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v48 = 20 / v47;
    local v49 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
    local v50 = 14 / v49;
    local l_displayUrl_0 = l_agreement_0.displayUrl;
    local l_agreementTitle_0 = v35.agreementTitle;
    local l_shortTitle_0 = v35.shortTitle;
    local l_v39_0 = v39;
    if l_GetFFlagVngTOSRevisedEnabled_0() and v34.state.titleTextWidth and v34.state.titleTextWidth > 100 then
        l_v39_0 = math.max(v39, l_TextService_0:GetTextSize(l_agreementTitle_0, v47, l_Font_0.Body.Font, Vector2.new(v34.state.titleTextWidth, 1e999)).Y + 20 + l_margin_0.top + l_margin_0.bottom);
    end;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    if l_FFlagEnableModularizedUserAgreementsList_0 then
        v55 = l_ImageSetLabel_0;
        v56 = 3;
        v57 = l_Images_0["icons/navigation/pushRight"];
    else
        v55 = v15;
        v56 = 1;
        v57 = "LuaApp/icons/navigation/pushRight_small";
    end;
    local function v61(v58, v59, v60) --[[ Line: 178 ]] --[[ Name: createImageElement ]]
        -- upvalues: l_Roact_0 (ref), l_margin_0 (copy), l_FFlagEnableModularizedUserAgreementsList_0 (ref), l_Theme_0 (copy)
        return l_Roact_0.createElement(v58, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Size = UDim2.new(0, 14 * v59, 0, 14 * v59), 
            Position = UDim2.new(1, -l_margin_0.right, 0.5, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = v60, 
            ImageColor3 = if l_FFlagEnableModularizedUserAgreementsList_0 then l_Theme_0.UIEmphasis.Color else l_Theme_0.SecondaryDefault.Color, 
            ImageTransparency = l_FFlagEnableModularizedUserAgreementsList_0 and 0 or l_Theme_0.SecondaryDefault.Transparency
        });
    end;
    return l_Roact_0.createElement("ImageButton", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = if l_GetFFlagVngTOSRevisedEnabled_0() then UDim2.new(1, 0, 0, l_v39_0) else l_Size_0, 
        AutoButtonColor = false, 
        BackgroundColor3 = v36.Theme.BackgroundOnPress.Color, 
        BackgroundTransparency = v34.buttonPressed:map(function(v62) --[[ Line: 200 ]]
            -- upvalues: v36 (copy)
            return v62 and v36.Theme.BackgroundOnPress.Transparency or 1;
        end), 
        BorderSizePixel = 0, 
        [l_Roact_0.Event.InputBegan] = v34.onButtonInputBegan, 
        [l_Roact_0.Event.InputEnded] = v34.onButtonInputEnded, 
        [l_Roact_0.Event.Activated] = function() --[[ Line: 206 ]]
            -- upvalues: v34 (copy), l_displayUrl_0 (copy), l_agreementTitle_0 (copy), v19 (ref), l_shortTitle_0 (copy), l_AppPage_0 (ref), l_NotificationType_0 (ref)
            if v34.props.useExternalBrowserForDisclaimerLinks then
                openExternalBrowser(v34.props.linking, l_displayUrl_0);
                return;
            else
                local l_l_agreementTitle_0_0 = l_agreementTitle_0;
                if v19 and string.len(l_agreementTitle_0) > 30 then
                    l_l_agreementTitle_0_0 = (not (l_shortTitle_0 ~= nil) or l_shortTitle_0 == "") and "Terms" or l_shortTitle_0;
                end;
                v34.props.navigateDown({
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
            PaddingRight = if l_FFlagEnableModularizedUserAgreementsList_0 and v42 then UDim.new(0, l_margin_0.right * 2) else UDim.new(0, 0)
        }), 
        TextLayout = l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, v46, 1, 0), 
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
                onAbsoluteSizeChange = function(v64) --[[ Line: 255 ]] --[[ Name: onAbsoluteSizeChange ]]
                    -- upvalues: v34 (copy)
                    local l_AbsoluteSize_0 = v64.AbsoluteSize;
                    if v34.state.titleTextWidth ~= l_AbsoluteSize_0.X then
                        v34:setState({
                            titleTextWidth = l_AbsoluteSize_0.X
                        });
                    end;
                end
            }) else l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 1, 
                Size = UDim2.new(l_FFlagEnableModularizedUserAgreementsList_0 and v42 and 0.9 or 1, 0, 0, l_FFlagEnableModularizedUserAgreementsList_0 and 40 or 20), 
                Position = UDim2.new(0, 0, 0.5, 0), 
                AnchorPoint = Vector2.new(0, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_agreementTitle_0, 
                Font = if l_FFlagEnableModularizedUserAgreementsList_0 then l_Font_0.Body.Font else l_Font_0.Header2.Font, 
                TextSize = v47, 
                LineHeight = v48, 
                TextColor3 = l_Theme_0.TextMuted.Color, 
                TextTransparency = l_Theme_0.TextMuted.Transparency, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = l_FFlagEnableModularizedUserAgreementsList_0 and true or false, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            LinkText = v34.showLinkText() and l_Roact_0.createElement("TextLabel", {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, 14), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_displayUrl_0, 
                Font = l_Font_0.Header2.Font, 
                TextSize = v49, 
                LineHeight = v50, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = 0.5, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }) or nil
        }), 
        RightImage = v61(v55, v56, v57)
    });
end;
v26.render = function(v66) --[[ Line: 307 ]] --[[ Name: render ]]
    -- upvalues: v25 (copy), l_withLocalization_0 (copy), l_withStyle_0 (copy)
    local v67 = v25[v66.props.agreement.agreementType] or "CommonUI.UserAgreements.Popup.DefaultAgreementTitle";
    return l_withLocalization_0({
        agreementTitle = v67, 
        shortTitle = "CommonUI.UserAgreements.Popup.TitleOnWebview"
    })(function(v68) --[[ Line: 317 ]]
        -- upvalues: l_withStyle_0 (ref), v66 (copy)
        return l_withStyle_0(function(v69) --[[ Line: 318 ]]
            -- upvalues: v66 (ref), v68 (copy)
            return v66:renderWithProviders(v68, v69);
        end);
    end);
end;
v26 = l_RoactAppPolicy_0.connect(function(v70) --[[ Line: 324 ]]
    return {
        useExternalBrowserForDisclaimerLinks = v70.shouldUseExternalBrowserForDisclaimerLinks()
    };
end)(v26);
v26 = l_RoactServices_0.connect({
    linking = l_AppLinking_0
})(v26);
return (l_RoactRodux_0.connect(nil, function(v71) --[[ Line: 334 ]]
    -- upvalues: l_NavigateDown_0 (copy)
    return {
        navigateDown = function(v72) --[[ Line: 336 ]] --[[ Name: navigateDown ]]
            -- upvalues: v71 (copy), l_NavigateDown_0 (ref)
            v71(l_NavigateDown_0(v72));
        end
    };
end)(v26));