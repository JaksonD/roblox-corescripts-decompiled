local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Actions.NavigateIntoChat);
local l_Thunks_0 = require(l_Parent_0.NavigationRodux).Thunks;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v5 = require(l_script_FirstAncestor_0.EnumScreens);
local l_NetworkingSquads_0 = require(l_Parent_0.SquadsCore).Http.NetworkingSquads;
local v7 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local l_FFlagEnableSquadDeeplinkWithChatId_0 = require(l_Parent_0.SharedFlags).FFlagEnableSquadDeeplinkWithChatId;
local v9 = {
    {
        name = l_AppPage_0.Chat
    }
};
return function(v10, v11) --[[ Line: 24 ]]
    -- upvalues: l_FFlagEnableSquadDeeplinkWithChatId_0 (copy), v7 (copy), l_Thunks_0 (copy), v9 (copy), v2 (copy), v5 (copy), l_NetworkingSquads_0 (copy)
    return function(v12) --[[ Line: 25 ]]
        -- upvalues: l_FFlagEnableSquadDeeplinkWithChatId_0 (ref), v10 (copy), v7 (ref), l_Thunks_0 (ref), v9 (ref), v11 (copy), v2 (ref), v5 (ref), l_NetworkingSquads_0 (ref)
        local v13 = nil;
        local v14 = nil;
        local v15 = nil;
        local v16 = if l_FFlagEnableSquadDeeplinkWithChatId_0 then v10.conversationId else nil;
        local v17 = nil;
        v13 = v12:getState();
        v14 = v7(v13, "Squad.Squad.currentSquad");
        v15 = v14 and v14.squadId;
        local v18 = l_FFlagEnableSquadDeeplinkWithChatId_0 and function() --[[ Line: 34 ]]
            -- upvalues: v12 (copy), l_Thunks_0 (ref), v9 (ref), v11 (ref), v16 (ref), v17 (ref), v2 (ref), v5 (ref), v15 (ref)
            v12:dispatch(l_Thunks_0.NavigateToRoute(v9, v11));
            if v16 and v16 ~= "" then
                if v17 and v17 ~= "" then
                    v12:dispatch(v2({
                        screen = v5.SquadLobby, 
                        params = {
                            conversationId = v16, 
                            squadId = if v15 and v15 ~= v17 then v17 else nil
                        }
                    }));
                    return;
                else
                    v12:dispatch(v2({
                        screen = v5.ChatConversation, 
                        params = {
                            conversationId = v16
                        }
                    }));
                end;
            end;
        end or nil;
        if l_FFlagEnableSquadDeeplinkWithChatId_0 then
            if v10.partyId and v10.partyId ~= "" then
                v12:dispatch(l_NetworkingSquads_0.GetSquadFromSquadId.API({
                    squadId = v10.partyId
                })):andThen(function(v19) --[[ Line: 62 ]]
                    -- upvalues: v7 (ref), v17 (ref), v10 (ref), v16 (ref), v18 (copy)
                    if v7(v19, "responseBody.groupUp.parentChannelId") then
                        v17 = v10.partyId;
                        v16 = v19.responseBody.groupUp.parentChannelId;
                    end;
                    v18();
                end):catch(function(_) --[[ Line: 70 ]]
                    -- upvalues: v18 (copy)
                    v18();
                end);
            else
                v18();
            end;
        else
            v12:dispatch(l_NetworkingSquads_0.GetSquadFromSquadId.API({
                squadId = v10.partyId
            })):andThen(function(v21) --[[ Line: 79 ]]
                -- upvalues: v7 (ref), v15 (ref), v10 (ref), v12 (copy), l_Thunks_0 (ref), v9 (ref), v11 (ref), v2 (ref), v5 (ref)
                if v7(v21, "responseBody.groupUp.parentChannelId") then
                    local v22 = {
                        conversationId = v21.responseBody.groupUp.parentChannelId, 
                        squadId = if v15 and v15 ~= v10.partyId then v10.partyId else nil
                    };
                    v12:dispatch(l_Thunks_0.NavigateToRoute(v9, v11));
                    v12:dispatch(v2({
                        screen = v5.SquadLobby, 
                        params = v22
                    }));
                end;
            end):catch(function(_) --[[ Line: 94 ]]

            end);
        end;
    end;
end;