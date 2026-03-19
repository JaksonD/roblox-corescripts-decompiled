local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1, v2) --[[ Line: 10 ]]
    return {
        endTimestamp = v1, 
        isEnforced = v2
    };
end);