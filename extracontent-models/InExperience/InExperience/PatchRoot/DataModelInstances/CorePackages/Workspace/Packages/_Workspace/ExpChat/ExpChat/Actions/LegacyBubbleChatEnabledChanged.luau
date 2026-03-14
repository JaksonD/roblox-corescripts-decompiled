local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 10 ]]
    return {
        value = v1
    };
end);