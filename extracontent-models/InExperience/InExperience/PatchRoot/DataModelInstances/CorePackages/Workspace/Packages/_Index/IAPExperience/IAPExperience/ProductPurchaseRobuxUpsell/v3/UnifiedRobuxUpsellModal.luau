local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Image_0 = v3.Image;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_FillBehavior_0 = v3.Enums.FillBehavior;
local l_Sheet_0 = v3.Sheet;
local l_useScaledValue_0 = v3.Hooks.useScaledValue;
local l_Enums_0 = v3.Enums;
local l_getIconRichText_0 = v3.Utility.getIconRichText;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v15 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v15.LocalizationProvider;
local l_useLocalization_0 = v15.Hooks.useLocalization;
local v18 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v19 = require(l_Parent_0.Generic.YellowBadge);
local v20 = require(l_Parent_0.Generic.GrayBadge);
local v21 = require(l_Parent_0.Generic.PriceSummary);
local v22 = require(l_Parent_0.Generic.UnifiedPurchaseModalHeader);
local v23 = require(l_Parent_0.Generic.ProductDetailsContainer);
local v24 = require(l_Parent_0.Generic.Hooks.useInitialButtonDisableDelay);
local v25 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local v26 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v27 = require(l_Parent_0.Utility.formatNumber);
local v28 = require(l_Parent_0.Generic.Constants);
local l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE_0 = v28.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE;
local l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 = v28.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT;
local l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 = v28.UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES;
local v32 = require(l_Parent_0.Flags.FFlagUnifiedPurchaseModalUiImprovements);
local v33 = require(l_Parent_0.Flags.FFlagFixUnifiedModalsMountedTwice);
local v34 = require(l_Parent_0.Flags.FFlagAddFocusNavigationToUnifiedPurchase);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v36 = require(l_Parent_0.Flags.FFlagAddCompactUnifiedUpsellModalMode);
local v37 = game:DefineFastInt("CompactUpsellModalBreakpoint", 400);
local l_FFlagRefactorUnifiedProductDetails_0 = require(l_Parent_0.Parent.SharedFlags).FFlagRefactorUnifiedProductDetails;
local l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 = require(l_Parent_0.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs;
local v40 = require(l_Parent_0.Flags.FFlagShouldApplyDevSubsUpsellFix);
local v41 = require(l_Parent_0.Flags.FFlagShouldFixDevSubsFlashingTitle);
local v42 = require(l_Parent_0.Flags.GetFFlagIAPExperienceEnableMultiDisplayUpsell);
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local v44 = require(l_Parent_0.Enums.BadgeType);
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
local _ = require(l_Parent_0.ProductPurchase.PricingTypes);
local function v55(v47, v48) --[[ Line: 99 ]] --[[ Name: UpsellProductDetailsLegacyImpl ]]
    -- upvalues: v44 (copy), v36 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v27 (copy), l_LocalizationService_0 (copy), v19 (copy)
    local v49 = if v47.badgeType == v44.Popular then v48.Popular else if v47.badgeType == v44.LastPurchased then v48.LastPurchased else nil;
    local v50 = v47.badgeType == v44.Popular and "icons/menu/fire_fill" or nil;
    local v51 = "size-full-1400 radius-medium padding-x-large row";
    v51 = if v47.selected then v51 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v51 .. " bg-surface-300 stroke-emphasis stroke-standard";
    local v52 = v36 and v47.isCompact and "auto-xy text-title-small content-emphasis text-align-x-left" or "auto-xy text-title-large content-emphasis text-align-x-left";
    local v53 = v36 and v47.isCompact and "auto-xy text-title-small content-muted text-align-x-left" or "auto-xy text-title-large content-muted text-align-x-left";
    local v54 = v36 and v47.isCompact and "auto-xy text-title-small content-emphasis text-align-x-right" or "auto-xy text-title-large content-emphasis text-align-x-right";
    return v2.createElement(l_View_0, {
        LayoutOrder = v47.layoutOrder, 
        onActivated = v47.onSelected, 
        tag = v51, 
        Size = if v36 and v47.isCompact then UDim2.new(1, 0, 0, 40) else nil
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = {
                ["row align-y-center gap-small"] = true, 
                ["align-x-start"] = true
            }, 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = utf8.char(57346) .. " " .. v27(l_LocalizationService_0.RobloxLocaleId, v47.product.robuxAmount), 
                tag = {
                    [v52] = v36, 
                    ["auto-xy text-title-large text-align-x-left content-emphasis"] = not v36
                }
            }), 
            RobuxAmountBonus = v47.product.robuxAmountBeforeBonus and v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                RichText = true, 
                Text = "<s>" .. utf8.char(57346) .. v27(l_LocalizationService_0.RobloxLocaleId, v47.product.robuxAmountBeforeBonus) .. "</s>", 
                tag = {
                    [v53] = v36, 
                    ["auto-xy text-title-large text-align-x-left content-muted"] = not v36
                }
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-x-right align-y-center gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            Badge = if v49 then v2.createElement(v19, {
                LayoutOrder = 1, 
                Text = v49, 
                Icon = v50
            }) else nil, 
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v47.product.price or "", 
                tag = {
                    [v54] = v36, 
                    ["auto-xy text-title-large text-align-x-right content-emphasis"] = not v36
                }
            })
        })
    });
