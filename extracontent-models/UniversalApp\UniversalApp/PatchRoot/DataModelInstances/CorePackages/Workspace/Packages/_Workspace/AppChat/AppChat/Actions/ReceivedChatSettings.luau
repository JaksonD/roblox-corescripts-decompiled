local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 6 ]]
    assert(type(v1) == "table", script.Name .. ": result must be a table");
    return {
        result = v1
    };
end);