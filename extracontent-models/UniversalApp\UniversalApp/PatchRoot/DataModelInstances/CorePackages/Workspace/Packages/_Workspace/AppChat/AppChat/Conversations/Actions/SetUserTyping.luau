local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 5 ]]
    return {
        conversationId = v1, 
        userId = v2, 
        value = v3
    };
end);