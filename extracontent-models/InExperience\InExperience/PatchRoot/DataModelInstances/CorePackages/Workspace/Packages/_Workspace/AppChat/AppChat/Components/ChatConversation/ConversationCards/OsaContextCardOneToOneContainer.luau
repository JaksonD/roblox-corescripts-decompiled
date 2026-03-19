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
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = v4.Hooks.useIsRobloxSubscriber;
return v3.memo(function(v25) --[[ Line: 39 ]]
    -- upvalues: l_useDispatch_0 (copy), v16 (copy), v7 (copy), v3 (copy), v21 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_useUserProfilesFetch_0 (copy), v4 (copy), v19 (copy), v18 (copy), v8 (copy), v17 (copy), l_useSelector_0 (copy), v10 (copy), l_API_0 (copy), v11 (copy), l_getUsernameFromId_0 (copy), l_getCombinedNameFromId_0 (copy), v6 (copy), v2 (copy), v5 (copy), v22 (copy)
    local v26 = l_useDispatch_0();
    local v27 = v16(v25.conversationId) or "";
    local v28 = v7();
    local v29 = v3.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: v28 (copy)
        return {
            left = UDim.new(0, v28.left), 
            right = UDim.new(0, v28.right)
        };
    end, {
        v28.left, 
        v28.right
    });
    local v30 = v21();
    local v31 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 and v27 ~= "" then v27 else nil);
    local v32 = l_useUserProfilesFetch_0({
        userIds = {
            v27
        }, 
        query = v4.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
        overrideRetryCount = 4
    });
    local v33, v34 = v3.useState(false);
    local v35 = v19(v25.conversationId);
    local v36 = v3.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v25 (copy), v27 (copy)
        if v25.openViewProfile then
            v25.openViewProfile(v27);
        end;
    end, {
        v27
    });
    local v37 = v18(v25.conversationId);
    local v38 = v37 and v37.osaAcknowledgementStatus == v8.Constants.OsaAcknowledgementStatusResponse.Unacknowledged;
    local v39 = v3.useRef(nil);
    local v40 = v17(v39, {
        v39.current
    });
    local v41 = if v38 then v40 else false;
    local v43 = l_useSelector_0(function(v42) --[[ Line: 81 ]]
        -- upvalues: v8 (ref), v25 (copy)
        return v8.rodux.RecordModalSequenceResponse.getStatus(v42, v25.conversationId);
    end);
    local v44, v45 = v3.useState(nil);
    local v46, v47 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 89 ]]
        -- upvalues: v38 (copy), v41 (copy), v43 (copy), v10 (ref), v33 (copy), v35 (copy), v34 (copy), v37 (copy), v26 (copy), l_API_0 (ref), v25 (copy), v11 (ref)
        if v38 and v41 and v43 ~= v10.Enum.NetworkStatus.Fetching and not v33 and v35 then
            v35("record_has_seen", "conversation_inline_top_modal", nil, "OsaContextCard"):andThen(function() --[[ Line: 98 ]]
                -- upvalues: v34 (ref), v37 (ref), v26 (ref), l_API_0 (ref), v25 (ref)
                v34(true);
                if v37 and v37.source ~= "friends" then
                    v26(l_API_0(v25.conversationId));
                end;
            end):catch(function(v48) --[[ Line: 106 ]]
                -- upvalues: v11 (ref)
                v11:error("Error in OsaContextCardOneToOneContainer -> recordModalSequenceResponseForConversation -> record_has_seen: " .. tostring(v48));
            end);
        end;
    end, {
        v38, 
        v41, 
        v43, 
        v35, 
        v33, 
        v26, 
        v25.conversationId
    });
    v3.useEffect(function() --[[ Line: 125 ]]
        -- upvalues: v32 (copy), v27 (copy), l_getUsernameFromId_0 (ref), v45 (copy), v47 (copy), l_getCombinedNameFromId_0 (ref)
        if v32.data and v27 then
            local v49 = l_getUsernameFromId_0(v32.data, v27);
            v45(if v49 then "@" .. v49 else nil);
            v47(l_getCombinedNameFromId_0(v32.data, v27));
        end;
    end, {
        v32.data, 
        v27
    });
    local v50 = v3.useMemo(function() --[[ Line: 133 ]]
        -- upvalues: v6 (ref), v27 (copy)
        return v6({
            v27
        })[1];
    end, {
        v27
    });
    return v3.createElement(v2.View, {
        tag = "col size-full-0 auto-y align-x-center padding-top-xxlarge padding-bottom-large", 
        padding = v29
    }, {
        OsaContextCardOneToOne = v3.createElement(v5, {
            displayName = v46, 
            username = v44, 
            avatarThumbnail = v50, 
            onAvatarActivated = v36, 
            hasError = v32.error and true or false, 
            isChatUserMessagesEnabled = v30, 
            ref = v39, 
            userId = if v22 then v27 else nil, 
            isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v31 else nil
        })
    });
end);