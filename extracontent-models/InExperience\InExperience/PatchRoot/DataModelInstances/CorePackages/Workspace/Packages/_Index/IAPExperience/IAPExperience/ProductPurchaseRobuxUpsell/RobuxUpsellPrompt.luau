local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local l_FitFrameVertical_0 = require(l_Parent_2.RoactFitComponents).FitFrameVertical;
local l_Colors_0 = require(l_Parent_2.Style).Colors;
local v6 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v6.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_withStyle_0 = v6.Core.Style.withStyle;
local v10 = require(l_Parent_1.Flags.FFlagLowCogsBannerInfoIcon);
local v11 = require(l_Parent_1.Generic.InfoIconWithTooltip);
local v12 = require(l_Parent_1.Locale.MultiTextLocalizer);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_2.AppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_2.Localization).LocalizationProvider;
local l_withLocalization_0 = require(l_Parent_2.Localization).withLocalization;
local _ = require(l_Parent_2.IXPServiceWrapper).IXPServiceWrapper;
local v18 = require(l_Parent_2.SharedFlags);
local l_default_0 = require(l_Parent_2.LoggingProtocol).default;
local v20 = require(l_Parent_1.Generic.Events.LegacyUpsellCounter);
local v21 = require(l_Parent_1.Utility.logger);
local v22 = require(l_Parent_1.Flags.FFlagMobilePopularItemBadgingExperimentEnabled);
local _ = require(l_Parent_1.Flags.GetFStringMobilePopularItemBadgingLayer);
local v24 = require(l_Parent_0.ProductDetails);
local v25 = require(l_Parent_0.ProductDetailsNew);
local v26 = require(l_Parent_1.Generic.Constants);
local v27 = require(l_Parent_1.Flags.getEnableCondenseRobuxUpsell);
local v28 = require(l_Parent_1.Flags.FFlagIntroduceMetricsLegacyUpsell);
local v29 = v3.Component:extend(script.Name);
v29.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    isDelayedInput = false, 
    isQuest = false, 
    enableInputDelayed = false, 
    inputDelaySec = 3, 
    isVng = false
};
v29.init = function(v30) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v27 (copy), v26 (copy)
    v30.contentRef = v3.createRef();
    v30.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0), 
        isCondensed = false
    };
    v30.validateCondensedCondition = function(v31) --[[ Line: 115 ]]
        -- upvalues: v27 (ref), v26 (ref), v30 (copy)
        if not v27() then
            return;
        else
            local v32 = v31.AbsoluteSize.Y + v26.MODAL_HEIGHT_WITHOUT_CONTENT + v26.MODAL_NORMAL_SECTION_PADDING * 2 + v26.MODAL_NORMAL_BUTTON_HEIGHT * 2;
            if v30.state.isCondensed then
                v30:setState({
                    isCondensed = v30.props.screenSize.Y < v32 + (v26.MODAL_NORMAL_CONTENT_PADDING - v26.MODAL_CONDENSED_CONTENT_PADDING) * 6 + (v26.MODAL_NORMAL_BUTTON_MARGIN - v26.MODAL_CONDENSED_BUTTON_MARGIN) + (v26.NORMAL_ICON_SIZE - v26.CONDENSED_ICON_SIZE)
                });
                return;
            else
                v30:setState({
                    isCondensed = v30.props.screenSize.Y < v32 + v26.MODAL_NORMAL_BUTTON_MARGIN
                });
                return;
            end;
        end;
    end;
    v30.changeContentSize = function(v33) --[[ Line: 143 ]]
        -- upvalues: v30 (copy)
        v30.validateCondensedCondition(v33);
        if v30.state.contentSize ~= v33.AbsoluteSize then
            v30:setState({
                contentSize = v33.AbsoluteSize
            });
        end;
    end;
end;
v29.didMount = function(_) --[[ Line: 153 ]] --[[ Name: didMount ]]
    -- upvalues: v28 (copy), v21 (copy), l_default_0 (copy), v20 (copy)
    if v28 then
        v21.debug({
            message = "Legacy Upsell Modal Shown"
        });
        l_default_0:logRobloxTelemetryCounter(v20.LegacyUpsellShownCounter, 1, {});
    end;
