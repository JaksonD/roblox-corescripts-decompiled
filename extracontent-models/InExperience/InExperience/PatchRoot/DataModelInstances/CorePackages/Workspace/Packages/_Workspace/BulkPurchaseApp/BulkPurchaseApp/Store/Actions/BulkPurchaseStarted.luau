local l_Parent_0 = script:FindFirstAncestor("BulkPurchaseApp").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("BulkPurchaseStarted", function(v1) --[[ Line: 10 ]]
    return {
        balance = v1
    };
end);