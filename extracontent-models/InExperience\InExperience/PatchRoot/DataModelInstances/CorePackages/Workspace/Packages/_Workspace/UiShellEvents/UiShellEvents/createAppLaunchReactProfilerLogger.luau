local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.LoggingProtocol);
local l_isReactProfilingEnabled_0 = require(l_Parent_0.RoactUtils).Profiling.isReactProfilingEnabled;
local v5 = game:DefineFastFlag("SupportTerminalMilestoneInReactProfilerLogger", false);
local v6 = game:DefineFastInt("AppLaunchReactProfilerLoggerCollectionTimeoutSec", 30);
local v7 = game:DefineFastString("SupportedAppLaunchMilestonesForReactProfilerLogger", "lua_app_starter_script_requires_end,fetch_homepage_data_begin,fetch_homepage_data_end,home_page_interactive");
local _ = function() --[[ Line: 20 ]] --[[ Name: getSupportedMilestones ]]
    -- upvalues: v7 (copy)
    local v8 = {};
    for _, v10 in (v7:split(",")) do
        v8[v10] = true;
    end;
    return v8;
end;
local v12 = {
    eventName = "AppLaunchReactProfilerUpdateCount", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        2, 
        25
    }, 
    throttlingPercentage = 0
};
local v13 = {
    eventName = "AppLaunchReactProfilerRenderDuration", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        2, 
        25
    }, 
    throttlingPercentage = 0
};
local v14 = {
    eventName = "AppLaunchReactProfilerCommitDuration", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        2, 
        25
    }, 
    throttlingPercentage = 0
};
local v15 = {
    eventName = "AppLaunchReactProfilerExclusiveRenderDuration", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        2, 
        25
    }, 
    throttlingPercentage = 0
};
local v16 = {
    eventName = "AppLaunchReactProfilerExclusiveCommitDuration", 
    backends = {
        "RobloxTelemetryStat"
    }, 
    lastUpdated = {
        2025, 
        2, 
        25
    }, 
    throttlingPercentage = 0
};
local function v20(v17) --[[ Line: 81 ]] --[[ Name: logProfilerData ]]
    -- upvalues: l_TelemetryService_0 (copy), v12 (copy), v13 (copy), v14 (copy), v15 (copy), v16 (copy)
    if next(v17) == nil then
        return;
    else
        for _, v19 in v17 do
            l_TelemetryService_0:LogStat(v12, {
                customFields = {
                    profilerId = v19.profilerId, 
                    milestoneName = v19.milestoneName
                }
            }, v19.updateCount);
            l_TelemetryService_0:LogStat(v13, {
                customFields = {
                    profilerId = v19.profilerId, 
                    milestoneName = v19.milestoneName
                }
            }, v19.renderDuration);
            l_TelemetryService_0:LogStat(v14, {
                customFields = {
                    profilerId = v19.profilerId, 
                    milestoneName = v19.milestoneName
                }
            }, v19.commitDuration);
            l_TelemetryService_0:LogStat(v15, {
                customFields = {
                    profilerId = v19.profilerId, 
                    milestoneName = v19.milestoneName
                }
            }, v19.exclusiveRenderDuration);
            l_TelemetryService_0:LogStat(v16, {
                customFields = {
                    profilerId = v19.profilerId, 
                    milestoneName = v19.milestoneName
                }
            }, v19.exclusiveCommitDuration);
        end;
        return;
    end;
end;
local function _(v21, v22) --[[ Line: 120 ]] --[[ Name: createProfilerData ]]
    return {
        profilerId = v21, 
        milestoneName = v22, 
        updateCount = 0, 
        renderDuration = 0, 
        commitDuration = 0, 
        exclusiveRenderDuration = 0, 
        exclusiveCommitDuration = 0
    };
end;
local function _(v24, v25) --[[ Line: 133 ]] --[[ Name: updateProfilerData ]]
    v24.updateCount = v24.updateCount + 1;
    v24.renderDuration = v24.renderDuration + v25.render.duration;
    v24.commitDuration = v24.commitDuration + v25.commit.duration;
    v24.exclusiveRenderDuration = v24.exclusiveRenderDuration + v25.render.exclusiveDuration;
    v24.exclusiveCommitDuration = v24.exclusiveCommitDuration + v25.commit.exclusiveDuration;
