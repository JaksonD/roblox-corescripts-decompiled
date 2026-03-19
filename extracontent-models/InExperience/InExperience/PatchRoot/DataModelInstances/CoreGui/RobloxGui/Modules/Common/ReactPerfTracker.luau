local v0 = game:DefineFastInt("ReactPerfTrackerKibana", 0);
applicationId = function() --[[ Line: 47 ]] --[[ Name: applicationId ]]
    local l_AppStorageService_0 = game:GetService("AppStorageService");
    if not l_AppStorageService_0 then
        return nil;
    else
        local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem("AppInstallationId");
        local v3 = typeof(l_l_AppStorageService_0_Item_0);
        if v3 == "number" then
            return tonumber(l_l_AppStorageService_0_Item_0) or nil;
        elseif v3 == "string" then
            if string.len(l_l_AppStorageService_0_Item_0) <= 0 then
                return nil;
            else
                return (tonumber((string.sub(l_l_AppStorageService_0_Item_0, -string.len((tostring(1000)))))));
            end;
        else
            return nil;
        end;
    end;
end;
local l_v0_0 = v0;
if not (l_v0_0 > 0) then
    return nil;
else
    local v5 = math.random(0, 1000);
    local v6 = applicationId();
    if v6 ~= nil then
        v5 = (v6 + 327) % 1000;
    end;
    if v5 >= l_v0_0 then
        l_v0_0 = 0;
    end;
    if not (l_v0_0 > 0) then
        return nil;
    else
        local l_CorePackages_0 = game:GetService("CorePackages");
        local v8 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
        local v9 = require(l_CorePackages_0.Packages.ReactRoblox);
        local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
        local v11 = {
            eventName = "ReactCoreScriptPerformance", 
            backends = {
                v8.TelemetryBackends.Points
            }, 
            throttlingPercentage = 10000, 
            lastUpdated = {
                24, 
                10, 
                4
            }, 
            description = "Reporting the time utilization of React in CoreScripts", 
            links = ""
        };
        local v12 = {};
        v12.__index = v12;
        v12.new = function() --[[ Line: 117 ]] --[[ Name: new ]]
            -- upvalues: v8 (copy), v12 (copy)
            return (setmetatable({
                totalTime = 0, 
                componentTotalTime = {}, 
                componentMaxTime = {}, 
                componentCount = {}, 
                sampleCount = 0, 
                loggingProtocol = v8.default, 
                outgoingEvents = {}, 
                nextSendTime = 0, 
                previousSendTime = 0
            }, v12));
        end;
        v12.start = function(v13) --[[ Line: 132 ]] --[[ Name: start ]]
            -- upvalues: v11 (copy), v9 (copy)
            v13.eventSender = coroutine.create(function() --[[ Line: 134 ]]
                -- upvalues: v13 (copy), v11 (ref)
                while true do
                    local v14 = table.remove(v13.outgoingEvents, 1);
                    if v14 then
                        wait();
                        v13.loggingProtocol:logRobloxTelemetryEvent(v11, {}, v14);
                    else
                        coroutine.yield();
                    end;
                end;
            end);
            v9.robloxReactProfiling.startTimerSampling(function(v15) --[[ Line: 147 ]]
                -- upvalues: v13 (copy)
                local l_id_0 = v15.id;
                local v17 = (v15.endTime - v15.startTime) * 1000;
                if not v13.componentTotalTime[l_id_0] then
                    v13.componentTotalTime[l_id_0] = 0;
                    v13.componentMaxTime[l_id_0] = 0;
                    v13.componentCount[l_id_0] = 0;
                end;
                local l_componentTotalTime_0 = v13.componentTotalTime;
                l_componentTotalTime_0[l_id_0] = l_componentTotalTime_0[l_id_0] + v17;
                l_componentTotalTime_0 = v13.componentCount;
                l_componentTotalTime_0[l_id_0] = l_componentTotalTime_0[l_id_0] + 1;
                l_componentTotalTime_0 = v13;
                l_componentTotalTime_0.sampleCount = l_componentTotalTime_0.sampleCount + 1;
                l_componentTotalTime_0 = v13;
                l_componentTotalTime_0.totalTime = l_componentTotalTime_0.totalTime + v17;
                v13.componentMaxTime[l_id_0] = math.max(v13.componentMaxTime[l_id_0], v17);
                if v15.startTime >= v13.nextSendTime then
                    if v13.nextSendTime > 0 then
                        v13:sendEvents();
                    end;
                    v13.previousSendTime = v13.nextSendTime;
                    if v13.previousSendTime == 0 then
                        v13.previousSendTime = v15.startTime;
                    end;
                    v13.nextSendTime = v15.startTime + 30;
                end;
            end);
        end;
        v12.genEvents = function(v19) --[[ Line: 180 ]] --[[ Name: genEvents ]]
            -- upvalues: l_RbxAnalyticsService_0 (copy)
            local v20 = 0;
            for v21, _ in v19.componentCount do
                v20 = v20 + 1;
                table.insert(v19.outgoingEvents, {
                    sessionid = if l_RbxAnalyticsService_0 then l_RbxAnalyticsService_0:GetSessionId() else "", 
                    component = v21, 
                    time_ms_max = v19.componentMaxTime[v21], 
                    time_ms_avg = v19.componentTotalTime[v21] / v19.componentCount[v21], 
                    total_time_ms = v19.componentTotalTime[v21], 
                    total_time_pct = v19.componentTotalTime[v21] / v19.totalTime, 
                    count = v19.componentCount[v21], 
                    count_pct = v19.componentCount[v21] / v19.sampleCount
                });
            end;
            table.insert(v19.outgoingEvents, 1, {
                summary_sessionid = if l_RbxAnalyticsService_0 then l_RbxAnalyticsService_0:GetSessionId() else "", 
                summary_total_time_ms = v19.totalTime, 
                summary_sample_time_s = v19.nextSendTime - v19.previousSendTime, 
                summary_num_components = v20, 
                summary_sample_count = v19.sampleCount
            });
        end;
        v12.sendEvents = function(v23) --[[ Line: 206 ]] --[[ Name: sendEvents ]]
            if v23.sampleCount == 0 then
                return;
            else
                v23:genEvents();
                v23:resetCounts();
                coroutine.resume(v23.eventSender);
                return;
            end;
        end;
        v12.resetCounts = function(v24) --[[ Line: 218 ]] --[[ Name: resetCounts ]]
            v24.componentTotalTime = {};
            v24.componentMaxTime = {};
            v24.componentCount = {};
            v24.sampleCount = 0;
            v24.totalTime = 0;
        end;
        return v12;
    end;
end;