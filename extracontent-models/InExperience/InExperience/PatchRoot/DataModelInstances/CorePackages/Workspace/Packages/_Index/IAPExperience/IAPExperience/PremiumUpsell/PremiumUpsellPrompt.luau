local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local l_FitFrameVertical_0 = require(l_Parent_2.RoactFitComponents).FitFrameVertical;
local v5 = require(l_Parent_2.UIBlox);
local l_PartialPageModal_0 = v5.App.Dialog.Modal.PartialPageModal;
local l_getPartialPageModalMiddleContentWidth_0 = v5.App.Dialog.Modal.getPartialPageModalMiddleContentWidth;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_withStyle_0 = v5.Style.withStyle;
local v12 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v13 = require(l_Parent_0.BulletPoint);
local v14 = v3.Component:extend(script.Name);
v14.init = function(v15) --[[ Line: 47 ]] --[[ Name: init ]]
    v15.isCondensed = false;
    v15.contentSize = Vector2.new(0, 0);
    v15.state = {
        padding = UDim.new(0, 24), 
        iconSize = UDim2.new(1, 0, 0, 80)
    };
    v15.updateContentSizes = function(v16, v17) --[[ Line: 56 ]]
        -- upvalues: v15 (copy)
        if v17.X < 200 or v17.Y > 1000 then
            return;
        else
            local l_contentSize_0 = v15.contentSize;
            v15.contentSize = v17;
            if v17.X == 0 and v17.Y == 0 then
                return;
            elseif v16.X == 0 and v16.Y == 0 then
                return;
            elseif v17 == l_contentSize_0 and v16 == v15.props.screenSize then
                return;
            else
                local v19 = if v15.isCondensed then v16.Y < v17.Y + 120 + 80 - 48 + 24 else v16.Y < v17.Y + 120;
                v15.isCondensed = v19;
                v15:setState({
                    padding = UDim.new(0, v19 and 12 or 24), 
                    iconSize = UDim2.new(1, 0, 0, v19 and 48 or 80)
                });
                return;
            end;
        end;
    end;
end;
v14.willUpdate = function(v20, v21) --[[ Line: 98 ]] --[[ Name: willUpdate ]]
    if v20.props.screenSize ~= v21.screenSize then
        v20.updateContentSizes(v21.screenSize, v20.contentSize);
    end;