end;
v29.render = function(v35) --[[ Line: 162 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v22 (copy), v12 (copy)
    local v36 = v35.props.isVng and "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" or "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL";
    if v18.FFlagLowCogsBannerExperiment then
        return v3.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            Alert = v35:renderNewAlert()
        });
    elseif v22 then
        return v3.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            Alert = v35:renderAlertNewProductDetails()
        });
    else
        return v3.createElement(v12, {
            keys = {
                InsufficientRobuxTitle = {
                    key = "IAPExperience.RobuxUpsell.Title.InsufficientRobux"
                }, 
                AdditionalRobux = {
                    key = "IAPExperience.RobuxUpsell.Text.AdditionalRobux"
                }, 
                WouldYouBuy = {
                    key = "IAPExperience.RobuxUpsell.Text.WouldYouBuy"
                }, 
                DisclosurePayment = {
                    key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment"
                }, 
                DisclosureTermsURL = {
                    key = v36
                }, 
                TermsOfUse = {
                    key = "IAPExperience.RobuxUpsell.Text.TermsOfUse"
                }, 
                BuyRobuxButton = {
                    key = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem"
                }, 
                ButtonCancel = {
                    key = "IAPExperience.RobuxUpsell.Action.Cancel"
                }, 
                LoadingText = {
                    key = "IAPExperience.RobuxUpsell.Text.Loading"
                }, 
                PurchaseNotAvialableForQuest = {
                    key = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet"
                }
            }, 
            render = function(v37) --[[ Line: 220 ]] --[[ Name: render ]]
                -- upvalues: v35 (copy)
                return v35:renderAlert(v37);
            end
        });
    end;
