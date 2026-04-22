local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_RunService_0 = game:GetService("RunService");
local l_ScriptContext_0 = game:GetService("ScriptContext");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local v10 = require(l_RobloxGui_0.Modules.ErrorReporting.RateLimiter);
local v11 = require(l_RobloxGui_0.Modules.ErrorReporting.PiiFilter);
local v12 = require(l_RobloxGui_0.Modules.ErrorReporting.LuaCoreScriptsErrorV2CounterConfig);
local l_BacktraceReporter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).BacktraceReporter;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v15 = require(l_CorePackages_0.Packages.React);
local v16 = game:DefineFastFlag("EnableCoreScriptsSessionWithError", false);
local l_SessionWithErrorReporter_0 = require(l_CorePackages_0.Workspace.Packages.AppObservability).SessionWithErrorReporter;
local v18 = if v16 then require(l_RobloxGui_0.Modules.ErrorReporting.LuaCoreScriptsSessionWithErrorConfig) else nil;
game:DefineFastFlag("DisableCorescriptBacktraceReporting", false);
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "");
game:DefineFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds", 300);
game:DefineFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting", true);
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount", 5);
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod", 60);
game:DefineFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10);
game:DefineFastInt("CoreScriptBacktraceErrorReportPercentage", 100);
local v19 = game:DefineFastFlag("EnableCoreScriptsSessionWithError", false);
local function _() --[[ Line: 52 ]] --[[ Name: CanReportCoreScriptBacktrace ]]
    return math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100);
end;
if not game:GetFastFlag("DisableCorescriptBacktraceReporting") and game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100) then
    local v21 = {
        LocalVersion = l_RunService_0:GetRobloxVersion(), 
        BaseUrl = l_ContentProvider_0.BaseUrl, 
        PlaceId = game.PlaceId, 
        Platform = l_UserInputService_0:GetPlatform().Name, 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion()
    };
    local v22 = v11.new({
        eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
    });
    local l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 = game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting");
    local v24 = nil;
    if l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 then
        v24 = v10.new({
            period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"), 
            threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"), 
            processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
        });
    end;
    local v25 = if v19 then l_SessionWithErrorReporter_0.new(v18, 300, nil) else nil;
    local v27 = l_BacktraceReporter_0.new({
        httpService = l_HttpService_0, 
        token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"), 
        processErrorReportMethod = function(v26) --[[ Line: 90 ]] --[[ Name: processReport ]]
            -- upvalues: v21 (copy), l_Players_0 (copy), l_RunService_0 (copy)
            v26:addAttributes(v21);
            v26:addAttributes({
                PlayerCount = #l_Players_0:GetPlayers()
            });
            v26:addAttributes({
                RobloxChannel = l_RunService_0:GetRobloxClientChannel()
            });
            return v26;
        end
    });
    do
        local l_v24_0 = v24;
        local function v38(v29, v30, v31, v32) --[[ Line: 111 ]] --[[ Name: handleErrorDetailed ]]
            -- upvalues: l_CoreGui_0 (copy), l_CorePackages_0 (copy), v15 (copy), v22 (copy), l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 (copy), l_v24_0 (ref), v27 (copy), l_default_0 (copy), v12 (copy), v19 (copy), v25 (copy)
            if v31 ~= nil and (v31:IsDescendantOf(l_CoreGui_0) or v31:IsDescendantOf(l_CorePackages_0)) then
                local v33, v34 = v15.unstable_parseReactError(v29);
                v29 = v33.message;
                v30 = v33.stack or v30;
                v32 = v32 or v34;
                local v35 = v22:cleanPii(v29);
                local v36 = v22:cleanPii(v30);
                if v32 ~= nil then
                    v32 = v22:cleanPii(v32);
                end;
                if l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 then
                    local v37 = v35 .. v36;
                    if l_v24_0:isRateLimited(v37) then
                        return;
                    else
                        l_v24_0:increment(v37);
                    end;
                end;
                v27:reportErrorDeferred(v35, v36, v32);
                l_default_0:logRobloxTelemetryCounter(v12, 1);
                if v19 then
                    v25:reportEvent(1, nil, "ERROR");
                end;
            end;
        end;
        l_ScriptContext_0.ErrorDetailed:Connect(function(...) --[[ Line: 154 ]]
            -- upvalues: v38 (copy)
            local l_status_0, l_result_0 = pcall(v38, ...);
            if not l_status_0 then
                warn(("CoreScript error reporter failed to handle an error:\n%s"):format(l_result_0));
            end;
        end);
        v21.ServerVersion = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999):InvokeServer();
    end;
end;