local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactUtils);
local l_SetUserPresences_0 = require(l_Parent_0.UserLib).Thunks.SetUserPresences;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_useEffect_0 = v3.useEffect;
local v8 = require(l_script_FirstAncestor_0.Logger):new("AppChat.RealtimeExternal");
local v9 = require(l_script_FirstAncestor_0.Http.NetworkingPresence);
local v10 = require(l_script_FirstAncestor_0.App.Thunks.ChatFriendshipDestroyed);
local v11 = require(l_script_FirstAncestor_0.App.Thunks.ChatFriendshipCreated);
local v12 = {
    localUserId = 0
};
ChatExternalEventReceiver = function(v13) --[[ Line: 31 ]] --[[ Name: ChatExternalEventReceiver ]]
    -- upvalues: v2 (copy), v12 (copy), l_useDispatch_0 (copy), l_useEffect_0 (copy), v9 (copy), l_SetUserPresences_0 (copy), v8 (copy), v10 (copy), v11 (copy)
    local v14 = v2.Dictionary.join(v12, v13);
    local v15 = l_useDispatch_0();
    l_useEffect_0(function() --[[ Line: 36 ]]
        -- upvalues: v14 (copy), v2 (ref), v15 (copy), v9 (ref), l_SetUserPresences_0 (ref), v8 (ref)
        local v21 = v14.robloxEventReceiver:observeEvent("PresenceBulkNotifications", function(v16) --[[ Line: 37 ]]
            -- upvalues: v2 (ref), v15 (ref), v9 (ref), l_SetUserPresences_0 (ref), v8 (ref)
            local v18 = v2.List.map(v16, function(v17) --[[ Line: 38 ]]
                return (tostring(v17.UserId));
            end);
            v15(v9.GetPresencesFromUserIds.API(v18)):andThen(function(v19) --[[ Line: 43 ]]
                -- upvalues: v15 (ref), l_SetUserPresences_0 (ref)
                v15(l_SetUserPresences_0(v19.responseBody.userPresences));
            end):catch(function(v20) --[[ Line: 46 ]]
                -- upvalues: v8 (ref)
                v8:warning("NetworkingPresence failure in ChatExternalEventReceiver->PresenceBulkNotifications, Status: " .. tostring(v20));
            end);
        end);
        return function() --[[ Line: 54 ]]
            -- upvalues: v21 (copy)
            if v21 and v21.disconnect then
                v21:disconnect();
            end;
        end;
    end, {
        v15, 
        v14.robloxEventReceiver
    });
    l_useEffect_0(function() --[[ Line: 62 ]]
        -- upvalues: v14 (copy), v15 (copy), v10 (ref), v11 (ref)
        local v24 = v14.robloxEventReceiver:observeEvent("FriendshipNotifications", function(v22) --[[ Line: 63 ]]
            -- upvalues: v14 (ref), v15 (ref), v10 (ref), v11 (ref)
            local v23 = tostring(v14.localUserId) == tostring(v22.EventArgs.UserId1) and tostring(v22.EventArgs.UserId2) or tostring(v22.EventArgs.UserId1);
            if v22.Type == "FriendshipDestroyed" then
                v15(v10(v23));
                return;
            else
                if v22.Type == "FriendshipCreated" then
                    v15(v11(v23));
                end;
                return;
            end;
        end);
        return function() --[[ Line: 75 ]]
            -- upvalues: v24 (copy)
            if v24 and v24.disconnect then
                v24:disconnect();
            end;
        end;
    end, {
        v15, 
        v14.robloxEventReceiver, 
        v14.localUserId
    });
    return nil;
end;
return ChatExternalEventReceiver;