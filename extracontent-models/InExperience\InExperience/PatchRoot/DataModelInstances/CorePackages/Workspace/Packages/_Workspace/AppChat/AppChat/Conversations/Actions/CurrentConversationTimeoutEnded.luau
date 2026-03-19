local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 10 ]]
    return {
        conversationId = v1
    };
end);