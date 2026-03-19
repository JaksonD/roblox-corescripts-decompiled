local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local v6 = require(l_Parent_1.Foundation);
local l_View_0 = v6.View;
local l_Text_0 = v6.Text;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v11 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v11.LocalizationProvider;
local l_useLocalization_0 = v11.Hooks.useLocalization;
local v14 = require(l_Parent_0.Generic.ProductDetails);
local v15 = require(l_Parent_0.Generic.YellowBadge);
local v16 = require(script.Parent.RobuxUpsellModalTitle);
local v17 = require(script.Parent.RobuxUpsellModalFooter);
local v18 = require(l_Parent_0.Utility.formatNumber);
local v19 = require(l_Parent_0.Utility.logger);
local v20 = require(l_Parent_0.Utility.getAppContext);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local v22 = require(l_Parent_0.Generic.Events.MultiplePackageUpsellCounter);
local l_MultiplePackageUpsellShownCounter_0 = v22.MultiplePackageUpsellShownCounter;
local l_MultiplePackageUpsellSelectedCounter_0 = v22.MultiplePackageUpsellSelectedCounter;
local l_MultiplePackageUpsellModalClosedCounter_0 = v22.MultiplePackageUpsellModalClosedCounter;
local l_MultiplePackageUpsellModalBuyClickedCounter_0 = v22.MultiplePackageUpsellModalBuyClickedCounter;
local _ = require(l_Parent_0.Api.PaymentsGateway.GetUpsellSuggestionsTypes);
local v28 = require(l_Parent_0.Enums.BadgeType);
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
local l_useDefaultFocusBehavior_0 = require(l_Parent_1.ReactFocusNavigation).useDefaultFocusBehavior;
local v31 = require(l_Parent_0.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt);
local function v37(v32) --[[ Line: 64 ]] --[[ Name: UpsellProductDetails ]]
    -- upvalues: l_useLocalization_0 (copy), v28 (copy), v2 (copy), l_View_0 (copy), l_Text_0 (copy), v18 (copy), l_LocalizationService_0 (copy), v15 (copy)
    local v33 = l_useLocalization_0({
        Popular = "IAPExperience.RobuxUpsell.Text.PopularItem", 
        LastPurchased = "IAPExperience.RobuxUpsell.Text.LastPurchased"
    });
    local v34 = if v32.badgeType == v28.Popular then v33.Popular else if v32.badgeType == v28.LastPurchased then v33.LastPurchased else nil;
    local v35 = v32.badgeType == v28.Popular and "icons/menu/fire_fill" or nil;
    local v36 = "size-full-1400 radius-medium padding-x-large row";
    v36 = if v32.selected then v36 .. " bg-surface-200 stroke-system-contrast stroke-thick" else v36 .. " bg-surface-300 stroke-emphasis stroke-standard";
    return v2.createElement(l_View_0, {
        LayoutOrder = v32.layoutOrder, 
        onActivated = v32.onSelected, 
        tag = v36
    }, {
        LeftSide = v2.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "row gap-small align-y-center align-x-start", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            RobuxAmount = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = utf8.char(57346) .. " " .. v18(l_LocalizationService_0.RobloxLocaleId, v32.product.robuxAmount), 
                tag = "auto-xy text-title-large content-emphasis text-align-x-left"
            }), 
            RobuxAmountBonus = v32.product.robuxAmountBeforeBonus and v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                RichText = true, 
                Text = "<s>" .. utf8.char(57346) .. v18(l_LocalizationService_0.RobloxLocaleId, v32.product.robuxAmountBeforeBonus) .. "</s>", 
                tag = "auto-xy text-title-large content-muted text-align-x-left"
            })
        }), 
        RightSide = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row align-y-center align-x-right gap-large", 
            Size = UDim2.new(0.5, 0, 1, 0)
        }, {
            Badge = if v34 then v2.createElement(v15, {
                LayoutOrder = 1, 
                Text = v34, 
                Icon = v35
            }) else nil, 
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v32.product.price or "", 
                tag = "auto-xy text-title-large content-emphasis text-align-x-right"
            })
        })
    });
