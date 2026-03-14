local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 6 ]]
    return {
        userId = tostring(v1), 
        presence = v2, 
        lastLocation = v3
    };
end);