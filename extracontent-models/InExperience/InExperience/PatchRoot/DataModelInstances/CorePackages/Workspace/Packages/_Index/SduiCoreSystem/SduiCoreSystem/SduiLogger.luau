local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.LoggingProtocol);
local v4 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiErrors);
local v8 = game:DefineFastInt("DiscoverySduiErrorHundredthsPercent", 0);
local v9 = game:DefineFastInt("DiscoverySduiTimerEventsHundredthsPercent", 0);
local v10 = game:DefineFastInt("DiscoveryFeedStatsHundredthsPercent", 0);
local v11 = {
    eventName = "DiscoverySdui_ErrorDetails", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v8, 
    lastUpdated = {
        24, 
        11, 
        4
    }, 
    description = "Error details related to discovery server-driven ui", 
    links = ""
};
local v12 = {
    eventName = "DiscoverySdui_ErrorCounter", 
    backends = {
        v3.TelemetryBackends.Counter
    }, 
    throttlingPercentage = 0, 
    lastUpdated = {
        24, 
        12, 
        14
    }, 
    description = "Error related to discovery server-driven ui"
};
local v13 = {
    eventName = "DiscoverySdui_Timers", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v9, 
    lastUpdated = {
        25, 
        3, 
        14
    }, 
    description = "Timers related to discovery server-driven ui", 
    links = ""
};
local v14 = {
    eventName = "DiscoverySdui_FeedStats", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v10, 
    lastUpdated = {
        25, 
        5, 
        27
    }, 
    description = "Stats for feed response. Number of items per collection", 
    links = ""
};
local function _(v15, v16) --[[ Line: 68 ]] --[[ Name: makeErrorKey ]]
    return (("%*_%*_%*_%*_%*"):format(v15, v16.name, v16.componentType, v16.parserName, v16.propName));
end;
local v18 = {};
return {
    clearSeenErrors = function() --[[ Line: 74 ]] --[[ Name: clearSeenErrors ]]
        -- upvalues: v18 (ref)
        v18 = {};
    end, 
    reportError = function(v19, v20, v21, v22) --[[ Line: 78 ]] --[[ Name: reportError ]]
        -- upvalues: v3 (copy), v18 (ref), v12 (copy), v11 (copy), v2 (copy), v4 (copy)
        v22 = v22 or v3.default;
        assert(v22, "loggingProtocol must exist");
        local v23 = ("%*_%*_%*_%*_%*"):format(v19, v20.name, v20.componentType, v20.parserName, v20.propName);
        if v18[v23] then
            return;
        else
            v18[v23] = true;
            v22:logRobloxTelemetryCounter(v12, 1, {
                errorType = v19, 
                name = if v20 then v20.name else nil, 
                componentType = if v20 then v20.componentType else nil, 
                propName = if v20 then v20.propName else nil, 
                parserName = if v20 then v20.parserName else nil, 
                page = v21
            });
            v22:logRobloxTelemetryEvent(v11, {
                "addSessionInfo", 
                v3.StandardizedFields.addOsInfo
            }, v2.Dictionary.union({
                errorType = v19
            }, v20 or {}), v21);
            if not _G.__TESTEZ_RUNNING_TEST__ then
                warn((("Discovery server-driven ui error \n%* \n%*"):format(v19, (v4.toString(v20)))));
            end;
            return;
        end;
    end, 
    reportCounter = function(v24, v25, v26, v27) --[[ Line: 125 ]] --[[ Name: reportCounter ]]
        -- upvalues: v3 (copy), v4 (copy)
        v27 = v27 or v3.default;
        assert(v27, "loggingProtocol must exist");
        v27:logRobloxTelemetryCounter({
            eventName = ("DiscoverySdui_Counter_%*"):format(v24), 
            backends = {
                v3.TelemetryBackends.Counter
            }, 
            throttlingPercentage = 0, 
            lastUpdated = {
                25, 
                2, 
                5
            }, 
            description = "Counters related to discovery server-driven ui"
        }, 1, if v25 then {
            name = if v25 then v25.name else nil, 
            componentType = if v25 then v25.componentType else nil, 
            propName = if v25 then v25.propName else nil, 
            parserName = if v25 then v25.parserName else nil
        } else nil);
        if not v26 and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
            warn((("Discovery server-driven ui counter \n%* \n%*"):format(v24, (v4.toString(v25)))));
        end;
    end, 
    reportTimers = function(v28, v29, v30) --[[ Line: 161 ]] --[[ Name: reportTimers ]]
        -- upvalues: v3 (copy), v13 (copy)
        v30 = v30 or v3.default;
        assert(v30, "loggingProtocol must exist");
        for v31, v32 in v28 do
            v30:logRobloxTelemetryEvent(v13, {
                "addSessionInfo", 
                v3.StandardizedFields.addOsInfo
            }, {
                flow = v31, 
                durationMs = v32.durationMs, 
                count = v32.count, 
                failed = v32.failed
            }, v29);
        end;
    end, 
    reportOmniFeedStats = function(v33, v34, v35, v36, v37) --[[ Line: 187 ]] --[[ Name: reportOmniFeedStats ]]
        -- upvalues: v3 (copy), v14 (copy)
        v37 = v37 or v3.default;
        assert(v37, "loggingProtocol must exist");
        if not v33 then
            return;
        else
            v34 = v34 or {};
            local v38 = {};
            local v39 = {};
            for _, v41 in v33 do
                if v41.topicId then
                    local v42 = v41.treatmentType == "sdui";
                    v39[v41.topicId] = v42;
                    if v42 then
                        local v43 = 0;
                        local v44 = v34.feed and v34.feed.props and v34.feed.props.feedItems;
                        if v44 then
                            for _, v46 in v44 do
                                if v46.feedItemKey == v41.feedItemKey then
                                    local v47 = v46.props and v46.props.items;
                                    if v47 then
                                        v43 = #v47;
                                        break;
                                    elseif v46.props and v46.props.item then
                                        v43 = 1;
                                        break;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                        end;
                        v38[v41.topicId] = (v38[v41.topicId] or 0) + v43;
                    else
                        v38[v41.topicId] = (v38[v41.topicId] or 0) + (v41.recommendationList and #v41.recommendationList or 0);
                    end;
                end;
            end;
            local v48 = {};
            for v49, v50 in v38 do
                v48[("%*_item_count"):format(v49)] = v50;
                v48[("%*_is_sdui"):format(v49)] = v39[v49] and 1 or 0;
            end;
            v48.appPage = v35;
            v48.sduiResponseRequestId = v36;
            v37:logRobloxTelemetryEvent(v14, {
                "addSessionInfo", 
                v3.StandardizedFields.addOsInfo
            }, v48, v35);
            return;
        end;
    end
};