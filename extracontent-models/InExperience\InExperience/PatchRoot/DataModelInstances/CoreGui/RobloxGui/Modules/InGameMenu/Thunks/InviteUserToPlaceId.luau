local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script.Parent.Parent;
local l_Network_0 = l_Parent_0.Network;
local v5 = require(l_CorePackages_0.Workspace.Packages.AppChatNetworking);
local v6 = require(l_Network_0.httpRequest);
local v7 = require(l_Network_0.Requests.GetPlaceInfos);
local v8 = require(l_Parent_0.Utility.constructGameLinkUrl);
local v9 = v6(l_HttpRbxApiService_0);
local l_InviteStatus_0 = require(l_Parent_0.Resources.Constants).InviteStatus;
local v11 = require(l_Parent_0.Actions.ReceivedUserInviteStatus);
return function(v12, v13) --[[ Line: 25 ]]
    -- upvalues: l_InviteStatus_0 (copy), v11 (copy), l_RunService_0 (copy), v7 (copy), v9 (copy), v8 (copy), v5 (copy)
    return function(v14) --[[ Line: 26 ]]
        -- upvalues: v12 (copy), l_InviteStatus_0 (ref), v11 (ref), l_RunService_0 (ref), v7 (ref), v9 (ref), v13 (copy), v8 (ref), v5 (ref)
        if v14:getState().invites[tostring(v12)] == l_InviteStatus_0.Pending then
            return;
        else
            v14:dispatch(v11(v12, l_InviteStatus_0.Pending));
            if l_RunService_0:IsStudio() then
                spawn(function() --[[ Line: 36 ]]
                    -- upvalues: v14 (copy), v11 (ref), v12 (ref), l_InviteStatus_0 (ref)
                    v14:dispatch(v11(v12, l_InviteStatus_0.Failed));
                end);
                return;
            else
                return v7(v9, {
                    v13
                }):andThen(function(v15) --[[ Line: 42 ]]
                    local v16 = v15.responseBody[1];
                    assert(v16, "Error fetching placeInfos");
                    v16.placeId = tostring(v16.placeId);
                    v16.universeId = tostring(v16.universeId);
                    return v16;
                end):andThen(function(v17) --[[ Line: 52 ]]
                    -- upvalues: v8 (ref), v5 (ref), v12 (ref)
                    local v18 = string.format("Come join me in %s", v17.name);
                    assert(v17.universeRootPlaceId, "Failed to get universe root place id");
                    v18 = v18 .. "\n" .. v8(v17.universeRootPlaceId);
                    return v5.http.CreateConversation(nil, "one_to_one", {
                        v12
                    }):andThen(function(v19) --[[ Line: 56 ]]
                        -- upvalues: v5 (ref), v18 (ref), v17 (copy)
                        local v20 = v19.responseBody.conversations[1];
                        assert(v20, "Failed to create conversation");
                        return v5.http.SendChatTextMessage(nil, v20.id, v18):andThen(function(v21) --[[ Line: 59 ]]
                            -- upvalues: v20 (copy), v17 (ref)
                            local v22 = v21.responseBody.messages[1];
                            assert(v22, "Failed to send message");
                            return {
                                resultType = v22.status == "success" and "Success" or "Failed", 
                                conversationId = v20.id, 
                                placeId = v17.universeRootPlaceId
                            };
                        end);
                    end):catch(function(v23) --[[ Line: 72 ]]
                        warn("Failed to send invite: " .. tostring(v23));
                    end);
                end):andThen(function(v24) --[[ Line: 75 ]]
                    -- upvalues: l_InviteStatus_0 (ref), v14 (copy), v11 (ref), v12 (ref)
                    local v25, v26 = v24:await();
                    assert(v25, "Failed to unroll promise after friend invitation: " .. tostring(v26));
                    v24 = v26;
                    local v27 = l_InviteStatus_0[v24.resultType] or l_InviteStatus_0.Failed;
                    v14:dispatch(v11(v12, v27));
                    return v24;
                end, function(_) --[[ Line: 88 ]]
                    -- upvalues: v14 (copy), v11 (ref), v12 (ref), l_InviteStatus_0 (ref)
                    v14:dispatch(v11(v12, l_InviteStatus_0.Failed));
                end);
            end;
        end;
    end;
end;