end;
local function v39(v38) --[[ Line: 149 ]] --[[ Name: MiddleContent ]]
    -- upvalues: v2 (copy), l_View_0 (copy), v14 (copy), v37 (copy)
    return v2.createElement(l_View_0, {
        tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
    }, {
        ProductDetails = v2.createElement(v14, {
            layoutOrder = 1, 
            isPortrait = v38.isPortrait and #v38.upsellSuggestions == 1, 
            model = v38.product.model, 
            itemIcon = v38.product.itemIcon, 
            itemName = v38.product.itemName, 
            itemRobuxCost = v38.product.itemRobuxCost, 
            badgeType = v38.product.badgeType
        }), 
        UpsellSuggestions = v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "col gap-medium auto-y size-full-0 align-x-center align-y-center"
        }, {
            UpsellPackage1 = v2.createElement(v37, {
                layoutOrder = 1, 
                product = v38.upsellSuggestions[1], 
                selected = v38.selectedUpsellIndex == 1, 
                onSelected = function() --[[ Line: 170 ]] --[[ Name: onSelected ]]
                    -- upvalues: v38 (copy)
                    v38.onUpsellSuggestionsSelected(1);
                end
            }), 
            UpsellPackage2 = if #v38.upsellSuggestions > 1 then v2.createElement(v37, {
                layoutOrder = 2, 
                product = v38.upsellSuggestions[2], 
                selected = v38.selectedUpsellIndex == 2, 
                onSelected = function() --[[ Line: 179 ]] --[[ Name: onSelected ]]
                    -- upvalues: v38 (copy)
                    v38.onUpsellSuggestionsSelected(2);
                end, 
                badgeType = v38.upsellSuggestions[2].badgeType
            }) else nil
        })
    });
end;
local function v42(v40) --[[ Line: 204 ]] --[[ Name: ButtonStackInfo ]]
    -- upvalues: l_useLocalization_0 (copy), v31 (copy), l_ButtonType_0 (copy)
    local v41 = l_useLocalization_0({
        BuyRobuxButton = "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem", 
        ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel", 
        LoadingText = "IAPExperience.RobuxUpsell.Text.Loading"
    });
    return {
        forcedFillDirection = Enum.FillDirection.Vertical, 
        disableGamepadRefs = v31 and true or nil, 
        buttons = if v40.isQuest then {
            {
                props = {
                    onActivated = v40.buttons.cancelPurchaseActivated, 
                    text = v41.ButtonCancel, 
                    inputIcon = v40.buttons.cancelControllerIcon
                }
            }
        } else {
            {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                props = {
                    isDelayedInput = v40.buttons.buyItemisDelayedInput, 
                    enableInputDelayed = v40.buttons.buyItemEnableInputDelayed, 
                    onActivated = v40.buttons.buyItemActivated, 
                    text = v41.BuyRobuxButton, 
                    inputIcon = v40.buttons.buyItemControllerIcon, 
                    buttonRef = if v31 then v40.buttons.buttonRef else nil
                }
            }
        }
    };
