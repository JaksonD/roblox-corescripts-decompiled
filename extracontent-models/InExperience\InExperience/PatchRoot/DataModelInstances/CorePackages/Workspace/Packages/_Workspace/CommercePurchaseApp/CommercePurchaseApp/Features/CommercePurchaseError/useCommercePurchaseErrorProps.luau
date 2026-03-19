local l_CommerceService_0 = game:GetService("CommerceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseEnded);
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectErrorCode);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectCommerceProductId);
local _ = require(l_script_FirstAncestor_0.Enums.ErrorCodeEnum);
local _ = require(script.Parent.CommercePurchaseError);
return function() --[[ Line: 15 ]] --[[ Name: useCommercePurchaseErrorProps ]]
    -- upvalues: l_useSelector_0 (copy), v7 (copy), v8 (copy), l_useDispatch_0 (copy), v3 (copy), l_CommerceService_0 (copy), v6 (copy)
    local v11 = l_useSelector_0(v7);
    local v12 = l_useSelector_0(v8);
    local v13 = l_useDispatch_0();
    return {
        onDismiss = v3.useCallback(function() --[[ Line: 20 ]]
            -- upvalues: l_CommerceService_0 (ref), v12 (copy), v13 (copy), v6 (ref)
            l_CommerceService_0:SignalPromptCommerceProductPurchaseFinished(v12, false);
            v13(v6());
        end, {
            v12, 
            v13
        }), 
        errorCode = v11
    };
end;