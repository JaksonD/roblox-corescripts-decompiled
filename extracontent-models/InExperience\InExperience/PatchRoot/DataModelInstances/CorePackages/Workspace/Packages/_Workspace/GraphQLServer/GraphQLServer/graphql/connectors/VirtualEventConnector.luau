local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v4 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local v6 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v6.fetch;
local l_Response_0 = v6.Response;
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local v10 = {};
local v11 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}");
local v12 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps");
local v13 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps/counters");
local v14 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/universes/{id}/virtual-events?cursor={cursor}&limit={limit}&fromUtc={fromUtc}");
local v15 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/notifications/modal-history");
local v16 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/notifications/preferences");
v10.findVirtualEventById = function(v17, v18) --[[ Line: 34 ]] --[[ Name: findVirtualEventById ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v11 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v19 = v18 or l_fetch_0;
    return v4.new(function(v20, v21) --[[ Line: 37 ]]
        -- upvalues: v11 (ref), v17 (copy), v19 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v22 = v11({
            id = v17
        });
        local v23 = v19(v22, {
            method = "GET"
        }):catch(function() --[[ Line: 40 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v23.ok then
            v21(l_GraphQLError_0.new(string.format("Failed to find VirtualEvent matching id: %s.", v17)));
            return;
        else
            local v24 = v23:json():catch(function() --[[ Line: 52 ]]
                return nil;
            end):expect();
            if not v24 then
                v21(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for VirtualEvent matching id: %s.", v17)));
                return;
            else
                v20(v24);
                return;
            end;
        end;
    end);
end;
v10.findVirtualEventsByUniverseId = function(v25, v26, v27) --[[ Line: 75 ]] --[[ Name: findVirtualEventsByUniverseId ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v14 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v28 = v27 or l_fetch_0;
    return v4.new(function(v29, v30) --[[ Line: 82 ]]
        -- upvalues: v14 (ref), v25 (copy), v26 (copy), v28 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v31 = v14({
            id = v25, 
            cursor = if v26 and v26.cursor then v26.cursor else "", 
            limit = if v26 and v26.limit then v26.limit else 25, 
            fromUtc = if v26 and v26.fromUtc then v26.fromUtc else ""
        });
        local v32 = v28(v31, {
            method = "GET"
        }):catch(function() --[[ Line: 91 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v32.ok then
            v30(l_GraphQLError_0.new(string.format("Failed to find experience matching universeId: %i", v25)));
            return;
        else
            local v33 = v32:json():catch(function() --[[ Line: 103 ]]
                return nil;
            end):expect();
            if not v33 then
                v30(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for experience matching universeId: %i", v25)));
                return;
            else
                v29({
                    cursor = v33.nextPageCursor, 
                    virtualEvents = v33.data
                });
                return;
            end;
        end;
    end);
end;
v10.findRsvpsByVirtualEventId = function(v34, v35) --[[ Line: 131 ]] --[[ Name: findRsvpsByVirtualEventId ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v12 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v36 = v35 or l_fetch_0;
    return v4.new(function(v37, v38) --[[ Line: 134 ]]
        -- upvalues: v12 (ref), v34 (copy), v36 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v39 = v12({
            id = v34
        });
        local v40 = v36(v39, {
            method = "GET"
        }):catch(function() --[[ Line: 137 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v40.ok then
            v38(l_GraphQLError_0.new(string.format("Failed to find RSVPs matching VirtualEvent id: %s.", v34)));
            return;
        else
            local v41 = v40:json():catch(function() --[[ Line: 150 ]]
                return nil;
            end):expect();
            if not v41 then
                v38(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for RSVPs matching VirtualEvent id: %s.", v34)));
                return;
            else
                v37(v41.data);
                return;
            end;
        end;
    end);
end;
v10.findRsvpCountersByVirtualEventId = function(v42, v43) --[[ Line: 173 ]] --[[ Name: findRsvpCountersByVirtualEventId ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v13 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v44 = v43 or l_fetch_0;
    return v4.new(function(v45, v46) --[[ Line: 176 ]]
        -- upvalues: v13 (ref), v42 (copy), v44 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v47 = v13({
            id = v42
        });
        local v48 = v44(v47, {
            method = "GET"
        }):catch(function() --[[ Line: 179 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v48.ok then
            v46(l_GraphQLError_0.new(string.format("Failed to find RSVP counters matching VirtualEvent id: %s.", v42)));
            return;
        else
            local v49 = v48:json():catch(function() --[[ Line: 194 ]]
                return nil;
            end):expect();
            if not v49 then
                v46(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for RSVP counters matching VirtualEvent id: %s.", v42)));
                return;
            else
                v45(v49.counters);
                return;
            end;
        end;
    end);
end;
v10.updateRsvpStatus = function(v50, v51, v52) --[[ Line: 217 ]] --[[ Name: updateRsvpStatus ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v12 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v53 = v52 or l_fetch_0;
    return v4.new(function(v54, v55) --[[ Line: 224 ]]
        -- upvalues: v12 (ref), v50 (copy), v53 (copy), l_HttpService_0 (ref), v51 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v56 = v12({
            id = v50
        });
        local v57 = v53(v56, {
            method = "POST", 
            body = l_HttpService_0:JSONEncode({
                rsvpStatus = v51
            }), 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):catch(function() --[[ Line: 236 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v57.ok then
            v55(l_GraphQLError_0.new(string.format("Failed to set RSVP status matching VirtualEvent id: %s.", v50)));
            return;
        else
            local v58 = v57:json():catch(function() --[[ Line: 251 ]]
                return nil;
            end):expect();
            if not v58 then
                v55(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for RSVP status matching VirtualEvent id: %s.", v50)));
                return;
            else
                v54({
                    shouldSeeNotificationsUpsellModal = v58.shouldSeeNotificationsUpsellModal, 
                    virtualEvent = {
                        id = v50, 
                        userRsvpStatus = v58.rsvpStatus
                    }
                });
                return;
            end;
        end;
    end);
end;
v10.neverShowNotificationModalAgain = function(v59) --[[ Line: 282 ]] --[[ Name: neverShowNotificationModalAgain ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v15 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v60 = v59 or l_fetch_0;
    return v4.new(function(v61, v62) --[[ Line: 285 ]]
        -- upvalues: v15 (ref), v60 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v63 = v15();
        if not v60(v63, {
            method = "POST"
        }):catch(function() --[[ Line: 290 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect().ok then
            v62(l_GraphQLError_0.new("Failed to update modal history"));
            return;
        else
            v61(true);
            return;
        end;
    end);
end;
v10.enablePushNotifications = function(v64) --[[ Line: 306 ]] --[[ Name: enablePushNotifications ]]
    -- upvalues: l_fetch_0 (copy), v4 (copy), v16 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v65 = v64 or l_fetch_0;
    return v4.new(function(v66, v67) --[[ Line: 309 ]]
        -- upvalues: v16 (ref), v65 (copy), l_HttpService_0 (ref), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v68 = v16();
        if not v65(v68, {
            method = "POST", 
            body = l_HttpService_0:JSONEncode({
                isEnabled = true
            }), 
            headers = {
                ["Content-Type"] = "application/json", 
                Accept = "application/json"
            }
        }):catch(function() --[[ Line: 322 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect().ok then
            v67(l_GraphQLError_0.new("Failed to update notification preferences"));
            return;
        else
            v66(true);
            return;
        end;
    end);
end;
return v10;