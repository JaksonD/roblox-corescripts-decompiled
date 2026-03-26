local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_script_FirstAncestor_0.Constants);
local _ = require(l_script_FirstAncestor_0.Models.ConversationChannels);
local v5 = require(l_Parent_0.Cryo);
local v6 = require(l_Parent_0.React);
local v7 = require(l_Parent_0.Signals);
local l_View_0 = require(l_Parent_0.Foundation).View;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Hooks.useAppChatIsWideMode);
local v11 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v12 = require(script.Parent.Utils.isUserInConversation);
local v13 = require(script.Parent.Utils.searchFilterPredicate);
local v14 = require(script.Parent.Utils.sortComparator);
local v15 = require(script.Parent.useFetchPaginatedFriendIds);
local v16 = require(script.Parent.SelectChatMembers);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v20 = require(l_script_FirstAncestor_0.Stores.GetSelectedUsersStore);
local v24 = {
    minSelections = 1, 
    maxSelections = v3.MIN_PARTICIPANT_COUNT, 
    maxConversationSize = v3.MAX_PARTICIPANT_COUNT, 
    canOnlyCreateOneToOneChat = false, 
    filterPredicate = v13, 
    sortComparator = v14, 
    conversation = {
        participants = {}
    }, 
    navigateToToast = function(_) --[[ Line: 64 ]] --[[ Name: navigateToToast ]]

    end, 
    selectedUsersChanged = function(_, _) --[[ Line: 65 ]] --[[ Name: selectedUsersChanged ]]

    end, 
    isDebugEnabled = false
};
SelectChatMembersContainer = function(v25) --[[ Line: 70 ]] --[[ Name: SelectChatMembersContainer ]]
    -- upvalues: v5 (copy), v24 (copy), v20 (copy), v6 (copy), v7 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v3 (copy), v15 (copy), v12 (copy), v11 (copy), v10 (copy), l_View_0 (copy), v16 (copy)
    local v26 = v5.Dictionary.union(v24, v25);
    local v27 = v20(false);
    v6.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v27 (copy), v26 (copy)
        v27.setMaxSize(v26.maxSelections);
        return function() --[[ Line: 76 ]]
            -- upvalues: v27 (ref)
            v27.clearStore();
        end;
    end, {
        v26.maxSelections
    });
    v6.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v7 (ref), v27 (copy), v5 (ref), v26 (copy)
        local v32 = v7.createEffect(function(v28) --[[ Line: 82 ]]
            -- upvalues: v27 (ref), v5 (ref), v26 (ref)
            local v29 = v27.getSelectedUserIdsArray()(v28);
            local v31 = v5.List.map(v29, function(v30) --[[ Line: 87 ]]
                return {
                    id = v30
                };
            end);
            v26.selectedUsersChanged(v31, v26.minSelections);
        end);
        return function() --[[ Line: 93 ]]
            -- upvalues: v32 (copy)
            v32();
        end;
    end, {
        v26.minSelections
    });
    local v33 = l_useLocalization_0({
        systemButtonText = v26.systemButtonText, 
        pageHeaderText = v26.pageHeaderText, 
        searchFriendsText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Label.SearchFriends" or "Feature.Chat.Label.SearchConnections", 
        networkErrorText = "Feature.Chat.Response.NetworkError", 
        tooManyFriendsText = {
            if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsPartyLimit" or "Feature.Chat.Message.AddConnectionsPartyLimit" else l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsLimit" or "Feature.Chat.Message.AddConnectionsLimit"; 
            friendNum = v3.MAX_PARTICIPANT_COUNT, 
            connectionsNum = v3.MAX_PARTICIPANT_COUNT
        }, 
        tooManyFriendsTextSingular = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsPartyLimitSingular" or "Feature.Chat.Message.AddConnectionsPartyLimitSingular" else l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.GroupFriendLimitSingular" or "Feature.Chat.Message.GroupConnectionLimitSingular"
    });
    local v35 = v6.useCallback(function() --[[ Line: 126 ]]
        -- upvalues: v26 (copy), v33 (copy)
        local v34 = if v26.canOnlyCreateOneToOneChat then v33.tooManyFriendsTextSingular else v33.tooManyFriendsText;
        v26.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v34
                }
            }
        });
    end, {
        v26.canOnlyCreateOneToOneChat, 
        v26.navigateToToast, 
        v33
    });
    v6.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v27 (copy), v35 (copy)
        local v36 = v27.onMaxSizeExceeded(v35);
        return function() --[[ Line: 134 ]]
            -- upvalues: v36 (copy)
            v36();
        end;
    end, {
        v35
    });
    local v37, v38, v39 = v15();
    local v41 = v6.useMemo(function() --[[ Line: 141 ]]
        -- upvalues: v5 (ref), v37 (copy), v12 (ref), v26 (copy)
        return v5.List.filter(v37, function(v40) --[[ Line: 142 ]]
            -- upvalues: v12 (ref), v26 (ref)
            return not v12(v40, v26.conversation);
        end);
    end, {
        v37, 
        v26.conversation
    });
    local v42 = v6.useCallback(function() --[[ Line: 147 ]]
        -- upvalues: v38 (copy), v39 (copy)
        if v38 and not v39 then
            v38();
        end;
    end, {
        v38, 
        v39
    });
    local v43 = not v26.canOnlyCreateOneToOneChat;
    local v44 = v11();
    local v45 = not v10(v44);
    return v6.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 1, v45 and 0 or -56)
    }, {
        SelectMembers = v6.createElement(v16, {
            friendIds = v41, 
            fetchMoreFriends = v42, 
            searchFriendsText = v33.searchFriendsText, 
            shouldShowSelectChatMembersBar = v43, 
            conversation = v26.conversation, 
            isDebugEnabled = v26.isDebugEnabled
        })
    });
end;
return v6.memo(SelectChatMembersContainer);