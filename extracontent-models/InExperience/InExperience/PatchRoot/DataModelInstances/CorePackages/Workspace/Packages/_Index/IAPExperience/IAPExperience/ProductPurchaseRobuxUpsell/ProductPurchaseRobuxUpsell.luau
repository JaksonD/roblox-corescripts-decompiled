local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_2.AppLocales).Localization;
local l_LocalizationProvider_0 = require(l_Parent_2.Localization).LocalizationProvider;
local l_withLocalization_0 = require(l_Parent_2.Localization).withLocalization;
local v9 = require(l_Parent_2.RoactFitComponents);
local l_FitFrameVertical_0 = v9.FitFrameVertical;
local l_FitTextLabel_0 = v9.FitTextLabel;
local v12 = require(l_Parent_2.UIBlox);
local l_InteractiveAlert_0 = v12.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v12.App.Button.Enum.ButtonType;
local l_Images_0 = v12.App.ImageSet.Images;
local l_ImageSetLabel_0 = v12.Core.ImageSet.ImageSetLabel;
local l_IconSize_0 = v12.App.Constant.IconSize;
local l_withStyle_0 = v12.Core.Style.withStyle;
local l_Colors_0 = require(l_Parent_2.Style).Colors;
local v20 = require(l_Parent_1.Flags.FFlagLowCogsBannerInfoIcon);
local v21 = require(l_Parent_1.Generic.InfoIconWithTooltip);
local v22 = require(l_Parent_2.SharedFlags);
local v23 = require(l_Parent_1.Locale.MultiTextLocalizer);
local v24 = require(l_Parent_0.ProductDetails);
local v25 = l_Images_0["icons/common/robux"];
local v26 = v3.Component:extend(script.Name);
local v27 = require(l_Parent_1.Flags.getEnableFixRobuxUpsellPriceCrash);
local v28 = require(l_Parent_1.Flags.FFlagIntroduceMetricsLegacyUpsell);
local l_default_0 = require(l_Parent_2.LoggingProtocol).default;
local v30 = require(l_Parent_1.Generic.Events.LegacyUpsellCounter);
local v31 = require(l_Parent_1.Utility.logger);
v26.validateProps = v4.strictInterface({
    anchorPoint = v4.optional(v4.Vector2), 
    position = v4.optional(v4.UDim2), 
    screenSize = v4.Vector2, 
    isLoading = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    isDelayedInput = v4.optional(v4.boolean), 
    enableInputDelayed = v4.optional(v4.boolean), 
    model = v4.optional(v4.table), 
    itemIcon = v4.table, 
    itemName = v4.string, 
    itemRobuxCost = v4.number, 
    robuxPurchaseAmount = v4.number, 
    robuxPurchaseAmountBeforeBonus = v4.optional(v4.number), 
    balanceAmount = v4.number, 
    buyItemControllerIcon = v4.optional(v4.table), 
    cancelControllerIcon = v4.optional(v4.table), 
    buyItemActivated = v4.callback, 
    cancelPurchaseActivated = v4.callback, 
    isLuobu = v4.optional(v4.boolean), 
    isVng = v4.optional(v4.boolean)
});
v26.defaultProps = {
    anchorPoint = Vector2.new(0.5, 0.5), 
    position = UDim2.new(0.5, 0, 0.5, 0), 
    isLoading = false, 
    isDisabled = false, 
    isDelayedInput = false, 
    enableInputDelayed = false, 
    isLuobu = false
};
v26.init = function(v32) --[[ Line: 91 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v32.contentRef = v3.createRef();
    v32.footerRef = v3.createRef();
    v32.state = {
        contentSize = Vector2.new(0, 0), 
        footerSize = Vector2.new(0, 0)
    };
    v32.changeContentSize = function(v33) --[[ Line: 99 ]]
        -- upvalues: v32 (copy)
        if v32.state.contentSize ~= v33.AbsoluteSize then
            v32:setState({
                contentSize = v33.AbsoluteSize
            });
        end;
    end;
    v32.changeFooterSize = function(v34) --[[ Line: 107 ]]
        -- upvalues: v32 (copy)
        if v32.state.footerSize ~= v34.AbsoluteSize then
            v32:setState({
                footerSize = v34.AbsoluteSize
            });
        end;
    end;
end;
v26.didMount = function(_) --[[ Line: 116 ]] --[[ Name: didMount ]]
    -- upvalues: v28 (copy), v31 (copy), l_default_0 (copy), v30 (copy)
    if v28 then
        v31.debug({
            message = "Legacy Upsell Modal Shown"
        });
        l_default_0:logRobloxTelemetryCounter(v30.LegacyUpsellShownCounter, 1, {});
    end;
end;
v26.render = function(v36) --[[ Line: 125 ]] --[[ Name: render ]]
    -- upvalues: v22 (copy), v3 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v23 (copy)
    local v37 = v36.props.isLuobu and "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestionWithWarning" or "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestion";
    local v38 = v36.props.isVng and "IAPExperience.RobuxUpsell.Text.VNGDisclosureTerms" or "IAPExperience.RobuxUpsell.Text.DisclosureTerms";
    if v22.FFlagLowCogsBannerExperiment then
        return v3.createElement(l_LocalizationProvider_0, {
            localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
        }, {
            Alert = v36:renderNewAlert()
        });
    else
        return v3.createElement(v23, {
            keys = {
                InsufficientFundsTitle = {
                    key = "IAPExperience.RobuxUpsell.Title.InsufficientFunds"
                }, 
                BuyRobuxQuestion = {
                    key = v37
                }, 
                DisclosurePayment = {
                    key = "IAPExperience.RobuxUpsell.Text.DisclosurePayment"
                }, 
                DisclosureTerms = {
                    key = v38
                }, 
                RemainingBalance = {
                    key = "IAPExperience.RobuxUpsell.Text.RemainingBalance"
                }, 
                BuyRobuxButton = {
                    key = "IAPExperience.RobuxUpsell.Action.BuyRobux"
                }, 
                ButtonCancel = {
                    key = "IAPExperience.RobuxUpsell.Action.Cancel"
                }, 
                LoadingText = {
                    key = "IAPExperience.RobuxUpsell.Text.Loading"
                }
            }, 
            render = function(v39) --[[ Line: 170 ]] --[[ Name: render ]]
                -- upvalues: v36 (copy)
                return v36:renderAlert(v39);
            end
        });
    end;
end;
v26.renderAlert = function(v40, v41) --[[ Line: 176 ]] --[[ Name: renderAlert ]]
    -- upvalues: l_withStyle_0 (copy), v27 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), v24 (copy), l_FitTextLabel_0 (copy), l_ImageSetLabel_0 (copy), v25 (copy), l_ButtonType_0 (copy), l_IconSize_0 (copy)
    return l_withStyle_0(function(v42) --[[ Line: 177 ]]
        -- upvalues: v27 (ref), v40 (copy), v3 (ref), l_InteractiveAlert_0 (ref), v41 (copy), l_FitFrameVertical_0 (ref), v24 (ref), l_FitTextLabel_0 (ref), l_ImageSetLabel_0 (ref), v25 (ref), l_ButtonType_0 (ref), l_IconSize_0 (ref)
        local l_Theme_0 = v42.Theme;
        local l_Font_0 = v42.Font;
        local v45 = 0;
        if v27() then
            local v46 = v40.props.balanceAmount or 0;
            local v47 = v40.props.robuxPurchaseAmount or 0;
            local v48 = v40.props.itemRobuxCost or 0;
            v45 = v46 + v47 - v48;
        else
            v45 = v40.props.balanceAmount + v40.props.robuxPurchaseAmount - v40.props.itemRobuxCost;
        end;
        return v3.createElement(l_InteractiveAlert_0, {
            screenSize = v40.props.screenSize, 
            position = v40.props.position, 
            anchorPoint = v40.props.anchorPoint, 
            title = v41.InsufficientFundsTitle, 
            middleContent = function() --[[ Line: 198 ]] --[[ Name: middleContent ]]
                -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v40 (ref), v24 (ref), l_Theme_0 (copy), l_FitTextLabel_0 (ref), l_Font_0 (copy), v41 (ref), l_ImageSetLabel_0 (ref), v25 (ref)
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 15), 
                    [v3.Ref] = v40.contentRef, 
                    [v3.Change.AbsoluteSize] = v40.changeContentSize
                }, {
                    ItemDetails = v3.createElement(v24, {
                        layoutOrder = 1, 
                        model = v40.props.model, 
                        itemIcon = v40.props.itemIcon, 
                        itemName = v40.props.itemName, 
                        itemRobuxCost = v40.props.itemRobuxCost
                    }), 
                    Underline = v3.createElement("Frame", {
                        LayoutOrder = 2, 
                        BorderSizePixel = 0, 
                        BackgroundColor3 = l_Theme_0.Divider.Color, 
                        BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 0, 1)
                    }), 
                    ConfirmationFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        WouldYouLikeText = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            TextWrapped = true, 
                            maximumWidth = v40.state.contentSize.X * 0.8, 
                            Font = l_Font_0.Body.Font, 
                            Text = v41.BuyRobuxQuestion, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        }), 
                        RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            Position = UDim2.new(0, 5, 0, 5), 
                            Size = UDim2.new(0, 24, 0, 24), 
                            ScaleType = Enum.ScaleType.Stretch, 
                            Image = v25, 
                            ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                            ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                        }), 
                        RemainingRobux = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Body.Font, 
                            Text = tostring(v40.props.robuxPurchaseAmount), 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                            TextColor3 = l_Theme_0.TextEmphasis.Color
                        })
                    }), 
                    DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                        LayoutOrder = 4, 
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 1)
                    }, {
                        DisclosurePayment = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 1, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v41.DisclosurePayment, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color, 
                            TextWrapped = true
                        }), 
                        DisclosureTerms = v3.createElement(l_FitTextLabel_0, {
                            LayoutOrder = 2, 
                            BackgroundTransparency = 1, 
                            width = l_FitTextLabel_0.Width.FitToText, 
                            Font = l_Font_0.Footer.Font, 
                            Text = v41.DisclosureTerms, 
                            TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                            TextColor3 = l_Theme_0.TextDefault.Color
                        })
                    })
                });
            end, 
            buttonStackInfo = {
                buttons = {
                    {
                        props = {
                            isDisabled = v40.props.isDisabled, 
                            onActivated = v40.props.cancelPurchaseActivated, 
                            text = v41.ButtonCancel, 
                            inputIcon = v40.props.cancelControllerIcon
                        }
                    }, 
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            isLoading = v40.props.isLoading, 
                            isDisabled = v40.props.isDisabled, 
                            isDelayedInput = v40.props.isDelayedInput, 
                            enableInputDelayed = v40.props.enableInputDelayed, 
                            delayInputSeconds = 3, 
                            onActivated = v40.props.buyItemActivated, 
                            text = v41.BuyRobuxButton, 
                            inputIcon = v40.props.buyItemControllerIcon
                        }
                    }
                }
            }, 
            footerContent = function() --[[ Line: 329 ]] --[[ Name: footerContent ]]
                -- upvalues: v41 (ref), v3 (ref), l_FitFrameVertical_0 (ref), v40 (ref), l_FitTextLabel_0 (ref), l_Font_0 (copy), l_Theme_0 (copy), l_ImageSetLabel_0 (ref), l_IconSize_0 (ref), v25 (ref), v45 (ref)
                local v49 = string.split(v41.RemainingBalance, " {robux} ");
                local v50 = v49[1];
                local v51 = v49[2];
                return v3.createElement(l_FitFrameVertical_0, {
                    BackgroundTransparency = 1, 
                    width = UDim.new(1, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    contentPadding = UDim.new(0, 1), 
                    [v3.Ref] = v40.footerRef, 
                    [v3.Change.AbsoluteSize] = v40.changeFooterSize
                }, {
                    RemainingBalanceBefore = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 1, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v50, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    }), 
                    RobuxIcon = v3.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 2, 
                        BackgroundTransparency = 1, 
                        Position = UDim2.new(0, 5, 0, 5), 
                        Size = UDim2.new(0, l_IconSize_0.Small, 0, l_IconSize_0.Small), 
                        ScaleType = Enum.ScaleType.Stretch, 
                        Image = v25, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency
                    }), 
                    RemainingRobux = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 3, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v45, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    }), 
                    RemainingBalanceAfter = v3.createElement(l_FitTextLabel_0, {
                        LayoutOrder = 4, 
                        BackgroundTransparency = 1, 
                        width = l_FitTextLabel_0.Width.FitToText, 
                        Font = l_Font_0.Footer.Font, 
                        Text = v51, 
                        TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                        TextColor3 = l_Theme_0.TextDefault.Color
                    })
                });
            end
        });
    end);
