local l_Parent_0 = script:FindFirstAncestor("ExpChatShared").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 11 ]]
    return {
        textChannel = v1, 
        shouldReorderTabs = v2
    };
end);