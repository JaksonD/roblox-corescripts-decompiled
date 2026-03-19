local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "string", string.format("SetFetchHomePageDataStatusAll action expects status to be an string, was %s", (type(v1))));
    return {
        status = v1
    };
end);