local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local _ = require(l_script_FirstAncestor_0.Parent.NetworkingVirtualEvents);
return function(v4, v5) --[[ Line: 31 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v8 = v1.createReducer({
        nextPageCursor = nil, 
        prevPageCursor = nil
    }, {
        [v4.GetVirtualEventRsvps.Succeeded.name] = function(_, v7) --[[ Line: 36 ]]
            return {
                nextPageCursor = v7.responseBody.nextPageCursor, 
                prevPageCursor = v7.responseBody.prevPageCursor
            };
        end
    });
    local v22 = v1.createReducer({}, {
        [v4.GetVirtualEventRsvpCounts.Succeeded.name] = function(v9, v10) --[[ Line: 45 ]]
            -- upvalues: v2 (ref)
            local v11 = v10.ids[1];
            return v2.Dictionary.join(v9, {
                [v11] = v10.responseBody.counters
            });
        end, 
        [v4.GetVirtualEventRsvpCounts.Failed.name] = function(v12, _) --[[ Line: 53 ]]
            return v12;
        end, 
        [v4.UpdateMyRsvpStatus.Succeeded.name] = function(v14, v15) --[[ Line: 57 ]]
            -- upvalues: v2 (ref)
            local v16 = v15.ids[1];
            local v17 = v14[v16];
            if v17 then
                local l_rsvpStatus_0 = v15.postBody.rsvpStatus;
                local v19 = 0;
                if l_rsvpStatus_0 == "going" then
                    v19 = 1;
                elseif l_rsvpStatus_0 == "notGoing" then
                    v19 = -1;
                end;
                return v2.Dictionary.join(v14, {
                    [v16] = v2.Dictionary.join(v17, {
                        going = math.clamp(v17.going + v19, 0, 1e999)
                    })
                });
            else
                return v14;
            end;
        end, 
        [v4.UpdateMyRsvpStatus.Failed.name] = function(v20, _) --[[ Line: 88 ]]
            return v20;
        end
    });
    local v38 = v1.createReducer({}, {
        [v4.GetVirtualEventRsvps.Succeeded.name] = function(v23, v24) --[[ Line: 94 ]]
            -- upvalues: v2 (ref)
            local v25 = v24.ids[1];
            local v26 = {};
            for _, v28 in v24.responseBody.data do
                v26[tostring(v28.userId)] = v28;
            end;
            return v2.Dictionary.join(v23, {
                [v25] = v2.Dictionary.join(v23[v25] or {}, v26)
            });
        end, 
        [v4.GetVirtualEventRsvps.Failed.name] = function(v29, _) --[[ Line: 107 ]]
            return v29;
        end, 
        [v4.UpdateMyRsvpStatus.Succeeded.name] = function(v31, v32) --[[ Line: 111 ]]
            -- upvalues: v5 (copy), v2 (ref)
            local v33 = v32.ids[1];
            local v34 = if v5.LocalPlayer then v5.LocalPlayer.UserId else -1;
            local v35 = {
                [tostring(v34)] = {
                    userId = v34, 
                    rsvpStatus = v32.postBody.rsvpStatus
                }
            };
            return v2.Dictionary.join(v31, {
                [v33] = v2.Dictionary.join(v31[v33] or {}, v35)
            });
        end, 
        [v4.UpdateMyRsvpStatus.Failed.name] = function(v36, _) --[[ Line: 127 ]]
            return v36;
        end
    });
    return (v1.combineReducers({
        page = v8, 
        counters = v22, 
        byVirtualEventId = v38
    }));
end;