end;
v29.renderAlert = function(v38, v39) --[[ Line: 226 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_withStyle_0 (copy), v27 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), v26 (copy), v24 (copy), l_ButtonType_0 (copy)
    local l_props_0 = v38.props;
    local l_state_0 = v38.state;
    return l_withStyle_0(function(v42) --[[ Line: 230 ]]
        -- upvalues: v27 (ref), l_state_0 (copy), l_props_0 (copy), v39 (copy), v3 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v26 (ref), v38 (copy), v24 (ref), l_ButtonType_0 (ref)
        local l_Theme_0 = v42.Theme;
        local l_Font_0 = v42.Font;
        local v45 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        if v27() then
            v45 = l_state_0.isCondensed and v45 * 0.9 or v45;
        end;
        local v46 = l_props_0.itemRobuxCost - l_props_0.balanceAmount;
        local v47 = v39.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(v46));
        local v48 = Color3.new(math.round(l_Theme_0.TextEmphasis.Color.R * 255), math.round(l_Theme_0.TextEmphasis.Color.G * 255), (math.round(l_Theme_0.TextEmphasis.Color.B * 255)));
        local v49 = string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(v48), utf8.char(57346), (tostring(l_props_0.robuxPurchaseAmount)));
        local v50 = v39.WouldYouBuy:gsub("{robux}", v49);
        local v51 = string.split(v39.DisclosureTermsURL, "{termsofuse}");
        local l_TermsOfUse_0 = v39.TermsOfUse;
        if l_props_0.termsOfUseActivated then
            l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
        end;
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = l_props_0.screenSize, 
            position = l_props_0.position, 
            anchorPoint = l_props_0.anchorPoint, 
            title = v39.InsufficientRobuxTitle, 
            middleContent = function() --[[ Line: 266 ]] --[[ Name: middleContent ]]
                -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v27 (ref), l_state_0 (ref), v26 (ref), v38 (ref), v24 (ref), l_props_0 (ref), l_Theme_0 (copy), l_Font_0 (copy), v47 (copy), v50 (copy), v45 (ref), v39 (ref), v51 (copy), l_TermsOfUse_0 (ref)
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = if v27() then UDim.new(0, l_state_0.isCondensed and v26.MODAL_CONDENSED_CONTENT_PADDING or v26.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, v26.MODAL_NORMAL_CONTENT_PADDING), 
                    [v3.Ref] = v38.contentRef, 
                    [v3.Change.AbsoluteSize] = v38.changeContentSize
                }, {
                    ProductDetails = v3.createElement(v24, {
                        layoutOrder = 1, 
                        model = l_props_0.model, 
                        itemIcon = l_props_0.itemIcon, 
                        itemName = l_props_0.itemName, 
                        itemRobuxCost = l_props_0.itemRobuxCost, 
                        itemIconWidth = if v27() then l_state_0.isCondensed and v26.CONDENSED_ICON_SIZE or nil else nil, 
                        itemIconHeight = if v27() then l_state_0.isCondensed and v26.CONDENSED_ICON_SIZE or nil else nil
                    }), 
                    Underline = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    AdditionalBuyText = v3.createElement("TextLabel", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, v38.state.contentSize.X, 0, 0), 
                        RichText = true, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextWrapped = true, 
                        Font = l_Font_0.Body.Font, 
                        Text = if v38.props.isQuest then v47 else v47 .. " " .. v50, 
                        TextSize = v45, 
                        TextColor3 = l_Theme_0.TextDefault.Color, 
                        TextTransparency = l_Theme_0.TextDefault.Transparency
                    }), 
                    Underline2 = v3.createElement("Frame", {
                        LayoutOrder = 4, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 5, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        DisclosurePayment = v3.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            Font = l_Font_0.Body.Font, 
                            Text = if v38.props.isQuest then v39.PurchaseNotAvailableOnHeadSet else v39.DisclosurePayment, 
                            TextSize = v45, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            TextTransparency = l_Theme_0.TextDefault.Transparency, 
                            TextWrapped = true
                        }), 
                        DisclosureTermsFrame = if v38.props.isQuest then nil else v3.createElement(l_FitFrameVertical_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            width = UDim.new(1, 0), 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            contentPadding = UDim.new(0, 1)
                        }, {
                            BeforeDisclosureText = v3.createElement("TextLabel", {
                                LayoutOrder = 0, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = v51[1], 
                                TextSize = v45, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency
                            }), 
                            TermsOfUse = v3.createElement("TextButton", {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                RichText = true, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = l_TermsOfUse_0, 
                                TextSize = v45, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency, 
                                Selectable = l_props_0.termsOfUseActivated ~= nil, 
                                [v3.Event.Activated] = l_props_0.termsOfUseActivated
                            }), 
                            AfterDisclosureText = v3.createElement("TextLabel", {
                                LayoutOrder = 2, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_0.Body.Font, 
                                Text = v51[2], 
                                TextSize = v45, 
                                TextColor3 = l_Theme_0.TextDefault.Color, 
                                TextTransparency = l_Theme_0.TextDefault.Transparency
                            })
                        })
                    })
                });
            end, 
            buttonStackInfo = {
                forcedFillDirection = Enum.FillDirection.Vertical, 
                marginBetween = if v27() then l_state_0.isCondensed and v26.MODAL_CONDENSED_BUTTON_MARGIN or v26.MODAL_NORMAL_BUTTON_MARGIN else v26.MODAL_NORMAL_BUTTON_MARGIN, 
                buttons = if v38.props.isQuest then {
                    {
                        props = {
                            isDisabled = l_props_0.isDisabled, 
                            onActivated = l_props_0.cancelPurchaseActivated, 
                            text = v39.ButtonCancel, 
                            inputIcon = l_props_0.cancelControllerIcon
                        }
                    }
                } else {
                    {
                        props = {
                            isDisabled = l_props_0.isDisabled, 
                            onActivated = l_props_0.cancelPurchaseActivated, 
                            text = v39.ButtonCancel, 
                            inputIcon = l_props_0.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = l_props_0.isLoading, 
                            isDisabled = l_props_0.isDisabled, 
                            isDelayedInput = l_props_0.isDelayedInput, 
                            enableInputDelayed = l_props_0.enableInputDelayed, 
                            delayInputSeconds = l_props_0.inputDelaySec, 
                            onActivated = l_props_0.buyItemActivated, 
                            text = if l_props_0.enableInputDelayed then v39.LoadingText else v39.BuyRobuxButton, 
                            inputIcon = l_props_0.buyItemControllerIcon
                        }
                    }
                }
            }
        });
    end);
