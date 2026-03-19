local l_Parent_0 = script:FindFirstAncestor("ErrorReporters").Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.BacktraceReport);
local v5 = require(script.Parent.Parent.ErrorQueue);
local v6 = require(script.Parent.Flags.FFlagLuaAppEnableBacktraceSessionInfo);
local v7 = l_RunService_0:IsStudio();
local v8 = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors);
local v9 = {};
v9.__index = v9;
local v10 = v3.strictInterface({
    httpService = v3.some(v3.instanceOf("HttpService"), v3.interface({
        JSONEncode = v3.callback, 
        JSONDecode = v3.callback, 
        RequestInternal = v3.callback
    })), 
    token = v3.string, 
    processErrorReportMethod = v3.optional(v3.callback), 
    queueOptions = v3.optional(v3.table), 
    generateLogMethod = v3.optional(v3.callback), 
    logIntervalInSeconds = v3.optional(v3.numberPositive)
});
v9.new = function(v11) --[[ Line: 42 ]] --[[ Name: new ]]
    -- upvalues: v10 (copy), v7 (copy), v9 (copy), v5 (copy)
    local v12, v13 = v10(v11);
    local v14 = nil;
    if v12 then
        v14 = {
            _isEnabled = true, 
            _httpService = v11.httpService, 
            _errorQueue = nil, 
            _reportUrl = game:GetFastString("ErrorUploadToBacktraceBaseUrl") .. "token=" .. v11.token, 
            _processErrorReportMethod = v11.processErrorReportMethod, 
            _sharedAttributes = {}, 
            _sharedAnnotations = {}, 
            _generateLogMethod = v11.generateLogMethod, 
            _logIntervalInSeconds = v11.logIntervalInSeconds or 60, 
            _lastLogTime = 0
        };
    elseif v7 or _G.__DEV__ then
        error("invalid arguments for BacktraceReporter: " .. v13);
    else
        v14 = {
            _isEnabled = false
        };
    end;
    setmetatable(v14, v9);
    if v14._isEnabled then
        local v15 = v5.new(function(...) --[[ Line: 72 ]]
            -- upvalues: v14 (ref)
            v14:_reportErrorFromErrorQueue(...);
        end, v11.queueOptions);
        v14._errorQueue = v15;
        v14._errorQueue:startTimer();
    end;
    return v14;
end;
v9.isTooOldToReportErrors = function(_) --[[ Line: 85 ]] --[[ Name: isTooOldToReportErrors ]]
    -- upvalues: l_RunService_0 (copy), v8 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    local v18 = tonumber(string.match(l_l_RunService_0_RobloxVersion_0, ".(%d+)."));
    if not v18 then
        return false;
    elseif v18 < v8 then
        return true;
    else
        return false;
    end;
end;
v9.sendErrorReport = function(v19, v20, v21) --[[ Line: 97 ]] --[[ Name: sendErrorReport ]]
    -- upvalues: v7 (copy)
    if not v19._isEnabled then
        return;
    elseif v19:isTooOldToReportErrors() then
        return;
    else
        if v7 or _G.__DEV__ then
            assert(v20:validate());
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 113 ]]
            -- upvalues: v19 (copy), v20 (copy)
            return v19._httpService:JSONEncode(v20);
        end);
        if not l_status_0 then
            warn("Cannot convert report to Json");
            return;
        else
            pcall(function() --[[ Line: 122 ]]
                -- upvalues: v19 (copy), l_result_0 (copy), v21 (copy)
                v19._httpService:RequestInternal({
                    Url = v19._reportUrl .. "&format=json", 
                    Method = "POST", 
                    Headers = {
                        ["Content-Type"] = "application/json"
                    }, 
                    Body = l_result_0
                }):Start(function(_, v25) --[[ Line: 132 ]]
                    -- upvalues: v21 (ref), v19 (ref)
                    if v25.StatusCode == 200 and v21 ~= nil then
                        local l_status_1, l_result_1 = pcall(function() --[[ Line: 136 ]]
                            -- upvalues: v19 (ref), v25 (copy)
                            return v19._httpService:JSONDecode(v25.Body);
                        end);
                        if l_status_1 and l_result_1._rxid ~= nil then
                            v19:_sendLogToReport(l_result_1._rxid, v21);
                        end;
                    end;
                end);
            end);
            return;
        end;
    end;
end;
v9._sendLogToReport = function(v28, v29, v30) --[[ Line: 148 ]] --[[ Name: _sendLogToReport ]]
    if type(v30) ~= "string" or #v30 == 0 then
        return;
    else
        pcall(function() --[[ Line: 153 ]]
            -- upvalues: v28 (copy), v29 (copy), v30 (copy)
            v28._httpService:RequestInternal({
                Url = v28._reportUrl .. "&object=" .. v29 .. "&attachment_name=log.txt", 
                Method = "POST", 
                Headers = {
                    ["Content-Type"] = "text/plain"
                }, 
                Body = v30
            }):Start(function(_, _) --[[ Line: 163 ]]

            end);
        end);
        return;
    end;
