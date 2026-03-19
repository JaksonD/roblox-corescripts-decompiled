local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountRecovery");
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventConstants);
local l_recoveryEventName_0 = v5.recoveryEventName;
local function v8() --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v5 (copy), l_recoveryEventName_0 (copy)
    local v7 = {
        is_luafied = true
    };
    v4:sendEventDeferred(v5.context.pageLoad, l_recoveryEventName_0, v7);
end;
local function v13(v9, v10, v11) --[[ Line: 19 ]]
    -- upvalues: v4 (copy), v5 (copy), l_recoveryEventName_0 (copy)
    local v12 = {
        recovery_session_id = v9, 
        identifier_type = v10, 
        next_component = v11, 
        is_luafied = true
    };
    v4:sendEventDeferred(v5.context.recoveryInitializedFromAutofill, l_recoveryEventName_0, v12);
end;
local function v18(v14, v15, v16) --[[ Line: 37 ]]
    -- upvalues: v4 (copy), v5 (copy), l_recoveryEventName_0 (copy)
    local v17 = {
        recovery_session_id = v14, 
        identifier_type = v15, 
        next_component = v16, 
        is_luafied = true
    };
    v4:sendEventDeferred(v5.context.identifierSent, l_recoveryEventName_0, v17);
end;
local function v22(v19, v20) --[[ Line: 47 ]]
    -- upvalues: v4 (copy), v5 (copy), l_recoveryEventName_0 (copy)
    local v21 = {
        recovery_session_id = v19, 
        contact_method_type = v20, 
        is_luafied = true
    };
    v4:sendEventDeferred(v5.context.contactMethodSent, l_recoveryEventName_0, v21);
end;
local function v25(v23) --[[ Line: 56 ]]
    -- upvalues: v4 (copy), v5 (copy), l_recoveryEventName_0 (copy)
    local v24 = {
        recovery_session_id = v23, 
        is_luafied = true
    };
    v4:sendEventDeferred(v5.context.userSelected, l_recoveryEventName_0, v24);
end;
local function v29(v26, v27) --[[ Line: 64 ]]
    -- upvalues: v4 (copy), v5 (copy), l_recoveryEventName_0 (copy)
    local v28 = {
        recovery_session_id = v26, 
        redirect_after_reset = v27, 
        is_luafied = true
    };
    v4:sendEventDeferred(v5.context.passwordReset, l_recoveryEventName_0, v28);
end;
local function v35(v30, v31, v32) --[[ Line: 73 ]]
    -- upvalues: v5 (copy), v4 (copy), l_recoveryEventName_0 (copy)
    local v33 = v31 and v5.context.switchedToPhoneInput or v5.context.switchedToEmailInput;
    local v34 = {
        recovery_session_id = v30, 
        is_luafied = true, 
        current_component = v32
    };
    v4:sendEventDeferred(v33, l_recoveryEventName_0, v34);
end;
local function v39(v36, v37) --[[ Line: 88 ]]
    -- upvalues: v4 (copy), v5 (copy), l_recoveryEventName_0 (copy)
    local v38 = {
        recovery_session_id = v36, 
        current_component = v37, 
        is_luafied = true
    };
    v4:sendEventDeferred(v5.context.backButtonClicked, l_recoveryEventName_0, v38);
end;
local v40 = {
    eventName = v5.context.passwordUpdateAttempted, 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        2026, 
        2, 
        4
    }, 
    description = "Event fired when update password to iOS Keychain is attempted after recovery", 
    links = ""
};
local v41 = {
    eventName = v5.context.passwordUpdateSuccess, 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        2026, 
        2, 
        4
    }, 
    description = "Event fired when update password to iOS Keychain succeeds after recovery", 
    links = ""
};
local v42 = {
    eventName = v5.context.passwordUpdateFailure, 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        2026, 
        2, 
        4
    }, 
    description = "Event fired when update password to iOS Keychain fails after recovery", 
    links = ""
};
local v43 = {
    eventName = v5.context.passwordUpdateSkipped, 
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = 10000, 
    lastUpdated = {
        2026, 
        2, 
        4
    }, 
    description = "Event fired when update password to iOS Keychain is skipped after recovery", 
    links = ""
};
return {
    sendPageLoadEvent = v8, 
    sendRecoveryInitializedFromAutofillEvent = v13, 
    sendIdentifierSentEvent = v18, 
    sendContactMethodSentEvent = v22, 
    sendUserSelectedEvent = v25, 
    sendPasswordResetEvent = v29, 
    sendSwitchedInputEvent = v35, 
    sendBackButtonClickedEvent = v39, 
    sendPasswordUpdateAttemptedEvent = function(v44, v45) --[[ Line: 134 ]]
        -- upvalues: l_TelemetryService_0 (copy), v40 (copy)
        local v46 = {
            recovery_session_id = v44, 
            username = v45, 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v40, {
            customFields = v46
        });
    end, 
    sendPasswordUpdateSuccessEvent = function(v47, v48) --[[ Line: 143 ]]
        -- upvalues: l_TelemetryService_0 (copy), v41 (copy)
        local v49 = {
            recovery_session_id = v47, 
            username = v48, 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v41, {
            customFields = v49
        });
    end, 
    sendPasswordUpdateFailureEvent = function(v50, v51, v52) --[[ Line: 152 ]]
        -- upvalues: l_TelemetryService_0 (copy), v42 (copy)
        local v53 = {
            recovery_session_id = v50, 
            username = v51, 
            error_message = v52 or "unknown", 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v42, {
            customFields = v53
        });
    end, 
    sendPasswordUpdateSkippedEvent = function(v54, v55) --[[ Line: 162 ]]
        -- upvalues: l_TelemetryService_0 (copy), v43 (copy)
        local v56 = {
            recovery_session_id = v54, 
            skip_reason = v55, 
            is_luafied = true
        };
        l_TelemetryService_0:LogEvent(v43, {
            customFields = v56
        });
    end
};