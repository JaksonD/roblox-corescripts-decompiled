local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Toast_0 = v2.App.Dialog.Toast;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = v2.App.ImageSet.Images["icons/logo/block"];
local v6 = {
    heading = "CoreScripts.CancelUserSubscriptionPrompt.SuccessPrompt.Heading"
};
return function(v7) --[[ Line: 17 ]] --[[ Name: CancelUserSubscriptionSuccessPrompt ]]
    -- upvalues: l_useLocalization_0 (copy), v6 (copy), v1 (copy), l_Toast_0 (copy), v5 (copy)
    local v8 = l_useLocalization_0(v6);
    return v1.createElement(l_Toast_0, {
        toastContent = {
            toastTitle = v8.heading, 
            iconImage = v5, 
            onAppeared = function() --[[ Line: 23 ]] --[[ Name: onAppeared ]]

            end, 
            onDismissed = v7.onDismissed or function() --[[ Line: 24 ]]

            end, 
            swipeUpDismiss = true
        }, 
        anchorPoint = Vector2.new(0.5, 0), 
        duration = 3, 
        layoutOrder = 1, 
        position = UDim2.new(0.5, 0, 0, 20), 
        size = UDim2.new(0.5, -24, 0, 0), 
        show = true
    });
end;