local l_Parent_0 = script:FindFirstAncestor("Http").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 11 ]]
    return {
        fetchingStatuses = v1, 
        shouldImmediatelyDispatch = v2 or false
    };
end);