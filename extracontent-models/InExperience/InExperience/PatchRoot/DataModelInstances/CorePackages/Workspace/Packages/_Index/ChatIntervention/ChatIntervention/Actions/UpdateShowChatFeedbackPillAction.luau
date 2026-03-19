local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChatIntervention");
return require(l_script_FirstAncestor_0.Parent.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 9 ]]
    return {
        isShow = v1
    };
end);