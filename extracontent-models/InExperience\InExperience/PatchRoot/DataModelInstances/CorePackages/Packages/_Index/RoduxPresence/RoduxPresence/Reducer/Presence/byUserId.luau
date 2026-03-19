local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxPresence");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.ReceivedUserPresence);
local v6 = require(l_script_FirstAncestor_0.Models.PresenceModel);
local v7 = {};
return function(v8) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v7 (copy), v5 (copy), v6 (copy), v3 (copy)
    local l_presenceNetworking_0 = v8.presenceNetworking;
    return v2.createReducer(v7, {
        [v5.name] = function(v10, v11) --[[ Line: 16 ]]
            -- upvalues: v6 (ref), v3 (ref)
            local l_userId_0 = v11.payload.userId;
            local l_payload_0 = v11.payload;
            assert(v6.isValid(l_payload_0));
            return v3.Dictionary.join(v10, {
                [l_userId_0] = v6.format(l_payload_0)
            });
        end, 
        [l_presenceNetworking_0.GetPresencesFromUserIds.Succeeded.name] = function(v14, v15) --[[ Line: 27 ]]
            -- upvalues: v6 (ref), v3 (ref)
            local l_userPresences_0 = v15.responseBody.userPresences;
            local v17 = {};
            for _, v19 in ipairs(l_userPresences_0) do
                v17[tostring(v19.userId)] = v6.format(v19);
            end;
            return v3.Dictionary.join(v14, v17);
        end
    });
end;