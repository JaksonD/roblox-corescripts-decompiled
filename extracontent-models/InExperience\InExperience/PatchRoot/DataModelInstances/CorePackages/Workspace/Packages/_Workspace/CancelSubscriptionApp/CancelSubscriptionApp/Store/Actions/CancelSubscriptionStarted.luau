local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("CancelSubscriptionStarted", function(v1, v2) --[[ Line: 11 ]]
    return {
        subscriptionId = v1, 
        expirationDate = v2
    };
end);