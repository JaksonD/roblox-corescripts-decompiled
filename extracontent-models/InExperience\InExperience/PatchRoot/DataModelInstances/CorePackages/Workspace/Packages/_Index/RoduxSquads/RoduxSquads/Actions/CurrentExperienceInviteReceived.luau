local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 7 ]]
    return {
        payload = {
            experienceInviteId = v1, 
            membershipEntityId = v2, 
            notificationId = v3, 
            isInviter = v4
        }
    };
end);