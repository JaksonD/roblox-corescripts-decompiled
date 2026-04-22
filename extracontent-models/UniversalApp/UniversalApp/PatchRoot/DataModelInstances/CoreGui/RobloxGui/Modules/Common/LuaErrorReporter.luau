local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(script.Parent.removePII);
local v5 = require(script.Parent.Analytics).new();
local l_SessionInfo_0 = require(l_CorePackages_0.Workspace.Packages.SessionizationUtil).SessionInfo;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v9 = require(script.Parent.RobloxTelemetryConfigs.LuaShellErrors);
local v10 = require(script.Parent.RobloxTelemetryConfigs.LuaErrorV2CounterConfig);
local l_FFlagLuaAppEnableBacktraceSessionInfo_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).FFlagLuaAppEnableBacktraceSessionInfo;
local v12 = require(script.Parent.FFlagReportMutedErrorsToSentry);
local v13 = require(script.Parent.FFlagLuaAppEnableTokenBucketLimiter);
local l_TokenBucketRateLimiter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).TokenBucketRateLimiter;
local v15 = require(script.Parent.FFlagEnableLuaAppSessionWithError);
local v16 = require(script.Parent.RobloxTelemetryConfigs.LuaAppSessionWithErrorConfig);
local l_SessionWithErrorReporter_0 = require(l_CorePackages_0.Workspace.Packages.AppObservability).SessionWithErrorReporter;
local v18 = require(script.Parent.LuaErrorSeverity);
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagErrorCounter");
local v20 = game:DefineFastString("LuaErrorByPlatformCounter", "LuaErrorPlatformOther");
local l_FFlagDisableGoogleAnalyticsErrorReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting;
local v22 = if l_FFlagDisableGoogleAnalyticsErrorReporting_0 then nil else require(l_CorePackages_0.Workspace.Packages.ErrorReporters).ErrorQueue;
local v23 = not l_FFlagDisableGoogleAnalyticsErrorReporting_0 or nil;
local v24 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitThreshold"));
local v25 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitIntervalInSec"));
local l_FVariable_1 = settings():GetFVariable("LuaAppsDiagRateLimitedErrorsCounter");
local v27 = v24 * 2;
local v28 = {
    [v18.DEBUG] = "debug", 
    [v18.ERROR] = "error"
};
local v29 = {
    maxTokens = 3, 
    refillRate = 3, 
    refillIntervalSeconds = 600, 
    initialTokens = 3
};
local function _(v30) --[[ Line: 87 ]] --[[ Name: createProductName ]]
    -- upvalues: l_RunService_0 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    return string.format("%s-%s", v30, l_l_RunService_0_RobloxVersion_0);
end;
local function _(v33) --[[ Line: 92 ]] --[[ Name: convertNewlinesToPipes ]]
    local v34 = "";
    local v35 = true;
    for v36 in v33:gmatch("[^\r\n]+") do
        if v35 then
            v34 = v36;
            v35 = false;
        else
            v34 = v34 .. " | " .. v36;
        end;
    end;
    return v34;
end;
local function _(v38) --[[ Line: 106 ]] --[[ Name: removePlayerPersonalData ]]
    -- upvalues: v4 (copy)
    return v4(v38);
