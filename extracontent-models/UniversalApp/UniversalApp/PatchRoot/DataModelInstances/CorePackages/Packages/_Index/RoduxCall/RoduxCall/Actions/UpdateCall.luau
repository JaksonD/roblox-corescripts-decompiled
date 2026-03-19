local l_Parent_0 = script:FindFirstAncestor("RoduxCall").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        payload = {
            call = v1
        }
    };
end);