end;
v29.renderAlertNewProductDetails = function(v53, _) --[[ Line: 450 ]] --[[ Name: renderAlertNewProductDetails ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), v27 (copy), v26 (copy), v3 (copy), v25 (copy), v24 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), l_ButtonType_0 (copy)
    local l_props_1 = v53.props;
    local l_state_1 = v53.state;
    return l_withLocalization_0({
        InsufficientRobuxTitle = "IAPExperience.RobuxUpsell.Title.InsufficientRobux", 
        AdditionalRobux = "IAPExperience.RobuxUpsell.Text.AdditionalRobux", 
        WouldYouBuy = "IAPExperience.RobuxUpsell.Text.WouldYouBuy", 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTermsURL = v53.props.isVng and "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" or "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL", 
        TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse", 
        BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem", 
        ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel", 
        LoadingText = "IAPExperience.RobuxUpsell.Text.Loading", 
        PurchaseNotAvialableForQuest = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet", 
        NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux", 
        BadgeText = "IAPExperience.RobuxUpsell.Text.PopularItem"
    })(function(v57) --[[ Line: 468 ]]
        -- upvalues: l_withStyle_0 (ref), v27 (ref), l_state_1 (copy), l_props_1 (copy), v26 (ref), v3 (ref), v25 (ref), v24 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v53 (copy), l_ButtonType_0 (ref)
        return l_withStyle_0(function(v58) --[[ Line: 469 ]]
            -- upvalues: v27 (ref), l_state_1 (ref), l_props_1 (ref), v57 (copy), v26 (ref), v3 (ref), v25 (ref), v24 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v53 (ref), l_ButtonType_0 (ref)
            local l_Theme_1 = v58.Theme;
            local l_Font_1 = v58.Font;
            local v61 = l_Font_1.BaseSize * l_Font_1.Body.RelativeSize;
            if v27() then
                v61 = l_state_1.isCondensed and v61 * 0.9 or v61;
            end;
            local v62 = l_props_1.itemRobuxCost - l_props_1.balanceAmount;
            local v63 = v57.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(v62));
            local v64 = Color3.new(math.round(l_Theme_1.TextEmphasis.Color.R * 255), math.round(l_Theme_1.TextEmphasis.Color.G * 255), (math.round(l_Theme_1.TextEmphasis.Color.B * 255)));
            local v65 = string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(v64), utf8.char(57346), (tostring(l_props_1.robuxPurchaseAmount)));
            local v66 = v57.WouldYouBuy:gsub("{robux}", v65);
            local v67 = string.split(v57.DisclosureTermsURL, "{termsofuse}");
            local l_TermsOfUse_1 = v57.TermsOfUse;
            if l_props_1.termsOfUseActivated then
                l_TermsOfUse_1 = "<u>" .. l_TermsOfUse_1 .. "</u>";
            end;
            local v69 = if game.GameId then tostring(game.GameId) else nil;
            local v70 = if l_props_1.itemProductId then tostring(l_props_1.itemProductId) else nil;
            local v71 = {
                layoutOrder = 1, 
                model = l_props_1.model, 
                itemIcon = l_props_1.itemIcon, 
                itemName = l_props_1.itemName, 
                itemRobuxCost = l_props_1.itemRobuxCost, 
                itemIconWidth = if v27() then l_state_1.isCondensed and v26.CONDENSED_ICON_SIZE or nil else nil, 
                itemIconHeight = if v27() then l_state_1.isCondensed and v26.CONDENSED_ICON_SIZE or nil else nil
            };
            local v72 = false;
            local v73 = nil;
            local v74 = nil;
            local v75 = 0;
            if not v69 or v70 then

            end;
            local v76 = v72 and v75 ~= 0;
            local v77 = nil;
            if v76 then
                local v78 = table.clone(v71);
                v78.isPopularItem = v72;
                v78.catalogSize = v73;
                v78.salesRank = v74;
                v78.badgeText = v57.BadgeText;
                v78.universeId = v69;
                v78.itemProductId = v70;
                v78.userVariant = v75;
                v77 = v3.createElement(v25, v78);
            else
                v77 = v3.createElement(v24, v71);
            end;
            return v3.createElement(l_InteractiveAlert_0, {
                screenSize = l_props_1.screenSize, 
                position = l_props_1.position, 
                anchorPoint = l_props_1.anchorPoint, 
                title = v57.NeedMoreRobux, 
                middleContent = function() --[[ Line: 570 ]] --[[ Name: middleContent ]]
                    -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v27 (ref), l_state_1 (ref), v26 (ref), v53 (ref), v77 (ref), l_Theme_1 (copy), l_Font_1 (copy), v63 (copy), v66 (copy), v61 (ref), v57 (ref), v67 (copy), l_TermsOfUse_1 (ref), l_props_1 (ref)
                    return v3.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = if v27() then UDim.new(0, l_state_1.isCondensed and v26.MODAL_CONDENSED_CONTENT_PADDING or v26.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, v26.MODAL_NORMAL_CONTENT_PADDING), 
                        [v3.Ref] = v53.contentRef, 
                        [v3.Change.AbsoluteSize] = v53.changeContentSize
                    }, {
                        ProductDetails = v77, 
                        SimulateMargin = v3.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            LayoutOrder = 2, 
                            Size = UDim2.new(0, 12, 0, 12)
                        }), 
                        Underline = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = l_Theme_1.Divider.Color, 
                            BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                            Size = UDim2.new(1, 0, 0, 1)
                        }), 
                        AdditionalBuyText = v3.createElement("TextLabel", {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, v53.state.contentSize.X, 0, 0), 
                            RichText = true, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Font = l_Font_1.Body.Font, 
                            Text = if v53.props.isQuest then v63 else v63 .. " " .. v66, 
                            TextSize = v61, 
                            TextColor3 = l_Theme_1.TextDefault.Color, 
                            TextTransparency = l_Theme_1.TextDefault.Transparency
                        }), 
                        Underline2 = v3.createElement("Frame", {
                            LayoutOrder = 4, 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = l_Theme_1.Divider.Color, 
                            BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                            Size = UDim2.new(1, 0, 0, 1)
                        }), 
                        DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                            LayoutOrder = 5, 
                            BackgroundTransparency = 1, 
                            width = UDim.new(1, 0), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            contentPadding = UDim.new(0, 1)
                        }, {
                            DisclosurePayment = v3.createElement("TextLabel", {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_1.Body.Font, 
                                Text = if v53.props.isQuest then v57.PurchaseNotAvailableOnHeadSet else v57.DisclosurePayment, 
                                TextSize = v61, 
                                TextColor3 = l_Theme_1.TextDefault.Color, 
                                TextTransparency = l_Theme_1.TextDefault.Transparency, 
                                TextWrapped = true
                            }), 
                            DisclosureTermsFrame = if v53.props.isQuest then nil else v3.createElement(l_FitFrameVertical_0, {
                                LayoutOrder = 2, 
                                BackgroundTransparency = 1, 
                                width = UDim.new(1, 0), 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                contentPadding = UDim.new(0, 1)
                            }, {
                                BeforeDisclosureText = v3.createElement("TextLabel", {
                                    LayoutOrder = 0, 
                                    BackgroundTransparency = 1, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Font = l_Font_1.Body.Font, 
                                    Text = v67[1], 
                                    TextSize = v61, 
                                    TextColor3 = l_Theme_1.TextDefault.Color, 
                                    TextTransparency = l_Theme_1.TextDefault.Transparency
                                }), 
                                TermsOfUse = v3.createElement("TextButton", {
                                    LayoutOrder = 1, 
                                    BackgroundTransparency = 1, 
                                    RichText = true, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Font = l_Font_1.Body.Font, 
                                    Text = l_TermsOfUse_1, 
                                    TextSize = v61, 
                                    TextColor3 = l_Theme_1.TextDefault.Color, 
                                    TextTransparency = l_Theme_1.TextDefault.Transparency, 
                                    Selectable = l_props_1.termsOfUseActivated ~= nil, 
                                    [v3.Event.Activated] = l_props_1.termsOfUseActivated
                                }), 
                                AfterDisclosureText = v3.createElement("TextLabel", {
                                    LayoutOrder = 2, 
                                    BackgroundTransparency = 1, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Font = l_Font_1.Body.Font, 
                                    Text = v67[2], 
                                    TextSize = v61, 
                                    TextColor3 = l_Theme_1.TextDefault.Color, 
                                    TextTransparency = l_Theme_1.TextDefault.Transparency
                                })
                            })
                        })
                    });
                end, 
                buttonStackInfo = {
                    forcedFillDirection = Enum.FillDirection.Vertical, 
                    marginBetween = if v27() then l_state_1.isCondensed and v26.MODAL_CONDENSED_BUTTON_MARGIN or v26.MODAL_NORMAL_BUTTON_MARGIN else v26.MODAL_NORMAL_BUTTON_MARGIN, 
                    buttons = if v53.props.isQuest then {
                        {
                            props = {
                                isDisabled = l_props_1.isDisabled, 
                                onActivated = l_props_1.cancelPurchaseActivated, 
                                text = v57.ButtonCancel, 
                                inputIcon = l_props_1.cancelControllerIcon
                            }
                        }
                    } else {
                        {
                            props = {
                                isDisabled = l_props_1.isDisabled, 
                                onActivated = l_props_1.cancelPurchaseActivated, 
                                text = v57.ButtonCancel, 
                                inputIcon = l_props_1.cancelControllerIcon
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isLoading = l_props_1.isLoading, 
                                isDisabled = l_props_1.isDisabled, 
                                isDelayedInput = l_props_1.isDelayedInput, 
                                enableInputDelayed = l_props_1.enableInputDelayed, 
                                delayInputSeconds = l_props_1.inputDelaySec, 
                                onActivated = l_props_1.buyItemActivated, 
                                text = if l_props_1.enableInputDelayed then v57.LoadingText else v57.BuyRobuxButton, 
                                inputIcon = l_props_1.buyItemControllerIcon
                            }
                        }
                    }
                }
            });
        end);
    end);
