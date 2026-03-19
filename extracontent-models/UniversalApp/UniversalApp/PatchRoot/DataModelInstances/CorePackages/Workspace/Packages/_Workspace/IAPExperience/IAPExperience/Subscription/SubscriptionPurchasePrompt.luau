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
local function v30(v25, v26, v27, v28) --[[ Line: 78 ]] --[[ Name: generateTestmodeDisclaimer ]]
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
local function v37(v31, v32, v33, v34, v35) --[[ Line: 108 ]] --[[ Name: generateFooter ]]
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
local function v45(v38, v39, v40, v41, v42) --[[ Line: 141 ]] --[[ Name: generatePromptText ]]
    -- upvalues: v8 (copy), l_TextService_0 (copy)
    return v8.createElement("TextLabel", {
        LayoutOrder = 2, 
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
        [v8.Change.AbsoluteSize] = function(v43) --[[ Line: 155 ]]
            -- upvalues: l_TextService_0 (ref), v42 (copy)
            local l_Y_0 = l_TextService_0:GetTextSize(v43.Text, v43.TextSize, v43.Font, Vector2.new(v43.AbsoluteSize.X, 1e999)).Y;
            v42(l_Y_0);
        end
    });
end;
local function v49(v46, v47) --[[ Line: 163 ]] --[[ Name: createSubscribeButtonStacks ]]
    -- upvalues: v23 (copy), l_ButtonType_0 (copy)
    if v23() and v46.disablePurchase then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 169 ]] --[[ Name: onActivated ]]

                    end, 
                    isDisabled = true, 
                    text = v46.disablePurchaseText, 
                    layoutOrder = 0
                }
            }
        };
    elseif v46.secondaryPaymentMethod == nil or v46.secondaryPaymentMethod == "" then
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 183 ]] --[[ Name: onActivated ]]
                        -- upvalues: v46 (copy)
                        v46.purchaseSubscriptionActivated(v46.primaryPaymentMethod);
                    end, 
                    text = v47.subscribe, 
                    layoutOrder = 0
                }
            }
        };
    else
        local v48 = nil;
        if v46.primaryPaymentMethod == "Stripe" then
            v48 = v47.subscribeWithCreditDebitCard;
        elseif v46.primaryPaymentMethod == "CreditBalance" then
            v48 = v47.subscribeWithRobloxCredit;
        end;
        return {
            {
                buttonType = l_ButtonType_0.PrimarySystem, 
                props = {
                    onActivated = function() --[[ Line: 204 ]] --[[ Name: onActivated ]]
                        -- upvalues: v46 (copy)
                        v46.purchaseSubscriptionActivated(v46.primaryPaymentMethod);
                    end, 
                    text = v48, 
                    layoutOrder = 0
                }
            }, 
            {
                buttonType = l_ButtonType_0.Secondary, 
                props = {
                    onActivated = function() --[[ Line: 214 ]] --[[ Name: onActivated ]]
                        -- upvalues: v46 (copy)
                        v46.purchaseSubscriptionActivated(v46.secondaryPaymentMethod);
                    end, 
                    text = v47.payAnotherWay, 
                    layoutOrder = 1
                }
            }
        };
    end;
end;
local function v54(v50, v51) --[[ Line: 224 ]] --[[ Name: generateDisclosure ]]
    -- upvalues: v8 (copy), l_View_0 (copy), l_Text_0 (copy)
    local v52 = string.split(v50.DisclosureTermsURL, " {termsofuse} ");
    local v53 = "<u>" .. v50.TermsOfUse .. "</u>";
    return v8.createElement(l_View_0, {
        tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xsmall padding-x-xsmall padding-bottom-xsmall"
    }, {
        DisclosurePayment = v8.createElement(l_Text_0, {
            LayoutOrder = 1, 
            Text = v50.DisclosurePayment, 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        }), 
        BeforeText = v8.createElement(l_Text_0, {
            LayoutOrder = 2, 
            Text = v52[1], 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        }), 
        TextLink = v8.createElement(l_Text_0, {
            LayoutOrder = 3, 
            RichText = true, 
            Text = v53, 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
            onActivated = v51
        }), 
        AfterText = v8.createElement(l_Text_0, {
            LayoutOrder = 4, 
            Text = v52[2], 
            tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
        })
    });
