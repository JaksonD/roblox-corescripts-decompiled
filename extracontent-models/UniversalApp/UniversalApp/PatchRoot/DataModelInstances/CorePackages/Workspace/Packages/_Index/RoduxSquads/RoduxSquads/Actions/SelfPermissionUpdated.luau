local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 6 ]]
    return {
        payload = {
            selfPermissions = v1
        }
    };
end);