end;
local function v45(v40, v41, v42, v43) --[[ Line: 110 ]] --[[ Name: printError ]]
    local v44 = {
        "---- Unhandled Error Handler -----", 
        string.format("Current App<%s, %d> : \n%s\n", type(v40), #v40, v40), 
        string.format("Message<%s,%d> :\n%s\n", type(v41), #v41, v41), 
        string.format("Stack<%s,%d> :\n%s", type(v42), #v42, v42), 
        string.format("Script<%s> :\n%s", type(v43), v43:GetFullName()), 
        "----------------------------------"
    };
    print(table.concat(v44, "\n"));
end;
local v49 = if l_FFlagDisableGoogleAnalyticsErrorReporting_0 then nil else function(_, v47, v48) --[[ Line: 126 ]]
    -- upvalues: v5 (copy)
    v5.GoogleAnalytics:trackEvent(v47.productName, v47.errorMessage, v47.errorStack, v48);
end;
local function _() --[[ Line: 135 ]] --[[ Name: reportErrorToDiag ]]
    -- upvalues: v5 (copy), l_FVariable_0 (copy)
    v5.Diag:reportCounter(l_FVariable_0, 1);
end;
local function _() --[[ Line: 140 ]] --[[ Name: reportErrorToDiagByPlatform ]]
    -- upvalues: v5 (copy), v20 (copy)
    v5.Diag:reportCounter(v20, 1);
end;
local function _() --[[ Line: 144 ]] --[[ Name: reportErrorRateLimitingToDiag ]]
    -- upvalues: v5 (copy), l_FVariable_1 (copy)
    v5.Diag:reportCounter(l_FVariable_1, 1);
end;
local v53 = {};
v53.__index = v53;
v53.getSessionInformation = function(_) --[[ Line: 171 ]] --[[ Name: getSessionInformation ]]
    -- upvalues: l_SessionType_0 (copy), l_SessionInfo_0 (copy)
    local v55 = {};
    for _, v57 in ipairs({
        l_SessionType_0.StructuralIdentifier.Level0, 
        l_SessionType_0.StructuralIdentifier.Level1, 
        l_SessionType_0.StructuralIdentifier.Level2a, 
        l_SessionType_0.StructuralIdentifier.Level2b
    }) do
        local v58 = l_SessionInfo_0.getSessionByLevel(v57);
        if v58 then
            v55[v57] = v58.level;
            v55[v57 .. "_sessionId"] = v58.sessionId;
            v55[v57 .. "_tagName"] = v58.tagName;
        end;
    end;
    return v55;
end;
v53.new = function(v59, v60, v61, v62, v63) --[[ Line: 199 ]] --[[ Name: new ]]
    -- upvalues: l_ScriptContext_0 (copy), v25 (copy), l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy), v23 (copy), v24 (copy), l_default_0 (copy), v15 (copy), l_SessionWithErrorReporter_0 (copy), v16 (copy), v13 (copy), l_TokenBucketRateLimiter_0 (copy), v29 (copy), v53 (copy), v22 (copy), v49 (copy), v3 (copy), l_RunService_0 (copy)
    if not v59 then
        v59 = l_ScriptContext_0.Error;
    end;
    v60 = v60 or v25;
    local v64 = {
        _isInstance = true, 
        _verbose = false, 
        _signalConnectionToken = nil, 
        _shouldReportDiag = true, 
        _shouldReportGoogleAnalytics = if l_FFlagDisableGoogleAnalyticsErrorReporting_0 then nil else v23, 
        _shouldReportInflux = true, 
        _currentApp = "Unknown", 
        _reportQueueGA = nil, 
        _backtraceReporter = v61, 
        _sentryReporter = v63, 
        _rateLimitingThreshold = v24, 
        _rateLimitingIntervalSec = v60, 
        _rateLimitCounts = {}, 
        _rateLimitNextTick = tick() + v60, 
        _loggingProtocol = l_default_0, 
        _severity = v62, 
        _sessionWithErrorReporter = if v15 then l_SessionWithErrorReporter_0.new(v16, 300, nil) else nil, 
        _tokenBucketRateLimiter = if v13 then l_TokenBucketRateLimiter_0.new(v29) else nil
    };
    setmetatable(v64, v53);
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v64._reportQueueGA = v22.new(v49, {
            queueKeyLimit = 10
        });
    end;
    v64._signalConnectionToken = v59:connect(function(v65, v66, v67, v68) --[[ Line: 256 ]]
        -- upvalues: v3 (ref), v64 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 258 ]]
            -- upvalues: v3 (ref), v65 (ref), v66 (ref), v68 (ref), v64 (ref), v67 (copy)
            local v69, v70 = v3.unstable_parseReactError(v65);
            v65 = v69.message;
            v66 = v69.stack or v66;
            v68 = v68 or v70;
            local l__severity_0 = v64._severity;
            v64:handleError(v65, v66, v67, v68, l__severity_0);
        end);
        if not l_status_0 then
            warn(string.format("An error occurred while reporting an error : %s", l_result_0));
        end;
    end);
    if not l_RunService_0:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ then
        game:BindToClose(function() --[[ Line: 287 ]]
            -- upvalues: v64 (copy)
            v64:delete();
        end);
    end;
    v64._rateLimitHeartbeatConnectionToken = l_RunService_0.Heartbeat:connect(function() --[[ Line: 293 ]]
        -- upvalues: v64 (copy)
        local v74 = tick();
        if v64._rateLimitNextTick < v74 then
            v64:_processRateLimitingTick();
            v64._rateLimitNextTick = v74 + v64._rateLimitingIntervalSec;
        end;
    end);
    return v64;
