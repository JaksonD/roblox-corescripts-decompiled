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
local v15 = require(script.Parent.RobuxUpsellModalTitle);
local v16 = require(script.Parent.RobuxUpsellModalFooter);
local v17 = require(script.Parent.RobuxUpsellModalUpsellDetailsWithBonus);
local v18 = require(l_Parent_0.Utility.formatNumber);
local v19 = require(l_Parent_0.Utility.logger);
local v20 = require(l_Parent_0.Utility.getAppContext);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local v22 = require(l_Parent_0.Generic.Events.SinglePackageUpsellCounter);
local l_SinglePackageUpsellShownCounter_0 = v22.SinglePackageUpsellShownCounter;
local l_SinglePackageUpsellModalClosedCounter_0 = v22.SinglePackageUpsellModalClosedCounter;
local l_SinglePackageUpsellModalBuyClickedCounter_0 = v22.SinglePackageUpsellModalBuyClickedCounter;
local _ = require(l_Parent_0.Enums.VirtualItemBadgeType);
local l_useDefaultFocusBehavior_0 = require(l_Parent_1.ReactFocusNavigation).useDefaultFocusBehavior;
local v28 = require(l_Parent_0.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt);
local function v30(v29) --[[ Line: 72 ]] --[[ Name: MiddleContent ]]
    -- upvalues: v2 (copy), l_View_0 (copy), v14 (copy), v17 (copy), l_Text_0 (copy), v18 (copy), l_LocalizationService_0 (copy)
    return v2.createElement(l_View_0, {
        tag = "col gap-xxlarge auto-y size-full-0 align-x-center align-y-center"
    }, {
        ProductDetails = v2.createElement(v14, {
            layoutOrder = 1, 
            isPortrait = v29.isPortrait, 
            model = v29.product.model, 
            itemIcon = v29.product.itemIcon, 
            itemName = v29.product.itemName, 
            itemRobuxCost = v29.product.itemRobuxCost, 
            badgeType = v29.product.badgeType
        }), 
        UpsellPackageDetails = if v29.upsell.robuxPurchaseAmountBeforeBonus then v2.createElement(v17, {
            layoutOrder = 2, 
            priceString = v29.upsell.robuxPurchaseCost or "", 
            robuxAmount = v29.upsell.robuxPurchaseAmountBeforeBonus, 
            bonusAmount = v29.upsell.robuxPurchaseAmount - v29.upsell.robuxPurchaseAmountBeforeBonus
        }) else v2.createElement(l_View_0, {
            LayoutOrder = 2, 
            tag = "row flex-between size-full-1400 align-y-center bg-surface-300 radius-medium padding-large stroke-system-contrast stroke-thick"
        }, {
            RobuxAmountContainer = v2.createElement(l_View_0, {
                tag = "auto-xy row gap-small"
            }, {
                RobuxAmount = v2.createElement(l_Text_0, {
                    LayoutOrder = 1, 
                    Text = utf8.char(57346) .. " " .. v18(l_LocalizationService_0.RobloxLocaleId, v29.upsell.robuxPurchaseAmount), 
                    tag = "auto-xy text-title-large content-emphasis text-align-x-left"
                })
            }), 
            RobuxPrice = v2.createElement(l_Text_0, {
                LayoutOrder = 2, 
                Text = v29.upsell.robuxPurchaseCost or "", 
                tag = "auto-xy text-title-large content-emphasis text-align-x-right"
            })
        })
    });
end;
local function v33(v31) --[[ Line: 133 ]] --[[ Name: ButtonStackInfo ]]
    -- upvalues: l_useLocalization_0 (copy), v28 (copy), l_ButtonType_0 (copy)
    local v32 = l_useLocalization_0({
        BuyRobuxButton = v31.buttons.opensBuyRobuxPage and "IAPExperience.RobuxUpsell.Action.BuyRobux" or "IAPExperience.RobuxUpsell.Action.BuyRobuxAndItem", 
        ButtonCancel = "IAPExperience.RobuxUpsell.Action.Cancel", 
        LoadingText = "IAPExperience.RobuxUpsell.Text.Loading"
    });
    return {
        forcedFillDirection = Enum.FillDirection.Vertical, 
        disableGamepadRefs = v28 and true or nil, 
        buttons = if v31.isQuest then {
            {
                props = {
                    onActivated = v31.buttons.cancelPurchaseActivated, 
                    text = v32.ButtonCancel, 
                    inputIcon = v31.buttons.cancelControllerIcon
                }
            }
        } else {
            {
                buttonType = l_ButtonType_0.PrimaryContextual, 
                props = {
                    isDisabled = v31.buttons.buyItemDisabled, 
                    isDelayedInput = v31.buttons.buyItemisDelayedInput, 
                    enableInputDelayed = v31.buttons.buyItemEnableInputDelayed, 
                    onActivated = v31.buttons.buyItemActivated, 
                    text = v32.BuyRobuxButton, 
                    inputIcon = v31.buttons.buyItemControllerIcon, 
                    buttonRef = if v28 then v31.buttons.buttonRef else nil
                }
            }
        }
    };
