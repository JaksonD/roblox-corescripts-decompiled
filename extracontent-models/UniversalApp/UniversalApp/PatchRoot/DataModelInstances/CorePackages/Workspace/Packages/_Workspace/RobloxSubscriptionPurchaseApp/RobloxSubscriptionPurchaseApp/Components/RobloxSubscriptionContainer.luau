local l_script_FirstAncestor_0 = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_script_FirstAncestor_0.Enums.PromptState);
local v5 = require(l_script_FirstAncestor_0.Store.RobloxSubscriptionStore);
local v6 = require(l_script_FirstAncestor_0.Actions.completeRobloxSubscriptionUpsellFlow);
local v7 = require(l_Parent_0.SignalsReact);
local v8 = require(l_script_FirstAncestor_0.Hooks.useNativePurchaseFinishedListener);
local v9 = require(l_script_FirstAncestor_0.Hooks.useRobloxSubscriptionChangedListener);
local v10 = require(l_script_FirstAncestor_0.Hooks.useSubscriptionPollingTimeoutGuard);
local l_Sheet_0 = v3.Sheet;
local l_DialogSize_0 = v3.Enums.DialogSize;
local v13 = require(script.Parent.BlackbirdSheetContent);
local v14 = require(script.Parent.ErrorSheetContent);
local v15 = {
    [v4.Error] = true
};
local v16 = {
    [v4.SubscriptionPurchaseUIReady] = true, 
    [v4.SubscriptionPurchaseInProgress] = true, 
    [v4.SubscriptionStatusPolling] = true, 
    [v4.Error] = true
};
return function() --[[ Line: 46 ]] --[[ Name: RobloxSubscriptionContainer ]]
    -- upvalues: v5 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy), v2 (copy), l_Sheet_0 (copy), v6 (copy), l_DialogSize_0 (copy)
    local v17 = v5.get();
    local v18 = v7.useSignalState(v17.getPromptState);
    v8();
    v9();
    v10();
    local v19 = v13();
    local v20 = v14();
    local v21 = if v15[v18] == true then v20 else v19;
    return v16[v18] == true and v2.createElement(l_Sheet_0.Root, {
        onClose = function() --[[ Line: 66 ]] --[[ Name: onClose ]]
            -- upvalues: v6 (ref)
            v6();
        end, 
        preferCenterSheet = true, 
        size = l_DialogSize_0.Medium
    }, {
        Header = v21.Header, 
        Content = v21.Content, 
        Actions = v21.Actions
    }) or nil;
end;