end;
v53._processRateLimitingTick = function(v75) --[[ Line: 324 ]] --[[ Name: _processRateLimitingTick ]]
    -- upvalues: v27 (copy), v5 (copy), l_FVariable_1 (copy)
    local v76 = 0;
    for v77, v78 in pairs(v75._rateLimitCounts) do
        if v75._rateLimitingThreshold <= v78 then
            v76 = v76 + 1;
        end;
        local v79 = v78 - v75._rateLimitingThreshold;
        if v27 < v79 then
            v75._rateLimitCounts[v77] = v27;
        elseif v79 <= 0 then
            v75._rateLimitCounts[v77] = nil;
        else
            v75._rateLimitCounts[v77] = v79;
        end;
    end;
    if v76 > 0 then
        v5.Diag:reportCounter(l_FVariable_1, 1);
    end;
end;
v53._processErrorForRateLimiting = function(v80, v81, v82) --[[ Line: 347 ]] --[[ Name: _processErrorForRateLimiting ]]
    local v83 = v81 .. v82;
    local v84 = v80._rateLimitCounts[v83] or 0;
    v80._rateLimitCounts[v83] = v84 + 1;
    return v80._rateLimitingThreshold <= v84;
end;
v53.delete = function(v85) --[[ Line: 355 ]] --[[ Name: delete ]]
    -- upvalues: l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy)
    if v85._rateLimitHeartbeatConnectionToken ~= nil then
        v85._rateLimitHeartbeatConnectionToken:disconnect();
    end;
    v85._signalConnectionToken:disconnect();
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v85._reportQueueGA:reportAllErrors();
        v85._reportQueueGA:stopTimer();
    end;
    if v85._backtraceReporter ~= nil then
        v85._backtraceReporter:stop();
    end;
    if v85._sentryReporter ~= nil then
        v85._sentryReporter:stop();
    end;
end;
v53.setCurrentApp = function(v86, v87) --[[ Line: 381 ]] --[[ Name: setCurrentApp ]]
    if type(v87) ~= "string" then
        error("appName must be a string");
    end;
    v86._currentApp = v87;
end;
if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
    v53.startQueueTimers = function(v88) --[[ Line: 390 ]] --[[ Name: startQueueTimers ]]
        v88._reportQueueGA:startTimer();
    end;
end;
v53.stopQueueTimers = function(v89) --[[ Line: 395 ]] --[[ Name: stopQueueTimers ]]
    -- upvalues: l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy)
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v89._reportQueueGA:stopTimer();
    end;
end;
v53.reportRobloxTelemetryEvent = function(v90, v91, v92, v93, v94) --[[ Line: 404 ]] --[[ Name: reportRobloxTelemetryEvent ]]
    -- upvalues: v9 (copy)
    local v95 = {
        app = v91, 
        err = v92, 
        stack = v93, 
        script = v94:GetFullName()
    };
    v90._loggingProtocol:logRobloxTelemetryEvent(v9, nil, v95);
