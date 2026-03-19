local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3, v4) --[[ Line: 15 ]]
    return {
        userId = tostring(v1), 
        username = v2, 
        displayName = v3, 
        hasVerifiedBadge = v4
    };
end);