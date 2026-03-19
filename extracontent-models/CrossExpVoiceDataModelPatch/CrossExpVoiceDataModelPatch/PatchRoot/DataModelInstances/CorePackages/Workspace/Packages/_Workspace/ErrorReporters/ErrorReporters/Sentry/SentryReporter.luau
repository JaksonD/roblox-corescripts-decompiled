local l_Parent_0 = script:FindFirstAncestor("ErrorReporters").Parent;
local l_Client_0 = require(l_Parent_0.SentrySdk).Client;
local l_RunService_0 = game:GetService("RunService");
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.t);
local v5 = require(script.Parent.Parent.ErrorQueue);
local v6 = require(script.Parent.Parent.FIntOldestUAVersionToReportErrors);
local v7 = require(script.Parent.ErrorReport);
local v8 = require(script.Parent.SentryReporterUtility);
local v9 = require(script.Parent.Constants);
local l_IAttributes_0 = v7.IAttributes;
local l_IAnnotations_0 = v7.IAnnotations;
local v12 = l_RunService_0:IsStudio();
local function _(v13) --[[ Line: 43 ]] --[[ Name: truncateLog ]]
    local v14 = string.len(v13);
    if v14 <= 20971520 then
        return v13, false;
    else
        local v15 = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", v14 / 1048576, 20);
        return v15 .. string.sub(v13, v14 - (20971520 - string.len(v15)) + 1), true;
    end;
end;
local v17 = {};
v17.__index = v17;
local function _(v18, v19, v20, v21) --[[ Line: 78 ]] --[[ Name: createSentryClient ]]
    -- upvalues: l_Client_0 (copy)
    return l_Client_0:new({
        dsn = v18, 
        environment = v19, 
        release = v20
    }, v21);
end;
local function _(v23, v24) --[[ Line: 121 ]] --[[ Name: buildErrorKey ]]
    local v25 = v23 or "";
    local v26 = v24 or "";
    return string.format("%s | %s", v25, v26);
end;
local v28 = v4.strictInterface({
    httpService = v4.some(v4.instanceOf("HttpService"), v4.interface({
        JSONEncode = v4.callback, 
        JSONDecode = v4.callback, 
        RequestInternal = v4.callback
    })), 
    processErrorReportMethod = v4.optional(v4.callback), 
    queueOptions = v4.optional(v4.table), 
    generateLogMethod = v4.optional(v4.callback), 
    logIntervalInSeconds = v4.optional(v4.numberPositive), 
    dsn = v4.string, 
    environment = v4.optional(v4.string), 
    release = v4.optional(v4.string), 
    sentryClientSuccessCallback = v4.optional(v4.callback), 
    sentryClientFailureCallback = v4.optional(v4.callback), 
    logAttachmentSuccessCallback = v4.optional(v4.callback), 
    logAttachmentFailureCallback = v4.optional(v4.callback)
});
v17.new = function(v29) --[[ Line: 155 ]] --[[ Name: new ]]
    -- upvalues: v28 (copy), v12 (copy), l_Client_0 (copy), v17 (copy), v5 (copy)
    local v30, v31 = v28(v29);
    if not v30 then
        if v12 then
            error("invalid arguments for SentryReporter: " .. v31);
        else
            return nil;
        end;
    end;
    local v32 = {
        _isEnabled = true, 
        _httpService = v29.httpService, 
        _errorQueue = nil, 
        _processErrorReportMethod = v29.processErrorReportMethod, 
        _sharedAttributes = {}, 
        _sharedAnnotations = {}, 
        _generateLogMethod = v29.generateLogMethod, 
        _logIntervalInSeconds = v29.logIntervalInSeconds or 5, 
        _lastLogTime = 0, 
        _dsn = v29.dsn, 
        _environment = v29.environment, 
        _release = v29.release
    };
    local l_dsn_0 = v29.dsn;
    local l_environment_0 = v29.environment;
    local l_release_0 = v29.release;
    local l_httpService_0 = v29.httpService;
    v32._sentryClient = l_Client_0:new({
        dsn = l_dsn_0, 
        environment = l_environment_0, 
        release = l_release_0
    }, l_httpService_0);
    v32._sentryClientSuccessCallback = v29.sentryClientSuccessCallback or nil;
    v32._sentryClientFailureCallback = v29.sentryClientFailureCallback or nil;
    v32._logAttachmentSuccessCallback = v29.logAttachmentSuccessCallback or nil;
    v32._logAttachmentFailureCallback = v29.logAttachmentFailureCallback or nil;
    setmetatable(v32, v17);
    local v40 = v5.new(function(_, v38, _) --[[ Line: 196 ]]
        -- upvalues: v32 (copy)
        v32:sendErrorReport(v38.errorReport, v38.log);
    end, v29.queueOptions);
    v32._errorQueue = v40;
    v40:startTimer();
    return v32;
