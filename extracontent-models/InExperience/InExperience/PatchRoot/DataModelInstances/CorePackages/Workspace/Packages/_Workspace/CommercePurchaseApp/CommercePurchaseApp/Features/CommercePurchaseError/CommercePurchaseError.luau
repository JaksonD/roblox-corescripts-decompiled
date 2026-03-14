local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useScreenSize_0 = require(l_Parent_0.EconomyCommonCoreScriptHooks).useScreenSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_InteractiveAlert_0 = v5.App.Dialog.Alert.InteractiveAlert;
local v8 = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAddCommerceErrors);
local v10 = {
    [v8.NotPurchasable] = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.NotPurchasable"
};
local v11 = {
    [v8.NotPurchasable] = {
        title = "CoreScripts.CommercePurchasePrompt.ProductNotAvailable", 
        reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.NotPurchasable"
    }, 
    [v8.DeviceNotSupported] = {
        title = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Title.DeviceNotSupported", 
        reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.DeviceNotSupported"
    }, 
    [v8.AccountNotSupported] = {
        title = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Title.AccountNotSupported", 
        reason = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.AccountNotSupported"
    }
};
return function(v12) --[[ Line: 39 ]] --[[ Name: CommercePurchaseError ]]
    -- upvalues: l_useScreenSize_0 (copy), l_useLocalization_0 (copy), v9 (copy), v11 (copy), v10 (copy), v2 (copy), l_InteractiveAlert_0 (copy), l_Images_0 (copy)
    local v13 = l_useScreenSize_0();
    local v14 = l_useLocalization_0({
        title = if v9 then v11[v12.errorCode].title else "CoreScripts.CommercePurchasePrompt.ErrorPrompt.CantBuy", 
        errorReason = if v9 then v11[v12.errorCode].reason else v10[v12.errorCode], 
        dismissCTA = "CoreScripts.CommercePurchasePrompt.ErrorPrompt.DismissCTA"
    });
    return v2.createElement(l_InteractiveAlert_0, {
        title = v14.title, 
        titleIcon = l_Images_0["icons/status/error_large"], 
        bodyText = v14.errorReason, 
        buttonStackInfo = {
            buttons = {
                {
                    props = {
                        onActivated = v12.onDismiss, 
                        text = v14.dismissCTA
                    }, 
                    isDefaultChild = true
                }
            }
        }, 
        position = UDim2.fromScale(0.5, 0.5), 
        screenSize = v13
    });
end;