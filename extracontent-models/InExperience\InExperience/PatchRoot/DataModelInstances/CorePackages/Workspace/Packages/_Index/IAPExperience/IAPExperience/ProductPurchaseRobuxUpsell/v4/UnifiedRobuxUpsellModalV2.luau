local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.Foundation);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_Dialog_0 = v3.Dialog;
local l_DialogSize_0 = v3.Enums.DialogSize;
local l_Orientation_0 = v3.Enums.Orientation;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v12 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v12.LocalizationProvider;
local l_useLocalization_0 = v12.Hooks.useLocalization;
local v15 = require(l_Parent_0.Generic.UnifiedProductDetails);
local v16 = require(l_Parent_0.Generic.YellowBadge);
local v17 = require(l_Parent_0.Generic.PriceSummary);
local v18 = require(l_Parent_0.Generic.Hooks.useFocusNavigationRefs);
local v19 = require(l_Parent_0.Enums.UnifiedPurchaseModalTypeEnum);
local v20 = require(l_Parent_0.Utility.formatNumber);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_Parent_0.Parent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local v22 = require(l_Parent_0.Flags.FFlagAddCompactUnifiedUpsellModalMode);
local v23 = game:DefineFastInt("CompactUpsellModalBreakpoint", 400);
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local v25 = require(l_Parent_0.Enums.BadgeType);
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
local function v35(v27) --[[ Line: 60 ]] --[[ Name: UpsellProductDetails ]]
    -- upvalues: l_useLocalization_0 (copy), v25 (copy), v22 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v20 (copy), l_LocalizationService_0 (copy), v16 (copy)
    local v28 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem", 
        LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
    });
    local v29 = if v27.badgeType == v25.Popular then v28.Popular else if v27.badgeType == v25.LastPurchased then v28.LastPurchased else nil;
    local v30 = v27.badgeType == v25.Popular and "icons/menu/fire_fill" or nil;
    local v31 = "size-full-1400 radius-medium padding-x-large row";
    v31 = if v27.selected then v31 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v31 .. " bg-surface-300 stroke-emphasis stroke-standard";
    local v32 = v22 and v27.isCompact and "auto-xy text-title-small content-emphasis text-align-x-left" or "auto-xy text-title-large content-emphasis text-align-x-left";
    local v33 = v22 and v27.isCompact and "auto-xy text-title-small content-muted text-align-x-left" or "auto-xy text-title-large content-muted text-align-x-left";
    local v34 = v22 and v27.isCompact and "auto-xy text-title-small content-emphasis text-align-x-right" or "auto-xy text-title-large content-emphasis text-align-x-right";
    return v2.createElement(l_View_0, {
        LayoutOrder = v27.layoutOrder, 
        onActivated = v27.onSelected, 
        tag = v31, 
        Size = if v22 and v27.isCompact then UDim2.new(1, 0, 0, 40) else nil
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small align-y-center align-x-start", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = utf8.char(57346) .. " " .. v20(l_LocalizationService_0.RobloxLocaleId, v27.product.robuxAmount), 
                tag = v32
            }), 
            RobuxAmountBonus = v27.product.robuxAmountBeforeBonus and v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                RichText = true, 
                Text = "<s>" .. utf8.char(57346) .. v20(l_LocalizationService_0.RobloxLocaleId, v27.product.robuxAmountBeforeBonus) .. "</s>", 
                tag = v33
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-y-center align-x-right gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            Badge = if v29 then v2.createElement(v16, {
                LayoutOrder = 1, 
                Text = v29, 
                Icon = v30
            }) else nil, 
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v27.product.price or "", 
                tag = v34
            })
        })
    });