end;
v17.isTooOldToReportErrors = function(_) --[[ Line: 215 ]] --[[ Name: isTooOldToReportErrors ]]
    -- upvalues: l_RunService_0 (copy), v6 (copy)
    local l_l_RunService_0_RobloxVersion_0 = l_RunService_0:GetRobloxVersion();
    local v43 = tonumber(string.match(l_l_RunService_0_RobloxVersion_0, ".(%d+)."));
    if not v43 then
        return false;
    elseif v43 < v6 then
        return true;
    else
        return false;
    end;
end;
v17._sendLogAttachment = function(v44, v45, v46) --[[ Line: 239 ]] --[[ Name: _sendLogAttachment ]]
    -- upvalues: v12 (copy)
    local v47 = string.len(v46);
    local v48 = string.len(v46);
    local v49, v50;
    if v48 <= 20971520 then
        v50 = v46;
        v49 = false;
    else
        local v51 = string.format("[LOG TRUNCATED - Original size: %.2f MB, kept latest %.2f MB]\n\n", v48 / 1048576, 20);
        v50 = v51 .. string.sub(v46, v48 - (20971520 - string.len(v51)) + 1);
        v49 = true;
    end;
    if v49 and v12 then
        v48 = string.format("Log attachment truncated: original %.2f MB, sending latest %.2f MB", v47 / 1048576, 20);
        print("[Sentry] " .. v48);
    end;
    v48 = {
        {
            filename = "app.log", 
            data = v50, 
            content_type = "text/plain"
        }
    };
    if v12 and not v49 then
        local v52 = string.format("Sending log attachment for event: %s (%.2f KB)", v45, v47 / 1024);
        print("[Sentry] " .. v52);
    end;
    v44._sentryClient:send_event_with_attachments(v45, v48, function(v53, v54, _) --[[ Line: 270 ]]
        -- upvalues: v12 (ref), v45 (copy), v44 (copy)
        if v53 then
            if v12 then
                print("[Sentry] Successfully attached log to event:", v45);
            end;
            if v44._logAttachmentSuccessCallback ~= nil then
                v44._logAttachmentSuccessCallback();
                return;
            end;
        else
            if v12 then
                local v56 = if type(v54) == "table" then v54.error or "unknown error" else tostring(v54);
                warn("[Sentry] Failed to attach log:", v56);
            end;
            if v44._logAttachmentFailureCallback ~= nil then
                v44._logAttachmentFailureCallback(v54);
            end;
        end;
    end);
end;
v17._handleSentryExceptionCallback = function(v57, v58, v59, v60, v61) --[[ Line: 303 ]] --[[ Name: _handleSentryExceptionCallback ]]
    -- upvalues: v12 (copy)
    if v58 then
        if v12 then
            print("[Sentry] Successfully reported error to Sentry:", v60);
        end;
        if v57._sentryClientSuccessCallback ~= nil then
            v57._sentryClientSuccessCallback();
        end;
        if v61 and v60 then
            v57:_sendLogAttachment(v60, v61);
            return;
        end;
    else
        if v12 then
            local v62 = if type(v59) == "table" then v59.error or "unknown error" else tostring(v59);
            warn("[Sentry] Failed to report error to Sentry:", v62);
        end;
        if v57._sentryClientFailureCallback ~= nil then
            v57._sentryClientFailureCallback(v59);
        end;
    end;
end;
v17.sendErrorReport = function(v63, v64, v65) --[[ Line: 335 ]] --[[ Name: sendErrorReport ]]
    -- upvalues: v12 (copy), v9 (copy), v8 (copy)
    if not v63._isEnabled then
        return;
    elseif v63:isTooOldToReportErrors() then
        return;
    else
        if v12 then
            assert(v64:validate());
        end;
        local v66 = v64.message or "Unknown error message";
        local v67 = v64.level or v9.DEFAULT_ERROR_LEVEL;
        local v68 = v8.parseErrorToContext(v64);
        local v69 = v8.parseThreadsToSentry(v64.threads);
        local v70 = nil;
        if v69 and v69.values then
            for _, v72 in ipairs(v69.values) do
                if v72.main == true or v72.crashed == true then
                    v70 = v72.stacktrace;
                    break;
                end;
            end;
        end;
        if v12 then
            print("[Sentry] Report Context:", v68);
            print("[Sentry] Threads:", v69);
            print("[Sentry] Main Stacktrace:", v70);
            print("[Sentry] Level:", v67);
        end;
        v63._sentryClient:capture_exception({
            type = "UniversalAppError", 
            message = v66, 
            stacktrace = v70
        }, v67, v68, v69, function(v73, v74, v75) --[[ Line: 387 ]]
            -- upvalues: v63 (copy), v65 (copy)
            v63:_handleSentryExceptionCallback(v73, v74, v75, v65);
        end);
        return;
    end;
