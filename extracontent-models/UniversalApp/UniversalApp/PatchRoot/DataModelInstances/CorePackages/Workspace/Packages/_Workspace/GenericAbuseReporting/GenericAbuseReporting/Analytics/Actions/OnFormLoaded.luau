local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
return require(l_Parent_0.Rodux).makeActionCreator(script.Name, function(v1) --[[ Line: 15 ]]
    return {
        context = v1.context, 
        place_id = v1.place_id, 
        accumulated_time_ms = v1.accumulated_time_ms
    };
end);