end;
v29.renderNewAlert = function(v79) --[[ Line: 752 ]] --[[ Name: renderNewAlert ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), v27 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), v26 (copy), v24 (copy), l_ButtonType_0 (copy)
    local l_props_2 = v79.props;
    local l_state_2 = v79.state;
    return l_withLocalization_0({
        InsufficientRobuxTitle = "IAPExperience.RobuxUpsell.Title.InsufficientRobux", 
        AdditionalRobux = "IAPExperience.RobuxUpsell.Text.AdditionalRobux", 
        WouldYouBuy = "IAPExperience.RobuxUpsell.Text.WouldYouBuy", 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTermsURL = v79.props.isVng and "IAPExperience.RobuxUpsell.Text.VNGDisclosureTermsURL" or "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL", 
        TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse", 
        BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem", 
        ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel", 
        LoadingText = "IAPExperience.RobuxUpsell.Text.Loading", 
        PurchaseNotAvialableForQuest = "IAPExperience.RobuxUpsell.Text.PurchaseNotAvailableOnHeadSet", 
        NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux", 
        BonusBannerV1 = "IAPExperience.RobuxUpsell.Text.BonusBannerV1", 
        BonusBannerInfo = "IAPExperience.RobuxUpsell.Text.BonusBannerInfo"
    })(function(v82) --[[ Line: 772 ]]
        -- upvalues: l_withStyle_0 (ref), v27 (ref), l_state_2 (copy), l_props_2 (copy), v3 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v26 (ref), v79 (copy), v24 (ref), l_ButtonType_0 (ref)
        return l_withStyle_0(function(v83) --[[ Line: 773 ]]
            -- upvalues: v27 (ref), l_state_2 (ref), l_props_2 (ref), v82 (copy), v3 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v26 (ref), v79 (ref), v24 (ref), l_ButtonType_0 (ref)
            local l_Theme_2 = v83.Theme;
            local l_Font_2 = v83.Font;
            local v86 = l_Font_2.BaseSize * l_Font_2.Body.RelativeSize;
            if v27() then
                v86 = l_state_2.isCondensed and v86 * 0.9 or v86;
            end;
            local v87 = l_Font_2.BaseSize * l_Font_2.Footer.RelativeSize;
            local v88 = l_props_2.itemRobuxCost - l_props_2.balanceAmount;
            local v89 = v82.AdditionalRobux:gsub("{robux}", utf8.char(57346) .. tostring(v88));
            local v90 = Color3.new(math.round(l_Theme_2.TextEmphasis.Color.R * 255), math.round(l_Theme_2.TextEmphasis.Color.G * 255), (math.round(l_Theme_2.TextEmphasis.Color.B * 255)));
            local v91 = string.format("<font color=\"rgb(%s)\">%s%s</font>", tostring(v90), utf8.char(57346), (tostring(l_props_2.robuxPurchaseAmount)));
            local v92 = v82.WouldYouBuy:gsub("{robux}", v91);
            local v93 = string.split(v82.DisclosureTermsURL, "{termsofuse}");
            local l_TermsOfUse_2 = v82.TermsOfUse;
            if l_props_2.termsOfUseActivated then
                l_TermsOfUse_2 = "<u>" .. l_TermsOfUse_2 .. "</u>";
            end;
            local v95 = "";
            if l_props_2.robuxPurchaseAmountBeforeBonus ~= nil then
                local v96 = tostring(l_props_2.robuxPurchaseAmountBeforeBonus);
                local v97 = tostring(l_props_2.robuxPurchaseAmount);
                local v98 = utf8.char(57346) .. "<s>" .. v96 .. "</s>" .. utf8.char(57346) .. v97;
                v92 = v82.WouldYouBuy:gsub("{robux}", v98);
                local v99 = l_props_2.robuxPurchaseAmount - l_props_2.robuxPurchaseAmountBeforeBonus;
                local v100 = utf8.char(57346) .. tostring(v99);
                v95 = v82.BonusBannerV1:gsub("{robux}", v100);
            end;
            return v3.createElement(l_InteractiveAlert_0, {
                screenSize = l_props_2.screenSize, 
                position = l_props_2.position, 
                anchorPoint = l_props_2.anchorPoint, 
                title = v82.NeedMoreRobux, 
                middleContent = function() --[[ Line: 830 ]] --[[ Name: middleContent ]]
                    -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v27 (ref), l_state_2 (ref), v26 (ref), v79 (ref), v24 (ref), l_props_2 (ref), l_Theme_2 (copy), l_Font_2 (copy), v89 (copy), v92 (ref), v86 (ref), v82 (ref), v87 (copy), v93 (copy), l_TermsOfUse_2 (ref)
                    return v3.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        BackgroundColor3 = Color3.fromRGB(0, 255, 0), 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = if v27() then UDim.new(0, l_state_2.isCondensed and v26.MODAL_CONDENSED_CONTENT_PADDING or v26.MODAL_NORMAL_CONTENT_PADDING) else UDim.new(0, v26.MODAL_NORMAL_CONTENT_PADDING), 
                        [v3.Ref] = v79.contentRef, 
                        [v3.Change.AbsoluteSize] = v79.changeContentSize
                    }, {
                        ProductDetails = v3.createElement(v24, {
                            layoutOrder = 1, 
                            model = l_props_2.model, 
                            itemIcon = l_props_2.itemIcon, 
                            itemName = l_props_2.itemName, 
                            itemRobuxCost = l_props_2.itemRobuxCost, 
                            itemIconWidth = if v27() then l_state_2.isCondensed and v26.CONDENSED_ICON_SIZE or nil else nil, 
                            itemIconHeight = if v27() then l_state_2.isCondensed and v26.CONDENSED_ICON_SIZE or nil else nil
                        }), 
                        Underline = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = l_Theme_2.Divider.Color, 
                            BackgroundTransparency = l_Theme_2.Divider.Transparency, 
                            Size = UDim2.new(1, 0, 0, 1)
                        }), 
                        AdditionalBuyText = v3.createElement("TextLabel", {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(0, v79.state.contentSize.X, 0, 0), 
                            RichText = true, 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            TextWrapped = true, 
                            Font = l_Font_2.Body.Font, 
                            Text = if v79.props.isQuest then v89 else v89 .. " " .. v92, 
                            TextSize = v86, 
                            TextColor3 = l_Theme_2.TextDefault.Color, 
                            TextTransparency = l_Theme_2.TextDefault.Transparency
                        }), 
                        Underline2 = v3.createElement("Frame", {
                            LayoutOrder = 4, 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = l_Theme_2.Divider.Color, 
                            BackgroundTransparency = l_Theme_2.Divider.Transparency, 
                            Size = UDim2.new(1, 0, 0, 1)
                        }), 
                        DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                            LayoutOrder = 5, 
                            BackgroundTransparency = 1, 
                            width = UDim.new(1, 0), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            contentPadding = UDim.new(0, 1)
                        }, {
                            DisclosurePayment = v3.createElement("TextLabel", {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                Font = l_Font_2.Body.Font, 
                                Text = if v79.props.isQuest then v82.PurchaseNotAvailableOnHeadSet else v82.DisclosurePayment, 
                                TextSize = v87, 
                                TextColor3 = l_Theme_2.TextDefault.Color, 
                                TextTransparency = l_Theme_2.TextDefault.Transparency, 
                                TextWrapped = true
                            }), 
                            DisclosureTermsFrame = if v79.props.isQuest then nil else v3.createElement(l_FitFrameVertical_0, {
                                LayoutOrder = 2, 
                                BackgroundTransparency = 1, 
                                width = UDim.new(1, 0), 
                                FillDirection = Enum.FillDirection.Horizontal, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                VerticalAlignment = Enum.VerticalAlignment.Center, 
                                contentPadding = UDim.new(0, 1)
                            }, {
                                BeforeDisclosureText = v3.createElement("TextLabel", {
                                    LayoutOrder = 0, 
                                    BackgroundTransparency = 1, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Font = l_Font_2.Body.Font, 
                                    Text = v93[1], 
                                    TextSize = v87, 
                                    TextColor3 = l_Theme_2.TextDefault.Color, 
                                    TextTransparency = l_Theme_2.TextDefault.Transparency
                                }), 
                                TermsOfUse = v3.createElement("TextButton", {
                                    LayoutOrder = 1, 
                                    BackgroundTransparency = 1, 
                                    RichText = true, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Font = l_Font_2.Body.Font, 
                                    Text = l_TermsOfUse_2, 
                                    TextSize = v87, 
                                    TextColor3 = l_Theme_2.TextDefault.Color, 
                                    TextTransparency = l_Theme_2.TextDefault.Transparency, 
                                    Selectable = l_props_2.termsOfUseActivated ~= nil, 
                                    [v3.Event.Activated] = l_props_2.termsOfUseActivated
                                }), 
                                AfterDisclosureText = v3.createElement("TextLabel", {
                                    LayoutOrder = 2, 
                                    BackgroundTransparency = 1, 
                                    AutomaticSize = Enum.AutomaticSize.XY, 
                                    Font = l_Font_2.Body.Font, 
                                    Text = v93[2], 
                                    TextSize = v87, 
                                    TextColor3 = l_Theme_2.TextDefault.Color, 
                                    TextTransparency = l_Theme_2.TextDefault.Transparency
                                })
                            })
                        })
                    });
                end, 
                buttonStackInfo = {
                    forcedFillDirection = Enum.FillDirection.Vertical, 
                    marginBetween = if v27() then l_state_2.isCondensed and v26.MODAL_CONDENSED_BUTTON_MARGIN or v26.MODAL_NORMAL_BUTTON_MARGIN else v26.MODAL_NORMAL_BUTTON_MARGIN, 
                    buttons = if v79.props.isQuest then {
                        {
                            props = {
                                isDisabled = l_props_2.isDisabled, 
                                onActivated = l_props_2.cancelPurchaseActivated, 
                                text = v82.ButtonCancel, 
                                inputIcon = l_props_2.cancelControllerIcon
                            }
                        }
                    } else {
                        {
                            props = {
                                isDisabled = l_props_2.isDisabled, 
                                onActivated = l_props_2.cancelPurchaseActivated, 
                                text = v82.ButtonCancel, 
                                inputIcon = l_props_2.cancelControllerIcon
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isLoading = l_props_2.isLoading, 
                                isDisabled = l_props_2.isDisabled, 
                                isDelayedInput = l_props_2.isDelayedInput, 
                                enableInputDelayed = l_props_2.enableInputDelayed, 
                                delayInputSeconds = l_props_2.inputDelaySec, 
                                onActivated = l_props_2.buyItemActivated, 
                                text = if l_props_2.enableInputDelayed then v82.LoadingText else v82.BuyRobuxButton, 
                                inputIcon = l_props_2.buyItemControllerIcon
                            }
                        }
                    }
                }, 
                footerContent = function() --[[ Line: 1007 ]] --[[ Name: footerContent ]]
                    -- upvalues: v79 (ref), v83 (copy), v95 (ref), v82 (ref)
                    return v79:renderFooterExperiment(v83, v95, v82.BonusBannerInfo);
                end
            });
        end);
    end);
