local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        ids = v1
    };
end);