local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_Parent_0.AppChatNetworking);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore);
local v7 = require(l_script_FirstAncestor_0.Stores.GetOverlayStore.OverlayTypes);
local v8 = require(l_script_FirstAncestor_0.Logger);
local v9 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchLatestConversationDetails);
local v10 = require(l_script_FirstAncestor_0.Utils.shouldShowOSAForConversation);
local v11 = require(l_script_FirstAncestor_0.Utils.shouldShowU13ChatOptInForConversation);
local v12 = require(l_script_FirstAncestor_0.Conversations.Actions.RemovedConversation);
local v13 = require(l_script_FirstAncestor_0.Models.Conversation);
local l_FFlagAppChatShowOSAOnPageEntry_0 = v3.FFlagAppChatShowOSAOnPageEntry;
local l_FFlagAppChatEnableGroupOSA_0 = v3.FFlagAppChatEnableGroupOSA;
local l_FFlagAppChatGroupOsaDialogHost_0 = v3.FFlagAppChatGroupOsaDialogHost;
local l_FFlagAppChatLiftPostAPICallActionsUp_0 = v3.FFlagAppChatLiftPostAPICallActionsUp;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUpdateConvAfterRecordModalSequence);
local l_API_0 = v4.rodux.GetConversationDetails.API;
local v20 = l_FFlagAppChatShowOSAOnPageEntry_0 and l_FFlagAppChatEnableGroupOSA_0 and l_FFlagAppChatGroupOsaDialogHost_0;
return function(v21) --[[ Line: 38 ]]
    -- upvalues: v20 (copy), v9 (copy), v11 (copy), v13 (copy), v5 (copy), v10 (copy), v6 (copy), v8 (copy), v7 (copy), l_HttpService_0 (copy), l_FFlagAppChatLiftPostAPICallActionsUp_0 (copy), v18 (copy), l_API_0 (copy), v12 (copy)
    local l_conversationId_0 = v21.conversationId;
    local l_dispatch_0 = v21.dispatch;
    local l_onAccepted_0 = v21.onAccepted;
    local l_onDeclined_0 = v21.onDeclined;
    if not v20 then
        l_onAccepted_0();
        return;
    elseif not l_conversationId_0 or l_conversationId_0 == "" then
        l_onAccepted_0();
        return;
    else
        l_dispatch_0(v9(l_conversationId_0)):andThen(function() --[[ Line: 55 ]]
            -- upvalues: l_dispatch_0 (copy), l_conversationId_0 (copy), v11 (ref), v21 (copy), v13 (ref), v5 (ref), v10 (ref), l_onAccepted_0 (copy), v6 (ref), v8 (ref), v7 (ref), l_HttpService_0 (ref), l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v18 (ref), l_API_0 (ref), v12 (ref), l_onDeclined_0 (copy)
            local v26 = nil;
            l_dispatch_0(function(v27) --[[ Line: 57 ]]
                -- upvalues: v26 (ref), l_conversationId_0 (ref)
                v26 = v27:getState().ChatAppReducer.Conversations[l_conversationId_0];
            end);
            local v28 = nil;
            if v11(v26) and v21.requireMultiUserForU13 and v26 and v26.conversationType == v13.Type.MULTI_USER_CONVERSATION then
                v28 = v5.OptInVariant.ChatOptInInfoCard;
            elseif v10(v26) then
                v28 = v5.OptInVariant.OsaContextCard;
            end;
            if not v28 then
                l_onAccepted_0();
                return;
            else
                local v29 = v6(false);
                v8:debug("[OSA Gate] Showing overlay variant={} for conversation {}", v28, l_conversationId_0);
                v29.showOverlay(v7.GroupOSADialog, {
                    conversationId = l_conversationId_0, 
                    impressionId = l_HttpService_0:GenerateGUID(false), 
                    modalVariant = v28, 
                    onJoin = function() --[[ Line: 83 ]] --[[ Name: onJoin ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), v18 (ref), l_conversationId_0 (ref), l_dispatch_0 (ref), l_API_0 (ref), v29 (copy), l_onAccepted_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and not v18 and l_conversationId_0 then
                            l_dispatch_0(l_API_0(l_conversationId_0));
                        end;
                        v29.dismissOverlay();
                        l_onAccepted_0();
                    end, 
                    onDecline = function() --[[ Line: 94 ]] --[[ Name: onDecline ]]
                        -- upvalues: l_FFlagAppChatLiftPostAPICallActionsUp_0 (ref), l_conversationId_0 (ref), v26 (ref), v13 (ref), l_dispatch_0 (ref), v12 (ref), v29 (copy), l_onDeclined_0 (ref)
                        if l_FFlagAppChatLiftPostAPICallActionsUp_0 and l_conversationId_0 and v26 and v26.conversationType == v13.Type.MULTI_USER_CONVERSATION then
                            l_dispatch_0(v12(l_conversationId_0));
                        end;
                        v29.dismissOverlay();
                        if l_onDeclined_0 then
                            l_onDeclined_0();
                        end;
                    end, 
                    onClose = function() --[[ Line: 108 ]] --[[ Name: onClose ]]
                        -- upvalues: l_onDeclined_0 (ref)
                        if l_onDeclined_0 then
                            l_onDeclined_0();
                        end;
                    end
                });
                return;
            end;
        end):catch(function(v30) --[[ Line: 115 ]]
            -- upvalues: v8 (ref), l_conversationId_0 (copy), v21 (copy)
            v8:warning("[OSA Gate] Error fetching conversation details for {}: {}", l_conversationId_0, (tostring(v30)));
            if v21.onError then
                v21.onError(v30);
            end;
        end);
        return;
    end;
end;