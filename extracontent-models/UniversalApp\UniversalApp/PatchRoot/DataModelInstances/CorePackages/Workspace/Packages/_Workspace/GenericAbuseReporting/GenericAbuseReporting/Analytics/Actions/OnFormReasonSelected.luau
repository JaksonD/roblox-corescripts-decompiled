local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 13 ]]
    return {
        reason_selection = v1.reason_selection
    };
end);