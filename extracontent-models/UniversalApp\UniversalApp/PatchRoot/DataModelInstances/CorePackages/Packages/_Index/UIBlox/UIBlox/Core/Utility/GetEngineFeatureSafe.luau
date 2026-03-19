return function(v0) --[[ Line: 8 ]] --[[ Name: GetEngineFeatureSafe ]]
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
        -- upvalues: v0 (copy)
        return game:GetEngineFeature(v0);
    end);
    return l_status_0 and l_result_0;
end;