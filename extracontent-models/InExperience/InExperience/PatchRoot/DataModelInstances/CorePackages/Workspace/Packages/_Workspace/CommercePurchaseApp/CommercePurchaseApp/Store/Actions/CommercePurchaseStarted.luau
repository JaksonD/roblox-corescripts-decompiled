local l_Parent_0 = script:FindFirstAncestor("CommercePurchaseApp").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("CommercePurchaseStarted", function(v1) --[[ Line: 10 ]]
    return {
        commerceProductId = v1
    };
end);