end;
local function v48(v36) --[[ Line: 175 ]] --[[ Name: UnifiedRobuxUpsellModalV2 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), v22 (copy), v23 (copy), v2 (copy), v19 (copy), v18 (copy), l_Dialog_0 (copy), l_DialogSize_0 (copy), l_View_0 (copy), v17 (copy), v15 (copy), v35 (copy), l_Orientation_0 (copy), l_ButtonVariant_0 (copy), l_Text_0 (copy)
    local v37 = l_useLocalization_0({
        Buy = "IAPExperience.PurchasePrompt.Action.Buy", 
        DisclosurePayment = "IAPExperience.RobuxUpsell.Text.DisclosurePayment", 
        DisclosureTermsURL = "IAPExperience.RobuxUpsell.Text.DisclosureTermsURL", 
        TermsOfUse = "IAPExperience.RobuxUpsell.Text.TermsOfUse", 
        BuyRobuxAndExperience = "IAPExperience.PurchasePrompt.BuyRobuxAndExperience", 
        BuyRobuxAndItem = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItem", 
        BuyRobuxAndItems = "IAPExperience.PurchasePrompt.Title.BuyRobuxAndItems", 
        BuyRobuxAndAvatar = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "IAPExperience.PurchasePrompt.Header.BuyRobuxAndAvatar" or nil
    });
    local v38 = nil;
    if v22 then
        v38 = v36.screenSize.Y < v23;
    end;
    local v39, v40 = v2.useState(v37.BuyRobuxAndItem);
    v2.useEffect(function() --[[ Line: 195 ]]
        -- upvalues: v36 (copy), v19 (ref), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), v40 (copy), v37 (copy)
        local l_purchaseModalType_0 = v36.purchaseModalType;
        if l_purchaseModalType_0 == v19.MultiItem then
            if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then
                v40(v37.BuyRobuxAndAvatar);
                return;
            else
                v40(v37.BuyRobuxAndItems);
                return;
            end;
        elseif l_purchaseModalType_0 == v19.Experience then
            v40(v37.BuyRobuxAndExperience);
            return;
        else
            v40(v37.BuyRobuxAndItem);
            return;
        end;
    end, {
        v36.purchaseModalType
    });
    local v42 = nil;
    local v43 = nil;
    local v44, v45 = v18(v36.buttons.cancelPurchaseActivated, v36.onBuyItemButtonMounted);
    v42 = v44;
    v43 = v45;
    v2.useEffect(function() --[[ Line: 215 ]]

    end, {
        v36.upsellSuggestions
    });
    v44 = function(v46) --[[ Line: 217 ]]
        -- upvalues: v36 (copy)
        v36.onUpsellSuggestionsSelected(v46);
    end;
    v45 = string.split(v37.DisclosureTermsURL, " {termsofuse} ");
    local l_TermsOfUse_0 = v37.TermsOfUse;
    if v36.termsOfUseActivated then
        l_TermsOfUse_0 = "<u>" .. l_TermsOfUse_0 .. "</u>";
    end;
    return v2.createElement(l_Dialog_0.Root, {
        size = l_DialogSize_0.Medium, 
        onClose = v36.buttons.cancelPurchaseActivated, 
        ref = v42, 
        disablePortal = false
    }, {
        DialogTitle = v2.createElement(l_Dialog_0.Title, {
            text = v39
        }), 
        DialogContent = v2.createElement(l_Dialog_0.Content, nil, {
            ContentView = v2.createElement(l_View_0, {
                tag = "col gap-medium auto-y size-full-0 align-x-center align-y-start"
            }, {
                ProductDetailsContainer = v2.createElement(l_View_0, {
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center", 
                    LayoutOrder = 1
                }, {
                    ProductDetails = if v36.purchaseModalType == v19.MultiItem then v2.createElement(v17, {
                        amount = v36.product.itemRobuxCost
                    }) else v2.createElement(v15, {
                        isPortrait = false, 
                        isCompact = if v22 then v38 else nil, 
                        itemIcon = v36.product.itemIcon, 
                        itemName = v36.product.itemName, 
                        itemRobuxCost = v36.product.itemRobuxCost, 
                        model = v36.product.model
                    })
                }), 
                UpsellSuggestions = v2.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center padding-x-xsmall padding-y-small padding-bottom-xxlarge"
                }, {
                    UpsellPackage1 = v2.createElement(v35, {
                        layoutOrder = 1, 
                        product = v36.upsellSuggestions[1], 
                        selected = v36.selectedUpsellIndex == 1, 
                        isCompact = if v22 then v38 else nil, 
                        onSelected = function() --[[ Line: 267 ]] --[[ Name: onSelected ]]
                            -- upvalues: v36 (copy)
                            v36.onUpsellSuggestionsSelected(1);
                        end
                    }), 
                    UpsellPackage2 = if #v36.upsellSuggestions > 1 then v2.createElement(v35, {
                        layoutOrder = 2, 
                        product = v36.upsellSuggestions[2], 
                        selected = v36.selectedUpsellIndex == 2, 
                        isCompact = if v22 then v38 else nil, 
                        onSelected = function() --[[ Line: 277 ]] --[[ Name: onSelected ]]
                            -- upvalues: v36 (copy)
                            v36.onUpsellSuggestionsSelected(2);
                        end, 
                        badgeType = v36.upsellSuggestions[2].badgeType
                    }) else nil
                })
            })
        }), 
        DialogActions = v2.createElement(l_Dialog_0.Actions, {
            LayoutOrder = 4, 
            orientation = l_Orientation_0.Horizontal, 
            actions = {
                {
                    text = v37.Buy, 
                    variant = l_ButtonVariant_0.Emphasis, 
                    onActivated = v36.buttons.buyItemActivated, 
                    isDisabled = v36.buttons.buyItemDisabled, 
                    ref = v43, 
                    inputDelay = (not v36.buttons.buyItemEnableInputDelayed or v36.buttons.buyItemDisabled) and 0 or 2.5
                }
            }
        }), 
        DisclosureTerms = v2.createElement(l_View_0, {
            LayoutOrder = 5, 
            tag = "row wrap auto-y align-y-center align-x-center size-full-0 gap-xxsmall"
        }, {
            DisclosurePayment = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v37.DisclosurePayment, 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
            }), 
            BeforeText = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v45[1], 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
            }), 
            TextLink = v2.createElement(l_Text_0, {
                LayoutOrder = 3, 
                RichText = true, 
                Text = l_TermsOfUse_0, 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small", 
                onActivated = v36.termsOfUseActivated
            }), 
            AfterText = v2.createElement(l_Text_0, {
                LayoutOrder = 4, 
                Text = v45[2], 
                tag = "auto-xy text-body content-default text-align-x-left content-muted text-caption-small"
            })
        })
    });
end;
return function(v49) --[[ Line: 332 ]] --[[ Name: UnifiedRobuxUpsellModalV2Container ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v48 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        UnifiedRobuxUpsellModalV2 = v2.createElement(v48, v49)
    });
end;