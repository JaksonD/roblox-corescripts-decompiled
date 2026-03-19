local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local _ = require(l_script_FirstAncestor_0.Stores.types);
return {
    findLastMilestoneIndex = function(v2, v3) --[[ Line: 22 ]] --[[ Name: findLastMilestoneIndex ]]
        for v4 = #v2, 1, -1 do
            if v2[v4].name == v3 then
                return v4;
            end;
        end;
        return nil;
    end, 
    deepCloneMilestones = function(v5) --[[ Line: 31 ]] --[[ Name: deepCloneMilestones ]]
        local v6 = table.clone(v5);
        for v7, v8 in v6 do
            local v9 = table.clone(v8);
            if v9.subphases then
                local v10 = table.clone(v9.subphases);
                for v11, v12 in v10 do
                    v10[v11] = table.clone(v12);
                end;
                v9.subphases = v10;
            end;
            if v9.requests then
                local v13 = table.clone(v9.requests);
                for v14, v15 in v13 do
                    v13[v14] = table.clone(v15);
                end;
                v9.requests = v13;
            end;
            v6[v7] = v9;
        end;
        return v6;
    end
};