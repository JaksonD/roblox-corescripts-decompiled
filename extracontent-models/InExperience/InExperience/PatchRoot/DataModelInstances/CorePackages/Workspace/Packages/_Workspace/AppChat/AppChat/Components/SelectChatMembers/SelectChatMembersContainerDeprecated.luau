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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_0.SharedFlags).FFlagConnectionsToFriendsRename;
local v27 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatInExpSelectChatMembersMobileHeight);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v32 = {
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
    navigateToToast = function(_) --[[ Line: 77 ]] --[[ Name: navigateToToast ]]

    end, 
    selectedUsersChanged = function(_, _) --[[ Line: 78 ]] --[[ Name: selectedUsersChanged ]]

    end
};
SelectChatMembersContainer = function(v33) --[[ Line: 82 ]] --[[ Name: SelectChatMembersContainer ]]
    -- upvalues: v3 (copy), v32 (copy), l_useState_0 (copy), l_useLocalization_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), l_GetFFlagAppChatRebrandStringUpdates_0 (copy), l_GetFFlagIsSquadEnabled_0 (copy), v4 (copy), v22 (copy), l_useUserProfilesFetch_0 (copy), v17 (copy), v21 (copy), l_useCallback_0 (copy), v5 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_usePrevious_0 (copy), l_useEffect_0 (copy), l_useStyle_0 (copy), v27 (copy), v15 (copy), v16 (copy), v7 (copy), v23 (copy)
    local v34 = v3.Dictionary.join(v32, v33);
    local v35, v36 = l_useState_0({});
    local v37 = l_useLocalization_0({
        systemButtonText = v34.systemButtonText, 
        pageHeaderText = v34.pageHeaderText, 
        searchFriendsText = l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Label.SearchFriends" or "Feature.Chat.Label.SearchConnections", 
        offlinePresenceText = "Common.Presence.Label.Offline", 
        onlinePresenceText = "Common.Presence.Label.Online", 
        networkErrorText = "Feature.Chat.Response.NetworkError", 
        tooManyFriendsText = {
            if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsPartyLimit" or "Feature.Chat.Message.AddConnectionsPartyLimit" else l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsLimit" or "Feature.Chat.Message.AddConnectionsLimit"; 
            friendNum = 5, 
            connectionsNum = 5
        }, 
        tooManyFriendsTextSingular = if l_GetFFlagAppChatRebrandStringUpdates_0() and l_GetFFlagIsSquadEnabled_0() then l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.AddFriendsPartyLimitSingular" or "Feature.Chat.Message.AddConnectionsPartyLimitSingular" else l_FFlagConnectionsToFriendsRename_0 and "Feature.Chat.Message.GroupFriendLimitSingular" or "Feature.Chat.Message.GroupConnectionLimitSingular"
    });
    local v38, v39 = v4.useState({});
    local v40 = nil;
    local v41 = nil;
    local v42 = nil;
    local v43, v44, v45 = v22();
    v42 = v43;
    v40 = v44;
    v41 = v45;
    v43 = v3.List.map(v42, function(v46) --[[ Line: 120 ]]
        return v46.id;
    end);
    v44 = l_useUserProfilesFetch_0({
        userIds = v43, 
        query = v17.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    v4.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v44 (copy), v39 (copy), v3 (ref), v42 (ref), v21 (ref), v34 (copy), v17 (ref)
        if v44.data then
            v39(v3.List.filterMap(v42, function(v47) --[[ Line: 130 ]]
                -- upvalues: v21 (ref), v34 (ref), v3 (ref), v17 (ref), v44 (ref)
                if not v21(v47.id, v34.conversation) then
                    return v3.Dictionary.join(v47, {
                        displayName = v17.Selectors.getCombinedNameFromId(v44.data, v47.id), 
                        username = v17.Selectors.getUsernameFromId(v44.data, v47.id)
                    });
                else
                    return nil;
                end;
            end));
        end;
    end, {
        v44.data, 
        v34.conversation
    });
    v45 = l_useCallback_0(function(v48) --[[ Line: 145 ]]
        -- upvalues: v35 (copy), v34 (copy), v5 (ref), v3 (ref)
        if v35 and #v35 == v34.maxSelections then
            return v5.reject();
        else
            return v5.resolve(v3.List.join(v35, {
                v48
            }));
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v35, 
        v34.maxSelections
    } else l_dependencyArray_0(v35, v34.maxSelections));
    local v51 = l_useCallback_0(function(v49) --[[ Line: 157 ]]
        -- upvalues: v5 (ref), v3 (ref), v35 (copy)
        return v5.resolve(v3.List.filter(v35, function(v50) --[[ Line: 158 ]]
            -- upvalues: v49 (copy)
            return v50.id ~= v49;
        end));
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v35
    } else l_dependencyArray_0(v35));
    local v55 = l_useCallback_0(function(v52) --[[ Line: 163 ]]
        -- upvalues: v35 (copy)
        for _, v54 in pairs(v35) do
            if v54.id == v52.id then
                return true;
            end;
        end;
        return false;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v35
    } else l_dependencyArray_0(v35));
    local function _(v56) --[[ Line: 173 ]]
        -- upvalues: v55 (copy), v51 (copy), v45 (copy)
        if v55(v56) then
            return v51(v56.id);
        else
            return v45(v56);
        end;
    end;
    local function v59(v58) --[[ Line: 181 ]]
        -- upvalues: v34 (copy)
        v34.navigateToToast({
            toastProps = {
                toastContent = {
                    toastTitle = v58
                }
            }
        });
    end;
    local v60 = l_usePrevious_0(v35);
    l_useEffect_0(function() --[[ Line: 193 ]]
        -- upvalues: v35 (copy), v60 (copy), v34 (copy)
        if v35 ~= v60 then
            v34.selectedUsersChanged(v35, v34.minSelections);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v35
    } else l_dependencyArray_0(v35));
    local v61 = l_useStyle_0();
    local function v62() --[[ Line: 201 ]]
        -- upvalues: v40 (ref), v41 (ref)
        if v40 and not v41 then
            v40();
        end;
    end;
    local v65 = v3.Dictionary.join(v34, v37, {
        onEntryActivated = function(v63) --[[ Line: 210 ]] --[[ Name: onEntryActivated ]]
            -- upvalues: v55 (copy), v51 (copy), v45 (copy), v36 (copy), v59 (copy), v34 (copy), v37 (copy)
            (if v55(v63) then v51(v63.id) else v45(v63)):andThen(function(v64) --[[ Line: 212 ]]
                -- upvalues: v36 (ref)
                v36(v64);
            end):catch(function() --[[ Line: 215 ]]
                -- upvalues: v59 (ref), v34 (ref), v37 (ref)
                v59(if v34.canOnlyCreateOneToOneChat then v37.tooManyFriendsTextSingular else v37.tooManyFriendsText);
            end);
        end, 
        selectedUsers = v35, 
        friendEntries = v38, 
        shouldShowSelectChatMembersBar = not v34.canOnlyCreateOneToOneChat, 
        fetchMoreFriends = v62
    });
    local v66 = if v27 then not v15(v16()) else v7.useOrientation() == v7.Keys.Portrait;
    local l_topBarHeight_0 = v32.topBarHeight;
    return v4.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, v66 and 0 or -l_topBarHeight_0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v61.Theme.BackgroundUIDefault.Color, 
        BorderSizePixel = 0, 
        Active = true, 
        AutoButtonColor = false
    }, {
        content = v4.createElement(v23, v65)
    });
end;
return l_memo_0(SelectChatMembersContainer);