end;
local function v53(v43) --[[ Line: 253 ]] --[[ Name: RobuxUpsellModal ]]
    -- upvalues: v31 (copy), l_useDefaultFocusBehavior_0 (copy), v2 (copy), v19 (copy), l_default_0 (copy), l_MultiplePackageUpsellShownCounter_0 (copy), l_MultiplePackageUpsellSelectedCounter_0 (copy), l_MultiplePackageUpsellModalClosedCounter_0 (copy), v20 (copy), l_MultiplePackageUpsellModalBuyClickedCounter_0 (copy), l_InteractiveAlert_0 (copy), v16 (copy), v39 (copy), v42 (copy), v17 (copy)
    local v44 = nil;
    local v45 = nil;
    if v31 then
        local v46, v47 = l_useDefaultFocusBehavior_0();
        v44 = v46;
        v45 = v47;
    end;
    v2.useEffect(function() --[[ Line: 260 ]]
        -- upvalues: v19 (ref), v43 (copy), l_default_0 (ref), l_MultiplePackageUpsellShownCounter_0 (ref)
        v19.debug({
            message = "Multiple Package Upsell Modal Shown", 
            suggestionCount = #v43.upsellSuggestions, 
            screenHeight = v43.screenSize.Y, 
            screenWidth = v43.screenSize.X, 
            portrait = v43.screenSize.X < v43.screenSize.Y
        });
        l_default_0:logRobloxTelemetryCounter(l_MultiplePackageUpsellShownCounter_0, 1, {
            suggestionCount = #v43.upsellSuggestions, 
            screenHeight = v43.screenSize.Y, 
            screenWidth = v43.screenSize.X, 
            portrait = v43.screenSize.X < v43.screenSize.Y
        });
    end, {
        v43.upsellSuggestions
    });
    local function v49(v48) --[[ Line: 277 ]]
        -- upvalues: v19 (ref), v43 (copy), l_default_0 (ref), l_MultiplePackageUpsellSelectedCounter_0 (ref)
        v19.debug({
            message = "Multiple Package Upsell Option Selected", 
            suggestionCount = #v43.upsellSuggestions, 
            previousIndex = v43.selectedUpsellIndex, 
            selectedIndex = v48
        });
        l_default_0:logRobloxTelemetryCounter(l_MultiplePackageUpsellSelectedCounter_0, 1, {
            suggestionCount = #v43.upsellSuggestions, 
            previousIndex = v43.selectedUpsellIndex, 
            selectedIndex = v48
        });
        v43.onUpsellSuggestionsSelected(v48);
    end;
    local function v50() --[[ Line: 293 ]]
        -- upvalues: v19 (ref), v43 (copy), l_default_0 (ref), l_MultiplePackageUpsellModalClosedCounter_0 (ref)
        v19.debug({
            message = "Multiple Package Upsell Modal Closed", 
            suggestionCount = #v43.upsellSuggestions
        });
        l_default_0:logRobloxTelemetryCounter(l_MultiplePackageUpsellModalClosedCounter_0, 1, {
            suggestionCount = #v43.upsellSuggestions
        });
        v43.buttons.cancelPurchaseActivated();
    end;
    local l_buyItemActivated_0 = v43.buttons.buyItemActivated;
    local function v52() --[[ Line: 306 ]]
        -- upvalues: v19 (ref), v20 (ref), v43 (copy), l_default_0 (ref), l_MultiplePackageUpsellModalBuyClickedCounter_0 (ref), l_buyItemActivated_0 (copy)
        v19.debug({
            message = "Multiple Package Upsell Modal Buy Clicked", 
            appContext = v20(), 
            suggestionCount = #v43.upsellSuggestions, 
            selectedIndex = v43.selectedUpsellIndex
        });
        l_default_0:logRobloxTelemetryCounter(l_MultiplePackageUpsellModalBuyClickedCounter_0, 1, {
            appContext = v20(), 
            suggestionCount = #v43.upsellSuggestions, 
            selectedIndex = v43.selectedUpsellIndex
        });
        l_buyItemActivated_0();
    end;
    v43.buttons.buyItemActivated = v52;
    if v31 then
        v43.buttons.buttonRef = v44;
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        defaultChildRef = if v31 then v45 else nil, 
        screenSize = v43.screenSize, 
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        title = "", 
        titleContent = function() --[[ Line: 331 ]] --[[ Name: titleContent ]]
            -- upvalues: v2 (ref), v16 (ref), v43 (copy), v50 (copy)
            return v2.createElement(v16, {
                balanceAmount = v43.userBalance, 
                cancelPurchaseActivated = v50
            });
        end, 
        middleContent = function() --[[ Line: 337 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), v39 (ref), v43 (copy), v49 (copy)
            return v2.createElement(v39, {
                product = v43.product, 
                upsellSuggestions = v43.upsellSuggestions, 
                selectedUpsellIndex = v43.selectedUpsellIndex, 
                onUpsellSuggestionsSelected = v49, 
                isPortrait = v43.screenSize.X < v43.screenSize.Y
            });
        end, 
        buttonStackInfo = v42({
            buttons = v43.buttons, 
            isQuest = v43.isQuest
        }), 
        footerContent = function() --[[ Line: 350 ]] --[[ Name: footerContent ]]
            -- upvalues: v2 (ref), v17 (ref)
            return v2.createElement(v17);
        end
    });
end;
return function(v54) --[[ Line: 356 ]] --[[ Name: RobuxUpsellModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v53 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        RobuxUpsellModal = v2.createElement(v53, v54)
    });
end;