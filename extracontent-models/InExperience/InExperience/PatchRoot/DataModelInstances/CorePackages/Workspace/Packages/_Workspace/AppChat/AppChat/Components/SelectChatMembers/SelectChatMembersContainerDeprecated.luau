local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.types);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Promise);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v7 = require(l_Parent_0.Responsive);
local l_memo_0 = v4.memo;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useState_0 = v4.useState;
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local v15 = require(l_script_FirstAncestor_0.Hooks.useAppChatIsWideMode);
local v16 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v17 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v17.Hooks.useUserProfilesFetch;
local v19 = require(script.Parent.Utils.searchFilterPredicate);
local v20 = require(script.Parent.Utils.sortComparator);
local v21 = require(script.Parent.Utils.isUserInConversation);
local v22 = require(script.Parent.useFetchPaginatedFriends);
local v23 = require(script.Parent.SelectChatMembersDeprecated);
local l_GetFFlagAppChatRebrandStringUpdates_0 = require(l_Parent_0.SharedFlags).GetFFlagAppChatRebrandStringUpdates;
local l_GetFFlagIsSquadEnabled_0 = require(l_Parent_0.SharedFlags).GetFFlagIsSquadEnabled;
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight);
local v30 = {
    topBarHeight = 56, 
    minSelections = 1, 
    maxSelections = 5, 
    maxConversationSize = 5, 
    canOnlyCreateOneToOneChat = false, 
    filterPredicate = v19, 
    sortComparator = v20, 
    conversation = {
        participants = {}
    }, 
    navigateToToast = function(_) --[[ Line: 74 ]] --[[ Name: navigateToToast ]]

    end, 
    selectedUsersChanged = function(_, _) --[[ Line: 75 ]] --[[ Name: selectedUsersChanged ]]

    end
};
SelectChatMembersContainer = function(v31) --[[ Line: 79 ]] --[[ Name: SelectChatMembersContainer ]]
    -- upvalues: v3 (copy), v30 (copy), l_useState_0 (copy), l_useLocalization_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v4 (copy), v22 (copy), l_useUserProfilesFetch_0 (copy), v17 (copy), v21 (copy), l_useCallback_0 (copy), v5 (copy), l_dependencyArray_0 (copy), l_usePrevious_0 (copy), l_useEffect_0 (copy), l_useStyle_0 (copy), v26 (copy), v15 (copy), v16 (copy), v7 (copy), v23 (copy)
    local v32 = v3.Dictionary.join(v30, v31);
    local v33, v34 = l_useState_0({});
    local v35 = l_useLocalization_0({
        systemButtonText = v32.systemButtonText, 
        pageHeaderText = v32.pageHeaderText, 
        searchFriendsText = "Feature.Chat.Label.SearchConnections", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        networkErrorText = "Feature.Chat.Response.NetworkError", 
        tooManyFriendsText = {
            l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.AddConnectionsPartyLimit" or "Feature.Chat.Message.AddConnectionsLimit"; 
            friendNum = 5, 
            connectionsNum = 5
        }, 
        tooManyFriendsTextSingular = l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() and "Feature.Chat.Message.AddConnectionsPartyLimitSingular" or "Feature.Chat.Message.GroupConnectionLimitSingular"
    });
    local v36, v37 = v4.useState({});
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    local v41, v42, v43 = v22();
    v40 = v41;
    v38 = v42;
    v39 = v43;
    v41 = v3.List.map(v40, function(v44) --[[ Line: 107 ]]
        return v44.id;
    end);
    v42 = l_useUserProfilesFetch_0({
        userIds = v41, 
        query = v17.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v4.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v42 (copy), v37 (copy), v3 (ref), v40 (ref), v21 (ref), v32 (copy), v17 (ref)
        if v42.data then
            v37(v3.List.filterMap(v40, function(v45) --[[ Line: 117 ]]
                -- upvalues: v21 (ref), v32 (ref), v3 (ref), v17 (ref), v42 (ref)
                if not v21(v45.id, v32.conversation) then
                    return v3.Dictionary.join(v45, {
                        displayName = v17.Selectors.getCombinedNameFromId(v42.data, v45.id), 
                        username = v17.Selectors.getUsernameFromId(v42.data, v45.id)
                    });
                else
                    return nil;
                end;
            end));
        end;
    end, {
        v42.data, 
        v32.conversation
    });
    v43 = l_useCallback_0(function(v46) --[[ Line: 131 ]]
        -- upvalues: v33 (copy), v32 (copy), v5 (ref), v3 (ref)
        if v33 and #v33 == v32.maxSelections then
            return v5.reject();
        else
            return v5.resolve(v3.List.join(v33, {
                v46
            }));
        end;
    end, l_dependencyArray_0(v33, v32.maxSelections));
    local v49 = l_useCallback_0(function(v47) --[[ Line: 139 ]]
        -- upvalues: v5 (ref), v3 (ref), v33 (copy)
        return v5.resolve(v3.List.filter(v33, function(v48) --[[ Line: 140 ]]
            -- upvalues: v47 (copy)
            return v48.id ~= v47;
        end));
    end, l_dependencyArray_0(v33));
    local v53 = l_useCallback_0(function(v50) --[[ Line: 145 ]]
        -- upvalues: v33 (copy)
        for _, v52 in pairs(v33) do
            if v52.id == v50.id then
                return true;
            end;
        end;
        return false;
    end, l_dependencyArray_0(v33));
    local function _(v54) --[[ Line: 155 ]]
        -- upvalues: v53 (copy), v49 (copy), v43 (copy)
        if v53(v54) then
            return v49(v54.id);
        else
            return v43(v54);
        end;
    end;
    local function v57(v56) --[[ Line: 163 ]]
        -- upvalues: v32 (copy)
        v32.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v56
                }
            }
        });
    end;
    local v58 = l_usePrevious_0(v33);
    l_useEffect_0(function() --[[ Line: 175 ]]
        -- upvalues: v33 (copy), v58 (copy), v32 (copy)
        if v33 ~= v58 then
            v32.selectedUsersChanged(v33, v32.minSelections);
        end;
    end, l_dependencyArray_0(v33));
    local v59 = l_useStyle_0();
    local function v60() --[[ Line: 183 ]]
        -- upvalues: v38 (ref), v39 (ref)
        if v38 and not v39 then
            v38();
        end;
    end;
    local v63 = v3.Dictionary.join(v32, v35, {
        onEntryActivated = function(v61) --[[ Line: 192 ]] --[[ Name: onEntryActivated ]]
            -- upvalues: v53 (copy), v49 (copy), v43 (copy), v34 (copy), v57 (copy), v32 (copy), v35 (copy)
            (if v53(v61) then v49(v61.id) else v43(v61)):andThen(function(v62) --[[ Line: 194 ]]
                -- upvalues: v34 (ref)
                v34(v62);
            end):catch(function() --[[ Line: 197 ]]
                -- upvalues: v57 (ref), v32 (ref), v35 (ref)
                v57(if v32.canOnlyCreateOneToOneChat then v35.tooManyFriendsTextSingular else v35.tooManyFriendsText);
            end);
        end, 
        selectedUsers = v33, 
        friendEntries = v36, 
        shouldShowSelectChatMembersBar = not v32.canOnlyCreateOneToOneChat, 
        fetchMoreFriends = v60
    });
    local v64 = if v26 then not v15(v16()) else v7.useOrientation() == v7.Keys.Portrait;
    local l_topBarHeight_0 = v30.topBarHeight;
    return v4.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, v64 and 0 or -l_topBarHeight_0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v59.Theme.BackgroundUIDefault.Color, 
        BorderSizePixel = 0, 
        Active = true, 
        AutoButtonColor = false
    }, {
        content = v4.createElement(v23, v63)
    });
end;
return l_memo_0(SelectChatMembersContainer);