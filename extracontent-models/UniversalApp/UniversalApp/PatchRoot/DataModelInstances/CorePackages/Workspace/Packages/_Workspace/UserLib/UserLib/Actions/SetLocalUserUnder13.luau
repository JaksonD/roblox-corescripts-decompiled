local l_Parent_0 = script:FindFirstAncestor("UserLib").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 6 ]]
    return {
        isUnder13 = v1
    };
end);