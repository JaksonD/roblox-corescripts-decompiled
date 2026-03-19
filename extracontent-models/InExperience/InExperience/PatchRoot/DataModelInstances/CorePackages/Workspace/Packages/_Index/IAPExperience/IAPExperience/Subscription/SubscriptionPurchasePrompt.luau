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
local v24 = require(l_Parent_0.Flags.FFlagEnableSubscriptionPurchasePromptDisclosure);
local function v30(v25, v26, v27, v28) --[[ Line: 81 ]] --[[ Name: generateTestmodeDisclaimer ]]
    -- upvalues: l_TextService_0 (copy), v8 (copy)
    local v29 = l_TextService_0:GetTextSize(v25, 12, v26.Footer.Font, Vector2.new(v28, 1e999)).Y + 2;
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
            Size = UDim2.new(1, 0, 0, v29), 
            Font = v26.Footer.Font, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true, 
            Text = v25, 
            TextSize = 12, 
            TextColor3 = v27.TextDefault.Color
        })
    });
end;
local function v37(v31, v32, v33, v34, v35) --[[ Line: 111 ]] --[[ Name: generateFooter ]]
    -- upvalues: l_TextService_0 (copy), v8 (copy)
    if not v31 then
        return nil;
    else
        local v36 = l_TextService_0:GetTextSize(v32, 12, v33.Footer.Font, Vector2.new(v35, 1e999)).Y + 2;
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
                Size = UDim2.new(1, 0, 0, v36), 
                Font = v33.Footer.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true, 
                Text = v32, 
                TextSize = 12, 
                TextColor3 = v34.TextDefault.Color
            })
        });
    end;
end;
local function v46(v38, v39, v40, v41, v42, v43) --[[ Line: 144 ]] --[[ Name: generatePromptText ]]
    -- upvalues: v8 (copy), l_TextService_0 (copy)
    return v8.createElement("TextLabel", {
        LayoutOrder = v43 or 2, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v41, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = v39.Body.Font, 
        Text = v38.description, 
        TextSize = 16, 
        TextWrapped = true, 
        TextColor3 = v40.TextDefault.Color, 
        TextTransparency = v40.TextDefault.Transparency, 
        RichText = true, 
        [v8.Change.AbsoluteSize] = function(v44) --[[ Line: 158 ]]
            -- upvalues: l_TextService_0 (ref), v42 (copy)
            local l_Y_0 = l_TextService_0:GetTextSize(v44.Text, v44.TextSize, v44.Font, Vector2.new(v44.AbsoluteSize.X, 1e999)).Y;
            v42(l_Y_0);
        end
    });
end;
local function v50(v47, v48) --[[ Line: 166 ]] --[[ Name: createSubscribeButtonStacks ]]
    -- upvalues: v23 (copy), l_ButtonType_0 (copy)
    if (v23() or v47.shouldUseNewModalDesign) and v47.disablePurchase then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 172 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true, 
                    text = v47.disablePurchaseText, 
                    layoutOrder = 0
                }
            }
        };
    elseif v47.secondaryPaymentMethod == nil or v47.secondaryPaymentMethod == "" then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 186 ]] --[[ Name: onActivated ]]
                        -- upvalues: v47 (copy)
                        v47.purchaseSubscriptionActivated(v47.primaryPaymentMethod);
                    end, 
                    text = v48.subscribe, 
                    layoutOrder = 0
                }
            }
        };
    else
        local v49 = nil;
        if v47.primaryPaymentMethod == "Stripe" then
            v49 = v48.subscribeWithCreditDebitCard;
        elseif v47.primaryPaymentMethod == "CreditBalance" then
            v49 = v48.subscribeWithRobloxCredit;
        end;
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 207 ]] --[[ Name: onActivated ]]
                        -- upvalues: v47 (copy)
                        v47.purchaseSubscriptionActivated(v47.primaryPaymentMethod);
                    end, 
                    text = v49, 
                    layoutOrder = 0
                }
            }, 
            {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = function() --[[ Line: 217 ]] --[[ Name: onActivated ]]
                        -- upvalues: v47 (copy)
                        v47.purchaseSubscriptionActivated(v47.secondaryPaymentMethod);
                    end, 
                    text = v48.payAnotherWay, 
                    layoutOrder = 1
                }
            }
        };
    end;
