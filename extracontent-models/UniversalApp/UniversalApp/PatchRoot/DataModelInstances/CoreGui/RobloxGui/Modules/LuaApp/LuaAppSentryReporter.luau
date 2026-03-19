local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_SentryReporter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).SentryReporter;
local v4 = require(script.Parent.LuaAppErrorReporterUtil);
local v5 = require(script.Parent.LuaAppBacktraceLogger);
local v6 = require(script.Parent.Sentry.LuaAppSentryReporterMetrics);
local v7 = l_RunService_0:IsStudio();
local v8 = game:DefineFastString("LuaAppSentryDsn", "");
local v9 = nil;
if v8 ~= "" then
    local l_l_RunService_0_CoreScriptVersion_0 = l_RunService_0:GetCoreScriptVersion();
    if v7 then
        print("[LuaAppSentryReporter] CoreScript Version:", l_l_RunService_0_CoreScriptVersion_0);
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 102 ]]
        -- upvalues: l_SentryReporter_0 (copy), l_HttpService_0 (copy), v4 (copy), v5 (copy), v8 (copy), v7 (copy), l_l_RunService_0_CoreScriptVersion_0 (copy), v6 (copy)
        return l_SentryReporter_0.new({
            httpService = l_HttpService_0, 
            processErrorReportMethod = v4.processReport, 
            generateLogMethod = function() --[[ Line: 111 ]] --[[ Name: generateLogMethod ]]
                -- upvalues: v5 (ref)
                return v5:generateAppLog();
            end, 
            dsn = v8, 
            environment = v7 and "development" or "production", 
            release = l_l_RunService_0_CoreScriptVersion_0 or "unknown", 
            sentryClientSuccessCallback = function() --[[ Line: 120 ]] --[[ Name: sentryClientSuccessCallback ]]
                -- upvalues: v6 (ref)
                v6.logErrorSentSuccess();
            end, 
            sentryClientFailureCallback = function() --[[ Line: 123 ]] --[[ Name: sentryClientFailureCallback ]]
                -- upvalues: v6 (ref)
                v6.logErrorSentFailure();
            end, 
            logAttachmentSuccessCallback = function() --[[ Line: 126 ]] --[[ Name: logAttachmentSuccessCallback ]]
                -- upvalues: v6 (ref)
                v6.logLogAttachmentSuccess();
            end, 
            logAttachmentFailureCallback = function() --[[ Line: 129 ]] --[[ Name: logAttachmentFailureCallback ]]
                -- upvalues: v6 (ref)
                v6.logLogAttachmentFailure();
            end
        });
    end);
    if l_status_0 then
        v9 = l_result_0;
        v6.logInitSuccess();
        if v7 then
            print("[LuaAppSentryReporter] Initialized successfully");
            return v9;
        end;
    else
        v6.logInitFailure();
        if v7 then
            warn("[LuaAppSentryReporter] Failed to initialize:", l_result_0);
        end;
    end;
end;
return v9;