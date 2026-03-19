local l_Parent_0 = script:FindFirstAncestor("RoduxSquads").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        payload = {
            experienceInvite = v1
        }
    };
end);