end;
v26.renderNewAlert = function(v52) --[[ Line: 401 ]] --[[ Name: renderNewAlert ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy), v3 (copy), l_InteractiveAlert_0 (copy), l_FitFrameVertical_0 (copy), v24 (copy), l_FitTextLabel_0 (copy), l_ButtonType_0 (copy)
    local v53 = v52.props.isLuobu and "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestionWithWarning" or "IAPExperience.RobuxUpsell.Text.BuyRobuxQuestion";
    local v54 = v52.props.isVng and "IAPExperience.RobuxUpsell.Text.VNGDisclosureTerms" or "IAPExperience.RobuxUpsell.Text.DisclosureTerms";
    return l_withLocalization_0({
        InsufficientFundsTitle = "IAPExperience.RobuxUpsell.Title.InsufficientFunds", 
        BuyRobuxQuestion = v53, 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTerms = v54, 
        RemainingBalance = "IAPExperience.RobuxUpsell.Text.RemainingBalance", 
        BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobux", 
        ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel", 
        LoadingText = "IAPExperience.RobuxUpsell.Text.Loading", 
        NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux", 
        BonusBannerV1 = "IAPExperience.RobuxUpsell.Text.BonusBannerV1", 
        BonusBannerInfo = "IAPExperience.RobuxUpsell.Text.BonusBannerInfo"
    })(function(v55) --[[ Line: 419 ]]
        -- upvalues: l_withStyle_0 (ref), v52 (copy), v3 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v24 (ref), l_FitTextLabel_0 (ref), l_ButtonType_0 (ref)
        return l_withStyle_0(function(v56) --[[ Line: 420 ]]
            -- upvalues: v55 (copy), v52 (ref), v3 (ref), l_InteractiveAlert_0 (ref), l_FitFrameVertical_0 (ref), v24 (ref), l_FitTextLabel_0 (ref), l_ButtonType_0 (ref)
            local l_Theme_1 = v56.Theme;
            local l_Font_1 = v56.Font;
            local v59 = v55.BuyRobuxQuestion .. " " .. utf8.char(57346) .. tostring(v52.props.robuxPurchaseAmount);
            local v60 = "";
            if v52.props.robuxPurchaseAmountBeforeBonus ~= nil then
                local v61 = (utf8.char(57346) .. "<s>" .. tostring(v52.props.robuxPurchaseAmountBeforeBonus) .. "</s>") .. " " .. utf8.char(57346) .. tostring(v52.props.robuxPurchaseAmount);
                v59 = v55.BuyRobuxQuestion .. " " .. v61;
                local v62 = v52.props.robuxPurchaseAmount - v52.props.robuxPurchaseAmountBeforeBonus;
                local v63 = utf8.char(57346) .. tostring(v62);
                v60 = v55.BonusBannerV1:gsub("{robux}", v63);
            end;
            return v3.createElement(l_InteractiveAlert_0, {
                screenSize = v52.props.screenSize, 
                position = v52.props.position, 
                anchorPoint = v52.props.anchorPoint, 
                title = v55.NeedMoreRobux, 
                middleContent = function() --[[ Line: 450 ]] --[[ Name: middleContent ]]
                    -- upvalues: v3 (ref), l_FitFrameVertical_0 (ref), v52 (ref), v24 (ref), l_Theme_1 (copy), l_FitTextLabel_0 (ref), l_Font_1 (copy), v59 (ref), v55 (ref)
                    return v3.createElement(l_FitFrameVertical_0, {
                        BackgroundTransparency = 1, 
                        width = UDim.new(1, 0), 
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        contentPadding = UDim.new(0, 15), 
                        [v3.Ref] = v52.contentRef, 
                        [v3.Change.AbsoluteSize] = v52.changeContentSize
                    }, {
                        ItemDetails = v3.createElement(v24, {
                            layoutOrder = 1, 
                            model = v52.props.model, 
                            itemIcon = v52.props.itemIcon, 
                            itemName = v52.props.itemName, 
                            itemRobuxCost = v52.props.itemRobuxCost
                        }), 
                        Underline = v3.createElement("Frame", {
                            LayoutOrder = 2, 
                            BorderSizePixel = 0, 
                            BackgroundColor3 = l_Theme_1.Divider.Color, 
                            BackgroundTransparency = l_Theme_1.Divider.Transparency, 
                            Size = UDim2.new(1, 0, 0, 1)
                        }), 
                        ConfirmationFrame = v3.createElement(l_FitFrameVertical_0, {
                            LayoutOrder = 3, 
                            BackgroundTransparency = 1, 
                            width = UDim.new(1, 0), 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            contentPadding = UDim.new(0, 1)
                        }, {
                            WouldYouLikeText = v3.createElement(l_FitTextLabel_0, {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                width = l_FitTextLabel_0.Width.FitToText, 
                                TextWrapped = true, 
                                maximumWidth = v52.state.contentSize.X * 0.8, 
                                RichText = true, 
                                Font = l_Font_1.Body.Font, 
                                Text = v59, 
                                TextSize = l_Font_1.BaseSize * l_Font_1.Body.RelativeSize, 
                                TextColor3 = l_Theme_1.TextDefault.Color
                            })
                        }), 
                        DisclosureFrame = v3.createElement(l_FitFrameVertical_0, {
                            LayoutOrder = 4, 
                            BackgroundTransparency = 1, 
                            width = UDim.new(1, 0), 
                            FillDirection = Enum.FillDirection.Vertical, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            contentPadding = UDim.new(0, 1)
                        }, {
                            DisclosurePayment = v3.createElement(l_FitTextLabel_0, {
                                LayoutOrder = 1, 
                                BackgroundTransparency = 1, 
                                width = l_FitTextLabel_0.Width.FitToText, 
                                Font = l_Font_1.Footer.Font, 
                                Text = v55.DisclosurePayment, 
                                TextSize = l_Font_1.BaseSize * l_Font_1.Footer.RelativeSize, 
                                TextColor3 = l_Theme_1.TextDefault.Color, 
                                TextWrapped = true
                            }), 
                            DisclosureTerms = v3.createElement(l_FitTextLabel_0, {
                                LayoutOrder = 2, 
                                BackgroundTransparency = 1, 
                                width = l_FitTextLabel_0.Width.FitToText, 
                                Font = l_Font_1.Footer.Font, 
                                Text = v55.DisclosureTerms, 
                                TextSize = l_Font_1.BaseSize * l_Font_1.Footer.RelativeSize, 
                                TextColor3 = l_Theme_1.TextDefault.Color
                            })
                        })
                    });
                end, 
                buttonStackInfo = {
                    buttons = {
                        {
                            props = {
                                isDisabled = v52.props.isDisabled, 
                                onActivated = v52.props.cancelPurchaseActivated, 
                                text = v55.ButtonCancel, 
                                inputIcon = v52.props.cancelControllerIcon
                            }
                        }, 
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isLoading = v52.props.isLoading, 
                                isDisabled = v52.props.isDisabled, 
                                isDelayedInput = v52.props.isDelayedInput, 
                                enableInputDelayed = v52.props.enableInputDelayed, 
                                delayInputSeconds = 3, 
                                onActivated = v52.props.buyItemActivated, 
                                text = v55.BuyRobuxButton, 
                                inputIcon = v52.props.buyItemControllerIcon
                            }
                        }
                    }
                }, 
                footerContent = function() --[[ Line: 560 ]] --[[ Name: footerContent ]]
                    -- upvalues: v52 (ref), v56 (copy), v60 (ref), v55 (ref)
                    return v52:renderFooterExperiment(v56, v60, v55.BonusBannerInfo);
                end
            });
        end);
    end);
