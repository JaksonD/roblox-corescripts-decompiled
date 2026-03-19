local l_Parent_0 = script:FindFirstAncestor("CancelSubscriptionApp").Parent;
return require(l_Parent_0.Rodux).makeActionCreator("CancelSubscriptionSucceeded", function(v1) --[[ Line: 10 ]]
    return {
        subscriptionId = v1
    };
end);