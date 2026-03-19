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
local v19 = game:DefineFastFlag("EnableLuaCoreScriptsErrorV2Counter", false);
local v20 = game:DefineFastFlag("EnableCoreScriptsSessionWithError", false);
local function _() --[[ Line: 54 ]] --[[ Name: CanReportCoreScriptBacktrace ]]
    return math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100);
end;
if not game:GetFastFlag("DisableCorescriptBacktraceReporting") and game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CoreScriptBacktraceErrorReportPercentage"), 0, 100) then
    local v22 = {
        LocalVersion = l_RunService_0:GetRobloxVersion(), 
        BaseUrl = l_ContentProvider_0.BaseUrl, 
        PlaceId = game.PlaceId, 
        Platform = l_UserInputService_0:GetPlatform().Name, 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion()
    };
    local v23 = v11.new({
        eraseTimeout = game:GetFastInt("CoreScriptBacktracePIIFilterEraseTimeoutSeconds")
    });
    local l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 = game:GetFastFlag("CoreScriptBacktraceRepeatedErrorRateLimiting");
    local v25 = nil;
    if l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 then
        v25 = v10.new({
            period = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitPeriod"), 
            threshold = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitCount"), 
            processInterval = game:GetFastInt("CoreScriptBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
        });
    end;
    local v26 = if v20 then l_SessionWithErrorReporter_0.new(v18, 300, nil) else nil;
    local v28 = l_BacktraceReporter_0.new({
        httpService = l_HttpService_0, 
        token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"), 
        processErrorReportMethod = function(v27) --[[ Line: 92 ]] --[[ Name: processReport ]]
            -- upvalues: v22 (copy), l_Players_0 (copy), l_RunService_0 (copy)
            v27:addAttributes(v22);
            v27:addAttributes({
                PlayerCount = #l_Players_0:GetPlayers()
            });
            v27:addAttributes({
                RobloxChannel = l_RunService_0:GetRobloxClientChannel()
            });
            return v27;
        end
    });
    do
        local l_v25_0 = v25;
        local function v39(v30, v31, v32, v33) --[[ Line: 113 ]] --[[ Name: handleErrorDetailed ]]
            -- upvalues: l_CoreGui_0 (copy), l_CorePackages_0 (copy), v15 (copy), v23 (copy), l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 (copy), l_v25_0 (ref), v28 (copy), v19 (copy), l_default_0 (copy), v12 (copy), v20 (copy), v26 (copy)
            if v32 ~= nil and (v32:IsDescendantOf(l_CoreGui_0) or v32:IsDescendantOf(l_CorePackages_0)) then
                local v34, v35 = v15.unstable_parseReactError(v30);
                v30 = v34.message;
                v31 = v34.stack or v31;
                v33 = v33 or v35;
                local v36 = v23:cleanPii(v30);
                local v37 = v23:cleanPii(v31);
                if v33 ~= nil then
                    v33 = v23:cleanPii(v33);
                end;
                if l_CoreScriptBacktraceRepeatedErrorRateLimiting_0 then
                    local v38 = v36 .. v37;
                    if l_v25_0:isRateLimited(v38) then
                        return;
                    else
                        l_v25_0:increment(v38);
                    end;
                end;
                v28:reportErrorDeferred(v36, v37, v33);
                if v19 then
                    l_default_0:logRobloxTelemetryCounter(v12, 1);
                end;
                if v20 then
                    v26:reportEvent(1, nil, "ERROR");
                end;
            end;
        end;
        l_ScriptContext_0.ErrorDetailed:Connect(function(...) --[[ Line: 158 ]]
            -- upvalues: v39 (copy)
            local l_status_0, l_result_0 = pcall(v39, ...);
            if not l_status_0 then
                warn(("CoreScript error reporter failed to handle an error:\n%s"):format(l_result_0));
            end;
        end);
        v22.ServerVersion = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999):InvokeServer();
    end;
end;