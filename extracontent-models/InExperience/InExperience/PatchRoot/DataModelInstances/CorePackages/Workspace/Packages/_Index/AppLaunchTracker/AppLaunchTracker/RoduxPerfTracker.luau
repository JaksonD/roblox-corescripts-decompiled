local _ = require(script.Parent.AppLaunchTrackerTypes);
local v1 = {
    __className = "Devtools"
};
v1.__index = v1;
local function _() --[[ Line: 43 ]] --[[ Name: createTable ]]
    return (table.create(100));
end;
v1.new = function(v3, v4, v5) --[[ Line: 48 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    return (setmetatable({
        reportTopAction = v3, 
        reportTopThunk = v4, 
        startImmediately = v5, 
        shouldTrack = false, 
        flushCount = 0, 
        totalFlushTimeMs = 0, 
        reduceCount = 0, 
        totalReduceTimeMs = 0, 
        maxListenerCount = 0, 
        totalThunkTimeMs = 0, 
        thunkCount = 0, 
        actionCounts = if v3 then table.create(100) else nil, 
        actionTotalTimes = if v3 then table.create(100) else nil, 
        thunkCounts = if v4 then table.create(100) else nil, 
        thunkTotalTimes = if v4 then table.create(100) else nil
    }, v1));
end;
v1._hookIntoStore = function(v6, v7) --[[ Line: 80 ]] --[[ Name: _hookIntoStore ]]
    v6.store = v7;
    v6.originalReducer = v7._reducer;
    v6.originalFlushHandler = v7._flushHandler;
    if v6.startImmediately then
        v6:startTracking();
    end;
end;
v1.trackingReducer = function(v8, v9, v10) --[[ Line: 90 ]] --[[ Name: trackingReducer ]]
    assert(v8.originalReducer, "self.originalReducer must exist");
    local v11 = os.clock();
    local v12 = v8.originalReducer(v9, v10);
    local v13 = (os.clock() - v11) * 1000;
    v8.totalReduceTimeMs = v8.totalReduceTimeMs + v13;
    v8.reduceCount = v8.reduceCount + 1;
    if v8.reportTopAction and v8.actionCounts and v8.actionTotalTimes then
        local v14 = v10.type or tostring(v10);
        if v14 then
            local v15 = (v8.actionCounts[v14] or 0) + 1;
            v8.actionCounts[v14] = v15;
            local v16 = (v8.actionTotalTimes[v14] or 0) + v13;
            v8.actionTotalTimes[v14] = v16;
        end;
    end;
    return v12;
end;
v1.trackingFlush = function(v17, ...) --[[ Line: 115 ]] --[[ Name: trackingFlush ]]
    local v18 = os.clock();
    v17.originalFlushHandler(...);
    local v19 = (os.clock() - v18) * 1000;
    v17.totalFlushTimeMs = v17.totalFlushTimeMs + v19;
    v17.flushCount = v17.flushCount + 1;
    local v20 = #v17.store.changed._listeners;
    if v17.maxListenerCount < v20 then
        v17.maxListenerCount = v20;
    end;
end;
v1.startTracking = function(v21) --[[ Line: 130 ]] --[[ Name: startTracking ]]
    v21.store._flushHandler = function(...) --[[ Line: 131 ]]
        -- upvalues: v21 (copy)
        return v21:trackingFlush(...);
    end;
    v21.store._reducer = function(...) --[[ Line: 134 ]]
        -- upvalues: v21 (copy)
        return v21:trackingReducer(...);
    end;
    v21.shouldTrack = true;
end;
v1.stopTracking = function(v22) --[[ Line: 140 ]] --[[ Name: stopTracking ]]
    if v22.shouldTrack then
        v22.shouldTrack = false;
        v22.store._flushHandler = v22.originalFlushHandler;
        v22.store._reducer = v22.originalReducer;
    end;
end;
v1.clear = function(v23) --[[ Line: 148 ]] --[[ Name: clear ]]
    v23.flushCount = 0;
    v23.totalFlushTimeMs = 0;
    v23.reduceCount = 0;
    v23.totalReduceTimeMs = 0;
    v23.maxListenerCount = 0;
    v23.totalThunkTimeMs = 0;
    v23.thunkCount = 0;
    if v23.reportTopAction then
        v23.actionCounts = table.create(100);
        v23.actionTotalTimes = table.create(100);
    end;
    if v23.reportTopThunk then
        v23.thunkCounts = table.create(100);
        v23.thunkTotalTimes = table.create(100);
    end;
end;
local function v28(v24) --[[ Line: 167 ]] --[[ Name: getRelevantLineFromTrace ]]
    local v25 = string.split(v24, "\n");
    for v26 = 3, #v25 do
        local v27 = v25[v26];
        if not string.find(v27, "AppLaunchTracker") and not string.find(v27, "_Index.Rodux") and not string.find(v27, "_Index.RoactRodux") and not string.find(v27, "_Index.Promise") and not string.find(v27, ".RoactRodux") then
            return v27;
        end;
    end;
    return nil;
end;
local function _(v29) --[[ Line: 184 ]] --[[ Name: getThunkName ]]
    -- upvalues: v28 (copy)
    local v30 = v28(debug.traceback());
    if v30 then
        return v30;
    else
        return debug.info(v29, "slf");
    end;
end;
v1.makeThunkMiddleware = function(v32, v33) --[[ Line: 192 ]] --[[ Name: makeThunkMiddleware ]]
    -- upvalues: v28 (copy)
    local function v35(v34) --[[ Line: 193 ]] --[[ Name: tracebackReporter ]]
        return debug.traceback(v34);
    end;
    return function(v36, v37) --[[ Line: 196 ]] --[[ Name: thunkMiddleware ]]
        -- upvalues: v32 (copy), v33 (copy), v28 (ref), v35 (copy)
        return function(v38) --[[ Line: 197 ]]
            -- upvalues: v32 (ref), v37 (copy), v33 (ref), v28 (ref), v35 (ref), v36 (copy)
            if typeof(v38) == "function" then
                local v45, v46 = xpcall(function() --[[ Line: 199 ]]
                    -- upvalues: v32 (ref), v38 (copy), v37 (ref), v33 (ref), v28 (ref)
                    if v32.shouldTrack then
                        local v39 = os.clock();
                        local v40 = v38(v37, v33);
                        local v41 = (os.clock() - v39) * 1000;
                        local l_v32_0 = v32;
                        l_v32_0.totalThunkTimeMs = l_v32_0.totalThunkTimeMs + v41;
                        l_v32_0 = v32;
                        l_v32_0.thunkCount = l_v32_0.thunkCount + 1;
                        if v32.reportTopThunk and v32.thunkCounts and v32.thunkTotalTimes then
                            local l_v38_0 = v38;
                            l_v32_0 = v28(debug.traceback()) or debug.info(l_v38_0, "slf");
                            l_v38_0 = (v32.thunkCounts[l_v32_0] or 0) + 1;
                            v32.thunkCounts[l_v32_0] = l_v38_0;
                            local v44 = (v32.thunkTotalTimes[l_v32_0] or 0) + v41;
                            v32.thunkTotalTimes[l_v32_0] = v44;
                        end;
                        return v40;
                    else
                        return v38(v37, v33);
                    end;
                end, v35);
                if not v45 then
                    v37._errorReporter.reportReducerError(v37:getState(), v38, {
                        message = "Caught error in thunk", 
                        thrownValue = v46
                    });
                    return nil;
                else
                    return v46;
                end;
            else
                return v36(v38);
            end;
        end;
    end;
end;
local function _(v47) --[[ Line: 243 ]] --[[ Name: getTopValue ]]
    local v48 = nil;
    local v49 = nil;
    for v50, v51 in v47 do
        if (v48 or -1) < v51 then
            v48 = v51;
            v49 = v50;
        end;
    end;
    return v49, v48;
end;
local function _(v53) --[[ Line: 255 ]] --[[ Name: fixThunkName ]]
    return v53:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "");
end;
v1.getStats = function(v55) --[[ Line: 259 ]] --[[ Name: getStats ]]
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    if v55.reportTopAction and v55.actionCounts and v55.actionTotalTimes then
        local l_actionTotalTimes_0 = v55.actionTotalTimes;
        local v63 = nil;
        local v64 = nil;
        for v65, v66 in l_actionTotalTimes_0 do
            if (v63 or -1) < v66 then
                v63 = v66;
                v64 = v65;
            end;
        end;
        local l_v64_0 = v64;
        local l_v63_0 = v63;
        v56 = l_v64_0;
        v57 = l_v63_0;
        if v56 then
            v58 = v55.actionCounts[v56];
        end;
    end;
    if v55.reportTopThunk and v55.thunkCounts and v55.thunkTotalTimes then
        local l_thunkTotalTimes_0 = v55.thunkTotalTimes;
        local v70 = nil;
        local v71 = nil;
        for v72, v73 in l_thunkTotalTimes_0 do
            if (v70 or -1) < v73 then
                v70 = v73;
                v71 = v72;
            end;
        end;
        local l_v71_0 = v71;
        local l_v70_0 = v70;
        v59 = l_v71_0;
        v60 = l_v70_0;
        if v59 then
            v61 = v55.thunkCounts[v59];
            v59 = v59:gsub("CoreGui.RobloxGui.Modules.", ""):gsub("CorePackages.Workspace.Packages._Workspace.", "");
        end;
    end;
    return {
        flushCount = v55.flushCount, 
        totalFlushTimeMs = v55.totalFlushTimeMs, 
        reduceCount = v55.reduceCount, 
        totalReduceTimeMs = v55.totalReduceTimeMs, 
        maxListenerCount = v55.maxListenerCount, 
        totalThunkTimeMs = v55.totalThunkTimeMs, 
        thunkCount = v55.thunkCount, 
        topActionName = v56, 
        topActionDurationMs = v57, 
        topActionCount = v58, 
        topThunkName = v59, 
        topThunkDurationMs = v60, 
        topThunkCount = v61
    };
end;
return v1;