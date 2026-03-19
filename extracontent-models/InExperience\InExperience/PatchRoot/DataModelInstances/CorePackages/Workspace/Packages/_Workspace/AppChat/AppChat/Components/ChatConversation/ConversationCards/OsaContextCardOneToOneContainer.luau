local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.UserProfiles);
local v5 = require(l_script_FirstAncestor_0.Components.ChatConversation.ConversationCards.OsaContextCardOneToOne);
local v6 = require(l_script_FirstAncestor_0.Users.getThumbnailsForUserIds);
local v7 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local v8 = require(l_Parent_0.AppChatNetworking);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local v11 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local l_useUserProfilesFetch_0 = v4.Hooks.useUserProfilesFetch;
local l_getCombinedNameFromId_0 = v4.Selectors.getCombinedNameFromId;
local l_getUsernameFromId_0 = v4.Selectors.getUsernameFromId;
local l_API_0 = v8.rodux.GetConversationDetails.API;
local v16 = require(l_script_FirstAncestor_0.Hooks.useGetOneToOneFriendIdFromConversationId);
local v17 = require(l_script_FirstAncestor_0.Hooks.useIsGuiInChatVisible);
local v18 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v19 = require(l_script_FirstAncestor_0.Hooks.useRecordModalSequenceResponseForConversation);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v21 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseTCUserTileForOSACard);
return v3.memo(function(v23) --[[ Line: 35 ]]
    -- upvalues: l_useDispatch_0 (copy), v16 (copy), v7 (copy), v3 (copy), v21 (copy), l_useUserProfilesFetch_0 (copy), v4 (copy), v19 (copy), v18 (copy), v8 (copy), v17 (copy), l_useSelector_0 (copy), v10 (copy), l_API_0 (copy), v11 (copy), l_getUsernameFromId_0 (copy), l_getCombinedNameFromId_0 (copy), v6 (copy), v2 (copy), v5 (copy), v22 (copy)
    local v24 = l_useDispatch_0();
    local v25 = v16(v23.conversationId) or "";
    local v26 = v7();
    local v27 = v3.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v26 (copy)
        return {
            left = UDim.new(0, v26.left), 
            right = UDim.new(0, v26.right)
        };
    end, {
        v26.left, 
        v26.right
    });
    local v28 = v21();
    local v29 = l_useUserProfilesFetch_0({
        userIds = {
            v25
        }, 
        query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
        overrideRetryCount = 4
    });
    local v30, v31 = v3.useState(false);
    local v32 = v19(v23.conversationId);
    local v33 = v3.useCallback(function() --[[ Line: 59 ]]
        -- upvalues: v23 (copy), v25 (copy)
        if v23.openViewProfile then
            v23.openViewProfile(v25);
        end;
    end, {
        v25
    });
    local v34 = v18(v23.conversationId);
    local v35 = v34 and v34.osaAcknowledgementStatus == v8.Constants.OsaAcknowledgementStatusResponse.Unacknowledged;
    local v36 = v3.useRef(nil);
    local v37 = v17(v36, {
        v36.current
    });
    local v38 = if v35 then v37 else false;
    local v40 = l_useSelector_0(function(v39) --[[ Line: 74 ]]
        -- upvalues: v8 (ref), v23 (copy)
        return v8.rodux.RecordModalSequenceResponse.getStatus(v39, v23.conversationId);
    end);
    local v41, v42 = v3.useState(nil);
    local v43, v44 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 82 ]]
        -- upvalues: v35 (copy), v38 (copy), v40 (copy), v10 (ref), v30 (copy), v32 (copy), v31 (copy), v34 (copy), v24 (copy), l_API_0 (ref), v23 (copy), v11 (ref)
        if v35 and v38 and v40 ~= v10.Enum.NetworkStatus.Fetching and not v30 and v32 then
            v32("record_has_seen", "conversation_inline_top_modal", nil, "OsaContextCard"):andThen(function() --[[ Line: 91 ]]
                -- upvalues: v31 (ref), v34 (ref), v24 (ref), l_API_0 (ref), v23 (ref)
                v31(true);
                if v34 and v34.source ~= "friends" then
                    v24(l_API_0(v23.conversationId));
                end;
            end):catch(function(v45) --[[ Line: 99 ]]
                -- upvalues: v11 (ref)
                v11:error("Error in OsaContextCardOneToOneContainer -> recordModalSequenceResponseForConversation -> record_has_seen: " .. tostring(v45));
            end);
        end;
    end, {
        v35, 
        v38, 
        v40, 
        v32, 
        v30, 
        v24, 
        v23.conversationId
    });
    v3.useEffect(function() --[[ Line: 118 ]]
        -- upvalues: v29 (copy), v25 (copy), l_getUsernameFromId_0 (ref), v42 (copy), v44 (copy), l_getCombinedNameFromId_0 (ref)
        if v29.data and v25 then
            local v46 = l_getUsernameFromId_0(v29.data, v25);
            v42(if v46 then "@" .. v46 else nil);
            v44(l_getCombinedNameFromId_0(v29.data, v25));
        end;
    end, {
        v29.data, 
        v25
    });
    local v47 = v3.useMemo(function() --[[ Line: 126 ]]
        -- upvalues: v6 (ref), v25 (copy)
        return v6({
            v25
        })[1];
    end, {
        v25
    });
    return v3.createElement(v2.View, {
        tag = "col size-full-0 auto-y align-x-center padding-top-xxlarge padding-bottom-large", 
        padding = v27
    }, {
        OsaContextCardOneToOne = v3.createElement(v5, {
            displayName = v43, 
            username = v41, 
            avatarThumbnail = v47, 
            onAvatarActivated = v33, 
            hasError = v29.error and true or false, 
            isChatUserMessagesEnabled = v28, 
            ref = v36, 
            userId = if v22 then v25 else nil
        })
    });
end);