local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_Modules_0.LuaApp.Promise);
local v5 = require(l_Modules_0.LuaApp.Http.Requests.ModerationAPI.GetReminderOfNorms);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v7 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
local v8 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name);
local v9 = game:DefineFastFlag("ReminderAPIFetchErrorLogging", false);
VerifyReminderOfNormsResponse = function(v10) --[[ Line: 17 ]] --[[ Name: VerifyReminderOfNormsResponse ]]
    local l_contentVariant_0 = v10.contentVariant;
    if not l_contentVariant_0 or l_contentVariant_0 ~= "positive" and l_contentVariant_0 ~= "warning" then
        return false;
    elseif not v10.policyViolation or not v10.interventionId or not v10.reminderNumber or not v10.experimentVariant then
        return false;
    else
        return true;
    end;
end;
return function(v12) --[[ Line: 33 ]]
    -- upvalues: v5 (copy), v4 (copy), v2 (copy), v3 (copy), v7 (copy), v9 (copy), v8 (copy)
    return function(v13) --[[ Line: 34 ]]
        -- upvalues: v5 (ref), v12 (copy), v4 (ref), v2 (ref), v3 (ref), v7 (ref), v9 (ref), v8 (ref)
        return v5(v12):andThen(function(v14) --[[ Line: 35 ]]
            -- upvalues: v4 (ref), v13 (copy), v2 (ref), v3 (ref), v7 (ref)
            local l_responseBody_0 = v14.responseBody;
            if not l_responseBody_0 or not l_responseBody_0.shouldSurfaceReminder then
                return v4.resolve();
            elseif not VerifyReminderOfNormsResponse(l_responseBody_0) then
                return v4.reject(nil, l_responseBody_0);
            else
                v13:dispatch(v2(v3.ReminderOfNormsPopup, {
                    interventionId = l_responseBody_0.interventionId, 
                    contentVariant = l_responseBody_0.contentVariant, 
                    policyViolation = l_responseBody_0.policyViolation, 
                    reminderNumber = l_responseBody_0.reminderNumber, 
                    experimentVariant = l_responseBody_0.experimentVariant, 
                    eventIngest = v7
                }));
                return v4.resolve();
            end;
        end):catch(function(v16) --[[ Line: 55 ]]
            -- upvalues: v9 (ref), v8 (ref)
            if v9 then
                v8:warning("(Moderation) Failed to fetch reminder {}", v16);
            end;
        end);
    end;
end;