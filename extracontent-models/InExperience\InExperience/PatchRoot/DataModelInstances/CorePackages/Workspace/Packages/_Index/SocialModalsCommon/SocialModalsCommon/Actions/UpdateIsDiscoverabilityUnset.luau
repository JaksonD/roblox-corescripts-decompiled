local l_Parent_0 = script:FindFirstAncestor("SocialModalsCommon").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 9 ]]
    assert(type(v1) == "table", string.format("UpdateIsDiscoverabilityUnset action expects params to be a table, was %s", (type(v1))));
    return v1;
end);