end;
v14.render = function(v22) --[[ Line: 104 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v12 (copy)
    local l_props_0 = v22.props;
    return v3.createElement(v12, {
        keys = {
            titleLocalizedText = {
                key = "IAPExperience.SubscriptionPurchasePrompt.Label.GetSubscription"
            }, 
            monthlyLocalizedText = {
                key = "IAPExperience.PremiumUpsell.Action.Subscribe"
            }, 
            descLocalizedText = {
                key = "IAPExperience.PremiumUpsell.Label.PremiumBenefitListDesc"
            }, 
            bulletPoint1Text = {
                key = "IAPExperience.PremiumUpsell.Label.RobuxPerMonth", 
                params = {
                    robux = utf8.char(57346) .. tostring(l_props_0.robuxAmount)
                }
            }, 
            bulletPoint2Text = {
                key = "IAPExperience.PremiumUpsell.Label.PremiumOnlyBenefits"
            }, 
            bulletPoint3Text = if l_props_0.isCatalog then {
                key = "IAPExperience.PremiumUpsell.Label.AvatarShopBenefits"
            } else {
                key = "IAPExperience.PremiumUpsell.Body.RobuxDiscount"
            }, 
            disclosure = {
                key = "IAPExperience.PremiumUpsell.Label.Disclosure", 
                params = {
                    currencySymbol = l_props_0.currencySymbol, 
                    price = tostring(l_props_0.robuxPrice)
                }
            }, 
            shortDisclosure = {
                key = "IAPExperience.PremiumUpsell.Label.ShortDisclosure"
            }, 
            priceLocalizedText = {
                key = "IAPExperience.PremiumUpsell.Label.PremiumPrice", 
                params = {
                    currencySymbol = l_props_0.currencySymbol, 
                    price = tostring(l_props_0.robuxPrice)
                }
            }, 
            headerLocalizedText = {
                key = "IAPExperience.PremiumUpsell.Label.RobloxPremium"
            }, 
            policyLocalizedText = {
                key = "IAPExperience.PremiumUpsell.Label.PremiumPolicy"
            }
        }, 
        render = function(v24) --[[ Line: 158 ]] --[[ Name: render ]]
            -- upvalues: v22 (copy)
            return v22:renderPrompt(v24);
        end
    });
end;
v14.renderCondensedPremiumInfo = function(_, v26) --[[ Line: 164 ]] --[[ Name: renderCondensedPremiumInfo ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    return l_withStyle_0(function(v27) --[[ Line: 165 ]]
        -- upvalues: v3 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v26 (copy)
        local l_Theme_0 = v27.Theme;
        local l_Font_0 = v27.Font;
        return v3.createElement("Frame", {
            LayoutOrder = 1, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 12), 
                PaddingBottom = UDim.new(0, 12)
            }), 
            Layout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            IconContainer = v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 96, 0, 96), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                AnchorPoint = Vector2.new(0, 0), 
                Position = UDim2.new(0, 0, 0, 0)
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 12)
                }), 
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = l_Images_0["icons/graphic/premium_large"]
                })
            }), 
            PremiumInfoContainer = v3.createElement("Frame", {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, -80, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 6)
                }), 
                ListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 12)
                }), 
                PremiumHeader = v3.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Font = l_Font_0.Header2.Font, 
                    RichText = true, 
                    Text = v26.headerLocalizedText, 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                CostPerMonth = v3.createElement("TextLabel", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Font = l_Font_0.Body.Font, 
                    RichText = true, 
                    Text = v26.priceLocalizedText, 
                    TextSize = l_Font_0.BaseSize, 
                    TextColor3 = l_Theme_0.TextEmphasis.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency
                }), 
                RenewAndCancelText = v3.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    Font = l_Font_0.Body.Font, 
                    Text = v26.policyLocalizedText, 
                    TextSize = l_Font_0.BaseSize, 
                    TextColor3 = l_Theme_0.TextDefault.Color, 
                    TextTransparency = l_Theme_0.TextDefault.Transparency
                })
            })
        });
    end);
end;
v14.renderBulletInfo = function(v30, v31) --[[ Line: 261 ]] --[[ Name: renderBulletInfo ]]
    -- upvalues: l_withStyle_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), v3 (copy), l_FitFrameVertical_0 (copy), v13 (copy)
    return l_withStyle_0(function(v32) --[[ Line: 262 ]]
        -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (ref), v30 (copy), v3 (ref), v31 (copy), l_FitFrameVertical_0 (ref), v13 (ref)
        local l_Theme_1 = v32.Theme;
        local l_Font_1 = v32.Font;
        local v35 = l_getPartialPageModalMiddleContentWidth_0(v30.props.screenSize.X);
        return v3.createElement("Frame", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12)
            }), 
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 12)
            }), 
            BulletListText = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, v35, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = l_Font_1.Body.Font, 
                Text = v31.descLocalizedText, 
                TextSize = l_Font_1.BaseSize * l_Font_1.Body.RelativeSize, 
                TextColor3 = l_Theme_1.TextDefault.Color, 
                TextTransparency = l_Theme_1.TextDefault.Transparency
            }), 
            BulletList = v3.createElement(l_FitFrameVertical_0, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 12)
            }, {
                BulletText1 = v3.createElement(v13, {
                    text = v31.bulletPoint1Text, 
                    width = v35, 
                    layoutOrder = 1
                }), 
                BulletText2 = v3.createElement(v13, {
                    text = v31.bulletPoint2Text, 
                    width = v35, 
                    layoutOrder = 2
                }), 
                BulletText3 = v3.createElement(v13, {
                    text = v31.bulletPoint3Text, 
                    width = v35, 
                    layoutOrder = 3
                })
            })
        });
    end);
end;
v14.renderDisclosure = function(_, v37) --[[ Line: 321 ]] --[[ Name: renderDisclosure ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy)
    return l_withStyle_0(function(v38) --[[ Line: 322 ]]
        -- upvalues: v3 (ref), v37 (copy)
        local l_Theme_2 = v38.Theme;
        local l_Font_2 = v38.Font;
        return v3.createElement("Frame", {
            LayoutOrder = 5, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12)
            }), 
            Disclosure = v3.createElement("TextLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                RichText = true, 
                TextWrapped = true, 
                Font = l_Font_2.Body.Font, 
                Text = v37.shortDisclosure, 
                TextSize = l_Font_2.BaseSize * l_Font_2.Body.RelativeSize, 
                TextColor3 = l_Theme_2.TextDefault.Color, 
                TextTransparency = l_Theme_2.TextDefault.Transparency
            })
        });
    end);
