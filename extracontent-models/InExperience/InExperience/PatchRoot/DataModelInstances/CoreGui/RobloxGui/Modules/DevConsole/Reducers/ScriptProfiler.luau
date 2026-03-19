local v0 = require(script.Parent.Parent.Immutable);
local v1 = require(script.Parent.Parent.Actions.SetScriptProfilerState);
local v2 = require(script.Parent.Parent.Actions.SetScriptProfilerRoot);
local v3 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetIsProfiling);
local v4 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetData);
local v5 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetThreads);
local v6 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetTimerState);
local v7 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.ClearStateForNewProfilingSession);
local v8 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetAverage);
local v9 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetFrequency);
local v10 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetDataView);
local v11 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetLiveUpdate);
local v12 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowPlugins);
local v13 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetShowGC);
local v14 = require(script.Parent.Parent.Components.ScriptProfiler.Actions.SetSearchData);
local _ = require(script.Parent.Parent.Components.ScriptProfiler.ProfilerDataFormatV2);
local function _(v16, v17) --[[ Line: 68 ]] --[[ Name: GetSessionState ]]
    if v16 then
        return v17.client;
    else
        return v17.server;
    end;
end;
local function v25(v19, v20, v21) --[[ Line: 72 ]] --[[ Name: Update ]]
    -- upvalues: v0 (copy)
    local v22 = if v19 then v20.client else v20.server;
    local v23 = v0.JoinDictionaries(v22, v21);
    local v24 = {
        client = if v19 then v23 else nil, 
        server = if v19 then nil else v23
    };
    return v0.JoinDictionaries(v20, v24);
