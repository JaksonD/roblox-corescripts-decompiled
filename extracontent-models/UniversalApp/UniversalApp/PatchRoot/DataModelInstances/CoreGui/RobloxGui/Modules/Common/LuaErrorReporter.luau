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
local v12 = require(script.Parent.FFlagEnableSentryMigration);
local v13 = require(script.Parent.FFlagLuaAppEnableTokenBucketLimiter);
local l_TokenBucketRateLimiter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).TokenBucketRateLimiter;
local v15 = require(script.Parent.FFlagEnableLuaAppSessionWithError);
local v16 = require(script.Parent.RobloxTelemetryConfigs.LuaAppSessionWithErrorConfig);
local l_SessionWithErrorReporter_0 = require(l_CorePackages_0.Workspace.Packages.AppObservability).SessionWithErrorReporter;
local l_FVariable_0 = settings():GetFVariable("LuaAppsDiagErrorCounter");
local v19 = game:DefineFastString("LuaErrorByPlatformCounter", "LuaErrorPlatformOther");
local l_FFlagDisableGoogleAnalyticsErrorReporting_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDisableGoogleAnalyticsErrorReporting;
local v21 = if l_FFlagDisableGoogleAnalyticsErrorReporting_0 then nil else require(l_CorePackages_0.Workspace.Packages.ErrorReporters).ErrorQueue;
local v22 = not l_FFlagDisableGoogleAnalyticsErrorReporting_0 or nil;
local v23 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitThreshold"));
local v24 = tonumber(settings():GetFVariable("LuaAppErrorReporterRateLimitIntervalInSec"));
local l_FVariable_1 = settings():GetFVariable("LuaAppsDiagRateLimitedErrorsCounter");
local v26 = v23 * 2;
local v27 = {
    maxTokens = 3, 
    refillRate = 3, 
    refillIntervalSeconds = 600, 
    initialTokens = 3
};
local function _(v28) --[[ Line: 80 ]] --[[ Name: createProductName ]]
    -- upvalues: l_RunService_0 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    return string.format("%s-%s", v28, l_l_RunService_0_RobloxVersion_0);
end;
local function _(v31) --[[ Line: 85 ]] --[[ Name: convertNewlinesToPipes ]]
    local v32 = "";
    local v33 = true;
    for v34 in v31:gmatch("[^\r\n]+") do
        if v33 then
            v32 = v34;
            v33 = false;
        else
            v32 = v32 .. " | " .. v34;
        end;
    end;
    return v32;
end;
local function _(v36) --[[ Line: 99 ]] --[[ Name: removePlayerPersonalData ]]
    -- upvalues: v4 (copy)
    return v4(v36);