end;
v29.renderFooterExperiment = function(v101, v102, v103, v104) --[[ Line: 1015 ]] --[[ Name: renderFooterExperiment ]]
    -- upvalues: l_Colors_0 (copy), v3 (copy), l_FitFrameVertical_0 (copy), v10 (copy), v11 (copy)
    local l_Font_3 = v102.Font;
    local l_Flint_0 = l_Colors_0.Flint;
    if v103 == "" then
        return nil;
    else
        return v3.createElement(l_FitFrameVertical_0, {
            BackgroundTransparency = 1, 
            width = UDim.new(1, 0), 
            margin = {
                top = 0, 
                bottom = -24, 
                left = -24, 
                right = -24
            }, 
            [v3.Ref] = v101.footerRef, 
            [v3.Change.AbsoluteSize] = v101.changeFooterSize
        }, {
            Banner = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                ImageColor3 = Color3.fromRGB(239, 215, 140), 
                Size = UDim2.new(1, 0, 0, 40), 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 0, 24, 16), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                BannerContent = v3.createElement(l_FitFrameVertical_0, {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    margin = {
                        top = 12, 
                        bottom = 0, 
                        left = 0, 
                        right = 0
                    }, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }, {
                    BonusBefore = v3.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        RichText = true, 
                        Font = l_Font_3.Footer.Font, 
                        Text = v103, 
                        TextSize = l_Font_3.BaseSize * l_Font_3.Footer.RelativeSize, 
                        TextColor3 = l_Flint_0, 
                        TextWrapped = true
                    }), 
                    InfoIcon = if v10 then v11({
                        text = v104, 
                        layoutOrder = 2, 
                        color = l_Flint_0, 
                        eventActivated = v101.bonusBannerInfoIconStateChange
                    }) else nil
                })
            })
        });
    end;
end;
return v29;