end;
local function v64(v56, v57) --[[ Line: 185 ]] --[[ Name: UpsellProductDetailsMultiDisplayImpl ]]
    -- upvalues: v44 (copy), l_Enums_0 (copy), v36 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), l_getIconRichText_0 (copy), v27 (copy), l_LocalizationService_0 (copy), v20 (copy)
    local v58 = if v56.badgeType == v44.Popular then v57.Popular else if v56.badgeType == v44.LastPurchased then v57.LastPurchased else if v56.badgeType == v44.ForYou then v57.ForYouItem else nil;
    local v59 = if v56.badgeType == v44.Popular then l_Enums_0.IconName.Flame else if v56.badgeType == v44.ForYou then l_Enums_0.IconName.CircleStar else nil;
    local v60 = v36 and v56.isCompact and "size-full-0 auto-y radius-medium padding-small row" or "col align-x-left gap-medium size-full-0 auto-y padding-medium radius-medium";
    v60 = if v56.selected then v60 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v60 .. " bg-surface-300 stroke-default stroke-standard";
    local v61 = v36 and v56.isCompact and "auto-xy text-title-small content-emphasis text-align-x-left" or "auto-xy text-heading-small content-emphasis text-align-x-left";
    local v62 = v36 and v56.isCompact and "auto-xy text-title-small content-muted text-align-x-left" or v36 and "auto-xy text-title-medium content-muted text-align-x-left" or "auto-xy text-title-large content-muted text-align-x-left";
    local v63 = v36 and v56.isCompact and "auto-xy text-title-small content-emphasis text-align-x-right" or "auto-xy text-title-large content-emphasis text-align-x-right";
    return v2.createElement(l_View_0, {
        LayoutOrder = v56.layoutOrder, 
        onActivated = v56.onSelected, 
        tag = v60, 
        Size = if v36 and v56.isCompact then UDim2.new(1, 0, 0, 40) else nil
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = {
                ["row align-x-left align-y-center gap-small"] = true, 
                ["size-full-0 auto-y"] = not (v36 and v56.isCompact)
            }, 
            Size = if v36 and v56.isCompact then UDim2.new(0.65, 0, 1, 0) else nil
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                RichText = true, 
                Text = l_getIconRichText_0(l_Enums_0.IconName.Robux) .. " " .. v27(l_LocalizationService_0.RobloxLocaleId, v56.product.robuxAmount), 
                tag = v61
            }), 
            RobuxAmountBonus = v56.product.robuxAmountBeforeBonus and v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                RichText = true, 
                Text = "<s>" .. l_getIconRichText_0(l_Enums_0.IconName.Robux) .. v27(l_LocalizationService_0.RobloxLocaleId, v56.product.robuxAmountBeforeBonus) .. "</s>", 
                tag = v62
            }), 
            Badge = if v58 then v2.createElement(v20, {
                LayoutOrder = 3, 
                Text = v58, 
                iconName = v59
            }) else nil
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = {
                ["row align-x-right align-y-center gap-large"] = true, 
                ["size-full-0 auto-y"] = not (v36 and v56.isCompact)
            }, 
            Size = if v36 and v56.isCompact then UDim2.new(0.35, 0, 1, 0) else nil
        }, {
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v56.product.price or "", 
                tag = v63
            })
        })
    });
end;
local function v67(v65) --[[ Line: 276 ]] --[[ Name: UpsellProductDetails ]]
    -- upvalues: l_useLocalization_0 (copy), v42 (copy), v64 (copy), v55 (copy)
    local v66 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem", 
        LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased", 
        ForYouItem = "IAPExperience.RobuxUpsell.Text.ForYou"
    });
    if v42() then
        return v64(v65, v66);
    else
        return v55(v65, v66);
    end;
