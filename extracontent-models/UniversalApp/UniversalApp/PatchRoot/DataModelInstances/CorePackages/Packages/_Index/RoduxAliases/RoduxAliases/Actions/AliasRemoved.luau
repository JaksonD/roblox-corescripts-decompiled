local l_Parent_0 = script:FindFirstAncestor("RoduxAliases").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        payload = {
            userId = v1
        }
    };
end);