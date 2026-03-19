local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 6 ]]
    return {
        userId = tostring(v1), 
        displayName = v2
    };
end);