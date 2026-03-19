local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_StyledTextLabel_0 = require(l_Parent_0.UIBlox).App.Text.StyledTextLabel;
local v6 = require(l_Parent_0.IAPExperience);
local l_formatEconomicRestrictionText_0 = v6.Utility.formatEconomicRestrictionText;
local l_addEconomicRestrictionKeysToLocalization_0 = v6.Utility.addEconomicRestrictionKeysToLocalization;
local v9 = require(l_script_FirstAncestor_0.Components.AlertPrompt);
local v10 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local function v13(v11) --[[ Line: 21 ]] --[[ Name: BulkPurchaseErrorText ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), l_StyledTextLabel_0 (copy)
    local v12 = l_useDesignTokens_0();
    return v2.createElement(l_StyledTextLabel_0, {
        size = UDim2.fromScale(1, 0), 
        automaticSize = Enum.AutomaticSize.Y, 
        fontStyle = v12.Semantic.Typography.Body, 
        colorStyle = v12.Semantic.Color.Text.Default, 
        textXAlignment = Enum.TextXAlignment.Center, 
        text = v11.text, 
        layoutOrder = v11.layoutOrder
    });
end;
local v14 = {
    [v10.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientRobux", 
    [v10.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuotaExceeded", 
    [v10.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotForSale", 
    [v10.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonAlreadyOwned", 
    [v10.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPurchaserIsSeller", 
    [v10.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableForPurchaser", 
    [v10.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonPriceMismatch", 
    [v10.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonQuantityLimitExceeded", 
    [v10.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonInsufficientMembership", 
    [v10.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonGeneric", 
    [v10.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonSoldOut", 
    [v10.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReason2SV", 
    [v10.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.ErrorReasonNotAvailableInExperience"
};
local v15 = {
    [v10.InsufficientRobux] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainMoreRobux", 
    [v10.QuotaExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainWait", 
    [v10.NotForSale] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v10.AlreadyOwned] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v10.PurchaserIsSeller] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v10.NotAvailableForPurchaser] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v10.PriceMismatch] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow", 
    [v10.QuantityLimitExceeded] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v10.InsufficientMembership] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v10.Generic] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainLater", 
    [v10.SoldOut] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainNow", 
    [v10.TwoStepVerificationRequired] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems", 
    [v10.PlaceInvalid] = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorPrompt.TryAgainOtherItems"
};
return function(v16) --[[ Line: 73 ]] --[[ Name: BulkPurchaseError ]]
    -- upvalues: l_useDesignTokens_0 (copy), v14 (copy), v15 (copy), l_addEconomicRestrictionKeysToLocalization_0 (copy), l_useLocalization_0 (copy), v10 (copy), l_formatEconomicRestrictionText_0 (copy), v2 (copy), v13 (copy), v9 (copy)
    local v17 = l_useDesignTokens_0();
    local v18 = nil;
    local v19 = {
        title = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.ErrorHeading", 
        errorReason = v14[v16.errorCode], 
        tryAgain = v15[v16.errorCode], 
        dismissCTA = "CoreScripts.BulkPurchasePrompt.CompletedPrompt.DismissCTA"
    };
    l_addEconomicRestrictionKeysToLocalization_0(v19);
    v18 = l_useLocalization_0(v19);
    if v16.errorCode == v10.EconomicRestriction and v16.errorMetadata then
        v18.errorReason = l_formatEconomicRestrictionText_0(v18, v16.errorMetadata, true);
    end;
    local function v20() --[[ Line: 88 ]]
        -- upvalues: v2 (ref), v17 (copy), v13 (ref), v18 (ref)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, v17.Global.Space_200)
            }), 
            ErrorReason = v2.createElement(v13, {
                text = v18.errorReason, 
                layoutOrder = 1
            }), 
            TryAgain = if v18.tryAgain then v2.createElement(v13, {
                text = v18.tryAgain, 
                layoutOrder = 2
            }) else nil
        });
    end;
    return v2.createElement(v9, {
        title = v18.title, 
        dismissCTA = v18.dismissCTA, 
        onDismiss = v16.onDismiss, 
        middleContent = v20
    });
end;