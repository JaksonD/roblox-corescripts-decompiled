local l_Parent_0 = script:FindFirstAncestor("PlayabilityRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 18 ]]
    assert(type(v1) == "table", "SetPlayabilityStatus action expects playabilityStatus to be a table");
    return {
        playabilityStatus = v1
    };
end);