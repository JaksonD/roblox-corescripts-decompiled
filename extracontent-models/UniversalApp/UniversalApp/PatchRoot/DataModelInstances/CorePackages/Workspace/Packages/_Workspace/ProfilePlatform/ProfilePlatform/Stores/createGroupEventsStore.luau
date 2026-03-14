local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v4 = require(l_Parent_0.Signals);
local v5 = require(l_Parent_0.HttpStore);
local l_FFlagLuaAppUseAppHttpStore_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppUseAppHttpStore;
local v7 = require(l_Parent_0.InternalHttpStore);
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v9 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/groups/{id}");
local v10 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{eventId}/rsvps");
local v11 = {};
return function(v12) --[[ Line: 20 ]] --[[ Name: createGroupEventsStore ]]
    -- upvalues: v7 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v5 (copy), v4 (copy), v9 (copy), v11 (copy), l_HttpService_0 (copy), v10 (copy)
    local v13 = v7.GetHttpStore();
    if l_FFlagLuaAppUseAppHttpStore_0 then
        local v14 = v5.Instance.get();
        if v14 then
            v13 = v14;
        end;
    end;
    local v15, v16 = v4.createSignal(0);
    local v17 = {};
    local v18, v19 = v4.createSignal(v17);
    local function _(v20, v21) --[[ Line: 35 ]]
        -- upvalues: v17 (ref), v19 (copy)
        local l_v17_0 = v17;
        local v23 = table.clone(l_v17_0);
        v23[v20] = v21;
        v19(v23);
        v17 = v23;
    end;
    local v29 = v4.createComputed(function(v25) --[[ Line: 43 ]]
        -- upvalues: v15 (copy), v12 (copy), v9 (ref), v13 (ref)
        local v26 = v15(v25);
        local v27 = string.format("GetEvents_%d_%d", v12, v26);
        local v28 = {
            Url = v9({
                id = v12
            }), 
            Method = "GET"
        };
        return v13.fetch(v27, v28);
    end);
    local l_v11_0 = v11;
    local v31 = nil;
    return {
        getEvents = v4.createComputed(function(v32) --[[ Line: 57 ]]
            -- upvalues: v29 (copy), v18 (copy), l_HttpService_0 (ref), l_v11_0 (ref)
            local v33 = v29(v32)(v32);
            local v34 = v18(v32);
            if v33.status == "Success" then
                local v35 = {};
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v33.response.Body);
                if l_status_0 then
                    for v38, v39 in pairs(l_result_0.data) do
                        v39.universeId = tostring(v39.universeId);
                        local v40 = v34[v39.id];
                        if v40 ~= nil then
                            v39.userRsvpStatus = v40;
                        end;
                        v35[v38] = v39;
                    end;
                end;
                l_v11_0 = v35;
                return v35;
            elseif v33.status == "Failed" then
                return {};
            else
                return l_v11_0;
            end;
        end), 
        updateRsvpStatus = function(v41, v42) --[[ Line: 91 ]] --[[ Name: updateRsvpStatus ]]
            -- upvalues: v10 (ref), l_HttpService_0 (ref), v13 (ref), v17 (ref), v19 (copy), v31 (ref), v4 (ref)
            local v43 = string.format("UpdateEventRsvpStatus_%s_%s", v41.id, v42);
            local v44 = {
                Url = v10({
                    eventId = v41.id
                }), 
                Method = "POST", 
                Body = l_HttpService_0:JSONEncode({
                    rsvpStatus = v42
                }), 
                Headers = {
                    ["Content-Type"] = "application/json"
                }
            };
            local v45 = v13.fetch(v43, v44);
            local v46 = v17[v41.id];
            local l_id_0 = v41.id;
            local l_v17_1 = v17;
            local v49 = table.clone(l_v17_1);
            v49[l_id_0] = v42;
            v19(v49);
            v17 = v49;
            if v31 then
                v31();
            end;
            v31 = v4.createEffect(function(v50) --[[ Line: 108 ]]
                -- upvalues: v45 (copy), v41 (copy), v46 (copy), v17 (ref), v19 (ref)
                if v45(v50).status == "Failed" then
                    local l_id_1 = v41.id;
                    local l_v46_0 = v46;
                    local l_v17_2 = v17;
                    local v54 = table.clone(l_v17_2);
                    v54[l_id_1] = l_v46_0;
                    v19(v54);
                    v17 = v54;
                end;
            end);
            return v45;
        end, 
        refetch = function() --[[ Line: 119 ]] --[[ Name: refetch ]]
            -- upvalues: v16 (copy), v19 (copy)
            v16(function(v55) --[[ Line: 121 ]]
                return v55 + 1;
            end);
            v19(function(_) --[[ Line: 125 ]]
                return {};
            end);
        end
    };
end;