end;
local function v42(v34) --[[ Line: 180 ]] --[[ Name: RobuxUpsellModal ]]
    -- upvalues: v28 (copy), l_useDefaultFocusBehavior_0 (copy), v2 (copy), v19 (copy), v20 (copy), l_default_0 (copy), l_SinglePackageUpsellShownCounter_0 (copy), l_SinglePackageUpsellModalClosedCounter_0 (copy), l_SinglePackageUpsellModalBuyClickedCounter_0 (copy), l_InteractiveAlert_0 (copy), v15 (copy), v30 (copy), v33 (copy), v16 (copy)
    local v35 = nil;
    local v36 = nil;
    if v28 then
        local v37, v38 = l_useDefaultFocusBehavior_0();
        v35 = v37;
        v36 = v38;
    end;
    v2.useEffect(function() --[[ Line: 186 ]]
        -- upvalues: v19 (ref), v34 (copy), v20 (ref), l_default_0 (ref), l_SinglePackageUpsellShownCounter_0 (ref)
        v19.debug({
            message = "Single Package Upsell Modal Shown", 
            screenHeight = v34.screenSize.Y, 
            screenWidth = v34.screenSize.X, 
            portrait = v34.screenSize.X < v34.screenSize.Y, 
            appContext = v20(), 
            buyRobuxVariant = v34.buttons.opensBuyRobuxPage == nil and 0 or v34.buttons.opensBuyRobuxPage and 1 or 2
        });
        l_default_0:logRobloxTelemetryCounter(l_SinglePackageUpsellShownCounter_0, 1, {
            screenHeight = v34.screenSize.Y, 
            screenWidth = v34.screenSize.X, 
            portrait = v34.screenSize.X < v34.screenSize.Y, 
            appContext = v20(), 
            buyRobuxVariant = v34.buttons.opensBuyRobuxPage == nil and 0 or v34.buttons.opensBuyRobuxPage and 1 or 2
        });
    end, {});
    local function v39() --[[ Line: 209 ]]
        -- upvalues: v19 (ref), l_default_0 (ref), l_SinglePackageUpsellModalClosedCounter_0 (ref), v20 (ref), v34 (copy)
        v19.debug({
            message = "Single Package Upsell Modal Closed"
        });
        l_default_0:logRobloxTelemetryCounter(l_SinglePackageUpsellModalClosedCounter_0, 1, {
            appContext = v20()
        });
        v34.buttons.cancelPurchaseActivated();
    end;
    local l_buyItemActivated_0 = v34.buttons.buyItemActivated;
    local function v41() --[[ Line: 219 ]]
        -- upvalues: v19 (ref), l_default_0 (ref), l_SinglePackageUpsellModalBuyClickedCounter_0 (ref), v20 (ref), l_buyItemActivated_0 (copy)
        v19.debug({
            message = "Single Package Upsell Modal Buy Clicked"
        });
        l_default_0:logRobloxTelemetryCounter(l_SinglePackageUpsellModalBuyClickedCounter_0, 1, {
            appContext = v20()
        });
        l_buyItemActivated_0();
    end;
    v34.buttons.buyItemActivated = v41;
    if v28 then
        v34.buttons.buttonRef = v35;
    end;
    return v2.createElement(l_InteractiveAlert_0, {
        defaultChildRef = if v28 then v36 else nil, 
        screenSize = v34.screenSize, 
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        title = "", 
        titleContent = function() --[[ Line: 237 ]] --[[ Name: titleContent ]]
            -- upvalues: v2 (ref), v15 (ref), v34 (copy), v39 (copy)
            return v2.createElement(v15, {
                balanceAmount = v34.upsell.balanceAmount, 
                cancelPurchaseActivated = v39
            });
        end, 
        middleContent = function() --[[ Line: 243 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), v30 (ref), v34 (copy)
            return v2.createElement(v30, {
                product = v34.product, 
                upsell = v34.upsell, 
                isPortrait = v34.screenSize.X < v34.screenSize.Y
            });
        end, 
        buttonStackInfo = v33({
            buttons = v34.buttons, 
            isQuest = v34.isQuest
        }), 
        footerContent = function() --[[ Line: 254 ]] --[[ Name: footerContent ]]
            -- upvalues: v2 (ref), v16 (ref)
            return v2.createElement(v16);
        end
    });
end;
return function(v43) --[[ Line: 260 ]] --[[ Name: RobuxUpsellModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v42 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        RobuxUpsellModal = v2.createElement(v42, v43)
    });
end;