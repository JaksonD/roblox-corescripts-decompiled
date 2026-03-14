local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 12 ]]
    return {
        name = v1, 
        primaryAlias = v2, 
        secondaryAlias = v3
    };
end);