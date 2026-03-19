local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 5 ]]
    return {
        payload = {
            userId1 = v1, 
            userId2 = v2
        }
    };
end);