end;
v26.renderFooterExperiment = function(v64, v65, v66, v67) --[[ Line: 568 ]] --[[ Name: renderFooterExperiment ]]
    -- upvalues: l_Colors_0 (copy), v3 (copy), l_FitFrameVertical_0 (copy), v20 (copy), v21 (copy)
    local l_Font_2 = v65.Font;
    local l_Flint_0 = l_Colors_0.Flint;
    if v66 == "" then
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
            [v3.Ref] = v64.footerRef, 
            [v3.Change.AbsoluteSize] = v64.changeFooterSize
        }, {
            Banner = v3.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
                ImageColor3 = Color3.fromRGB(239, 215, 140), 
                Size = UDim2.new(1, 0, 0, 40), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 0, 24, 16)
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
                        Font = l_Font_2.Footer.Font, 
                        Text = v66, 
                        TextSize = l_Font_2.BaseSize * l_Font_2.Footer.RelativeSize, 
                        TextColor3 = l_Flint_0, 
                        TextWrap = true
                    }), 
                    InfoIcon = if v20 then v21({
                        text = v67, 
                        layoutOrder = 2, 
                        color = l_Flint_0, 
                        eventActivated = v64.bonusBannerInfoIconStateChange
                    }) else nil
                })
            })
        });
    end;
end;
return v26;