end;
v14.renderLandscapePrompt = function(v41, v42) --[[ Line: 352 ]] --[[ Name: renderLandscapePrompt ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy)
    local l_props_1 = v41.props;
    return l_withStyle_0(function(_) --[[ Line: 355 ]]
        -- upvalues: v3 (ref), l_PartialPageModal_0 (ref), v42 (copy), l_props_1 (copy), l_ButtonType_0 (ref), v41 (copy)
        return v3.createElement(l_PartialPageModal_0, {
            title = v42.titleLocalizedText, 
            screenSize = l_props_1.screenSize, 
            buttonStackProps = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_props_1.purchasePremiumActivated, 
                            text = v42.monthlyLocalizedText, 
                            inputIcon = l_props_1.acceptControllerIcon
                        }
                    }
                }, 
                buttonHeight = 48
            }, 
            onCloseClicked = l_props_1.cancelPurchaseActivated
        }, {
            v3.createElement("ScrollingFrame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, l_props_1.screenSize.Y / 2), 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                ScrollingEnabled = true, 
                ScrollBarThickness = 5, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                Selectable = false, 
                CanvasSize = UDim2.new(1, 0, 0, (math.min(l_props_1.screenSize.Y / 2 + 96 + 12, 450)))
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                IconAndPremiumInfoContainer = v41:renderCondensedPremiumInfo(v42), 
                BulletList = v41:renderBulletInfo(v42), 
                Disclosure = v41:renderDisclosure(v42)
            })
        });
    end);
end;
v14.renderPortraitPrompt = function(v45, v46) --[[ Line: 403 ]] --[[ Name: renderPortraitPrompt ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy)
    local l_props_2 = v45.props;
    return l_withStyle_0(function(_) --[[ Line: 406 ]]
        -- upvalues: v3 (ref), l_PartialPageModal_0 (ref), v46 (copy), l_props_2 (copy), l_ButtonType_0 (ref), v45 (copy)
        return v3.createElement(l_PartialPageModal_0, {
            title = v46.titleLocalizedText, 
            screenSize = l_props_2.screenSize, 
            buttonStackProps = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_props_2.purchasePremiumActivated, 
                            text = v46.monthlyLocalizedText, 
                            inputIcon = l_props_2.acceptControllerIcon
                        }
                    }
                }, 
                buttonHeight = 48
            }, 
            onCloseClicked = l_props_2.cancelPurchaseActivated
        }, {
            v3.createElement("Frame", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                Layout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                IconAndPremiumInfoContainer = v45:renderCondensedPremiumInfo(v46), 
                BulletList = v45:renderBulletInfo(v46), 
                Disclosure = v45:renderDisclosure(v46)
            })
        });
    end);