end;
v53.reportRobloxTelemetryCounter = function(v96, v97) --[[ Line: 420 ]] --[[ Name: reportRobloxTelemetryCounter ]]
    -- upvalues: v10 (copy)
    if v97 ~= nil then
        local v98 = {
            tag_severity = v97
        };
        v96._loggingProtocol:logRobloxTelemetryCounter(v10, 1, v98);
        return;
    else
        v96._loggingProtocol:logRobloxTelemetryCounter(v10, 1);
        return;
    end;
end;
v53.reportSessionWithError = function(v99, v100, v101, v102) --[[ Line: 431 ]] --[[ Name: reportSessionWithError ]]
    v99._sessionWithErrorReporter:reportEvent(v100, v101, v102);
end;
v53.handleError = function(v103, v104, v105, v106, v107, v108) --[[ Line: 439 ]] --[[ Name: handleError ]]
    -- upvalues: l_RunService_0 (copy), v45 (copy), v4 (copy), v13 (copy), l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy), l_FFlagLuaAppEnableBacktraceSessionInfo_0 (copy), v12 (copy), v28 (copy), v15 (copy), v5 (copy), l_FVariable_0 (copy), v20 (copy)
    local l__currentApp_0 = v103._currentApp;
    local l_l_RunService_0_RobloxVersion_1 = l_RunService_0:GetRobloxVersion();
    local v111 = string.format("%s-%s", l__currentApp_0, l_l_RunService_0_RobloxVersion_1);
    if v103._verbose then
        v45(v111, v104, v105, v106);
    end;
    l__currentApp_0 = v4(v104);
    l_l_RunService_0_RobloxVersion_1 = v4(v105);
    local v112 = "";
    local v113 = true;
    for v114 in l_l_RunService_0_RobloxVersion_1:gmatch("[^\r\n]+") do
        if v113 then
            v112 = v114;
            v113 = false;
        else
            v112 = v112 .. " | " .. v114;
        end;
    end;
    local l_v112_0 = v112;
    if v107 ~= nil then
        v107 = v4(v107);
    end;
    if v13 then
        if not v103._tokenBucketRateLimiter:consume(1) then
            return;
        end;
    elseif v103:_processErrorForRateLimiting(l__currentApp_0, l_v112_0) then
        return;
    end;
    v112 = string.format("%s | %s", l__currentApp_0, l_l_RunService_0_RobloxVersion_1);
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 and v103._shouldReportGoogleAnalytics then
        v103._reportQueueGA:addError(v112, {
            productName = v111, 
            errorMessage = l__currentApp_0, 
            errorStack = l_v112_0
        });
    end;
    v113 = nil;
    if l_FFlagLuaAppEnableBacktraceSessionInfo_0 then
        v113 = v103:getSessionInformation();
    end;
    if v103._sentryReporter ~= nil then
        local v116 = if v12 then v28[v108] else nil;
        if l_FFlagLuaAppEnableBacktraceSessionInfo_0 then
            v103._sentryReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v107, v113, v116);
        else
            v103._sentryReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v107, nil, v116);
        end;
    end;
    if v103._backtraceReporter ~= nil then
        if l_FFlagLuaAppEnableBacktraceSessionInfo_0 then
            v103._backtraceReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v107, v113);
        else
            v103._backtraceReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v107);
        end;
    end;
    if v103._shouldReportInflux then
        v103:reportRobloxTelemetryEvent(v111, l__currentApp_0, l_v112_0, v106);
    end;
    if v103._shouldReportDiag then
        v103:reportRobloxTelemetryCounter(v108);
        if v15 then
            v103:reportSessionWithError(1, nil, v108);
        end;
        v5.Diag:reportCounter(l_FVariable_0, 1);
        v5.Diag:reportCounter(v20, 1);
    end;
end;
return v53;