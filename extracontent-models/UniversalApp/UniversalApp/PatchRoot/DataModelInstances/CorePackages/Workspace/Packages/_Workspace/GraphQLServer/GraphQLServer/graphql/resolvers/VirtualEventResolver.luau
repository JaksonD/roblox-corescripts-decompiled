local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local v1 = require(l_script_FirstAncestor_0.graphql.connectors.VirtualEventConnector);
local l_findVirtualEventById_0 = v1.findVirtualEventById;
local l_findVirtualEventsByUniverseId_0 = v1.findVirtualEventsByUniverseId;
local l_findRsvpCountersByVirtualEventId_0 = v1.findRsvpCountersByVirtualEventId;
local l_findRsvpsByVirtualEventId_0 = v1.findRsvpsByVirtualEventId;
local l_updateRsvpStatus_0 = v1.updateRsvpStatus;
local l_neverShowNotificationModalAgain_0 = v1.neverShowNotificationModalAgain;
local l_enablePushNotifications_0 = v1.enablePushNotifications;
local v9 = require(l_script_FirstAncestor_0.graphql.connectors.ExperienceConnector);
local l_findExperienceDetailsByUniverseId_0 = v9.findExperienceDetailsByUniverseId;
local l_findExperienceMediaByUniverseId_0 = v9.findExperienceMediaByUniverseId;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
return {
    VirtualEventMutations = {
        neverShowNotificationModalAgain = function(_, _, v15) --[[ Line: 19 ]] --[[ Name: neverShowNotificationModalAgain ]]
            -- upvalues: l_neverShowNotificationModalAgain_0 (copy)
            return l_neverShowNotificationModalAgain_0(v15.fetchImpl);
        end, 
        enablePushNotifications = function(_, _, v18) --[[ Line: 22 ]] --[[ Name: enablePushNotifications ]]
            -- upvalues: l_enablePushNotifications_0 (copy)
            return l_enablePushNotifications_0(v18.fetchImpl);
        end
    }, 
    VirtualEvent = {
        experienceDetails = function(v19, _, v21) --[[ Line: 27 ]] --[[ Name: experienceDetails ]]
            -- upvalues: l_findExperienceDetailsByUniverseId_0 (copy)
            return l_findExperienceDetailsByUniverseId_0(tostring(v19.universeId), v21.fetchImpl);
        end, 
        media = function(v22, _, v24) --[[ Line: 30 ]] --[[ Name: media ]]
            -- upvalues: l_findExperienceMediaByUniverseId_0 (copy)
            return l_findExperienceMediaByUniverseId_0(tostring(v22.universeId), v24.fetchImpl);
        end, 
        rsvpCounters = function(v25, _, v27) --[[ Line: 33 ]] --[[ Name: rsvpCounters ]]
            -- upvalues: l_findRsvpCountersByVirtualEventId_0 (copy)
            return l_findRsvpCountersByVirtualEventId_0(v25.id, v27.fetchImpl);
        end, 
        rsvps = function(v28, _, v30) --[[ Line: 36 ]] --[[ Name: rsvps ]]
            -- upvalues: l_findRsvpsByVirtualEventId_0 (copy)
            return l_findRsvpsByVirtualEventId_0(v28.id, v30.fetchImpl);
        end
    }, 
    Mutation = {
        virtualEvents = function() --[[ Line: 41 ]] --[[ Name: virtualEvents ]]
            return {};
        end, 
        virtualEventRsvp = function(_, v32, v33) --[[ Line: 44 ]] --[[ Name: virtualEventRsvp ]]
            -- upvalues: l_updateRsvpStatus_0 (copy)
            return l_updateRsvpStatus_0(v32.id, v32.rsvpStatus, v33.fetchImpl);
        end
    }, 
    Query = {
        virtualEvent = function(_, v35, v36) --[[ Line: 49 ]] --[[ Name: virtualEvent ]]
            -- upvalues: l_findVirtualEventById_0 (copy)
            return l_findVirtualEventById_0(v35.id, v36.fetchImpl);
        end, 
        virtualEventsByUniverseId = function(_, v38, v39) --[[ Line: 52 ]] --[[ Name: virtualEventsByUniverseId ]]
            -- upvalues: l_findVirtualEventsByUniverseId_0 (copy)
            return l_findVirtualEventsByUniverseId_0(v38.universeId, v38.options, v39.fetchImpl);
        end
    }
};