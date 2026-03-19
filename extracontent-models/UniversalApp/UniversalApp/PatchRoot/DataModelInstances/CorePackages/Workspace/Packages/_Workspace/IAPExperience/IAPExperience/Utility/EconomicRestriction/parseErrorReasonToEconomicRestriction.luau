return function(v0) --[[ Line: 1 ]] --[[ Name: parseErrorReasonToEconomicRestriction ]]
    local v1 = string.split(v0, "/");
    local v2 = #v1;
    return {
        timeoutMinutes = v1[v2], 
        violationType = v1[v2 - 1]
    };
end;