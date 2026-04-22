local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.SduiCoreSystem);
local v2 = require(l_Parent_0.DataHydration);
local l_SduiErrorType_0 = v1.SduiErrors.SduiErrorType;
local l_getExperienceEventInfoStore_0 = v2.ExperienceEvents.getExperienceEventInfoStore;
return function(v5, _, v7, _) --[[ Line: 16 ]]
    -- upvalues: l_SduiErrorType_0 (copy), l_getExperienceEventInfoStore_0 (copy)
    local v9 = v5 and v5.actionParams or nil;
    if v9 == nil then
        v7.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
            name = "RsvpToEvent", 
            message = "Missing actionParams"
        }, v7.appPage);
        return;
    else
        assert(v9, "actionParams must exist");
        local l_eventId_0 = v9.eventId;
        if l_eventId_0 == nil then
            v7.dependencies.logger.reportError(l_SduiErrorType_0.InvalidActionParams, {
                name = "RsvpToEvent", 
                message = "Missing eventId", 
                propName = "eventId"
            }, v7.appPage);
            return;
        else
            local l_userRsvp_0 = v9.userRsvp;
            l_getExperienceEventInfoStore_0(false).patchRsvpStatus(l_eventId_0, l_userRsvp_0);
            return;
        end;
    end;
end;