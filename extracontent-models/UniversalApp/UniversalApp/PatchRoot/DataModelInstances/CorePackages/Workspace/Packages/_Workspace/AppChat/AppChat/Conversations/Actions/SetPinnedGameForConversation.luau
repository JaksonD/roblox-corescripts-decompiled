local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 6 ]]
    return {
        universeId = v1, 
        rootPlaceId = v2, 
        conversationId = v3
    };
end);