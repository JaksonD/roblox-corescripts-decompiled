return function(v0) --[[ Line: 1 ]]
    return function(v1, v2) --[[ Line: 2 ]]
        -- upvalues: v0 (copy)
        local v3 = v0.eventList[v1];
        v0.diagImpl:reportStats(v3.name, v2.loadingTime);
    end;
end;