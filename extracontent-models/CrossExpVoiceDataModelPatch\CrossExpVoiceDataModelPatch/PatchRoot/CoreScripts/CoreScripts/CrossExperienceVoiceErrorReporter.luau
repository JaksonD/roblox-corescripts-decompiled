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
local l_BacktraceReporter_0 = require(l_CorePackages_0.Workspace.Packages.ErrorReporters).BacktraceReporter;
game:DefineFastFlag("DisableCEVBacktraceReporting", false);
game:DefineFastString("CoreScriptBacktraceErrorUploadToken", "");
game:DefineFastInt("CEVBacktracePIIFilterEraseTimeoutSeconds", 300);
game:DefineFastFlag("CEVBacktraceRepeatedErrorRateLimiting", true);
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitCount", 5);
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitPeriod", 60);
game:DefineFastInt("CEVBacktraceRepeatedErrorRateLimitProcessIntervalTenths", 10);
game:DefineFastInt("CEVBacktraceErrorReportPercentage", 100);
local function _() --[[ Line: 41 ]] --[[ Name: CanReportCEVBacktrace ]]
    return math.random(1, 100) <= math.clamp(game:GetFastInt("CEVBacktraceErrorReportPercentage"), 0, 100);
end;
if not game:GetFastFlag("DisableCEVBacktraceReporting") and game:GetFastString("CoreScriptBacktraceErrorUploadToken") ~= "" and math.random(1, 100) <= math.clamp(game:GetFastInt("CEVBacktraceErrorReportPercentage"), 0, 100) then
    local v14 = {
        LocalVersion = l_RunService_0:GetRobloxVersion(), 
        BaseUrl = l_ContentProvider_0.BaseUrl, 
        PlaceId = game.PlaceId, 
        Platform = l_UserInputService_0:GetPlatform().Name, 
        UserAgent = l_HttpService_0:GetUserAgent(), 
        CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
        AppName = "CrossExperienceVoice"
    };
    local v15 = v11.new({
        eraseTimeout = game:GetFastInt("CEVBacktracePIIFilterEraseTimeoutSeconds")
    });
    local l_CEVBacktraceRepeatedErrorRateLimiting_0 = game:GetFastFlag("CEVBacktraceRepeatedErrorRateLimiting");
    local v17 = nil;
    if l_CEVBacktraceRepeatedErrorRateLimiting_0 then
        v17 = v10.new({
            period = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitPeriod"), 
            threshold = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitCount"), 
            processInterval = game:GetFastInt("CEVBacktraceRepeatedErrorRateLimitProcessIntervalTenths") / 10
        });
    end;
    local v19 = l_BacktraceReporter_0.new({
        httpService = l_HttpService_0, 
        token = game:GetFastString("CoreScriptBacktraceErrorUploadToken"), 
        processErrorReportMethod = function(v18) --[[ Line: 76 ]] --[[ Name: processReport ]]
            -- upvalues: v14 (copy), l_Players_0 (copy), l_RunService_0 (copy)
            v18:addAttributes(v14);
            v18:addAttributes({
                PlayerCount = #l_Players_0:GetPlayers(), 
                RobloxChannel = l_RunService_0:GetRobloxClientChannel()
            });
            return v18;
        end
    });
    do
        local l_v17_0 = v17;
        local function v28(v21, v22, v23, v24) --[[ Line: 94 ]] --[[ Name: handleErrorDetailed ]]
            -- upvalues: l_CoreGui_0 (copy), l_CorePackages_0 (copy), v15 (copy), l_CEVBacktraceRepeatedErrorRateLimiting_0 (copy), l_v17_0 (ref), v19 (copy)
            if v23 ~= nil and (v23:IsDescendantOf(l_CoreGui_0) or v23:IsDescendantOf(l_CorePackages_0)) then
                local v25 = v15:cleanPii(v21);
                local v26 = v15:cleanPii(v22);
                if v24 ~= nil then
                    v24 = v15:cleanPii(v24);
                end;
                if l_CEVBacktraceRepeatedErrorRateLimiting_0 then
                    local v27 = v25 .. v26;
                    if l_v17_0:isRateLimited(v27) then
                        return;
                    else
                        l_v17_0:increment(v27);
                    end;
                end;
                v19:reportErrorDeferred(v25, v26, v24);
            end;
        end;
        l_ScriptContext_0.ErrorDetailed:Connect(function(...) --[[ Line: 121 ]]
            -- upvalues: v28 (copy)
            local l_status_0, l_result_0 = pcall(v28, ...);
            if not l_status_0 then
                warn(("CEV error reporter failed to handle an error:\n%s"):format(l_result_0));
            end;
        end);
        v14.ServerVersion = l_RobloxReplicatedStorage_0:WaitForChild("GetServerVersion", 1e999):InvokeServer();
    end;
end;