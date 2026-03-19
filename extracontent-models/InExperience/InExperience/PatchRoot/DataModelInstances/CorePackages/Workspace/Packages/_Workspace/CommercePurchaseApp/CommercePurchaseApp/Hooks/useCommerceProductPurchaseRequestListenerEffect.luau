local l_CommerceService_0 = game:GetService("CommerceService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CommercePurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_script_FirstAncestor_0.Enums.CommercePurchasePromptStateEnum);
local v8 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
local v9 = require(l_script_FirstAncestor_0.Store.Thunks.InitiateCommercePurchaseFlow);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAddCommerceErrors);
return function() --[[ Line: 15 ]] --[[ Name: useCommercePurchaseRequestListenerEffect ]]
    -- upvalues: l_useDispatch_0 (copy), l_useSelector_0 (copy), v8 (copy), l_useLocalization_0 (copy), v10 (copy), v3 (copy), l_CommerceService_0 (copy), v7 (copy), v9 (copy)
    local v11 = l_useDispatch_0();
    local v12 = l_useSelector_0(v8);
    local v13 = l_useLocalization_0({
        genericError = v10 and "CoreScripts.CommercePurchasePrompt.ErrorPrompt.Body.ErrorLoading" or "CoreScripts.CommercePurchasePrompt.ErrorPrompt.GenericError"
    });
    v3.useEffect(function() --[[ Line: 24 ]]
        -- upvalues: v11 (copy), l_CommerceService_0 (ref), v12 (copy), v7 (ref), v9 (ref), v13 (copy)
        local v14 = nil;
        if v11 then
            v14 = l_CommerceService_0.PromptCommerceProductPurchaseRequested:Connect(function(v15) --[[ Line: 28 ]]
                -- upvalues: v12 (ref), v7 (ref), v11 (ref), v9 (ref), v13 (ref)
                if v12 == v7.None then
                    v11(v9(v15, v13.genericError));
                end;
            end);
        end;
        return function() --[[ Line: 35 ]]
            -- upvalues: v14 (ref)
            if v14 then
                v14:Disconnect();
                v14 = nil;
            end;
        end;
    end, {
        v11, 
        v13
    });
end;