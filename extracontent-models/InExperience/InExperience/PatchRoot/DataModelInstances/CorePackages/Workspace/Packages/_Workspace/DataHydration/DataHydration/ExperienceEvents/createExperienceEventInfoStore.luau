local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.createDataCache);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v5 = require(script.Parent.ExperienceEventTypes);
local v6 = require(script.Parent.ExperienceEventsUrlBuilder);
local v7 = require(l_script_FirstAncestor_0.createDataResolver);
local v8 = require(l_Parent_0.DiscoveryUtils);
local l_DiscoveryEventErrorLogger_0 = v8.DiscoveryEventErrorLogger;
local l_logResponseError_0 = v8.logResponseError;
local v11 = require(script.Parent.updateEventRsvp);
return function() --[[ Line: 25 ]] --[[ Name: createExperienceEventInfoStore ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy), v5 (copy), v11 (copy), l_logResponseError_0 (copy), v6 (copy), l_DiscoveryEventErrorLogger_0 (copy)
    local v12 = v3();
    local v14 = v7({
        cache = v12, 
        supportsMultiGet = false, 
        fetchFn = function(_) --[[ Line: 30 ]] --[[ Name: fetchFn ]]
            -- upvalues: v2 (ref)
            return v2.resolve({});
        end
    });
    local function v24(v15, v16) --[[ Line: 39 ]] --[[ Name: patchRsvpStatus ]]
        -- upvalues: v14 (copy), v5 (ref), v11 (ref), v12 (copy), l_logResponseError_0 (ref), v6 (ref), l_DiscoveryEventErrorLogger_0 (ref)
        local v17 = v14.getCachedItem(v15).data();
        local v18 = if v16 then v5.EventRsvpTypes.Going else v5.EventRsvpTypes.NotGoing;
        v11(v15, v18):andThen(function() --[[ Line: 48 ]]
            -- upvalues: v17 (copy), v16 (copy), v12 (ref), v15 (copy)
            if v17 then
                local v19 = v17.rsvpCount or 0;
                local v20 = {
                    id = v17.id, 
                    title = v17.title, 
                    subtitle = v17.subtitle, 
                    eventStart = v17.eventStart, 
                    eventEnd = v17.eventEnd, 
                    userRsvp = v16, 
                    mediaAssetId = v17.mediaAssetId, 
                    description = v17.description, 
                    rsvpCount = v19 + (v16 and 1 or -1)
                };
                v12.updateItem(v15, v20);
            end;
        end):catch(function(v21) --[[ Line: 65 ]]
            -- upvalues: v17 (copy), v12 (ref), v15 (copy), l_logResponseError_0 (ref), v6 (ref), l_DiscoveryEventErrorLogger_0 (ref), v16 (copy)
            if v17 then
                v12.updateItem(v15, v17);
            end;
            local v22 = if type(v21) == "table" and v21.StatusCode then v21.StatusCode else nil;
            local v23 = if type(v21) == "table" and v21.StatusMessage then v21.StatusMessage else if type(v21) == "string" then v21 else nil;
            l_logResponseError_0(v6.RSVP_UPDATE_URL, {
                StatusCode = v22
            });
            l_DiscoveryEventErrorLogger_0.reportError("patchRsvpStatus", "Error updating event RSVP", {
                eventId = v15, 
                isRsvpGoing = v16, 
                statusCode = v22, 
                statusMessage = v23
            });
        end);
    end;
    return {
        getExperienceEventInfo = v14.getCachedItem, 
        getExperienceEventInfos = v14.getCachedItems, 
        updateExperienceEventInfo = v12.updateItem, 
        updateExperienceEventInfos = v12.updateItems, 
        patchRsvpStatus = v24, 
        clear = v14.clear, 
        dispose = v14.dispose
    };
end;