end;
return function(v26, v27) --[[ Line: 85 ]]
    -- upvalues: v1 (copy), v0 (copy), v3 (copy), v25 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v14 (copy), v6 (copy), v4 (copy), v5 (copy), v7 (copy), v2 (copy)
    local v28 = v26 or {
        isClientView = true, 
        usePercentages = false, 
        isExporting = false, 
        isShowingMobileSettings = false, 
        client = {
            isProfiling = false, 
            data = nil, 
            serializedData = nil, 
            frequency = 1000, 
            timedProfilingThread = nil, 
            timedProfilingTimerThread = nil, 
            timedProfilingDuration = 0, 
            timedProfilingCountdown = 0, 
            isFunctionsView = false, 
            average = 0, 
            searchTerm = "", 
            searchFilterGraph = {}, 
            searchFilterFlat = {}, 
            rootNode = 0, 
            rootFunc = 0, 
            rootNodeName = nil, 
            liveUpdate = false, 
            liveUpdateThread = nil, 
            showPlugins = false, 
            pluginOffsets = {}, 
            showGC = false, 
            gcFunctionOffsets = {}, 
            gcNodeOffsets = {}, 
            pluginGCOffsets = {}, 
            expandedNodes = {}
        }, 
        server = {
            isProfiling = false, 
            data = nil, 
            serializedData = nil, 
            frequency = 1000, 
            timedProfilingThread = nil, 
            timedProfilingTimerThread = nil, 
            timedProfilingDuration = 0, 
            timedProfilingCountdown = 0, 
            isFunctionsView = false, 
            average = 0, 
            searchTerm = "", 
            searchFilterGraph = {}, 
            searchFilterFlat = {}, 
            rootNode = 0, 
            rootFunc = 0, 
            rootNodeName = nil, 
            liveUpdate = false, 
            liveUpdateThread = nil, 
            showPlugins = false, 
            pluginOffsets = {}, 
            showGC = false, 
            gcFunctionOffsets = {}, 
            gcNodeOffsets = {}, 
            pluginGCOffsets = {}, 
            expandedNodes = {}
        }
    };
    if v27.type == v1.name then
        local v29 = {
            isClientView = v27.isClientView, 
            usePercentages = v27.usePercentages, 
            isExporting = v27.isExporting, 
            isShowingMobileSettings = v27.isShowingMobileSettings, 
            client = v27.clientSessionState, 
            server = v27.serverSessionState
        };
        return (v0.JoinDictionaries(v28, v29));
    elseif v27.type == v3.name then
        return v25(v27.isClient, v28, {
            isProfiling = v27.isProfiling
        });
    elseif v27.type == v8.name then
        return v25(v27.isClient, v28, {
            average = v27.average
        });
    elseif v27.type == v9.name then
        return v25(v27.isClient, v28, {
            frequency = v27.frequency
        });
    elseif v27.type == v10.name then
        return v25(v27.isClient, v28, {
            isFunctionsView = v27.isFunctionsView
        });
    elseif v27.type == v11.name then
        return v25(v27.isClient, v28, {
            liveUpdate = v27.liveUpdate
        });
    elseif v27.type == v12.name then
        return v25(v27.isClient, v28, {
            showPlugins = v27.showPlugins
        });
    elseif v27.type == v13.name then
        return v25(v27.isClient, v28, {
            showGC = v27.showGC
        });
    elseif v27.type == v14.name then
        return v25(v27.isClient, v28, {
            searchTerm = v27.state.searchTerm, 
            searchFilterFlat = v27.state.searchFilterFlat, 
            searchFilterGraph = v27.state.searchFilterGraph
        });
    elseif v27.type == v6.name then
        local v30 = {
            timedProfilingDuration = v27.state.timedProfilingDuration, 
            timedProfilingCountdown = v27.state.timedProfilingCountdown
        };
        return v25(v27.isClient, v28, v30);
    elseif v27.type == v4.name then
        local v31 = table.clone(if v27.isClient then v28.client else v28.server);
        v31.data = v27.state.data;
        v31.serializedData = v27.state.serializedData;
        v31.pluginOffsets = v27.state.pluginOffsets or {};
        v31.pluginGCOffsets = v27.state.pluginGCOffsets or {};
        v31.gcFunctionOffsets = v27.state.gcFunctionOffsets or {};
        v31.gcNodeOffsets = v27.state.gcNodeOffsets or {};
        v31.expandedNodes = v27.state.expandedNodes or {};
        local v32 = table.clone(v28);
        if v27.isClient then
            v32.client = v31;
        else
            v32.server = v31;
        end;
        return v0.JoinDictionaries(v28, v32);
    elseif v27.type == v5.name then
        local v33 = table.clone(if v27.isClient then v28.client else v28.server);
        v33.timedProfilingThread = v27.state.timedProfilingThread;
        v33.timedProfilingTimerThread = v27.state.timedProfilingTimerThread;
        v33.liveUpdateThread = v27.state.liveUpdateThread;
        local v34 = table.clone(v28);
        if v27.isClient then
            v34.client = v33;
        else
            v34.server = v33;
        end;
        return v0.JoinDictionaries(v28, v34);
    elseif v27.type == v7.name then
        local v35 = table.clone(if v27.isClient then v28.client else v28.server);
        v35.rootNode = 0;
        v35.rootFunc = 0;
        v35.rootNodeName = nil;
        v35.searchFilterFlat = {};
        v35.searchFilterGraph = {};
        v35.expandedNodes = {};
        local v36 = table.clone(v28);
        if v27.isClient then
            v36.client = v35;
        else
            v36.server = v35;
        end;
        return v0.JoinDictionaries(v28, v36);
    elseif v27.type == v2.name then
        local v37 = {};
        local v38 = table.clone(if v28.isClientView then v28.client else v28.server);
        if v38.rootNode ~= v27.rootNode then
            v38.rootNode = v27.rootNode;
            v38.rootFunc = v27.rootFunc;
            v38.rootNodeName = v27.rootNodeName;
        else
            v38.rootNode = 0;
            v38.rootFunc = 0;
            v38.rootNodeName = nil;
        end;
        if v28.isClientView then
            v37.client = v38;
        else
            v37.server = v38;
        end;
        return v0.JoinDictionaries(v28, v37);
    else
        return v28;
    end;
end;