end;
local function v43(v38, v39, v40, v41) --[[ Line: 103 ]] --[[ Name: printError ]]
    local v42 = {
        "---- Unhandled Error Handler -----", 
        string.format("Current App<%s, %d> : \n%s\n", type(v38), #v38, v38), 
        string.format("Message<%s,%d> :\n%s\n", type(v39), #v39, v39), 
        string.format("Stack<%s,%d> :\n%s", type(v40), #v40, v40), 
        string.format("Script<%s> :\n%s", type(v41), v41:GetFullName()), 
        "----------------------------------"
    };
    print(table.concat(v42, "\n"));
end;
local v47 = if l_FFlagDisableGoogleAnalyticsErrorReporting_0 then nil else function(_, v45, v46) --[[ Line: 119 ]]
    -- upvalues: v5 (copy)
    v5.GoogleAnalytics:trackEvent(v45.productName, v45.errorMessage, v45.errorStack, v46);
end;
local function _() --[[ Line: 128 ]] --[[ Name: reportErrorToDiag ]]
    -- upvalues: v5 (copy), l_FVariable_0 (copy)
    v5.Diag:reportCounter(l_FVariable_0, 1);
end;
local function _() --[[ Line: 133 ]] --[[ Name: reportErrorToDiagByPlatform ]]
    -- upvalues: v5 (copy), v19 (copy)
    v5.Diag:reportCounter(v19, 1);
end;
local function _() --[[ Line: 137 ]] --[[ Name: reportErrorRateLimitingToDiag ]]
    -- upvalues: v5 (copy), l_FVariable_1 (copy)
    v5.Diag:reportCounter(l_FVariable_1, 1);
end;
local v51 = {};
v51.__index = v51;
v51.getSessionInformation = function(_) --[[ Line: 164 ]] --[[ Name: getSessionInformation ]]
    -- upvalues: l_SessionType_0 (copy), l_SessionInfo_0 (copy)
    local v53 = {};
    for _, v55 in ipairs({
        l_SessionType_0.StructuralIdentifier.Level0, 
        l_SessionType_0.StructuralIdentifier.Level1, 
        l_SessionType_0.StructuralIdentifier.Level2a, 
        l_SessionType_0.StructuralIdentifier.Level2b
    }) do
        local v56 = l_SessionInfo_0.getSessionByLevel(v55);
        if v56 then
            v53[v55] = v56.level;
            v53[v55 .. "_sessionId"] = v56.sessionId;
            v53[v55 .. "_tagName"] = v56.tagName;
        end;
    end;
    return v53;
end;
v51.new = function(v57, v58, v59, v60, v61) --[[ Line: 192 ]] --[[ Name: new ]]
    -- upvalues: l_ScriptContext_0 (copy), v24 (copy), l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy), v22 (copy), v12 (copy), v23 (copy), l_default_0 (copy), v15 (copy), l_SessionWithErrorReporter_0 (copy), v16 (copy), v13 (copy), l_TokenBucketRateLimiter_0 (copy), v27 (copy), v51 (copy), v21 (copy), v47 (copy), v3 (copy), l_RunService_0 (copy)
    if not v57 then
        v57 = l_ScriptContext_0.Error;
    end;
    v58 = v58 or v24;
    local v62 = {
        _isInstance = true, 
        _verbose = false, 
        _signalConnectionToken = nil, 
        _shouldReportDiag = true, 
        _shouldReportGoogleAnalytics = if l_FFlagDisableGoogleAnalyticsErrorReporting_0 then nil else v22, 
        _shouldReportInflux = true, 
        _currentApp = "Unknown", 
        _reportQueueGA = nil, 
        _backtraceReporter = v59, 
        _sentryReporter = if v12 then v61 else nil, 
        _rateLimitingThreshold = v23, 
        _rateLimitingIntervalSec = v58, 
        _rateLimitCounts = {}, 
        _rateLimitNextTick = tick() + v58, 
        _loggingProtocol = l_default_0, 
        _severity = v60, 
        _sessionWithErrorReporter = if v15 then l_SessionWithErrorReporter_0.new(v16, 300, nil) else nil, 
        _tokenBucketRateLimiter = if v13 then l_TokenBucketRateLimiter_0.new(v27) else nil
    };
    setmetatable(v62, v51);
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v62._reportQueueGA = v21.new(v47, {
            queueKeyLimit = 10
        });
    end;
    v62._signalConnectionToken = v57:connect(function(v63, v64, v65, v66) --[[ Line: 249 ]]
        -- upvalues: v3 (ref), v62 (copy)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 251 ]]
            -- upvalues: v3 (ref), v63 (ref), v64 (ref), v66 (ref), v62 (ref), v65 (copy)
            local v67, v68 = v3.unstable_parseReactError(v63);
            v63 = v67.message;
            v64 = v67.stack or v64;
            v66 = v66 or v68;
            local l__severity_0 = v62._severity;
            v62:handleError(v63, v64, v65, v66, l__severity_0);
        end);
        if not l_status_0 then
            warn(string.format("An error occurred while reporting an error : %s", l_result_0));
        end;
    end);
    if not l_RunService_0:IsStudio() and not _G.__TESTEZ_RUNNING_TEST__ then
        game:BindToClose(function() --[[ Line: 280 ]]
            -- upvalues: v62 (copy)
            v62:delete();
        end);
    end;
    v62._rateLimitHeartbeatConnectionToken = l_RunService_0.Heartbeat:connect(function() --[[ Line: 286 ]]
        -- upvalues: v62 (copy)
        local v72 = tick();
        if v62._rateLimitNextTick < v72 then
            v62:_processRateLimitingTick();
            v62._rateLimitNextTick = v72 + v62._rateLimitingIntervalSec;
        end;
    end);
    return v62;
end;
v51._processRateLimitingTick = function(v73) --[[ Line: 317 ]] --[[ Name: _processRateLimitingTick ]]
    -- upvalues: v26 (copy), v5 (copy), l_FVariable_1 (copy)
    local v74 = 0;
    for v75, v76 in pairs(v73._rateLimitCounts) do
        if v73._rateLimitingThreshold <= v76 then
            v74 = v74 + 1;
        end;
        local v77 = v76 - v73._rateLimitingThreshold;
        if v26 < v77 then
            v73._rateLimitCounts[v75] = v26;
        elseif v77 <= 0 then
            v73._rateLimitCounts[v75] = nil;
        else
            v73._rateLimitCounts[v75] = v77;
        end;
    end;
    if v74 > 0 then
        v5.Diag:reportCounter(l_FVariable_1, 1);
    end;
end;
v51._processErrorForRateLimiting = function(v78, v79, v80) --[[ Line: 340 ]] --[[ Name: _processErrorForRateLimiting ]]
    local v81 = v79 .. v80;
    local v82 = v78._rateLimitCounts[v81] or 0;
    v78._rateLimitCounts[v81] = v82 + 1;
    return v78._rateLimitingThreshold <= v82;
end;
v51.delete = function(v83) --[[ Line: 348 ]] --[[ Name: delete ]]
    -- upvalues: l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy), v12 (copy)
    if v83._rateLimitHeartbeatConnectionToken ~= nil then
        v83._rateLimitHeartbeatConnectionToken:disconnect();
    end;
    v83._signalConnectionToken:disconnect();
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v83._reportQueueGA:reportAllErrors();
        v83._reportQueueGA:stopTimer();
    end;
    if v83._backtraceReporter ~= nil then
        v83._backtraceReporter:stop();
    end;
    if v83._sentryReporter ~= nil and v12 then
        v83._sentryReporter:stop();
    end;