end;
v9._generateLog = function(v33) --[[ Line: 169 ]] --[[ Name: _generateLog ]]
    if v33._generateLogMethod ~= nil and tick() - v33._lastLogTime > v33._logIntervalInSeconds then
        v33._lastLogTime = tick();
        local l_status_2, l_result_2 = pcall(function() --[[ Line: 173 ]]
            -- upvalues: v33 (copy)
            return v33._generateLogMethod();
        end);
        if l_status_2 and type(l_result_2) == "string" and #l_result_2 > 0 then
            return l_result_2;
        end;
    end;
    return nil;
end;
v9._generateErrorReport = function(v36, v37, v38, v39, v40) --[[ Line: 185 ]] --[[ Name: _generateErrorReport ]]
    -- upvalues: v4 (copy), v6 (copy)
    local v41 = nil;
    v41 = if type(v39) == "table" then v4.fromDetails(v39) else v4.fromMessageAndStack(v37, v38);
    if v6 and v40 ~= nil then
        v41:addAttributes(v40);
    end;
    v41:addAttributes(v36._sharedAttributes);
    v41:addAnnotations(v36._sharedAnnotations);
    if type(v39) == "string" and v39 ~= "" then
        v41:addAnnotations({
            stackDetails = v39
        });
    end;
    return v41;
end;
v9.reportErrorImmediately = function(v42, v43, v44, v45, v46) --[[ Line: 211 ]] --[[ Name: reportErrorImmediately ]]
    if not v42._isEnabled then
        return;
    else
        local v47 = v42:_generateErrorReport(v43, v44, v45, v46);
        if v42._processErrorReportMethod ~= nil then
            v47 = v42._processErrorReportMethod(v47);
        end;
        v42:sendErrorReport(v47, (v42:_generateLog()));
        return;
    end;
end;
v9.reportErrorDeferred = function(v48, v49, v50, v51, v52) --[[ Line: 228 ]] --[[ Name: reportErrorDeferred ]]
    if not v48._isEnabled then
        return;
    else
        local v53 = string.format("%s | %s", v49, v50);
        local v54 = {};
        if not v48._errorQueue:hasError(v53) then
            local v55 = v48:_generateErrorReport(v49, v50, v51, v52);
            if v48._processErrorReportMethod ~= nil then
                v55 = v48._processErrorReportMethod(v55);
            end;
            v54 = {
                backtraceReport = v55, 
                log = v48:_generateLog()
            };
        end;
        v48._errorQueue:addError(v53, v54);
        return;
    end;
end;
v9._reportErrorFromErrorQueue = function(v56, _, v58, v59) --[[ Line: 255 ]] --[[ Name: _reportErrorFromErrorQueue ]]
    local l_backtraceReport_0 = v58.backtraceReport;
    local l_log_0 = v58.log;
    l_backtraceReport_0:addAttributes({
        ErrorCount = v59
    });
    v56:sendErrorReport(l_backtraceReport_0, l_log_0);
end;
local l_IAttributes_0 = v4.IAttributes;
v9.updateSharedAttributes = function(v63, v64) --[[ Line: 269 ]] --[[ Name: updateSharedAttributes ]]
    -- upvalues: v2 (copy), l_IAttributes_0 (copy), v7 (copy)
    local v65 = v2.Dictionary.join(v63._sharedAttributes, v64);
    local v66, v67 = l_IAttributes_0(v65);
    if not v66 then
        if v7 or _G.__DEV__ then
            assert(v66, v67);
        else
            return;
        end;
    end;
    v63._sharedAttributes = v65;
end;
local l_IAnnotations_0 = v4.IAnnotations;
v9.updateSharedAnnotations = function(v69, v70) --[[ Line: 288 ]] --[[ Name: updateSharedAnnotations ]]
    -- upvalues: v2 (copy), l_IAnnotations_0 (copy), v7 (copy)
    local v71 = v2.Dictionary.join(v69._sharedAnnotations, v70);
    local v72, v73 = l_IAnnotations_0(v71);
    if not v72 then
        if v7 or _G.__DEV__ then
            assert(v72, v73);
        else
            return;
        end;
    end;
    v69._sharedAnnotations = v71;
end;
v9.reportAllErrors = function(v74) --[[ Line: 305 ]] --[[ Name: reportAllErrors ]]
    if v74._errorQueue ~= nil then
        v74._errorQueue:reportAllErrors();
    end;
end;
v9.stop = function(v75) --[[ Line: 311 ]] --[[ Name: stop ]]
    v75._isEnabled = false;
    if v75._errorQueue ~= nil then
        v75:reportAllErrors();
        v75._errorQueue:stopTimer();
    end;
end;
return v9;