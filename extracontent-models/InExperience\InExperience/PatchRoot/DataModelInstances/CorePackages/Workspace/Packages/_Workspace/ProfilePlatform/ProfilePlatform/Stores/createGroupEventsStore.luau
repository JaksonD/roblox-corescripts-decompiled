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
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagEnableCommunityProfileLoadingSkeletons);
local v12 = {};
return function(v13) --[[ Line: 22 ]] --[[ Name: createGroupEventsStore ]]
    -- upvalues: v7 (copy), l_FFlagLuaAppUseAppHttpStore_0 (copy), v5 (copy), v4 (copy), v9 (copy), v12 (copy), l_HttpService_0 (copy), v11 (copy), v10 (copy)
    local v14 = v7.GetHttpStore();
    if l_FFlagLuaAppUseAppHttpStore_0 then
        local v15 = v5.Instance.get();
        if v15 then
            v14 = v15;
        end;
    end;
    local v16, v17 = v4.createSignal(0);
    local v18 = {};
    local v19, v20 = v4.createSignal(v18);
    local function _(v21, v22) --[[ Line: 37 ]]
        -- upvalues: v18 (ref), v20 (copy)
        local l_v18_0 = v18;
        local v24 = table.clone(l_v18_0);
        v24[v21] = v22;
        v20(v24);
        v18 = v24;
    end;
    local v30 = v4.createComputed(function(v26) --[[ Line: 45 ]]
        -- upvalues: v16 (copy), v13 (copy), v9 (ref), v14 (ref)
        local v27 = v16(v26);
        local v28 = string.format("GetEvents_%d_%d", v13, v27);
        local v29 = {
            Url = v9({
                id = v13
            }), 
            Method = "GET"
        };
        return v14.fetch(v28, v29);
    end);
    local l_v12_0 = v12;
    local v32 = nil;
    return {
        getEvents = v4.createComputed(function(v33) --[[ Line: 59 ]]
            -- upvalues: v30 (copy), v19 (copy), l_HttpService_0 (ref), l_v12_0 (ref)
            local v34 = v30(v33)(v33);
            local v35 = v19(v33);
            if v34.status == "Success" then
                local v36 = {};
                local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v34.response.Body);
                if l_status_0 then
                    for v39, v40 in pairs(l_result_0.data) do
                        v40.universeId = tostring(v40.universeId);
                        local v41 = v35[v40.id];
                        if v41 ~= nil then
                            v40.userRsvpStatus = v41;
                        end;
                        v36[v39] = v40;
                    end;
                end;
                l_v12_0 = v36;
                return v36;
            elseif v34.status == "Failed" then
                return {};
            else
                return l_v12_0;
            end;
        end), 
        isLoading = if v11 then v4.createComputed(function(v42) --[[ Line: 94 ]]
            -- upvalues: v30 (copy)
            return v30(v42)(v42).status == "Fetching";
        end) else nil, 
        updateRsvpStatus = function(v43, v44) --[[ Line: 101 ]] --[[ Name: updateRsvpStatus ]]
            -- upvalues: v10 (ref), l_HttpService_0 (ref), v14 (ref), v18 (ref), v20 (copy), v32 (ref), v4 (ref)
            local v45 = string.format("UpdateEventRsvpStatus_%s_%s", v43.id, v44);
            local v46 = {
                Url = v10({
                    eventId = v43.id
                }), 
                Method = "POST", 
                Body = l_HttpService_0:JSONEncode({
                    rsvpStatus = v44
                }), 
                Headers = {
                    ["Content-Type"] = "application/json"
                }
            };
            local v47 = v14.fetch(v45, v46);
            local v48 = v18[v43.id];
            local l_id_0 = v43.id;
            local l_v18_1 = v18;
            local v51 = table.clone(l_v18_1);
            v51[l_id_0] = v44;
            v20(v51);
            v18 = v51;
            if v32 then
                v32();
            end;
            v32 = v4.createEffect(function(v52) --[[ Line: 118 ]]
                -- upvalues: v47 (copy), v43 (copy), v48 (copy), v18 (ref), v20 (ref)
                if v47(v52).status == "Failed" then
                    local l_id_1 = v43.id;
                    local l_v48_0 = v48;
                    local l_v18_2 = v18;
                    local v56 = table.clone(l_v18_2);
                    v56[l_id_1] = l_v48_0;
                    v20(v56);
                    v18 = v56;
                end;
            end);
            return v47;
        end, 
        refetch = function() --[[ Line: 129 ]] --[[ Name: refetch ]]
            -- upvalues: v17 (copy), v20 (copy)
            v17(function(v57) --[[ Line: 131 ]]
                return v57 + 1;
            end);
            v20(function(_) --[[ Line: 135 ]]
                return {};
            end);
        end
    };
end;