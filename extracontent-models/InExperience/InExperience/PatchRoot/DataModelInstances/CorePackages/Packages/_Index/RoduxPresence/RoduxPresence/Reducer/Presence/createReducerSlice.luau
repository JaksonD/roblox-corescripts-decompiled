local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoduxPresence");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.getDeepValue);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.ReceivedUserPresence);
return function(v6, v7, v8) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v2 (copy), v5 (copy)
    local l_presenceNetworking_0 = v8.presenceNetworking;
    local function v16(v10, v11) --[[ Line: 13 ]] --[[ Name: handlePresenceModel ]]
        -- upvalues: v6 (copy), v3 (ref), v7 (copy), v2 (ref)
        local v12 = v10[v6];
        local v13 = tostring(v11.userId);
        local v14 = v3(v10, string.format("byUserId.%s.%s", v13, v7));
        if v14 and v12[v14] then
            v14 = tostring(v14);
            v12 = v2.Dictionary.join(v12, {
                [v14] = v2.List.removeValue(v12[v14], v13)
            });
        end;
        local v15 = v12[v11[v7]];
        if not v15 or not table.find(v15, v13) then
            return v2.Dictionary.join(v12, {
                [tostring(v11[v7])] = v2.List.join(v15 or {}, {
                    v13
                })
            });
        else
            return v12;
        end;
    end;
    return function(v17, v18) --[[ Line: 36 ]]
        -- upvalues: v5 (ref), v16 (copy), l_presenceNetworking_0 (copy), v6 (copy)
        assert(v17, "state should not be nil");
        if v18.type == v5.name then
            return v16(v17, v18.payload);
        elseif v18.type == l_presenceNetworking_0.GetPresencesFromUserIds.Succeeded.name then
            local l_userPresences_0 = v18.responseBody.userPresences;
            local v20 = v17[v6];
            for _, v22 in ipairs(l_userPresences_0) do
                v20 = v16(v17, v22);
            end;
            return v20;
        else
            return v17[v6];
        end;
    end;
end;