end;
v51.setCurrentApp = function(v84, v85) --[[ Line: 374 ]] --[[ Name: setCurrentApp ]]
    if type(v85) ~= "string" then
        error("appName must be a string");
    end;
    v84._currentApp = v85;
end;
if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
    v51.startQueueTimers = function(v86) --[[ Line: 383 ]] --[[ Name: startQueueTimers ]]
        v86._reportQueueGA:startTimer();
    end;
end;
v51.stopQueueTimers = function(v87) --[[ Line: 388 ]] --[[ Name: stopQueueTimers ]]
    -- upvalues: l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy)
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 then
        v87._reportQueueGA:stopTimer();
    end;
end;
v51.reportRobloxTelemetryEvent = function(v88, v89, v90, v91, v92) --[[ Line: 397 ]] --[[ Name: reportRobloxTelemetryEvent ]]
    -- upvalues: v9 (copy)
    local v93 = {
        app = v89, 
        err = v90, 
        stack = v91, 
        script = v92:GetFullName()
    };
    v88._loggingProtocol:logRobloxTelemetryEvent(v9, nil, v93);
end;
v51.reportRobloxTelemetryCounter = function(v94, v95) --[[ Line: 413 ]] --[[ Name: reportRobloxTelemetryCounter ]]
    -- upvalues: v10 (copy)
    if v95 ~= nil then
        local v96 = {
            tag_severity = v95
        };
        v94._loggingProtocol:logRobloxTelemetryCounter(v10, 1, v96);
        return;
    else
        v94._loggingProtocol:logRobloxTelemetryCounter(v10, 1);
        return;
    end;
end;
v51.reportSessionWithError = function(v97, v98, v99, v100) --[[ Line: 424 ]] --[[ Name: reportSessionWithError ]]
    v97._sessionWithErrorReporter:reportEvent(v98, v99, v100);
end;
v51.handleError = function(v101, v102, v103, v104, v105, v106) --[[ Line: 432 ]] --[[ Name: handleError ]]
    -- upvalues: l_RunService_0 (copy), v43 (copy), v4 (copy), v13 (copy), l_FFlagDisableGoogleAnalyticsErrorReporting_0 (copy), l_FFlagLuaAppEnableBacktraceSessionInfo_0 (copy), v12 (copy), v15 (copy), v5 (copy), l_FVariable_0 (copy), v19 (copy)
    local l__currentApp_0 = v101._currentApp;
    local l_l_RunService_0_RobloxVersion_1 = l_RunService_0:GetRobloxVersion();
    local v109 = string.format("%s-%s", l__currentApp_0, l_l_RunService_0_RobloxVersion_1);
    if v101._verbose then
        v43(v109, v102, v103, v104);
    end;
    l__currentApp_0 = v4(v102);
    l_l_RunService_0_RobloxVersion_1 = v4(v103);
    local v110 = "";
    local v111 = true;
    for v112 in l_l_RunService_0_RobloxVersion_1:gmatch("[^\r\n]+") do
        if v111 then
            v110 = v112;
            v111 = false;
        else
            v110 = v110 .. " | " .. v112;
        end;
    end;
    local l_v110_0 = v110;
    if v105 ~= nil then
        v105 = v4(v105);
    end;
    if v13 then
        if not v101._tokenBucketRateLimiter:consume(1) then
            return;
        end;
    elseif v101:_processErrorForRateLimiting(l__currentApp_0, l_v110_0) then
        return;
    end;
    v110 = string.format("%s | %s", l__currentApp_0, l_l_RunService_0_RobloxVersion_1);
    if not l_FFlagDisableGoogleAnalyticsErrorReporting_0 and v101._shouldReportGoogleAnalytics then
        v101._reportQueueGA:addError(v110, {
            productName = v109, 
            errorMessage = l__currentApp_0, 
            errorStack = l_v110_0
        });
    end;
    v111 = nil;
    if l_FFlagLuaAppEnableBacktraceSessionInfo_0 then
        v111 = v101:getSessionInformation();
    end;
    if v101._sentryReporter ~= nil and v12 then
        if l_FFlagLuaAppEnableBacktraceSessionInfo_0 then
            v101._sentryReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v105, v111);
        else
            v101._sentryReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v105);
        end;
    end;
    if v101._backtraceReporter ~= nil then
        if l_FFlagLuaAppEnableBacktraceSessionInfo_0 then
            v101._backtraceReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v105, v111);
        else
            v101._backtraceReporter:reportErrorDeferred(l__currentApp_0, l_l_RunService_0_RobloxVersion_1, v105);
        end;
    end;
    if v101._shouldReportInflux then
        v101:reportRobloxTelemetryEvent(v109, l__currentApp_0, l_v110_0, v104);
    end;
    if v101._shouldReportDiag then
        v101:reportRobloxTelemetryCounter(v106);
        if v15 then
            v101:reportSessionWithError(1, nil, v106);
        end;
        v5.Diag:reportCounter(l_FVariable_0, 1);
        v5.Diag:reportCounter(v19, 1);
    end;
end;
return v51;