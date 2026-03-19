local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2, v3) --[[ Line: 12 ]]
    return {
        userId = tostring(v1), 
        character = v2, 
        humanoid = v3
    };
end);