end;
v14.renderUpdatedPrompt = function(v49, v50) --[[ Line: 443 ]] --[[ Name: renderUpdatedPrompt ]]
    -- upvalues: l_withStyle_0 (copy), l_getPartialPageModalMiddleContentWidth_0 (copy), v3 (copy), l_PartialPageModal_0 (copy), l_ButtonType_0 (copy), l_FitFrameVertical_0 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v13 (copy)
    local l_props_3 = v49.props;
    return l_withStyle_0(function(v52) --[[ Line: 446 ]]
        -- upvalues: l_getPartialPageModalMiddleContentWidth_0 (ref), v49 (copy), v3 (ref), l_PartialPageModal_0 (ref), v50 (copy), l_props_3 (copy), l_ButtonType_0 (ref), l_FitFrameVertical_0 (ref), l_ImageSetLabel_0 (ref), l_Images_0 (ref), v13 (ref)
        local l_Theme_3 = v52.Theme;
        local l_Font_3 = v52.Font;
        local v55 = l_getPartialPageModalMiddleContentWidth_0(v49.props.screenSize.X);
        return v3.createElement(l_PartialPageModal_0, {
            title = v50.titleLocalizedText, 
            screenSize = l_props_3.screenSize, 
            buttonStackProps = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = l_props_3.purchasePremiumActivated, 
                            text = v50.monthlyLocalizedText, 
                            inputIcon = l_props_3.acceptControllerIcon
                        }
                    }
                }, 
                buttonHeight = 48
            }, 
            onCloseClicked = l_props_3.cancelPurchaseActivated
        }, {
            v3.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                contentPadding = UDim.new(0, 12), 
                margin = {
                    top = 12, 
                    bottom = 12
                }, 
                [v3.Change.AbsoluteSize] = function(v56) --[[ Line: 479 ]]
                    -- upvalues: v49 (ref)
                    if v49.contentSize.X ~= v56.AbsoluteSize.X or v49.contentSize.Y ~= v56.AbsoluteSize.Y then
                        v49.updateContentSizes(v49.props.screenSize, v56.AbsoluteSize);
                    end;
                end
            }, {
                Icon = v3.createElement(l_ImageSetLabel_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1, 
                    Size = v49.state.iconSize, 
                    ScaleType = Enum.ScaleType.Fit, 
                    Image = l_Images_0["icons/graphic/premium_large"]
                }), 
                PremiumInfoContainer = v3.createElement("Frame", {
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    Padding = v3.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 12)
                    }), 
                    ListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 12)
                    }), 
                    PremiumHeader = v3.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Font = l_Font_3.Header2.Font, 
                        RichText = true, 
                        Text = v50.headerLocalizedText, 
                        TextSize = l_Font_3.BaseSize * l_Font_3.Header2.RelativeSize, 
                        TextColor3 = l_Theme_3.TextEmphasis.Color, 
                        TextTransparency = l_Theme_3.TextDefault.Transparency
                    }), 
                    CostPerMonth = v3.createElement("TextLabel", {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Font = l_Font_3.Body.Font, 
                        RichText = true, 
                        Text = v50.priceLocalizedText, 
                        TextSize = l_Font_3.BaseSize, 
                        TextColor3 = l_Theme_3.TextEmphasis.Color, 
                        TextTransparency = l_Theme_3.TextDefault.Transparency
                    }), 
                    CancelText = v3.createElement("TextLabel", {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(1, 0, 0, 0), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Font = l_Font_3.Body.Font, 
                        Text = v50.policyLocalizedText, 
                        TextSize = l_Font_3.BaseSize, 
                        TextColor3 = l_Theme_3.TextDefault.Color, 
                        TextTransparency = l_Theme_3.TextDefault.Transparency
                    })
                }), 
                BulletListText = v3.createElement("TextLabel", {
                    LayoutOrder = 3, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v55, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    Font = l_Font_3.Body.Font, 
                    Text = v50.descLocalizedText, 
                    TextSize = l_Font_3.BaseSize * l_Font_3.Body.RelativeSize, 
                    TextColor3 = l_Theme_3.TextDefault.Color, 
                    TextTransparency = l_Theme_3.TextDefault.Transparency
                }), 
                BulletList = v3.createElement(l_FitFrameVertical_0, {
                    LayoutOrder = 4, 
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    contentPadding = UDim.new(0, 12)
                }, {
                    BulletText1 = v3.createElement(v13, {
                        text = v50.bulletPoint1Text, 
                        width = v55, 
                        layoutOrder = 1
                    }), 
                    BulletText2 = v3.createElement(v13, {
                        text = v50.bulletPoint2Text, 
                        width = v55, 
                        layoutOrder = 2
                    }), 
                    BulletText3 = v3.createElement(v13, {
                        text = v50.bulletPoint3Text, 
                        width = v55, 
                        layoutOrder = 3
                    })
                }), 
                Disclosure = v49:renderDisclosure(v50)
            })
        });
    end);
end;
v14.renderPrompt = function(v57, v58) --[[ Line: 585 ]] --[[ Name: renderPrompt ]]
    local l_props_4 = v57.props;
    if l_props_4.screenSize.Y < 450 then
        return v57:renderLandscapePrompt(v58);
    elseif l_props_4.screenSize.X < 450 then
        return v57:renderPortraitPrompt(v58);
    else
        return v57:renderUpdatedPrompt(v58);
    end;
end;
return v14;