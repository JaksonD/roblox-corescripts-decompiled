local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_1.UrlBuilder).UrlBuilder;
local l_NavigateDown_0 = require(l_Parent_1.NavigationRodux).Thunks.NavigateDown;
local l_useDispatch_0 = require(l_Parent_1.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_Parent_1.RobloxAppEnums).AppPage;
local l_TextService_0 = game:GetService("TextService");
local v7 = require(l_Parent_1.VerifiedBadges);
local v8 = require(l_Parent_1.React);
local v9 = require(l_Parent_1.UIBlox);
local l_PartialPageModal_0 = v9.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v9.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_ButtonType_0 = v9.App.Button.Enum.ButtonType;
local l_ImageSetLabel_0 = v9.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v9.Style.withStyle;
local v15 = require(l_Parent_1.Foundation);
local l_View_0 = v15.View;
local l_Text_0 = v15.Text;
local l_Enums_0 = v15.Enums;
local l_getIconRichText_0 = v15.Utility.getIconRichText;
local l_useTokens_0 = v15.Hooks.useTokens;
local v21 = require(l_Parent_0.Locale.MultiTextLocalizer);
local v22 = require(l_Parent_0.Subscription.SubscriptionTitle);
local v23 = require(l_Parent_0.Flags.getEnableDisableSubPurchase);
local l_FFlagHideDevSubsPriceIfSubscribed_0 = require(l_Parent_0.Parent.SharedFlags).FFlagHideDevSubsPriceIfSubscribed;
local l_FFlagEnableDevSubsFastFollowFixes_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableDevSubsFastFollowFixes;
local function v31(v26, v27, v28, v29) --[[ Line: 84 ]] --[[ Name: generateTestmodeDisclaimer ]]
    -- upvalues: l_TextService_0 (copy), v8 (copy)
    local v30 = l_TextService_0:GetTextSize(v26, 12, v27.Footer.Font, Vector2.new(v29, 1e999)).Y + 2;
    return v8.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0, 16), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        LayoutOrder = 2, 
        Size = UDim2.new(1, -48, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        DisclaimerText = v8.createElement("TextLabel", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v30), 
            Font = v27.Footer.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Text = v26, 
            TextSize = 12, 
            TextColor3 = v28.TextDefault.Color
        })
    });
end;
local function v40(v32, v33, v34, v35, v36, v37) --[[ Line: 114 ]] --[[ Name: generatePromptText ]]
    -- upvalues: v8 (copy), l_TextService_0 (copy)
    return v8.createElement("TextLabel", {
        LayoutOrder = v37 or 2, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v35, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = v33.Body.Font, 
        Text = v32.description, 
        TextSize = 16, 
        TextWrapped = true, 
        TextColor3 = v34.TextDefault.Color, 
        TextTransparency = v34.TextDefault.Transparency, 
        RichText = true, 
        [v8.Change.AbsoluteSize] = function(v38) --[[ Line: 128 ]]
            -- upvalues: l_TextService_0 (ref), v36 (copy)
            local l_Y_0 = l_TextService_0:GetTextSize(v38.Text, v38.TextSize, v38.Font, Vector2.new(v38.AbsoluteSize.X, 1e999)).Y;
            v36(l_Y_0);
        end
    });
end;
local function v44(v41, v42) --[[ Line: 136 ]] --[[ Name: createSubscribeButtonStacks ]]
    -- upvalues: v23 (copy), l_ButtonType_0 (copy)
    if (v23() or v41.shouldUseNewModalDesign) and v41.disablePurchase then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 142 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true, 
                    text = v41.disablePurchaseText, 
                    layoutOrder = 0
                }
            }
        };
    elseif v41.secondaryPaymentMethod == nil or v41.secondaryPaymentMethod == "" then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 156 ]] --[[ Name: onActivated ]]
                        -- upvalues: v41 (copy)
                        v41.purchaseSubscriptionActivated(v41.primaryPaymentMethod);
                    end, 
                    text = v42.subscribe, 
                    layoutOrder = 0
                }
            }
        };
    else
        local v43 = nil;
        if v41.primaryPaymentMethod == "Stripe" then
            v43 = v42.subscribeWithCreditDebitCard;
        elseif v41.primaryPaymentMethod == "CreditBalance" then
            v43 = v42.subscribeWithRobloxCredit;
        end;
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 177 ]] --[[ Name: onActivated ]]
                        -- upvalues: v41 (copy)
                        v41.purchaseSubscriptionActivated(v41.primaryPaymentMethod);
                    end, 
                    text = v43, 
                    layoutOrder = 0
                }
            }, 
            {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = function() --[[ Line: 187 ]] --[[ Name: onActivated ]]
                        -- upvalues: v41 (copy)
                        v41.purchaseSubscriptionActivated(v41.secondaryPaymentMethod);
                    end, 
                    text = v42.payAnotherWay, 
                    layoutOrder = 1
                }
            }
        };
    end;
