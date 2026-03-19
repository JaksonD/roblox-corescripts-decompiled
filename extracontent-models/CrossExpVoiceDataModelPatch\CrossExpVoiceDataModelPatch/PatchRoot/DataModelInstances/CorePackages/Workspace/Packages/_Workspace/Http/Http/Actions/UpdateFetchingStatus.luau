local l_Parent_0 = script:FindFirstAncestor("Http").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 6 ]]
    return {
        key = v1, 
        status = v2
    };
end);