end;
v17._sendLogToReport = function(_, _, v78) --[[ Line: 399 ]] --[[ Name: _sendLogToReport ]]
    if type(v78) ~= "string" or #v78 == 0 then
        return;
    else
        pcall(function() --[[ Line: 404 ]]

        end);
        return;
    end;
end;
v17._generateLog = function(v79) --[[ Line: 414 ]] --[[ Name: _generateLog ]]
    if v79._generateLogMethod ~= nil and tick() - v79._lastLogTime > v79._logIntervalInSeconds then
        v79._lastLogTime = tick();
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 418 ]]
            -- upvalues: v79 (copy)
            return v79._generateLogMethod();
        end);
        if l_status_0 and type(l_result_0) == "string" and #l_result_0 > 0 then
            return l_result_0;
        end;
    end;
    return nil;
end;
v17._generateErrorReport = function(v82, v83, v84, v85, _) --[[ Line: 439 ]] --[[ Name: _generateErrorReport ]]
    -- upvalues: v7 (copy)
    local v87 = nil;
    if type(v85) == "table" then
        v87 = v7.fromDetails(v85);
    else
        v87 = v7.fromMessageAndStack(v83, v84);
        if type(v85) == "string" then
            v87:addAnnotations({
                stackDetails = v85
            });
        end;
    end;
    v87:addAttributes(v82._sharedAttributes);
    if v82._sharedAnnotations and next(v82._sharedAnnotations) ~= nil then
        v87:addAnnotations(v82._sharedAnnotations);
    end;
    if v82._processErrorReportMethod ~= nil then
        v87 = v82._processErrorReportMethod(v87);
    end;
    return v87, (v82:_generateLog());
end;
v17.reportErrorImmediately = function(v88, v89, v90, v91, v92) --[[ Line: 492 ]] --[[ Name: reportErrorImmediately ]]
    if not v88._isEnabled then
        return;
    else
        local v93, v94 = v88:_generateErrorReport(v89, v90, v91, v92);
        v88:sendErrorReport(v93, v94);
        return;
    end;
end;
v17.reportErrorDeferred = function(v95, v96, v97, v98, v99) --[[ Line: 516 ]] --[[ Name: reportErrorDeferred ]]
    if not v95._isEnabled then
        return;
    else
        local v100 = v96 or "";
        local v101 = v97 or "";
        local v102 = string.format("%s | %s", v100, v101);
        v100 = {
            errorReport = nil, 
            log = nil
        };
        if not v95._errorQueue:hasError(v102) then
            local v103;
            v101, v103 = v95:_generateErrorReport(v96, v97, v98, v99);
            v100 = {
                errorReport = v101, 
                log = v103
            };
        end;
        v95._errorQueue:addError(v102, v100);
        return;
    end;
end;
v17.reportAllErrors = function(v104) --[[ Line: 551 ]] --[[ Name: reportAllErrors ]]
    if v104._errorQueue ~= nil then
        v104._errorQueue:reportAllErrors();
    end;
end;
v17.stop = function(v105) --[[ Line: 560 ]] --[[ Name: stop ]]
    v105._isEnabled = false;
    if v105._errorQueue ~= nil then
        v105:reportAllErrors();
        v105._errorQueue:stopTimer();
    end;
end;
v17.updateSharedAttributes = function(v106, v107) --[[ Line: 578 ]] --[[ Name: updateSharedAttributes ]]
    -- upvalues: v3 (copy), l_IAttributes_0 (copy), v12 (copy)
    local v108 = v3.Dictionary.join(v106._sharedAttributes, v107);
    local v109, v110 = l_IAttributes_0(v108);
    if not v109 then
        if v12 then
            assert(v109, v110);
        else
            return;
        end;
    end;
    v106._sharedAttributes = v108;
end;
v17.updateSharedAnnotations = function(v111, v112) --[[ Line: 600 ]] --[[ Name: updateSharedAnnotations ]]
    -- upvalues: v3 (copy), l_IAnnotations_0 (copy), v12 (copy)
    local v113 = v3.Dictionary.join(v111._sharedAnnotations, v112);
    local v114, v115 = l_IAnnotations_0(v113);
    if not v114 then
        if v12 then
            assert(v114, v115);
        else
            return;
        end;
    end;
    v111._sharedAnnotations = v113;
end;
return v17;