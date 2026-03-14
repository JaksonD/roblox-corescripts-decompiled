local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEventsState");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local _ = require(l_script_FirstAncestor_0.types);
local l_VirtualEventModel_0 = require(l_script_FirstAncestor_0.network).NetworkingVirtualEvents.VirtualEventModel;
local v5 = require(l_script_FirstAncestor_0.logger);
return function(v6) --[[ Line: 14 ]]
    -- upvalues: v1 (copy), l_VirtualEventModel_0 (copy), v5 (copy), v2 (copy)
    return (v1.createReducer({}, {
        [v6.GetActiveVirtualEvents.Succeeded.name] = function(_, v8) --[[ Line: 16 ]]
            -- upvalues: l_VirtualEventModel_0 (ref), v5 (ref)
            local v9 = {};
            for _, v11 in v8.responseBody.data do
                local v12 = l_VirtualEventModel_0.fromResponse(v11);
                if v12 then
                    if v12.eventTime.startTime and v12.eventTime.endTime then
                        v9[v11.id] = v12;
                    else
                        v5:debug("Discarding VirtualEvent with ID {} (malformed start or end time)", v11.id);
                    end;
                end;
            end;
            return v9;
        end, 
        [v6.GetActiveVirtualEvents.Failed.name] = function(_, _) --[[ Line: 34 ]]
            return {};
        end, 
        [v6.GetVirtualEvent.Succeeded.name] = function(v15, v16) --[[ Line: 38 ]]
            -- upvalues: l_VirtualEventModel_0 (ref), v2 (ref)
            local v17 = {};
            local v18 = l_VirtualEventModel_0.fromResponse(v16.responseBody);
            if v18 then
                v17[v18.id] = v18;
            end;
            return v2.Dictionary.join(v15, v17);
        end, 
        [v6.GetVirtualEvent.Failed.name] = function(v19, _) --[[ Line: 49 ]]
            return v19;
        end, 
        [v6.UpdateMyRsvpStatus.Succeeded.name] = function(v21, v22) --[[ Line: 53 ]]
            -- upvalues: v2 (ref)
            local v23 = v22.ids[1];
            local v24 = v21[v23];
            if v24 then
                return v2.Dictionary.join(v21, {
                    [v23] = v2.Dictionary.join(v24, {
                        userRsvpStatus = v22.postBody.rsvpStatus
                    })
                });
            else
                return v21;
            end;
        end
    }));
end;