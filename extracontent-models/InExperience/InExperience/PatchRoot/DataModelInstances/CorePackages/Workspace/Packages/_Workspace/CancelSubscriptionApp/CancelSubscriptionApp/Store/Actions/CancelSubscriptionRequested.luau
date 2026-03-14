local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("CancelSubscriptionRequested", function(v1) --[[ Line: 10 ]]
    return {
        subscriptionId = v1
    };
end);