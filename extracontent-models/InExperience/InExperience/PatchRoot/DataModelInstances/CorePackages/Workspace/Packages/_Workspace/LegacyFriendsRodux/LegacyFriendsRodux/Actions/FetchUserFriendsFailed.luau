local l_Parent_0 = script:FindFirstAncestor("LegacyFriendsRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 6 ]]
    return {
        userId = v1, 
        response = v2
    };
end);