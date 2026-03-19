local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("TimeToInteractiveTracker");
local _ = require(l_script_FirstAncestor_0.Stores.types);
local _ = require(l_script_FirstAncestor_0.Milestones.types);
return {
    findLastMilestoneIndex = function(v4, v5) --[[ Line: 29 ]] --[[ Name: findLastMilestoneIndex ]]
        for v6 = #v4, 1, -1 do
            if v4[v6].name == v5 then
                return v6;
            end;
        end;
        return nil;
    end, 
    deepCloneMilestones = function(v7) --[[ Line: 38 ]] --[[ Name: deepCloneMilestones ]]
        local v8 = table.clone(v7);
        for v9, v10 in v8 do
            local v11 = table.clone(v10);
            if v11.subphases then
                local v12 = table.clone(v11.subphases);
                for v13, v14 in v12 do
                    v12[v13] = table.clone(v14);
                end;
                v11.subphases = v12;
            end;
            if v11.requests then
                local v15 = table.clone(v11.requests);
                for v16, v17 in v15 do
                    v15[v16] = table.clone(v17);
                end;
                v11.requests = v15;
            end;
            v8[v9] = v11;
        end;
        return v8;
    end, 
    encodeMilestonesJSON = function(v18) --[[ Line: 61 ]] --[[ Name: encodeMilestonesJSON ]]
        -- upvalues: l_HttpService_0 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 62 ]]
            -- upvalues: l_HttpService_0 (ref), v18 (copy)
            return l_HttpService_0:JSONEncode(v18);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return nil;
        end;
    end, 
    milestonesToProto = function(v21) --[[ Line: 77 ]] --[[ Name: milestonesToProto ]]
        local v22 = {};
        for _, v24 in v21 do
            local v25 = {
                name = v24.name, 
                timestamp_seconds = v24.timestamp, 
                delta_ms = v24.deltaMs
            };
            if v24.id then
                v25.id = v24.id;
            end;
            if v24.subphases then
                local v26 = {};
                for _, v28 in v24.subphases do
                    table.insert(v26, {
                        name = v28.name, 
                        timestamp_seconds = v28.timestamp, 
                        delta_ms = v28.deltaMs or 0
                    });
                end;
                v25.subphases = v26;
            end;
            if v24.requests then
                local v29 = {};
                for _, v31 in v24.requests do
                    table.insert(v29, {
                        name = v31.name, 
                        timestamp_seconds = v31.timestamp, 
                        delta_ms = v31.deltaMs or 0
                    });
                end;
                v25.requests = v29;
            end;
            table.insert(v22, v25);
        end;
        return v22;
    end, 
    generateMilestoneStats = function(v32, v33) --[[ Line: 141 ]] --[[ Name: generateMilestoneStats ]]
        local v34 = {};
        for _, v36 in v33 do
            local v37 = v32 .. "_" .. if v36.id then v36.name .. "__" .. v36.id else v36.name;
            table.insert(v34, {
                eventName = v37, 
                deltaMs = v36.deltaMs
            });
            if v36.subphases then
                for _, v39 in v36.subphases do
                    table.insert(v34, {
                        eventName = v37 .. "_sp_" .. v39.name, 
                        deltaMs = v39.deltaMs or 0
                    });
                end;
            end;
            if v36.requests then
                for _, v41 in v36.requests do
                    table.insert(v34, {
                        eventName = v37 .. "_rq_" .. v41.name, 
                        deltaMs = v41.deltaMs or 0
                    });
                end;
            end;
        end;
        return v34;
    end
};