local l_ScriptProfilerService_0 = game:GetService("ScriptProfilerService");
local v1 = {};
v1.__index = v1;
v1.new = function(v2) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), l_ScriptProfilerService_0 (copy)
    local v3 = setmetatable({
        _data = nil
    }, v1);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 58 ]]
        -- upvalues: l_ScriptProfilerService_0 (ref), v2 (copy)
        return l_ScriptProfilerService_0:DeserializeJSON(v2);
    end);
    if l_status_0 then
        v3._data = l_result_0;
        return v3;
    else
        warn("[ProfilerDataParser] Failed to deserialize JSON:", l_result_0);
        return v3;
    end;
end;
v1.getFunctionById = function(v6, v7) --[[ Line: 72 ]] --[[ Name: getFunctionById ]]
    if not v6._data then
        return nil;
    else
        return v6._data.Functions[v7];
    end;
end;
v1.getNodeById = function(v8, v9) --[[ Line: 80 ]] --[[ Name: getNodeById ]]
    local l__data_0 = v8._data;
    if not l__data_0 then
        return nil;
    else
        return l__data_0.Nodes[v9];
    end;
end;
v1.getSessionDuration = function(v11) --[[ Line: 89 ]] --[[ Name: getSessionDuration ]]
    local l__data_1 = v11._data;
    if not l__data_1 then
        return nil;
    else
        local l_SessionStartTime_0 = l__data_1.SessionStartTime;
        local l_SessionEndTime_0 = l__data_1.SessionEndTime;
        if l_SessionStartTime_0 and l_SessionEndTime_0 then
            return l_SessionEndTime_0 - l_SessionStartTime_0;
        else
            return nil;
        end;
    end;
end;
v1.getTotalFunctions = function(v15) --[[ Line: 103 ]] --[[ Name: getTotalFunctions ]]
    if not v15._data then
        return 0;
    else
        return #v15._data.Functions;
    end;
end;
v1.getTotalNodes = function(v16) --[[ Line: 111 ]] --[[ Name: getTotalNodes ]]
    local l__data_2 = v16._data;
    if not l__data_2 then
        return 0;
    else
        return #l__data_2.Nodes;
    end;
end;
v1.parsePackageName = function(v18) --[[ Line: 127 ]] --[[ Name: parsePackageName ]]
    if not v18 or v18 == "" then
        return "Unknown";
    else
        local v19 = string.match(v18, "^CorePackages%.Packages%._Index%.([^%.%-]+)");
        if v19 then
            return v19;
        else
            v19 = string.match(v18, "^CorePackages%.Workspace%.Packages%._Workspace%.([^%.]+)");
            if v19 then
                return v19;
            elseif string.match(v18, "^CoreGui%.RobloxGui") then
                return v18:match("^CoreGui%.RobloxGui%.(.*)");
            elseif string.match(v18, "^Players%.") then
                if string.match(v18, "CameraModule") then
                    return "CameraModule";
                elseif string.match(v18, "ControlModule") then
                    return "ControlModule";
                else
                    return "Players";
                end;
            else
                return "Unknown";
            end;
        end;
    end;
end;
v1.getPackageStatistics = function(v20) --[[ Line: 167 ]] --[[ Name: getPackageStatistics ]]
    -- upvalues: v1 (copy)
    if not v20._data then
        return {};
    else
        local v21 = {};
        for _, v23 in v20._data.Categories do
            for _, v25 in v20._data.Nodes[v23.NodeId].Children do
                local v26 = v20._data.Nodes[v25];
                for v27, _ in v26.Children do
                    local v29 = tonumber(v27);
                    if v29 then
                        local v30 = v20._data.Functions[v29];
                        if v30 then
                            local v31 = v1.parsePackageName(v30.Source);
                            if v31 then
                                if not v21[v31] then
                                    v21[v31] = {
                                        count = 0, 
                                        totalDuration = 0
                                    };
                                end;
                                local v32 = v21[v31];
                                v32.count = v32.count + 1;
                                v32 = v21[v31];
                                v32.totalDuration = v32.totalDuration + v26.TotalDuration;
                                break;
                            else
                                break;
                            end;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                end;
            end;
        end;
        return v21;
    end;
end;
return v1;