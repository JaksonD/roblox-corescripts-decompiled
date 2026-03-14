local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.LoggingProtocol);
local v4 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiErrors);
local l_FFlagSduiClientBinding_0 = require(l_Parent_0.SharedFlags).FFlagSduiClientBinding;
local v9 = game:DefineFastInt("DiscoverySduiErrorHundredthsPercent", 0);
local v10 = game:DefineFastInt("DiscoverySduiTimerEventsHundredthsPercent", 0);
local v11 = game:DefineFastInt("DiscoveryFeedStatsHundredthsPercent", 0);
local v12 = {
    eventName = "DiscoverySdui_ErrorDetails", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v9, 
    lastUpdated = {
        24, 
        11, 
        4
    }, 
    description = "Error details related to discovery server-driven ui", 
    links = ""
};
local v13 = {
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
local v14 = {
    eventName = "DiscoverySdui_Timers", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v10, 
    lastUpdated = {
        25, 
        3, 
        14
    }, 
    description = "Timers related to discovery server-driven ui", 
    links = ""
};
local v15 = {
    eventName = "DiscoverySdui_FeedStats", 
    backends = {
        v3.TelemetryBackends.Points, 
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v11, 
    lastUpdated = {
        25, 
        5, 
        27
    }, 
    description = "Stats for feed response. Number of items per collection", 
    links = ""
};
local function _(v16, v17) --[[ Line: 70 ]] --[[ Name: makeErrorKey ]]
    return (("%*_%*_%*_%*_%*"):format(v16, v17.name, v17.componentType, v17.parserName, v17.propName));
end;
local v19 = {};
return {
    clearSeenErrors = function() --[[ Line: 76 ]] --[[ Name: clearSeenErrors ]]
        -- upvalues: v19 (ref)
        v19 = {};
    end, 
    reportError = function(v20, v21, v22, v23) --[[ Line: 80 ]] --[[ Name: reportError ]]
        -- upvalues: v3 (copy), v19 (ref), v13 (copy), l_FFlagSduiClientBinding_0 (copy), v12 (copy), v2 (copy), v4 (copy)
        v23 = v23 or v3.default;
        assert(v23, "loggingProtocol must exist");
        local v24 = ("%*_%*_%*_%*_%*"):format(v20, v21.name, v21.componentType, v21.parserName, v21.propName);
        if v19[v24] then
            return;
        else
            v19[v24] = true;
            v23:logRobloxTelemetryCounter(v13, 1, {
                errorType = v20, 
                name = if v21 then v21.name else nil, 
                componentType = if v21 then v21.componentType else nil, 
                propName = if v21 then v21.propName else nil, 
                parserName = if v21 then v21.parserName else nil, 
                page = if l_FFlagSduiClientBinding_0 then v22 else nil
            });
            v23:logRobloxTelemetryEvent(v12, {
                "addSessionInfo", 
                v3.StandardizedFields.addOsInfo
            }, v2.Dictionary.union({
                errorType = v20
            }, v21 or {}), v22);
            if not _G.__TESTEZ_RUNNING_TEST__ then
                warn((("Discovery server-driven ui error \n%* \n%*"):format(v20, (v4.toString(v21)))));
            end;
            return;
        end;
    end, 
    reportCounter = function(v25, v26, v27, v28) --[[ Line: 127 ]] --[[ Name: reportCounter ]]
        -- upvalues: v3 (copy), v4 (copy)
        v28 = v28 or v3.default;
        assert(v28, "loggingProtocol must exist");
        v28:logRobloxTelemetryCounter({
            eventName = ("DiscoverySdui_Counter_%*"):format(v25), 
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
        }, 1, if v26 then {
            name = if v26 then v26.name else nil, 
            componentType = if v26 then v26.componentType else nil, 
            propName = if v26 then v26.propName else nil, 
            parserName = if v26 then v26.parserName else nil
        } else nil);
        if not v27 and not _G.__TESTEZ_RUNNING_TEST__ and not _G.__TEST_SUITE_PACKAGE__ then
            warn((("Discovery server-driven ui counter \n%* \n%*"):format(v25, (v4.toString(v26)))));
        end;
    end, 
    reportTimers = function(v29, v30, v31) --[[ Line: 163 ]] --[[ Name: reportTimers ]]
        -- upvalues: v3 (copy), v14 (copy)
        v31 = v31 or v3.default;
        assert(v31, "loggingProtocol must exist");
        for v32, v33 in v29 do
            v31:logRobloxTelemetryEvent(v14, {
                "addSessionInfo", 
                v3.StandardizedFields.addOsInfo
            }, {
                flow = v32, 
                durationMs = v33.durationMs, 
                count = v33.count, 
                failed = v33.failed
            }, v30);
        end;
    end, 
    reportOmniFeedStats = function(v34, v35, v36, v37, v38) --[[ Line: 189 ]] --[[ Name: reportOmniFeedStats ]]
        -- upvalues: v3 (copy), v15 (copy)
        v38 = v38 or v3.default;
        assert(v38, "loggingProtocol must exist");
        if not v34 then
            return;
        else
            v35 = v35 or {};
            local v39 = {};
            local v40 = {};
            for _, v42 in v34 do
                if v42.topicId then
                    local v43 = v42.treatmentType == "sdui";
                    v40[v42.topicId] = v43;
                    if v43 then
                        local v44 = 0;
                        local v45 = v35.feed and v35.feed.props and v35.feed.props.feedItems;
                        if v45 then
                            for _, v47 in v45 do
                                if v47.feedItemKey == v42.feedItemKey then
                                    local v48 = v47.props and v47.props.items;
                                    if v48 then
                                        v44 = #v48;
                                        break;
                                    elseif v47.props and v47.props.item then
                                        v44 = 1;
                                        break;
                                    else
                                        break;
                                    end;
                                end;
                            end;
                        end;
                        v39[v42.topicId] = (v39[v42.topicId] or 0) + v44;
                    else
                        v39[v42.topicId] = (v39[v42.topicId] or 0) + (v42.recommendationList and #v42.recommendationList or 0);
                    end;
                end;
            end;
            local v49 = {};
            for v50, v51 in v39 do
                v49[("%*_item_count"):format(v50)] = v51;
                v49[("%*_is_sdui"):format(v50)] = v40[v50] and 1 or 0;
            end;
            v49.appPage = v36;
            v49.sduiResponseRequestId = v37;
            v38:logRobloxTelemetryEvent(v15, {
                "addSessionInfo", 
                v3.StandardizedFields.addOsInfo
            }, v49, v36);
            return;
        end;
    end
};