end;
local function v49(v45, v46) --[[ Line: 197 ]] --[[ Name: generateDisclosure ]]
    -- upvalues: v8 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v47 = string.split(v45.DisclosureTermsURL, " {termsofuse} ");
    local v48 = "<u>" .. v45.TermsOfUse .. "</u>";
    return v8.createElement(l_View_0, {
        tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xsmall padding-x-xsmall padding-bottom-xsmall"
    }, {
        DisclosurePayment = v8.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v45.DisclosurePayment, 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        }), 
        BeforeText = v8.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v47[1], 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        }), 
        TextLink = v8.createElement(l_Text_0, {
            LayoutOrder = 3, 
            RichText = true, 
            Text = v48, 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
            onActivated = v46
        }), 
        AfterText = v8.createElement(l_Text_0, {
            LayoutOrder = 4, 
            Text = v47[2], 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        })
    });
end;
local function v61(v50, v51, v52, v53, v54, v55, v56, v57, v58) --[[ Line: 230 ]] --[[ Name: renderNewModalDesign ]]
    -- upvalues: v7 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), v8 (copy), l_PartialPageModal_0 (copy), v44 (copy), v31 (copy), l_FFlagEnableDevSubsFastFollowFixes_0 (copy), v49 (copy), l_ImageSetLabel_0 (copy), l_View_0 (copy), l_Text_0 (copy), l_FFlagHideDevSubsPriceIfSubscribed_0 (copy), v15 (copy), v40 (copy)
    local v59 = if v50.creatorName then v50.creatorName .. " " .. (v50.creatorVerified and v7.emoji.verified or "") else nil;
    local v60 = (if v50.isRobuxSubscription then l_getIconRichText_0(l_Enums_0.IconName.Robux) .. " " else "") .. v50.displayPrice .. v50.period;
    return v8.createElement(l_PartialPageModal_0, {
        screenSize = v50.screenSize, 
        contentPadding = UDim.new(0, 24), 
        buttonStackProps = {
            buttons = v44(v50, v51), 
            buttonHeight = 48, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }, 
        onCloseClicked = v50.cancelPurchaseActivated, 
        footerContent = function() --[[ Line: 256 ]] --[[ Name: footerContent ]]
            -- upvalues: v50 (copy), v31 (ref), v51 (copy), v53 (copy), v52 (copy), v54 (copy), l_FFlagEnableDevSubsFastFollowFixes_0 (ref), v49 (ref), v56 (copy)
            if v50.isTestingMode then
                return v31(v51.footerText, v53, v52, v54);
            elseif l_FFlagEnableDevSubsFastFollowFixes_0 then
                return nil;
            else
                return v49(v51, v56);
            end;
        end
    }, {
        v8.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            PromptScroll = v8.createElement("ScrollingFrame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, (math.min(v55, v50.screenSize.Y - 240))), 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                ScrollingEnabled = v50.screenSize.Y - 240 < v55, 
                ScrollBarThickness = v50.screenSize.Y - 240 < v55 and 5 or nil, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Selectable = false, 
                CanvasSize = UDim2.new(1, 0, 0, v55)
            }, {
                Padding = v8.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24), 
                    PaddingBottom = UDim.new(0, 24)
                }), 
                Layout = v8.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, 24)
                }), 
                HeroImage = v8.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 0, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 150, 0, 150), 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = v50.itemIcon
                }, {
                    UICorner = v8.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 12)
                    })
                }), 
                AttributionSection = v8.createElement(l_View_0, {
                    LayoutOrder = 1, 
                    tag = "auto-xy col align-x-start size-full-0"
                }, {
                    Layout = v8.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        Padding = UDim.new(0, 4)
                    }), 
                    SubscriptionName = v8.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = v50.name, 
                        tag = "auto-xy content-emphasis text-align-x-left", 
                        fontStyle = v58.Typography.HeadingSmall
                    }), 
                    CreatorName = v8.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v59, 
                        tag = "auto-xy content-default text-align-x-left", 
                        fontStyle = v58.Typography.TitleLarge
                    }), 
                    PriceRow = if v50.disablePurchase and l_FFlagHideDevSubsPriceIfSubscribed_0 then nil else v8.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        Text = v60, 
                        RichText = true, 
                        tag = "auto-xy content-emphasis text-align-x-left", 
                        fontStyle = v58.Typography.TitleLarge
                    })
                }), 
                ActionButtonsRow = v8.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "row gap-small auto-y size-full-0 align-x-left"
                }, {
                    ShareButton = if v50.onShare then v8.createElement(v15.Chip, {
                        text = v51.shareText, 
                        leading = {
                            iconName = l_Enums_0.IconName.ArrowThickToRight
                        }, 
                        size = l_Enums_0.ChipSize.Small, 
                        onActivated = v50.onShare, 
                        LayoutOrder = 1
                    }) else nil, 
                    ReportButton = if v50.onReport then v8.createElement(v15.Chip, {
                        text = v51.reportText, 
                        leading = {
                            iconName = l_Enums_0.IconName.Flag
                        }, 
                        size = l_Enums_0.ChipSize.Small, 
                        onActivated = v50.onReport, 
                        LayoutOrder = 2
                    }) else nil
                }); 
                v40(v50, v53, v52, v54, v57, 3)
            })
        })
    });