end;
local function v66(v55, v56, v57, v58, v59, v60, v61, v62, v63) --[[ Line: 257 ]] --[[ Name: renderNewModalDesign ]]
    -- upvalues: v7 (copy), l_getIconRichText_0 (copy), l_Enums_0 (copy), v8 (copy), l_PartialPageModal_0 (copy), v49 (copy), v24 (copy), v30 (copy), v54 (copy), v37 (copy), l_ImageSetLabel_0 (copy), l_View_0 (copy), l_Text_0 (copy), v45 (copy)
    local v64 = if v55.creatorName then v55.creatorName .. " " .. (v55.creatorVerified and v7.emoji.verified or "") else nil;
    local v65 = (if v55.isRobuxSubscription then l_getIconRichText_0(l_Enums_0.IconName.Robux) .. " " else "") .. v55.displayPrice .. " " .. v55.period;
    return v8.createElement(l_PartialPageModal_0, {
        screenSize = v55.screenSize, 
        contentPadding = UDim.new(0, 24), 
        buttonStackProps = {
            buttons = v49(v55, v56), 
            buttonHeight = 48, 
            forcedFillDirection = Enum.FillDirection.Vertical
        }, 
        onCloseClicked = v55.cancelPurchaseActivated, 
        footerContent = function() --[[ Line: 284 ]] --[[ Name: footerContent ]]
            -- upvalues: v24 (ref), v55 (copy), v30 (ref), v56 (copy), v58 (copy), v57 (copy), v59 (copy), v54 (ref), v61 (copy), v37 (ref)
            if v24 then
                if v55.isTestingMode then
                    return v30(v56.footerText, v58, v57, v59);
                else
                    return v54(v56, v61);
                end;
            else
                return v37(v55.isTestingMode, v56.footerText, v58, v57, v59);
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
                Size = UDim2.new(1, 0, 0, (math.min(v60, v55.screenSize.Y - 240))), 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                ScrollingEnabled = v55.screenSize.Y - 240 < v60, 
                ScrollBarThickness = v55.screenSize.Y - 240 < v60 and 5 or nil, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Selectable = false, 
                CanvasSize = UDim2.new(1, 0, 0, v60)
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
                    Image = v55.itemIcon
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
                        Text = v55.name, 
                        tag = "auto-xy content-emphasis text-align-x-left", 
                        fontStyle = v63.Typography.HeadingSmall
                    }), 
                    CreatorName = v8.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v64, 
                        tag = "auto-xy content-default text-align-x-left", 
                        fontStyle = v63.Typography.TitleLarge
                    }), 
                    PriceRow = v8.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        Text = v65, 
                        RichText = true, 
                        tag = "auto-xy content-emphasis text-align-x-left", 
                        fontStyle = v63.Typography.TitleLarge
                    })
                }); 
                v45(v55, v58, v57, v59, v62)
            })
        })
    });
