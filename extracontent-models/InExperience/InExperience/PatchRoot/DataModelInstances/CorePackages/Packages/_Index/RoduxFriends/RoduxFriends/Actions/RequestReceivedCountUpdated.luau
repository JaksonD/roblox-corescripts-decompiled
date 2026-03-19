local l_Parent_0 = script:FindFirstAncestor("RoduxFriends").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "number", "Request count must be a number");
    return {
        payload = {
            count = v1
        }
    };
end);