end;
return function(v62) --[[ Line: 368 ]] --[[ Name: SubscriptionPurchasePrompt ]]
    -- upvalues: v8 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_UrlBuilder_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v22 (copy), v21 (copy), l_withStyle_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), v61 (copy), l_PartialPageModal_0 (copy), v44 (copy), v31 (copy), l_FFlagEnableDevSubsFastFollowFixes_0 (copy), v49 (copy), v40 (copy)
    local v63, v64 = v8.useState(0);
    local v65 = l_useDispatch_0();
    local v66 = l_useTokens_0();
    local function v68() --[[ Line: 373 ]] --[[ Name: openTermsOfUse ]]
        -- upvalues: l_UrlBuilder_0 (ref), v65 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        local v67 = l_UrlBuilder_0.static.about.terms();
        v65(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v67
        }));
    end;
    local function v70(v69) --[[ Line: 381 ]] --[[ Name: calculatePromptHeight ]]
        -- upvalues: v62 (copy), v64 (copy), v22 (ref)
        if v62.shouldUseNewModalDesign then
            v64(338 + v69 + 24);
            return;
        else
            v64(24 + v22:getTitleHeight(v62.screenSize.Y - 240) + 24 + v69);
            return;
        end;
    end;
    return v8.createElement(v21, {
        keys = {
            titleText = {
                key = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription"
            }, 
            subscribe = {
                key = "Feature.Subscription.Action.Subscribe"
            }, 
            subscribeWithCreditDebitCard = {
                key = "Feature.Subscription.Action.SubscribeWithCreditDebitCard"
            }, 
            subscribeWithRobloxCredit = {
                key = "Feature.Subscription.Action.SubscribeWithRobloxCredit"
            }, 
            payAnotherWay = {
                key = "Feature.Subscription.Action.SubscribePayAnotherWay"
            }, 
            footerText = {
                key = "IAPExperience.SubscriptionPurchasePrompt.Label.TestFlowDisclaimer"
            }, 
            DisclosurePayment = {
                key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment"
            }, 
            DisclosureTermsURL = {
                key = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL"
            }, 
            TermsOfUse = {
                key = "IAPExperience.RobuxUpsell.Text.TermsOfUse"
            }, 
            shareText = {
                key = "Feature.SocialShare.Action.Share"
            }, 
            reportText = {
                key = "Feature.GameDetails.Action.Report"
            }
        }, 
        render = function(v71) --[[ Line: 418 ]] --[[ Name: render ]]
            -- upvalues: l_withStyle_0 (ref), l_getPartialPageModalMiddleContentWidth_0 (ref), v62 (copy), v61 (ref), v63 (copy), v68 (copy), v70 (copy), v66 (copy), v8 (ref), l_PartialPageModal_0 (ref), v44 (ref), v31 (ref), l_FFlagEnableDevSubsFastFollowFixes_0 (ref), v49 (ref), v22 (ref), v40 (ref)
            return l_withStyle_0(function(v72) --[[ Line: 419 ]]
                -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (ref), v62 (ref), v61 (ref), v71 (copy), v63 (ref), v68 (ref), v70 (ref), v66 (ref), v8 (ref), l_PartialPageModal_0 (ref), v44 (ref), v31 (ref), l_FFlagEnableDevSubsFastFollowFixes_0 (ref), v49 (ref), v22 (ref), v40 (ref)
                local l_Theme_0 = v72.Theme;
                local l_Font_0 = v72.Font;
                local v75 = l_getPartialPageModalMiddleContentWidth_0(v62.screenSize.X);
                if v62.shouldUseNewModalDesign then
                    return v61(v62, v71, l_Theme_0, l_Font_0, v75, v63, v68, v70, v66);
                else
                    return v8.createElement(l_PartialPageModal_0, {
                        title = v71.titleText, 
                        screenSize = v62.screenSize, 
                        contentPadding = UDim.new(0, 24), 
                        buttonStackProps = {
                            buttons = v44(v62, v71), 
                            buttonHeight = 48, 
                            forcedFillDirection = Enum.FillDirection.Vertical
                        }, 
                        onCloseClicked = v62.cancelPurchaseActivated, 
                        footerContent = function() --[[ Line: 448 ]] --[[ Name: footerContent ]]
                            -- upvalues: v62 (ref), v31 (ref), v71 (ref), l_Font_0 (copy), l_Theme_0 (copy), v75 (copy), l_FFlagEnableDevSubsFastFollowFixes_0 (ref), v49 (ref), v68 (ref)
                            if v62.isTestingMode then
                                return v31(v71.footerText, l_Font_0, l_Theme_0, v75);
                            elseif l_FFlagEnableDevSubsFastFollowFixes_0 then
                                return nil;
                            else
                                return v49(v71, v68);
                            end;
                        end
                    }, {
                        v8.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y
                        }, {
                            PromptScroll = v8.createElement("ScrollingFrame", {
                                BackgroundTransparency = 1, 
                                LayoutOrder = 3, 
                                Size = UDim2.new(1, 0, 0, (math.min(v63, v62.screenSize.Y - 240))), 
                                BorderSizePixel = 0, 
                                ZIndex = 2, 
                                ScrollingEnabled = v63 > v62.screenSize.Y - 240, 
                                ScrollBarThickness = v63 > v62.screenSize.Y - 240 and 5 or nil, 
                                ScrollingDirection = Enum.ScrollingDirection.Y, 
                                Selectable = false, 
                                CanvasSize = UDim2.new(1, 0, 0, v63)
                            }, {
                                Padding = v8.createElement("UIPadding", {
                                    PaddingTop = UDim.new(0, 24), 
                                    PaddingBottom = UDim.new(0, 24)
                                }), 
                                Layout = v8.createElement("UIListLayout", {
                                    SortOrder = Enum.SortOrder.LayoutOrder, 
                                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                    Padding = UDim.new(0, 24)
                                }), 
                                SubscriptionTitleSection = v8.createElement(v22, {
                                    subscriptionProviderName = v62.subscriptionProviderName, 
                                    name = v62.name, 
                                    displayPrice = v62.displayPrice, 
                                    period = v62.period, 
                                    disclaimerText = v62.disclaimerText, 
                                    layoutOrder = 2, 
                                    contentHeight = v62.screenSize.Y - 240, 
                                    itemIcon = v62.itemIcon
                                }); 
                                v40(v62, l_Font_0, l_Theme_0, v75, v70, 2)
                            })
                        })
                    });
                end;
            end);
        end
    });
end;