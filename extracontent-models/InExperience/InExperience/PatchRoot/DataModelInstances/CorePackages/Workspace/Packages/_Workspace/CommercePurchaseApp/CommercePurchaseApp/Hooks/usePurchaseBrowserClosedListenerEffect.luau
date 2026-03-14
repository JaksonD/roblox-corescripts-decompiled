local l_CommerceService_0 = game:GetService("CommerceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v6 = require(l_script_FirstAncestor_0.Enums.CommercePurchasePromptStateEnum);
local v7 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectCommerceProductId);
local v9 = require(l_script_FirstAncestor_0.Store.Selectors.selectCheckoutSessionId);
local v10 = require(l_script_FirstAncestor_0.Store.Actions.CommercePurchaseEnded);
return function() --[[ Line: 16 ]] --[[ Name: usePurchaseBrowserClosedListenerEffect ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v7 (copy), v8 (copy), v9 (copy), v3 (copy), l_CommerceService_0 (copy), v6 (copy), v10 (copy)
    local v11 = l_useDispatch_0();
    local v12 = l_useSelector_0(v7);
    local v13 = l_useSelector_0(v8);
    local v14 = l_useSelector_0(v9);
    v3.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v11 (copy), l_CommerceService_0 (ref), v12 (copy), v6 (ref), v13 (copy), v14 (copy), v10 (ref)
        local v15 = nil;
        if v11 then
            v15 = l_CommerceService_0.PurchaseBrowserClosed:Connect(function() --[[ Line: 24 ]]
                -- upvalues: v12 (ref), v6 (ref), l_CommerceService_0 (ref), v13 (ref), v14 (ref), v11 (ref), v10 (ref)
                if v12 == v6.Checkout then
                    l_CommerceService_0:SignalPromptCommerceProductPurchaseFinished(v13, true, v14);
                    v11(v10());
                end;
            end);
        end;
        return function() --[[ Line: 35 ]]
            -- upvalues: v15 (ref)
            if v15 then
                v15:Disconnect();
                v15 = nil;
            end;
        end;
    end, {
        v11, 
        v12, 
        v13, 
        v14
    });
end;