end;
return function(v67) --[[ Line: 367 ]] --[[ Name: SubscriptionPurchasePrompt ]]
    -- upvalues: v8 (copy), l_useDispatch_0 (copy), l_useTokens_0 (copy), l_UrlBuilder_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy), v22 (copy), v21 (copy), l_withStyle_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), v66 (copy), l_PartialPageModal_0 (copy), v49 (copy), v24 (copy), v30 (copy), v54 (copy), v37 (copy), v45 (copy)
    local v68, v69 = v8.useState(0);
    local v70 = l_useDispatch_0();
    local v71 = l_useTokens_0();
    local function v73() --[[ Line: 372 ]] --[[ Name: openTermsOfUse ]]
        -- upvalues: l_UrlBuilder_0 (ref), v70 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
        local v72 = l_UrlBuilder_0.static.about.terms();
        v70(l_NavigateDown_0({
            name = l_AppPage_0.GenericWebPage, 
            detail = v72
        }));
    end;
    local function v75(v74) --[[ Line: 380 ]] --[[ Name: calculatePromptHeight ]]
        -- upvalues: v67 (copy), v69 (copy), v22 (ref)
        if v67.shouldUseNewModalDesign then
            v69(282 + v74 + 24);
            return;
        else
            v69(24 + v22:getTitleHeight(v67.screenSize.Y - 240) + 24 + v74);
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
            }
        }, 
        render = function(v76) --[[ Line: 413 ]] --[[ Name: render ]]
            -- upvalues: l_withStyle_0 (ref), l_getPartialPageModalMiddleContentWidth_0 (ref), v67 (copy), v66 (ref), v68 (copy), v73 (copy), v75 (copy), v71 (copy), v8 (ref), l_PartialPageModal_0 (ref), v49 (ref), v24 (ref), v30 (ref), v54 (ref), v37 (ref), v22 (ref), v45 (ref)
            return l_withStyle_0(function(v77) --[[ Line: 414 ]]
                -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (ref), v67 (ref), v66 (ref), v76 (copy), v68 (ref), v73 (ref), v75 (ref), v71 (ref), v8 (ref), l_PartialPageModal_0 (ref), v49 (ref), v24 (ref), v30 (ref), v54 (ref), v37 (ref), v22 (ref), v45 (ref)
                local l_Theme_0 = v77.Theme;
                local l_Font_0 = v77.Font;
                local v80 = l_getPartialPageModalMiddleContentWidth_0(v67.screenSize.X);
                if v67.shouldUseNewModalDesign then
                    return v66(v67, v76, l_Theme_0, l_Font_0, v80, v68, v73, v75, v71);
                else
                    return v8.createElement(l_PartialPageModal_0, {
                        title = v76.titleText, 
                        screenSize = v67.screenSize, 
                        contentPadding = UDim.new(0, 24), 
                        buttonStackProps = {
                            buttons = v49(v67, v76), 
                            buttonHeight = 48, 
                            forcedFillDirection = Enum.FillDirection.Vertical
                        }, 
                        onCloseClicked = v67.cancelPurchaseActivated, 
                        footerContent = function() --[[ Line: 443 ]] --[[ Name: footerContent ]]
                            -- upvalues: v24 (ref), v67 (ref), v30 (ref), v76 (ref), l_Font_0 (copy), l_Theme_0 (copy), v80 (copy), v54 (ref), v73 (ref), v37 (ref)
                            if v24 then
                                if v67.isTestingMode then
                                    return v30(v76.footerText, l_Font_0, l_Theme_0, v80);
                                else
                                    return v54(v76, v73);
                                end;
                            else
                                return v37(v67.isTestingMode, v76.footerText, l_Font_0, l_Theme_0, v80);
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
                                Size = UDim2.new(1, 0, 0, (math.min(v68, v67.screenSize.Y - 240))), 
                                BorderSizePixel = 0, 
                                ZIndex = 2, 
                                ScrollingEnabled = v68 > v67.screenSize.Y - 240, 
                                ScrollBarThickness = v68 > v67.screenSize.Y - 240 and 5 or nil, 
                                ScrollingDirection = Enum.ScrollingDirection.Y, 
                                Selectable = false, 
                                CanvasSize = UDim2.new(1, 0, 0, v68)
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
                                    subscriptionProviderName = v67.subscriptionProviderName, 
                                    name = v67.name, 
                                    displayPrice = v67.displayPrice, 
                                    period = v67.period, 
                                    disclaimerText = v67.disclaimerText, 
                                    layoutOrder = 2, 
                                    contentHeight = v67.screenSize.Y - 240, 
                                    itemIcon = v67.itemIcon
                                }); 
                                v45(v67, l_Font_0, l_Theme_0, v80, v75)
                            })
                        })
                    });
                end;
            end);
        end
    });
end;