end;
return function(v27, v28) --[[ Line: 141 ]] --[[ Name: createAppLaunchReactProfilerLogger ]]
    -- upvalues: l_isReactProfilingEnabled_0 (copy), v5 (copy), v7 (copy), v3 (copy), v6 (copy), v20 (copy)
    if not l_isReactProfilingEnabled_0 then
        return;
    else
        local v29 = {};
        local v30 = {};
        local function v44() --[[ Line: 153 ]] --[[ Name: correlateProfilerData ]]
            -- upvalues: v29 (ref), v30 (ref)
            local v31 = {};
            for v32, v33 in v29 do
                local v34 = #v33;
                local v35 = #v30;
                local v36 = 1;
                local v37 = 1;
                local v38 = nil;
                local v39 = {
                    profilerId = v32, 
                    milestoneName = "aggregate", 
                    updateCount = 0, 
                    renderDuration = 0, 
                    commitDuration = 0, 
                    exclusiveRenderDuration = 0, 
                    exclusiveCommitDuration = 0
                };
                while v36 <= v34 and v37 <= v35 do
                    local v40 = v33[v36];
                    local v41 = v30[v37];
                    if v38 == nil then
                        local l_eventName_0 = v41.eventName;
                        v38 = {
                            profilerId = v32, 
                            milestoneName = l_eventName_0, 
                            updateCount = 0, 
                            renderDuration = 0, 
                            commitDuration = 0, 
                            exclusiveRenderDuration = 0, 
                            exclusiveCommitDuration = 0
                        };
                    end;
                    if v40.render.startTime < v41.eventTime then
                        local l_v38_0 = v38;
                        l_v38_0.updateCount = l_v38_0.updateCount + 1;
                        l_v38_0.renderDuration = l_v38_0.renderDuration + v40.render.duration;
                        l_v38_0.commitDuration = l_v38_0.commitDuration + v40.commit.duration;
                        l_v38_0.exclusiveRenderDuration = l_v38_0.exclusiveRenderDuration + v40.render.exclusiveDuration;
                        l_v38_0.exclusiveCommitDuration = l_v38_0.exclusiveCommitDuration + v40.commit.exclusiveDuration;
                        v39.updateCount = v39.updateCount + 1;
                        v39.renderDuration = v39.renderDuration + v40.render.duration;
                        v39.commitDuration = v39.commitDuration + v40.commit.duration;
                        v39.exclusiveRenderDuration = v39.exclusiveRenderDuration + v40.render.exclusiveDuration;
                        v39.exclusiveCommitDuration = v39.exclusiveCommitDuration + v40.commit.exclusiveDuration;
                        v36 = v36 + 1;
                    else
                        if v38.updateCount > 0 then
                            table.insert(v31, v38);
                        end;
                        v37 = v37 + 1;
                        v38 = nil;
                    end;
                end;
                if v38 and v38.updateCount > 0 then
                    table.insert(v31, v38);
                end;
                if v39.updateCount > 0 then
                    table.insert(v31, v39);
                end;
            end;
            v29 = {};
            v30 = {};
            return v31;
        end;
        local function _(v45) --[[ Line: 208 ]] --[[ Name: getOrCreateEventsForProfiler ]]
            -- upvalues: v29 (ref)
            local v46 = v29[v45];
            if v46 == nil then
                v46 = {};
                v29[v45] = v46;
            end;
            return v46;
        end;
        local v51 = v27.onRender:connect(function(v48) --[[ Line: 218 ]]
            -- upvalues: v29 (ref)
            local l_profilerId_0 = v48.profilerId;
            local v50 = v29[l_profilerId_0];
            if v50 == nil then
                v50 = {};
                v29[l_profilerId_0] = v50;
            end;
            table.insert(v50, {
                render = v48, 
                commit = {
                    profilerId = v48.profilerId, 
                    commitTime = v48.commitTime, 
                    duration = 0, 
                    exclusiveDuration = 0
                }
            });
        end);
        local v56 = v27.onCommit:connect(function(v52) --[[ Line: 234 ]]
            -- upvalues: v29 (ref)
            local l_profilerId_1 = v52.profilerId;
            local v54 = v29[l_profilerId_1];
            if v54 == nil then
                v54 = {};
                v29[l_profilerId_1] = v54;
            end;
            local l_v54_0 = v54;
            l_profilerId_1 = l_v54_0[#l_v54_0];
            if l_profilerId_1 ~= nil and l_profilerId_1.render.commitTime == v52.commitTime then
                l_profilerId_1.commit = v52;
                return;
            else
                warn("Profiler invariants are broken");
                return;
            end;
        end);
        local v57 = nil;
        if v5 then
            local v58 = {};
            for _, v60 in (v7:split(",")) do
                v58[v60] = true;
            end;
            local l_v58_0 = v58;
            local l_l_v58_0_0 = l_v58_0 --[[ copy: 9 -> 17 ]];
            v57 = v3.default:setDurationLoggerListener(function(v63) --[[ Line: 249 ]]
                -- upvalues: l_l_v58_0_0 (copy), v30 (ref), v28 (copy), v57 (ref)
                if l_l_v58_0_0[v63] then
                    local v64 = os.clock() * 1000;
                    table.insert(v30, {
                        eventName = v63, 
                        eventTime = v64
                    });
                end;
                if v28 ~= nil and v63 == v28 and v57 ~= nil then
                    v57:disconnect();
                    v57 = nil;
                end;
            end);
        else
            v57 = v3.default:setDurationLoggerListener(function(v65) --[[ Line: 266 ]]
                -- upvalues: v30 (ref)
                local v66 = os.clock() * 1000;
                table.insert(v30, {
                    eventName = v65, 
                    eventTime = v66
                });
            end);
        end;
        local function _() --[[ Line: 275 ]] --[[ Name: disconnectListeners ]]
            -- upvalues: v51 (ref), v56 (ref), v57 (ref)
            if v51 ~= nil then
                v51:disconnect();
                v51 = nil;
            end;
            if v56 ~= nil then
                v56:disconnect();
                v56 = nil;
            end;
            if v57 ~= nil then
                v57:disconnect();
                v57 = nil;
            end;
        end;
        task.delay(v6, function() --[[ Line: 290 ]]
            -- upvalues: v51 (ref), v56 (ref), v57 (ref), v44 (copy), v20 (ref)
            if v51 ~= nil then
                v51:disconnect();
                v51 = nil;
            end;
            if v56 ~= nil then
                v56:disconnect();
                v56 = nil;
            end;
            if v57 ~= nil then
                v57:disconnect();
                v57 = nil;
            end;
            local v68 = v44();
            v20(v68);
        end);
        return;
    end;
end;