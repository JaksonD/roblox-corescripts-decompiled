local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local l_TelemetryService_0 = game:GetService("TelemetryService");
local v3 = require(l_Parent_0.Dash);
local l_FFlagFixAnalyticsForDynamicReportV2_0 = require(l_Parent_0.SharedFlags).FFlagFixAnalyticsForDynamicReportV2;
local v5 = {
    OpenDialog = "OpenDialog", 
    EarlyClose = "EarlyClose", 
    Close = "Close", 
    Submit = "Submit", 
    SubmitSuccess = "SubmitSuccess", 
    SubmitFail = "SubmitFail", 
    BackAction = "BackAction", 
    NodeDone = "NodeDone", 
    SelectItem = "SelectItem", 
    IsUserBlockAvailable = "IsUserBlockAvailable", 
    IsUserMuteAvailable = "IsUserMuteAvailable", 
    DidBlockUser = "DidBlockUser", 
    DidUnblockUser = "DidUnblockUser", 
    DidMuteUser = "DidMuteUser", 
    HelplineShown = "HelplineShown", 
    HelplineOpened = "HelplineOpened", 
    Error = "Error"
};
local _ = function(v6) --[[ Line: 70 ]] --[[ Name: isArray ]]
    local v7 = 0;
    for _ in v6 do
        v7 = v7 + 1;
    end;
    local v9 = false;
    if v7 == #v6 then
        v9 = v7 > 0;
    end;
    return v9;
end;
local function v22(v11) --[[ Line: 83 ]] --[[ Name: flattenForTelemetry ]]
    local v12 = {};
    for v13, v14 in v11 do
        if type(v14) == "table" then
            local v15 = 0;
            for _ in v14 do
                v15 = v15 + 1;
            end;
            local v17 = false;
            if v15 == #v14 then
                v17 = v15 > 0;
            end;
            if v17 then
                v17 = {};
                for _, v19 in v14 do
                    table.insert(v17, (tostring(v19)));
                end;
                v12[v13] = "[" .. table.concat(v17, ", ") .. "]";
            else
                for v20, v21 in v14 do
                    v12[tostring(v20)] = tostring(v21);
                end;
            end;
        else
            v12[v13] = tostring(v14);
        end;
    end;
    return v12;
end;
local v23 = {
    eventName = "DynamicAbuseReportEventV2", 
    description = "Event to track dynamic abuse report v2", 
    lastUpdated = {
        2025, 
        11, 
        18
    }, 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("DynamicAbuseReportV2ThrottleHundredthsPercent", 0), 
    links = "https://github.rbx.com/Roblox/proto-schemas/pull/8782"
};
return {
    sendAnalyticsEvent = function(v24, v25) --[[ Line: 119 ]] --[[ Name: sendAnalyticsEvent ]]
        -- upvalues: l_FFlagFixAnalyticsForDynamicReportV2_0 (copy), v3 (copy), l_LocalPlayer_0 (copy), l_TelemetryService_0 (copy), v23 (copy), v22 (copy)
        if l_FFlagFixAnalyticsForDynamicReportV2_0 then
            local v26 = v3.join(v24, v25, {
                user_id = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or nil
            });
            l_TelemetryService_0:LogEvent(v23, {
                customFields = v22(v26), 
                eventContext = v24.abuse_vector
            });
            return;
        else
            l_TelemetryService_0:LogEvent(v3.join(v23, {
                eventContext = v24.abuse_vector
            }), {
                customFields = v3.join(v24, v25, {
                    user_id = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or nil
                })
            });
            return;
        end;
    end, 
    TelemetryEventType = v5
};