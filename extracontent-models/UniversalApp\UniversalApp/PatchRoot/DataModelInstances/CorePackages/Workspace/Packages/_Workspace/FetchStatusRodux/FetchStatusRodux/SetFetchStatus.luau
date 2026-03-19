local l_Parent_0 = script:FindFirstAncestor("FetchStatusRodux").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 6 ]]
    return {
        fetchNamespace = v1, 
        fetchKey = v2, 
        fetchStatus = v3
    };
end);