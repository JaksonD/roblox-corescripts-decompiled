local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_Button_0 = v5.App.Button.Button;
local l_ButtonType_0 = v5.App.Button.Enum.ButtonType;
local v8 = require(l_Parent_0.Foundation);
local v9 = require(script.Parent.Box);
local v10 = require(script.Parent.PriceBoxLine);
local v11 = require(l_script_FirstAncestor_0.Enums.PriceBoxLineVariantEnum);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagAddTimerToBulkPurchaseBuyButton);
local v13 = require(l_script_FirstAncestor_0.Flags.FIntBulkPurchaseEnabledCountdownMS);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAXMakeBulkPurchaseBlue);
local v15 = {
    heading = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.TotalCost", 
    currentBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.CurrentBalance", 
    projectedBalanceLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.NewBalance", 
    missingRobuxLine = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.MissingRobux", 
    confirmCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.ConfirmCTA", 
    buyRobuxCTA = "CoreScripts.BulkPurchasePrompt.RequestPrompt.PriceBox.BuyRobuxCTA"
};
local function v17(v16) --[[ Line: 28 ]] --[[ Name: mapTokens ]]
    return {
        background = v16.Semantic.Color.Background.Contrast.Color3, 
        padding = v16.Global.Space_300, 
        cornerRadius = v16.Semantic.Radius.Medium, 
        buttonMarginTop = v16.Global.Space_300, 
        headerMarginBottom = v16.Global.Space_200, 
        lineItemSpacing = v16.Global.Space_50, 
        buttonHeight = v16.Global.Size_450
    };
end;
return function(v18) --[[ Line: 49 ]] --[[ Name: PriceBox ]]
    -- upvalues: l_useDesignTokens_0 (copy), v17 (copy), l_useLocalization_0 (copy), v15 (copy), v2 (copy), v9 (copy), v10 (copy), v11 (copy), v14 (copy), v8 (copy), v12 (copy), v13 (copy), l_Button_0 (copy), l_ButtonType_0 (copy)
    local v19 = l_useDesignTokens_0(v17);
    local v20 = l_useLocalization_0(v15);
    return v2.createElement(v9, {
        padding = v19.padding, 
        cornerRadius = UDim.new(0, v19.cornerRadius), 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = v19.background, 
        BorderSizePixel = 0
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, v19.buttonMarginTop)
        }), 
        LineItems = v2.createElement("Frame", {
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, v19.headerMarginBottom)
            }), 
            PriceBoxHeader = v2.createElement(v10, {
                text = v20.heading, 
                amount = v18.totalCost, 
                highlight = true, 
                LayoutOrder = 1
            }), 
            Something = v2.createElement("Frame", {
                BorderSizePixel = 0, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                    Padding = UDim.new(0, v19.lineItemSpacing)
                }), 
                PriceBoxCurrentBalance = v2.createElement(v10, {
                    text = v20.currentBalanceLine, 
                    amount = v18.currentBalance, 
                    LayoutOrder = 1
                }), 
                PriceBoxProjectedBalance = v2.createElement(v10, {
                    text = if v18.missingRobux then v20.missingRobuxLine else v20.projectedBalanceLine, 
                    amount = math.abs(v18.totalCost - v18.currentBalance), 
                    variant = if v18.missingRobux then v11.Danger else nil, 
                    LayoutOrder = 2
                })
            })
        }), 
        PriceBoxConfirmButton = if v14 then v2.createElement(v8.Button, {
            text = if v18.missingRobux then v20.buyRobuxCTA else v20.confirmCTA, 
            onActivated = v18.onAccept or function() --[[ Line: 114 ]]

            end, 
            variant = v8.Enums.ButtonVariant.Emphasis, 
            size = v8.Enums.InputSize.Medium, 
            width = UDim.new(1, 0), 
            ref = v18.buttonRef, 
            isDisabled = v18.isDisabled, 
            inputDelay = if v12 then math.max(0, v13) / 1000 else nil
        }) else v2.createElement(l_Button_0, {
            text = if v18.missingRobux then v20.buyRobuxCTA else v20.confirmCTA, 
            onActivated = v18.onAccept, 
            buttonType = l_ButtonType_0.PrimarySystem, 
            size = UDim2.new(1, 0, 0, v19.buttonHeight), 
            buttonRef = v18.buttonRef, 
            isDisabled = v18.isDisabled, 
            isDelayedInput = v12 and true or nil, 
            enableInputDelayed = v12 and true or nil, 
            delayInputSeconds = if v12 then math.max(0, v13) / 1000 else nil
        })
    });
end;