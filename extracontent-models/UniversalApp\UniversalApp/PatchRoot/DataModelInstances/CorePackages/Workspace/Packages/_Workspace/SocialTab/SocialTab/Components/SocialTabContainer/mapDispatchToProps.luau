local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_Promise_0 = v3.Promise;
local l_GetUnreadConversationCount_0 = require(l_Parent_0.SocialTabState).Requests.GetUnreadConversationCount;
local l_GetPresencesFromUserIds_0 = v3.NetworkingPresence.GetPresencesFromUserIds;
local l_NetworkingFriends_0 = v3.NetworkingFriends;
local l_NetworkingUsers_0 = v3.NetworkingUsers;
local l_SocialLibraries_0 = v3.SocialLibraries;
local l_EnteredChatFromEntryPoint_0 = v3.AppChat.Actions.EnteredChatFromEntryPoint;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v13) --[[ Line: 19 ]]
    -- upvalues: l_NetworkingFriends_0 (copy), l_Promise_0 (copy), l_GetUnreadConversationCount_0 (copy), l_SocialLibraries_0 (copy), l_GetPresencesFromUserIds_0 (copy), l_NetworkingUsers_0 (copy), v2 (copy), l_EnteredChatFromEntryPoint_0 (copy), l_NavigateDown_0 (copy), l_AppPage_0 (copy)
    return {
        refreshPageData = function() --[[ Line: 21 ]] --[[ Name: refreshPageData ]]
            -- upvalues: l_NetworkingFriends_0 (ref), l_Promise_0 (ref), v13 (copy), l_GetUnreadConversationCount_0 (ref), l_SocialLibraries_0 (ref), l_GetPresencesFromUserIds_0 (ref), l_NetworkingUsers_0 (ref), v2 (ref)
            local l_GetFriendRequestsCount_0 = l_NetworkingFriends_0.GetFriendRequestsCount;
            return l_Promise_0.all({
                v13(l_GetUnreadConversationCount_0.API()), 
                v13(function(v15) --[[ Line: 26 ]]
                    -- upvalues: l_SocialLibraries_0 (ref), v13 (ref), l_GetPresencesFromUserIds_0 (ref), l_Promise_0 (ref)
                    local v16 = l_SocialLibraries_0.Dictionary.getDeepValue(v15:getState(), "SocialTab.Friends.byUserId.localUserId");
                    if v16 then
                        return v13(l_GetPresencesFromUserIds_0.API(v16));
                    else
                        return l_Promise_0.resolve();
                    end;
                end), 
                v13(l_GetFriendRequestsCount_0.API()), 
                v13(function(v17) --[[ Line: 39 ]]
                    -- upvalues: v13 (ref), l_NetworkingUsers_0 (ref)
                    return v13(l_NetworkingUsers_0.GetUserV2FromUserId.API(v17:getState().LocalUserId));
                end)
            }):catch(function() --[[ Line: 42 ]]
                -- upvalues: v2 (ref)
                v2:info("Failed to refresh SocialTab data");
            end);
        end, 
        fetchFriendsRequestsCount = function() --[[ Line: 46 ]] --[[ Name: fetchFriendsRequestsCount ]]
            -- upvalues: v13 (copy), l_NetworkingFriends_0 (ref)
            return v13(l_NetworkingFriends_0.GetFriendRequestsCount.API());
        end, 
        enteredChatFromEntryPoint = function(v18) --[[ Line: 49 ]] --[[ Name: enteredChatFromEntryPoint ]]
            -- upvalues: v13 (copy), l_EnteredChatFromEntryPoint_0 (ref)
            return v13(l_EnteredChatFromEntryPoint_0(v18));
        end, 
        navigateToFriendsPage = function() --[[ Line: 52 ]] --[[ Name: navigateToFriendsPage ]]
            -- upvalues: v13 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v13(l_NavigateDown_0({
                name = l_AppPage_0.ViewFriends
            }));
        end, 
        navigateToAddFriendsPage = function() --[[ Line: 57 ]] --[[ Name: navigateToAddFriendsPage ]]
            -- upvalues: v13 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v13(l_NavigateDown_0({
                name = l_AppPage_0.AddFriendsPage
            }));
        end, 
        navigateToUserSearch = function() --[[ Line: 62 ]] --[[ Name: navigateToUserSearch ]]
            -- upvalues: v13 (copy), l_NavigateDown_0 (ref), l_AppPage_0 (ref)
            v13(l_NavigateDown_0({
                name = l_AppPage_0.UserSearch, 
                shouldShowUserSearchLandingPage = true
            }));
        end
    };
end;