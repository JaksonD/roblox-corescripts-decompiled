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
local v19 = require(l_script_FirstAncestor_0.Stores.GetSelectedUsersStore);
local v23 = {
    minSelections = 1, 
    maxSelections = v3.MIN_PARTICIPANT_COUNT, 
    maxConversationSize = v3.MAX_PARTICIPANT_COUNT, 
    canOnlyCreateOneToOneChat = false, 
    filterPredicate = v13, 
    sortComparator = v14, 
    conversation = {
        participants = {}
    }, 
    navigateToToast = function(_) --[[ Line: 63 ]] --[[ Name: navigateToToast ]]

    end, 
    selectedUsersChanged = function(_, _) --[[ Line: 64 ]] --[[ Name: selectedUsersChanged ]]

    end, 
    isDebugEnabled = false
};
SelectChatMembersContainer = function(v24) --[[ Line: 69 ]] --[[ Name: SelectChatMembersContainer ]]
    -- upvalues: v5 (copy), v23 (copy), v19 (copy), v6 (copy), v7 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v3 (copy), v15 (copy), v12 (copy), v11 (copy), v10 (copy), l_View_0 (copy), v16 (copy)
    local v25 = v5.Dictionary.union(v23, v24);
    local v26 = v19(false);
    v6.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v26 (copy), v25 (copy)
        v26.setMaxSize(v25.maxSelections);
        return function() --[[ Line: 75 ]]
            -- upvalues: v26 (ref)
            v26.clearStore();
        end;
    end, {
        v25.maxSelections
    });
    v6.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v7 (ref), v26 (copy), v5 (ref), v25 (copy)
        local v31 = v7.createEffect(function(v27) --[[ Line: 81 ]]
            -- upvalues: v26 (ref), v5 (ref), v25 (ref)
            local v28 = v26.getSelectedUserIdsArray()(v27);
            local v30 = v5.List.map(v28, function(v29) --[[ Line: 86 ]]
                return {
                    id = v29
                };
            end);
            v25.selectedUsersChanged(v30, v25.minSelections);
        end);
        return function() --[[ Line: 92 ]]
            -- upvalues: v31 (copy)
            v31();
        end;
    end, {
        v25.minSelections
    });
    local v32 = l_useLocalization_0({
        systemButtonText = v25.systemButtonText, 
        pageHeaderText = v25.pageHeaderText, 
        searchFriendsText = "Feature.Chat.Label.SearchConnections", 
        networkErrorText = "Feature.Chat.Response.NetworkError", 
        tooManyFriendsText = {
            l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.AddConnectionsPartyLimit" or "Feature.Chat.Message.AddConnectionsLimit"; 
            friendNum = v3.MAX_PARTICIPANT_COUNT, 
            connectionsNum = v3.MAX_PARTICIPANT_COUNT
        }, 
        tooManyFriendsTextSingular = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.AddConnectionsPartyLimitSingular" or "Feature.Chat.Message.GroupConnectionLimitSingular"
    });
    local v34 = v6.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v25 (copy), v32 (copy)
        local v33 = if v25.canOnlyCreateOneToOneChat then v32.tooManyFriendsTextSingular else v32.tooManyFriendsText;
        v25.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v33
                }
            }
        });
    end, {
        v25.canOnlyCreateOneToOneChat, 
        v25.navigateToToast, 
        v32
    });
    v6.useEffect(function() --[[ Line: 121 ]]
        -- upvalues: v26 (copy), v34 (copy)
        local v35 = v26.onMaxSizeExceeded(v34);
        return function() --[[ Line: 123 ]]
            -- upvalues: v35 (copy)
            v35();
        end;
    end, {
        v34
    });
    local v36, v37, v38 = v15();
    local v40 = v6.useMemo(function() --[[ Line: 130 ]]
        -- upvalues: v5 (ref), v36 (copy), v12 (ref), v25 (copy)
        return v5.List.filter(v36, function(v39) --[[ Line: 131 ]]
            -- upvalues: v12 (ref), v25 (ref)
            return not v12(v39, v25.conversation);
        end);
    end, {
        v36, 
        v25.conversation
    });
    local v41 = v6.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v37 (copy), v38 (copy)
        if v37 and not v38 then
            v37();
        end;
    end, {
        v37, 
        v38
    });
    local v42 = not v25.canOnlyCreateOneToOneChat;
    local v43 = v11();
    local v44 = not v10(v43);
    return v6.createElement(l_View_0, {
        Size = UDim2.new(1, 0, 1, v44 and 0 or -56)
    }, {
        SelectMembers = v6.createElement(v16, {
            friendIds = v40, 
            fetchMoreFriends = v41, 
            searchFriendsText = v32.searchFriendsText, 
            shouldShowSelectChatMembersBar = v42, 
            conversation = v25.conversation, 
            isDebugEnabled = v25.isDebugEnabled
        })
    });
end;
return v6.memo(SelectChatMembersContainer);