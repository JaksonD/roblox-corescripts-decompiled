local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local l_TextService_0 = game:GetService("TextService");
local v4 = require(l_Parent_1.UIBlox);
local l_InteractiveAlert_0 = v4.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v4.App.Button.Enum.ButtonType;
local v7 = require(l_Parent_1.Foundation);
local l_Text_0 = v7.Text;
local l_useTokens_0 = v7.Hooks.useTokens;
local l_useTextSizeOffset_0 = v7.Hooks.useTextSizeOffset;
local l_useDefaultFocusBehavior_0 = require(l_Parent_1.ReactFocusNavigation).useDefaultFocusBehavior;
local v12 = require(l_Parent_0.Generic.ProductDetails);
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Localization_0 = require(l_Parent_1.AppLocales).Localization;
local v15 = require(l_Parent_1.Localization);
local l_LocalizationProvider_0 = v15.LocalizationProvider;
local l_useLocalization_0 = v15.Hooks.useLocalization;
local v18 = require(l_Parent_0.Utility.formatNumber);
local v19 = require(l_Parent_0.Utility.logger);
local v20 = require(l_Parent_0.Utility.getAppContext);
local l_default_0 = require(l_Parent_1.LoggingProtocol).default;
local l_PurchaseModalV2ShownCounter_0 = require(l_Parent_0.Generic.Events.PurchaseModalCounter).PurchaseModalV2ShownCounter;
local v23 = require(l_Parent_0.Flags.FFlagAddDefaultFocusNavSelectorsOnBuyPurchasePrompt);
local function v43(v24) --[[ Line: 67 ]] --[[ Name: ProductPurchaseModal ]]
    -- upvalues: v23 (copy), l_useDefaultFocusBehavior_0 (copy), v2 (copy), v19 (copy), v20 (copy), l_default_0 (copy), l_PurchaseModalV2ShownCounter_0 (copy), l_useLocalization_0 (copy), v18 (copy), l_LocalizationService_0 (copy), l_useTokens_0 (copy), l_useTextSizeOffset_0 (copy), l_TextService_0 (copy), l_InteractiveAlert_0 (copy), v12 (copy), l_ButtonType_0 (copy), l_Text_0 (copy)
    local v25 = nil;
    local v26 = nil;
    if v23 then
        local v27, v28 = l_useDefaultFocusBehavior_0();
        v25 = v27;
        v26 = v28;
    end;
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v19 (ref), v24 (copy), v20 (ref), l_default_0 (ref), l_PurchaseModalV2ShownCounter_0 (ref)
        v19.debug({
            message = "Purchase Modal V2 Shown", 
            screenHeight = v24.screenSize.Y, 
            screenWidth = v24.screenSize.X, 
            portrait = v24.screenSize.X < v24.screenSize.Y, 
            appContext = v20()
        });
        l_default_0:logRobloxTelemetryCounter(l_PurchaseModalV2ShownCounter_0, 1, {
            screenHeight = v24.screenSize.Y, 
            screenWidth = v24.screenSize.X, 
            portrait = v24.screenSize.X < v24.screenSize.Y, 
            appContext = v20()
        });
    end, {});
    local v29 = l_useLocalization_0({
        BuyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
        RemainingBalance = "IAPExperience.PurchasePrompt.Text.RemainingBalanceV2"
    });
    local v30 = v24.balanceAmount - v24.product.itemRobuxCost;
    local v31 = utf8.char(57346) .. " " .. v18(l_LocalizationService_0.RobloxLocaleId, v30);
    local v32 = utf8.char(57346) .. " " .. v18(l_LocalizationService_0.RobloxLocaleId, v24.product.itemRobuxCost);
    local v33 = nil;
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    v36 = l_useTokens_0();
    v37 = l_useTextSizeOffset_0();
    local v40, v41 = v2.useState(0);
    v33 = v40;
    v34 = v41;
    v40 = v36.Typography.CaptionSmall;
    v39 = v29.RemainingBalance:gsub("{robux}", v31);
    v35 = v2.useCallback(function(v42) --[[ Line: 110 ]]
        -- upvalues: v33 (ref), v34 (ref)
        if v33 ~= v42.AbsoluteSize.X then
            v34(v42.AbsoluteSize.X);
        end;
    end, {
        v24
    });
    v38 = v2.useMemo(function() --[[ Line: 116 ]]
        -- upvalues: v40 (copy), l_TextService_0 (ref), v39 (ref), v33 (ref)
        return v40.LineHeight * l_TextService_0:GetTextSize(v39, v40.FontSize, v40.Font, Vector2.new(v33, 1e999)).Y;
    end, {
        v33, 
        v37, 
        v39
    });
    return v2.createElement(l_InteractiveAlert_0, {
        defaultChildRef = if v23 then v26 else nil, 
        screenSize = v24.screenSize, 
        anchorPoint = Vector2.new(0.5, 0.5), 
        position = UDim2.new(0.5, 0, 0.5, 0), 
        bottomMargin = 12, 
        title = v29.BuyItem, 
        onCloseClicked = function() --[[ Line: 133 ]] --[[ Name: onCloseClicked ]]
            -- upvalues: v24 (copy)
            if not v24.buttons.isDisabled then
                v24.buttons.cancelActivated();
            end;
        end, 
        onAbsoluteSizeChanged = v35, 
        middleContent = function() --[[ Line: 139 ]] --[[ Name: middleContent ]]
            -- upvalues: v2 (ref), v12 (ref), v24 (copy)
            return v2.createElement(v12, {
                isPortrait = false, 
                layoutOrder = 1, 
                itemIcon = v24.product.itemIcon, 
                itemName = v24.product.itemName
            });
        end, 
        buttonStackInfo = {
            forcedFillDirection = Enum.FillDirection.Vertical, 
            disableGamepadRefs = v23 and true or nil, 
            buttons = {
                {
                    buttonType = l_ButtonType_0.PrimaryContextual, 
                    props = {
                        isDisabled = v24.buttons.isDisabled, 
                        isDelayedInput = v24.buttons.buyItemIsDelayedInput, 
                        enableInputDelayed = v24.buttons.buyItemEnableInputDelayed, 
                        onActivated = v24.buttons.buyItemActivated, 
                        text = v32, 
                        inputIcon = v24.buttons.buyItemControllerIcon, 
                        buttonRef = if v23 then v25 else nil
                    }
                }
            }
        }, 
        footerContent = function() --[[ Line: 167 ]] --[[ Name: footerContent ]]
            -- upvalues: v24 (copy), v2 (ref), l_Text_0 (ref), v39 (ref), v38 (ref), v35 (ref)
            if not v24.balanceAmountValid then
                return v2.None;
            else
                return v2.createElement(l_Text_0, {
                    Text = v39, 
                    Size = UDim2.new(1, 0, 0, v38), 
                    onAbsoluteSizeChanged = v35, 
                    tag = "content-muted text-caption-small align-x-center text-wrap"
                });
            end;
        end
    });
end;
return function(v44) --[[ Line: 182 ]] --[[ Name: ProductPurchaseModalContainer ]]
    -- upvalues: v2 (copy), l_LocalizationProvider_0 (copy), l_Localization_0 (copy), l_LocalizationService_0 (copy), v43 (copy)
    return v2.createElement(l_LocalizationProvider_0, {
        localization = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId)
    }, {
        ProductPurchaseModal = v2.createElement(v43, v44)
    });
end;