end;
local function v55(v51, v52) --[[ Line: 227 ]] --[[ Name: generateDisclosure ]]
    -- upvalues: v8 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v53 = string.split(v51.DisclosureTermsURL, " {termsofuse} ");
    local v54 = "<u>" .. v51.TermsOfUse .. "</u>";
    return v8.createElement(l_View_0, {
        tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xsmall padding-x-xsmall padding-bottom-xsmall"
    }, {
        DisclosurePayment = v8.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v51.DisclosurePayment, 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        }), 
        BeforeText = v8.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v53[1], 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        }), 
        TextLink = v8.createElement(l_Text_0, {
            LayoutOrder = 3, 
            RichText = true, 
            Text = v54, 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
            onActivated = v52
        }), 
        AfterText = v8.createElement(l_Text_0, {
            LayoutOrder = 4, 
            Text = v53[2], 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        })
    });
end;
local function v67(v56, v57, v58, v59, v60, v61, v62, v63, v64) --[[ Line: 260 ]] --[[ Name: renderNewModalDesign ]]
    -- upvalues: v7 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), v8 (copy), l_PartialPageModal_0 (copy), v50 (copy), v24 (copy), v30 (copy), v55 (copy), v37 (copy), l_ImageSetLabel_0 (copy), l_View_0 (copy), l_Text_0 (copy), v15 (copy), v46 (copy)
    local v65 = if v56.creatorName then v56.creatorName .. " " .. (v56.creatorVerified and v7.emoji.verified or "") else nil;
    local v66 = (if v56.isRobuxSubscription then l_getIconRichText_0(l_Enums_0.IconName.Robux) .. " " else "") .. v56.displayPrice .. " " .. v56.period;
    return v8.createElement(l_PartialPageModal_0, {
        screenSize = v56.screenSize, 
        contentPadding = UDim.new(0, 24), 
        buttonStackProps = {
            buttons = v50(v56, v57), 
            buttonHeight = 48, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }, 
        onCloseClicked = v56.cancelPurchaseActivated, 
        footerContent = function() --[[ Line: 287 ]] --[[ Name: footerContent ]]
            -- upvalues: v24 (ref), v56 (copy), v30 (ref), v57 (copy), v59 (copy), v58 (copy), v60 (copy), v55 (ref), v62 (copy), v37 (ref)
            if v24 then
                if v56.isTestingMode then
                    return v30(v57.footerText, v59, v58, v60);
                else
                    return v55(v57, v62);
                end;
            else
                return v37(v56.isTestingMode, v57.footerText, v59, v58, v60);
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
                Size = UDim2.new(1, 0, 0, (math.min(v61, v56.screenSize.Y - 240))), 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                ScrollingEnabled = v56.screenSize.Y - 240 < v61, 
                ScrollBarThickness = v56.screenSize.Y - 240 < v61 and 5 or nil, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Selectable = false, 
                CanvasSize = UDim2.new(1, 0, 0, v61)
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
                    Image = v56.itemIcon
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
                        Text = v56.name, 
                        tag = "auto-xy content-emphasis text-align-x-left", 
                        fontStyle = v64.Typography.HeadingSmall
                    }), 
                    CreatorName = v8.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v65, 
                        tag = "auto-xy content-default text-align-x-left", 
                        fontStyle = v64.Typography.TitleLarge
                    }), 
                    PriceRow = v8.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        Text = v66, 
                        RichText = true, 
                        tag = "auto-xy content-emphasis text-align-x-left", 
                        fontStyle = v64.Typography.TitleLarge
                    })
                }), 
                ActionButtonsRow = v8.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "row gap-small auto-y size-full-0 align-x-left"
                }, {
                    ShareButton = if v56.onShare then v8.createElement(v15.Chip, {
                        text = v57.shareText, 
                        leading = {
                            iconName = l_Enums_0.IconName.ArrowThickToRight
                        }, 
                        size = l_Enums_0.ChipSize.Small, 
                        onActivated = v56.onShare, 
                        LayoutOrder = 1
                    }) else nil, 
                    ReportButton = if v56.onReport then v8.createElement(v15.Chip, {
                        text = v57.reportText, 
                        leading = {
                            iconName = l_Enums_0.IconName.Flag
                        }, 
                        size = l_Enums_0.ChipSize.Small, 
                        onActivated = v56.onReport, 
                        LayoutOrder = 2
                    }) else nil
                }); 
                v46(v56, v59, v58, v60, v63, 3)
            })
        })
    });