end;
local function v109(v68) --[[ Line: 315 ]] --[[ Name: UnifiedRobuxUpsellModal ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v36 (copy), v26 (copy), v37 (copy), v24 (copy), v32 (copy), v2 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (copy), v42 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 (copy), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE_0 (copy), l_useScaledValue_0 (copy), v41 (copy), v33 (copy), v34 (copy), v25 (copy), v40 (copy), l_View_0 (copy), l_Image_0 (copy), l_Text_0 (copy), l_FFlagRefactorUnifiedProductDetails_0 (copy), v23 (copy), l_Sheet_0 (copy), v22 (copy), v21 (copy), v18 (copy), v67 (copy), v3 (copy), l_FillBehavior_0 (copy), l_ButtonVariant_0 (copy)
    local v69 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        Subscribe = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and "Feature.Subscription.Action.Subscribe" or nil, 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL", 
        TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse", 
        BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience", 
        BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem", 
        BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems", 
        BuyRobuxAndAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" or nil, 
        BuyRobuxAndSubscription = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and "IAPExperience.PurchasePrompt.BuyRobuxAndSubscription" or nil, 
        PerMonth = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and "Feature.Subscription.Text.PerMonth" or nil
    });
    local v70 = nil;
    if v36 then
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v68.purchaseModalType == v26.DeveloperSubscription then
            local v71 = false;
            if v68.screenSize.Y > 0 then
                v71 = v68.screenSize.Y < v37;
            end;
            v70 = v71;
        else
            v70 = v68.screenSize.Y < v37;
        end;
    end;
    local v72 = v24(false);
    local v73 = nil;
    local v74 = nil;
    if v32 then
        local v75, v76 = v2.useState(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0);
        v73 = v75;
        v74 = v76;
    end;
    if v32 then
        v2.useEffect(function() --[[ Line: 359 ]]
            -- upvalues: v42 (ref), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v68 (copy), v26 (ref), v74 (ref), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0 (ref), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE_0 (ref), l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0 (ref)
            if v42() then
                if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v68.purchaseModalType == v26.DeveloperSubscription then
                    v74(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0);
                    return;
                else
                    local v77 = #v68.upsellSuggestions;
                    if v77 == 1 then
                        v74(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_SINGLE_PACKAGE_0);
                        return;
                    elseif v77 == 2 then
                        v74(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_DEFAULT_0);
                        return;
                    else
                        v74(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0);
                        return;
                    end;
                end;
            else
                if #v68.upsellSuggestions > 1 then
                    v74(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0);
                end;
                if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v68.purchaseModalType == v26.DeveloperSubscription then
                    v74(l_UNIFIED_ROBUX_UPSELL_MODAL_MIN_HEIGHT_PIXELS_WITH_MULTIPLE_PACKAGES_0);
                end;
                return;
            end;
        end, {
            v68.upsellSuggestions, 
            v68.purchaseModalType
        });
    end;
    local v78 = l_useScaledValue_0(v73 or 0);
    local v79, v80 = v2.useState(v69.BuyRobuxAndItem);
    v2.useEffect(function() --[[ Line: 393 ]]
        -- upvalues: v68 (copy), l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 (ref), v26 (ref), v69 (copy), v41 (ref), v80 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref)
        local l_purchaseModalType_0 = v68.purchaseModalType;
        if l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and l_purchaseModalType_0 == v26.DeveloperSubscription then
            local l_BuyRobuxAndItem_0 = v69.BuyRobuxAndItem;
            if v41 and v69.BuyRobuxAndSubscription and v69.BuyRobuxAndSubscription ~= "" then
                l_BuyRobuxAndItem_0 = v69.BuyRobuxAndSubscription;
            end;
            v80(l_BuyRobuxAndItem_0);
            return;
        elseif l_purchaseModalType_0 == v26.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v80(v69.BuyRobuxAndAvatar);
                return;
            else
                v80(v69.BuyRobuxAndItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v26.Experience then
            v80(v69.BuyRobuxAndExperience);
            return;
        else
            v80(v69.BuyRobuxAndItem);
            return;
        end;
    end, {
        v68.purchaseModalType, 
        v69.BuyRobuxAndAvatar, 
        v69.BuyRobuxAndExperience, 
        v69.BuyRobuxAndItem, 
        v69.BuyRobuxAndItems, 
        v69.BuyRobuxAndSubscription
    });
    local v84 = v2.useCallback(function(v83) --[[ Line: 430 ]]
        -- upvalues: v68 (copy)
        if v83 and v68.onBuyItemButtonMounted then
            v68.onBuyItemButtonMounted(v83);
        end;
    end, {
        v68.onBuyItemButtonMounted
    });
    if v33 then
        v84 = v2.useCallback(function(v85) --[[ Line: 439 ]]
            -- upvalues: v68 (copy), v72 (copy)
            if v85 and v68.onBuyItemButtonMounted and not v72 then
                v68.onBuyItemButtonMounted(v85);
            end;
        end, {
            v68.onBuyItemButtonMounted, 
            v72
        });
    end;
    local v86 = nil;
    local v87 = nil;
    if v34 then
        local v88, v89 = v25(v68.buttons.cancelPurchaseActivated, v68.onBuyItemButtonMounted);
        v86 = v88;
        v87 = v89;
    end;
    v2.useEffect(function() --[[ Line: 454 ]]

    end, {
        v68.upsellSuggestions
    });
    local function _(v90) --[[ Line: 457 ]]
        -- upvalues: v68 (copy)
        v68.onUpsellSuggestionsSelected(v90);
    end;
    local v92 = string.split(v69.DisclosureTermsURL, " {termsofuse} ");
    local l_TermsOfUse_0 = v69.TermsOfUse;
    if v68.termsOfUseActivated then
        l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
    end;
    local v94 = l_FFlagEnableUnifiedPurchaseFlowForDevSubs_0 and v68.purchaseModalType == v26.DeveloperSubscription;
    local v95 = if v94 then v69.PerMonth else nil;
    local v96 = if v94 then v69.Subscribe else v69.Buy;
    local v97 = nil;
    if v94 and v40 then
        v97 = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row align-y-center gap-medium size-full-0 auto-y"
        }, {
            ItemIcon = v2.createElement(l_Image_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(72, 72), 
                ScaleType = Enum.ScaleType.Fit, 
                Image = v68.product.itemIcon
            }), 
            ItemInfo = v2.createElement(l_View_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, -84, 0, 0), 
                tag = "col gap-xxsmall auto-y"
            }, {
                ItemName = v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = v68.product.itemName or "", 
                    tag = "auto-y text-title-medium text-wrap text-align-x-left content-emphasis"
                }), 
                ItemPrice = v2.createElement(l_Text_0, {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = utf8.char(57346) .. " " .. tostring(v68.product.itemRobuxCost or 0) .. (v95 or ""), 
                    tag = "auto-y text-title-medium text-align-x-left content-emphasis", 
                    RichText = true
                })
            })
        });
    elseif l_FFlagRefactorUnifiedProductDetails_0 then
        v97 = v2.createElement(v23, {
            purchaseModalType = v68.purchaseModalType, 
            product = v68.product, 
            isCompact = v70, 
            model = v68.product.model, 
            priceSuffix = v95
        });
    end;
    local v98 = v42();
    local v99 = v98 and "col align-x-center align-y-start gap-medium size-full-0 auto-y" or "col gap-medium auto-y size-full-0 align-x-center align-y-start";
    local v100 = v98 and "col align-x-center align-y-start gap-medium size-full-0 auto-y padding-x-xsmall" or "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge";
    local v101 = v98 and "row wrap align-x-center align-y-center gap-medium size-full-0 auto-y" or "row wrap auto-xy align-y-center align-x-center size-full-0 gap-medium";
    local v102 = v98 and "row wrap align-x-left align-y-center gap-xxsmall size-full-0 auto-y" or "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall";
    local v103 = v36 and v70 and "Small" or v98 and "Medium" or nil;
    local v104 = v98 and "col align-x-center align-y-center gap-medium size-full-0 auto-y" or "col gap-medium auto-y size-full-0 align-x-center align-y-center";
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v68.buttons.cancelPurchaseActivated, 
        snapPoints = if l_FFlagRefactorUnifiedProductDetails_0 then if v32 then {
            v78, 
            0.8
        } else {
            0.52, 
            0.8
        } else nil, 
        centerSheetHeight = if v32 and v98 then v78 else nil, 
        preferCenterSheet = true, 
        ref = if v34 then if v72 then nil else v86 else nil
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {
            hasCloseAffordance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v68.hideUserRobuxBalance and true or nil else nil
        }, {
            ModalHeader = v2.createElement(v22, {
                titleText = v79, 
                robuxBalanceAmount = v68.userBalance, 
                hideUserRobuxBalance = if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v68.hideUserRobuxBalance else nil
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {
            LayoutOrder = 2
        }, {
            SheetContentContainer = v2.createElement(l_View_0, {
                tag = v99
            }, {
                ProductDetailsContainer = if v97 then v97 else v2.createElement(l_View_0, {
                    tag = v104, 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v68.purchaseModalType == v26.MultiItem then v2.createElement(v21, {
                        amount = v68.product.itemRobuxCost
                    }) else v2.createElement(v18, {
                        isPortrait = false, 
                        isCompact = if v36 then v70 else nil, 
                        itemIcon = v68.product.itemIcon, 
                        itemName = v68.product.itemName, 
                        itemRobuxCost = v68.product.itemRobuxCost, 
                        model = v68.product.model, 
                        priceSuffix = v95
                    })
                }), 
                UpsellSuggestions = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = v100
                }, if v98 then (function() --[[ Line: 602 ]]
                    -- upvalues: v68 (copy), v2 (ref), v67 (ref), v36 (ref), v70 (ref)
                    local v105 = {};
                    for v106, v107 in ipairs(v68.upsellSuggestions) do
                        v105["UpsellPackage" .. tostring(v106)] = v2.createElement(v67, {
                            layoutOrder = v106, 
                            product = v107, 
                            selected = v68.selectedUpsellIndex == v106, 
                            isCompact = if v36 then v70 else nil, 
                            onSelected = function() --[[ Line: 611 ]] --[[ Name: onSelected ]]
                                -- upvalues: v106 (copy), v68 (ref)
                                local l_v106_0 = v106;
                                v68.onUpsellSuggestionsSelected(l_v106_0);
                            end, 
                            badgeType = v107.badgeType
                        });
                    end;
                    return v105;
                end)() else {
                    UpsellPackage1 = v2.createElement(v67, {
                        layoutOrder = 1, 
                        product = v68.upsellSuggestions[1], 
                        selected = v68.selectedUpsellIndex == 1, 
                        isCompact = if v36 then v70 else nil, 
                        onSelected = function() --[[ Line: 625 ]] --[[ Name: onSelected ]]
                            -- upvalues: v68 (copy)
                            v68.onUpsellSuggestionsSelected(1);
                        end
                    }), 
                    UpsellPackage2 = if #v68.upsellSuggestions > 1 then v2.createElement(v67, {
                        layoutOrder = 2, 
                        product = v68.upsellSuggestions[2], 
                        selected = v68.selectedUpsellIndex == 2, 
                        isCompact = if v36 then v70 else nil, 
                        onSelected = function() --[[ Line: 635 ]] --[[ Name: onSelected ]]
                            -- upvalues: v68 (copy)
                            v68.onUpsellSuggestionsSelected(2);
                        end, 
                        badgeType = v68.upsellSuggestions[2].badgeType
                    }) else nil
                })
            })
        }), 
        Actions = v2.createElement(l_Sheet_0.Actions, {
            LayoutOrder = 3
        }, {
            v2.createElement(l_View_0, {
                LayoutOrder = 1, 
                tag = v101
            }, {
                v2.createElement(v3.Button, {
                    LayoutOrder = 1, 
                    text = v96, 
                    onActivated = v68.buttons.buyItemActivated, 
                    inputDelay = (not v68.buttons.buyItemEnableInputDelayed or v72) and 0 or 2.5, 
                    isDisabled = v72, 
                    ref = if v34 then v87 else v84, 
                    fillBehavior = l_FillBehavior_0.Fill, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    size = v103
                }); 
                DisclosureTerms = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = v102
                }, {
                    DisclosurePayment = v2.createElement(l_Text_0, {
                        LayoutOrder = 1, 
                        Text = v69.DisclosurePayment, 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    }), 
                    BeforeText = v2.createElement(l_Text_0, {
                        LayoutOrder = 2, 
                        Text = v92[1], 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    }), 
                    TextLink = v2.createElement(l_Text_0, {
                        LayoutOrder = 3, 
                        RichText = true, 
                        Text = l_TermsOfUse_0, 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
                        onActivated = v68.termsOfUseActivated
                    }), 
                    AfterText = v2.createElement(l_Text_0, {
                        LayoutOrder = 4, 
                        Text = v92[2], 
                        tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
                    })
                })
            })
        })
    });
end;
return function(v110) --[[ Line: 696 ]] --[[ Name: UnifiedRobuxUpsellModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v109 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        UnifiedRobuxUpsellModal = v2.createElement(v109, v110)
    });
end;