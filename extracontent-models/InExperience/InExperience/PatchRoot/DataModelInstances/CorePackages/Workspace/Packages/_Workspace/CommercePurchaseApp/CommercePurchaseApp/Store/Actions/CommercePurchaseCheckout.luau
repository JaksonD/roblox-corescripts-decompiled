local l_Parent_0 = script:FindFirstAncestor("CommercePurchaseApp").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("CommercePurchaseCheckout", function(v1) --[[ Line: 10 ]]
    return {
        checkoutSessionId = v1
    };
end);