local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_AddUsers_0 = require(l_Parent_0.UserLib).Actions.AddUsers;
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatConversationHeaderTCIndicator);
local function v22(v7, v8) --[[ Line: 11 ]] --[[ Name: extractConversationsAndUsers ]]
    -- upvalues: v6 (copy), l_UserModel_0 (copy), l_llama_0 (copy)
    local v9 = {};
    local v10 = {};
    for _, v12 in v7 do
        table.insert(v9, v12.id);
        if v12.participant_user_ids then
            for _, v14 in v12.participant_user_ids do
                v14 = tostring(v14);
                if not v10[v14] then
                    local l_user_data_0 = v12.user_data;
                    if l_user_data_0 then
                        local v16 = l_user_data_0[v14];
                        if v16 then
                            local v17 = v8[v14];
                            local v18 = nil;
                            v18 = if v6 then l_UserModel_0.fromDataTable({
                                id = v16.id, 
                                name = v16.name, 
                                displayName = if v17 then v17.displayName else v16.display_name, 
                                isFriend = if v17 then v17.isFriend else false
                            }) else v17 or l_UserModel_0.fromDataTable({
                                id = v16.id, 
                                name = v16.name, 
                                displayName = v16.display_name, 
                                isFriend = false
                            });
                            v10[v18.id] = v18;
                        end;
                    end;
                end;
            end;
        else
            for _, v20 in ipairs(v12.participants) do
                if not v10[tostring(v20.targetId)] then
                    local v21 = v8[tostring(v20.targetId)] or l_UserModel_0.fromDataTable({
                        id = v20.targetId, 
                        name = v20.name, 
                        displayName = v20.displayName, 
                        isFriend = false
                    });
                    v10[v21.id] = v21;
                end;
            end;
        end;
    end;
    return v9, v10, (l_llama_0.Dictionary.keys(v10));
end;
return function(v23) --[[ Line: 76 ]]
    -- upvalues: v22 (copy), l_AddUsers_0 (copy), v2 (copy)
    return function(v24) --[[ Line: 77 ]]
        -- upvalues: v23 (copy), v22 (ref), l_AddUsers_0 (ref), v2 (ref)
        if not v23 then
            return;
        else
            local v25 = v24:getState();
            local _, v27, v28 = v22(v23, v25.Users or {});
            v24:dispatch(l_AddUsers_0(v27));
            v24:dispatch(v2.GetPresencesFromUserIds.API(v28)):catch(function(v29) --[[ Line: 86 ]]
                warn("NetworkingPresence failure in processConversations, Status: " .. tostring(v29));
            end);
            return;
        end;
    end;
end;