end;
return function(v68) --[[ Line: 397 ]] --[[ Name: SubscriptionPurchasePrompt ]]
    -- upvalues: v8 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_UrlBuilder_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v22 (copy), v21 (copy), l_withStyle_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), v67 (copy), l_PartialPageModal_0 (copy), v50 (copy), v24 (copy), v30 (copy), v55 (copy), v37 (copy), v46 (copy)
    local v69, v70 = v8.useState(0);
    local v71 = l_useDispatch_0();
    local v72 = l_useTokens_0();
    local function v74() --[[ Line: 402 ]] --[[ Name: openTermsOfUse ]]
        -- upvalues: l_UrlBuilder_0 (ref), v71 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        local v73 = l_UrlBuilder_0.static.about.terms();
        v71(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v73
        }));
    end;
    local function v76(v75) --[[ Line: 410 ]] --[[ Name: calculatePromptHeight ]]
        -- upvalues: v68 (copy), v70 (copy), v22 (ref)
        if v68.shouldUseNewModalDesign then
            v70(338 + v75 + 24);
            return;
        else
            v70(24 + v22:getTitleHeight(v68.screenSize.Y - 240) + 24 + v75);
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
        render = function(v77) --[[ Line: 447 ]] --[[ Name: render ]]
            -- upvalues: l_withStyle_0 (ref), l_getPartialPageModalMiddleContentWidth_0 (ref), v68 (copy), v67 (ref), v69 (copy), v74 (copy), v76 (copy), v72 (copy), v8 (ref), l_PartialPageModal_0 (ref), v50 (ref), v24 (ref), v30 (ref), v55 (ref), v37 (ref), v22 (ref), v46 (ref)
            return l_withStyle_0(function(v78) --[[ Line: 448 ]]
                -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (ref), v68 (ref), v67 (ref), v77 (copy), v69 (ref), v74 (ref), v76 (ref), v72 (ref), v8 (ref), l_PartialPageModal_0 (ref), v50 (ref), v24 (ref), v30 (ref), v55 (ref), v37 (ref), v22 (ref), v46 (ref)
                local l_Theme_0 = v78.Theme;
                local l_Font_0 = v78.Font;
                local v81 = l_getPartialPageModalMiddleContentWidth_0(v68.screenSize.X);
                if v68.shouldUseNewModalDesign then
                    return v67(v68, v77, l_Theme_0, l_Font_0, v81, v69, v74, v76, v72);
                else
                    return v8.createElement(l_PartialPageModal_0, {
                        title = v77.titleText, 
                        screenSize = v68.screenSize, 
                        contentPadding = UDim.new(0, 24), 
                        buttonStackProps = {
                            buttons = v50(v68, v77), 
                            buttonHeight = 48, 
                            forcedFillDirection = Enum.FillDirection.Vertical
                        }, 
                        onCloseClicked = v68.cancelPurchaseActivated, 
                        footerContent = function() --[[ Line: 477 ]] --[[ Name: footerContent ]]
                            -- upvalues: v24 (ref), v68 (ref), v30 (ref), v77 (ref), l_Font_0 (copy), l_Theme_0 (copy), v81 (copy), v55 (ref), v74 (ref), v37 (ref)
                            if v24 then
                                if v68.isTestingMode then
                                    return v30(v77.footerText, l_Font_0, l_Theme_0, v81);
                                else
                                    return v55(v77, v74);
                                end;
                            else
                                return v37(v68.isTestingMode, v77.footerText, l_Font_0, l_Theme_0, v81);
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
                                Size = UDim2.new(1, 0, 0, (math.min(v69, v68.screenSize.Y - 240))), 
                                BorderSizePixel = 0, 
                                ZIndex = 2, 
                                ScrollingEnabled = v69 > v68.screenSize.Y - 240, 
                                ScrollBarThickness = v69 > v68.screenSize.Y - 240 and 5 or nil, 
                                ScrollingDirection = Enum.ScrollingDirection.Y, 
                                Selectable = false, 
                                CanvasSize = UDim2.new(1, 0, 0, v69)
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
                                    subscriptionProviderName = v68.subscriptionProviderName, 
                                    name = v68.name, 
                                    displayPrice = v68.displayPrice, 
                                    period = v68.period, 
                                    disclaimerText = v68.disclaimerText, 
                                    layoutOrder = 2, 
                                    contentHeight = v68.screenSize.Y - 240, 
                                    itemIcon = v68.itemIcon
                                }); 
                                v46(v68, l_Font_0, l_Theme_0, v81, v76, 2)
                            })
                        })
                    });
                end;
            end);
        end
    });
end;