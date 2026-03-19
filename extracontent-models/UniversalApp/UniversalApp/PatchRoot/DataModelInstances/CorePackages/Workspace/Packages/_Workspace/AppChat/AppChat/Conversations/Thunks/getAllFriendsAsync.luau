local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local v4 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local l_AddUsers_0 = require(l_Parent_0.UserLib).Actions.AddUsers;
local l_SetUserIsFriend_0 = require(l_Parent_0.UserLib).Actions.SetUserIsFriend;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local l_receiveUsersPresence_0 = require(l_Parent_0.UserLib).Utils.receiveUsersPresence;
return function(v12) --[[ Line: 16 ]]
    -- upvalues: l_Players_0 (copy), v3 (copy), v6 (copy), v5 (copy), l_UserModel_0 (copy), l_SetUserIsFriend_0 (copy), l_llama_0 (copy), l_AddUsers_0 (copy), v4 (copy), l_receiveUsersPresence_0 (copy)
    return function(v13) --[[ Line: 17 ]]
        -- upvalues: l_Players_0 (ref), v3 (ref), v6 (ref), v5 (ref), v12 (copy), l_UserModel_0 (ref), l_SetUserIsFriend_0 (ref), l_llama_0 (ref), l_AddUsers_0 (ref), v4 (ref), l_receiveUsersPresence_0 (ref)
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        assert(l_LocalPlayer_0, "Local Player not found");
        local l_UserId_0 = l_LocalPlayer_0.UserId;
        if v3.GetFriendsFromUserId.getStatus(v13:getState(), l_UserId_0) == v6.Enum.NetworkStatus.Fetching then
            return v5.resolve({});
        else
            return v13:dispatch(v3.GetFriendsFromUserId.API(l_UserId_0)):andThen(function(v16) --[[ Line: 30 ]]
                -- upvalues: v13 (copy), v12 (ref), l_UserModel_0 (ref), l_SetUserIsFriend_0 (ref), l_llama_0 (ref), l_AddUsers_0 (ref), v4 (ref), l_receiveUsersPresence_0 (ref)
                local l_data_0 = v16.responseBody.data;
                local v18 = v13:getState().Users or {};
                local v19 = {};
                local v20 = nil;
                if v12 then
                    v20 = {};
                end;
                for _, v22 in ipairs(l_data_0) do
                    local v23 = tostring(v22.id);
                    if v12 then
                        table.insert(v20, v23);
                    end;
                    if v18[v23] == nil then
                        v19[v23] = l_UserModel_0.fromDataTable({
                            id = v22.id, 
                            name = v22.name, 
                            displayName = v22.displayName, 
                            isFriend = true
                        });
                    else
                        v13:dispatch(l_SetUserIsFriend_0(v23, true));
                    end;
                end;
                local v24 = l_llama_0.Dictionary.keys(v19);
                v13:dispatch(l_AddUsers_0(v19));
                if v12 then
                    v13:dispatch(v4.GetPresencesFromUserIds.API(v20)):andThen(function(v25) --[[ Line: 67 ]]
                        -- upvalues: l_receiveUsersPresence_0 (ref), v13 (ref)
                        local l_userPresences_0 = v25.responseBody.userPresences;
                        l_receiveUsersPresence_0(l_userPresences_0, v13);
                        return v25;
                    end):catch(function(v27) --[[ Line: 72 ]]
                        warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(v27));
                    end);
                    return v16;
                else
                    v13:dispatch(v4.GetPresencesFromUserIds.API(v24)):catch(function(v28) --[[ Line: 78 ]]
                        warn("NetworkingPresence failure in getAllFriendsAsync, Status: " .. tostring(v28));
                    end);
                    return v16;
                end;
            end):catch(function(v29) --[[ Line: 85 ]]
                warn("NetworkingFriends failure in getAllFriendsAsync, Status: " .. tostring(v29));
            end);
        end;
    end;
end;