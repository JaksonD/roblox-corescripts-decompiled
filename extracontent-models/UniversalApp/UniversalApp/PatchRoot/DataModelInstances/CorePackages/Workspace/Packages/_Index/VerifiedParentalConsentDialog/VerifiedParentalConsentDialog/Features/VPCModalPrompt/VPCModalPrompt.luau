local l_script_FirstAncestor_0 = script:FindFirstAncestor("VerifiedParentalConsentDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = require(l_script_FirstAncestor_0.Components.AlertPrompt);
local _ = require(l_script_FirstAncestor_0.VPCModalType);
return function(v7) --[[ Line: 22 ]] --[[ Name: VPCModalPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v5 (copy), l_Images_0 (copy)
    local v8 = {
        EnablePurchase = {
            v7.isActionable and "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithSettings" or "Common.VerifiedParentalConsent.Description.SpendingRestrictionWithoutSettings"
        }
    };
    local v9 = l_useLocalization_0({
        title = "Common.VerifiedParentalConsent.Label.AskParent", 
        message = v8[v7.modalType]
    });
    return v2.createElement(v5, {
        title = v9.title, 
        titleIcon = l_Images_0["icons/graphic/lock_xxlarge"], 
        bodyText = v9.message, 
        onDismiss = v7.onDismiss, 
        isActionable = v7.isActionable, 
        screenSize = v7.screenSize, 
        onAction = v7.onAction
    });
end;