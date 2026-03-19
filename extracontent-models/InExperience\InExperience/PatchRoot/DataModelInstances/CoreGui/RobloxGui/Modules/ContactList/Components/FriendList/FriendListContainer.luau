local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.ApolloClient);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.Promise);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v11 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_GetFFlagSuggestedCalleeBugFixEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagSuggestedCalleeBugFixEnabled;
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_useApolloClient_0 = v4.useApolloClient;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v16 = require(l_ContactList_0.dependencies);
local l_UIBlox_0 = v16.UIBlox;
local l_dependencyArray_0 = v16.Hooks.dependencyArray;
local l_useSelector_0 = v16.Hooks.useSelector;
local l_useDispatch_0 = v16.Hooks.useDispatch;
local l_useLocalization_0 = v16.Hooks.useLocalization;
local l_FindFriendsFromUserId_0 = v16.NetworkingFriends.FindFriendsFromUserId;
local l_SearchFriendsByQuery_0 = v16.NetworkingFriends.SearchFriendsByQuery;
local l_GetSuggestedCallees_0 = v16.NetworkingCall.GetSuggestedCallees;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_LoadingSpinner_0 = l_UIBlox_0.App.Loading.LoadingSpinner;
local v27 = require(l_ContactList_0.Analytics.useAnalytics);
local v28 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v29 = require(l_ContactList_0.Components.FriendList.FriendListItem);
local v30 = require(l_ContactList_0.Components.FriendList.SectionHeader);
local v31 = require(l_ContactList_0.Components.ContactListCommon.NoItemView);
local v32 = require(l_ContactList_0.Components.ContactListCommon.Constants);
local v33 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v35 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function(v36) --[[ Line: 60 ]] --[[ Name: FriendListContainer ]]
    -- upvalues: l_useApolloClient_0 (copy), v27 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_RetrievalStatus_0 (copy), l_GetFFlagSuggestedCalleeBugFixEnabled_0 (copy), l_GetSuggestedCallees_0 (copy), l_useSelector_0 (copy), v35 (copy), l_HttpService_0 (copy), v28 (copy), l_FindFriendsFromUserId_0 (copy), l_SearchFriendsByQuery_0 (copy), v8 (copy), v5 (copy), v11 (copy), l_dependencyArray_0 (copy), v31 (copy), v32 (copy), v30 (copy), v33 (copy), v29 (copy), l_LoadingSpinner_0 (copy), v7 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v37 = l_useApolloClient_0();
    local v38 = v27();
    local v39 = l_useDispatch_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v41 = l_useLocalization_0({
        genericErrorLabel = "Feature.Call.Error.Description.Generic", 
        noFriendsLabel = "Feature.Call.Description.NoFriendsFound", 
        addFriendsLabel = "Feature.Call.Prompt.AddFriends", 
        suggestedFriendsTitle = "Feature.Call.Label.Suggested", 
        suggestedFriendsDescription = "Feature.Call.Description.SuggestedFriends", 
        friendsTitle = "Feature.Call.Label.Friends", 
        friendsDescription = "Feature.Call.Description.Friends"
    });
    local v42 = v6.useRef(true);
    local v43 = v6.useRef(nil);
    local v44 = v6.useRef(0);
    local v45, v46 = v6.useState(l_RetrievalStatus_0.Fetching);
    local v47, v48 = v6.useState(false);
    local v49, v50 = v6.useState({});
    local v51, v52 = v6.useState(nil);
    local v53 = v6.useRef("");
    local v54 = nil;
    v54 = if l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v6.useMemo(function() --[[ Line: 91 ]]
        -- upvalues: v39 (copy), l_GetSuggestedCallees_0 (ref)
        return v39(l_GetSuggestedCallees_0.API()):catch(function() --[[ Line: 92 ]]

        end);
    end, {}) else v6.useRef(v39(l_GetSuggestedCallees_0.API()):catch(function() --[[ Line: 95 ]]

    end));
    local v55 = v6.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: v36 (copy)
        return string.gsub(v36.searchText, "%s+", "");
    end, {
        v36.searchText
    });
    local v57 = l_useSelector_0(function(v56) --[[ Line: 102 ]]
        return v56.LastRemovedFriend.lastRemovedFriendId;
    end);
    local v77 = v6.useCallback(function(v58, v59) --[[ Line: 109 ]]
        -- upvalues: v35 (ref), v42 (copy), v46 (copy), l_RetrievalStatus_0 (ref), v53 (copy), l_HttpService_0 (ref), v38 (copy), v28 (ref), v55 (copy), v39 (copy), l_FindFriendsFromUserId_0 (ref), l_SearchFriendsByQuery_0 (ref), v8 (ref), l_GetFFlagSuggestedCalleeBugFixEnabled_0 (ref), v54 (ref), v5 (ref), v37 (copy), v11 (ref), v50 (copy), v52 (copy)
        if v35 then
            v42.current = true;
            v46(l_RetrievalStatus_0.Fetching);
            local v60 = v53.current == "" and 0 or 0.5;
            local v61 = l_HttpService_0:GenerateGUID(false);
            v53.current = v61;
            local function v76() --[[ Line: 118 ]]
                -- upvalues: v53 (ref), v61 (copy), v38 (ref), v28 (ref), v55 (ref), v39 (ref), l_FindFriendsFromUserId_0 (ref), v35 (ref), v59 (copy), l_SearchFriendsByQuery_0 (ref), v8 (ref), l_GetFFlagSuggestedCalleeBugFixEnabled_0 (ref), v54 (ref), v58 (copy), v5 (ref), v37 (ref), v11 (ref), v50 (ref), v52 (ref), v46 (ref), l_RetrievalStatus_0 (ref)
                if v53.current ~= v61 then
                    return;
                else
                    v38.fireEvent(v28.PhoneBookSearchAttempted, {
                        eventTimestampMs = os.time() * 1000, 
                        searchQueryString = v55
                    });
                    local v62 = v39(if v55 == "" then l_FindFriendsFromUserId_0.API(v35, {
                        userSort = "CombinedName", 
                        cursor = v59, 
                        limit = 20
                    }) else l_SearchFriendsByQuery_0.API(v35, {
                        userSort = "CombinedName", 
                        cursor = v59, 
                        limit = 20, 
                        query = v55
                    }));
                    v8.all({
                        v62, 
                        if l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v54 else v54.current
                    }):andThen(function(v63) --[[ Line: 146 ]]
                        -- upvalues: v53 (ref), v61 (ref), v38 (ref), v28 (ref), v55 (ref), v58 (ref), v5 (ref), v37 (ref), v11 (ref), v50 (ref), v52 (ref), v46 (ref), l_RetrievalStatus_0 (ref)
                        if v53.current ~= v61 then
                            return;
                        else
                            local v64 = v63[1];
                            local v65 = v63[2];
                            v38.fireEvent(v28.PhoneBookSearchFinished, {
                                eventTimestampMs = os.time() * 1000, 
                                searchQueryString = v55, 
                                searchResultCount = #v64.responseBody.PageItems
                            });
                            local v66 = {};
                            for _, v68 in ipairs(v58) do
                                table.insert(v66, v68);
                            end;
                            for _, v70 in ipairs(v64.responseBody.PageItems) do
                                table.insert(v66, v70);
                            end;
                            local v72 = v5.List.map(v66, function(v71) --[[ Line: 168 ]]
                                return (tostring(v71.id));
                            end);
                            if v55 == "" and v65 ~= nil then
                                for _, v74 in ipairs(v65.responseBody.suggestedCallees) do
                                    table.insert(v72, (tostring(v74.userId)));
                                end;
                            end;
                            v37:query({
                                query = v11.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
                                variables = {
                                    userIds = v72
                                }
                            }):andThen(function() --[[ Line: 187 ]]
                                -- upvalues: v53 (ref), v61 (ref), v50 (ref), v66 (copy), v52 (ref), v64 (copy), v46 (ref), l_RetrievalStatus_0 (ref)
                                if v53.current ~= v61 then
                                    return;
                                else
                                    v50(v66);
                                    v52(v64.responseBody.NextCursor);
                                    v46(l_RetrievalStatus_0.Done);
                                    return;
                                end;
                            end):catch(function(_) --[[ Line: 196 ]]
                                -- upvalues: v53 (ref), v61 (ref), v46 (ref), l_RetrievalStatus_0 (ref)
                                if v53.current ~= v61 then
                                    return;
                                else
                                    v46(l_RetrievalStatus_0.Failed);
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end, function() --[[ Line: 202 ]]
                        -- upvalues: v53 (ref), v61 (ref), v46 (ref), l_RetrievalStatus_0 (ref)
                        if v53.current ~= v61 then
                            return;
                        else
                            v46(l_RetrievalStatus_0.Failed);
                            return;
                        end;
                    end);
                    return;
                end;
            end;
            if v60 == 0 then
                v76();
                return;
            else
                delay(v60, v76);
            end;
        end;
    end, l_dependencyArray_0(v55, v57, if l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v54 else nil));
    v6.useEffect(function() --[[ Line: 224 ]]
        -- upvalues: v77 (copy), v50 (copy), v52 (copy)
        v77({}, "");
        return function() --[[ Line: 227 ]]
            -- upvalues: v50 (ref), v52 (ref)
            v50({});
            v52(nil);
        end;
    end, l_dependencyArray_0(v77));
    v6.useEffect(function() --[[ Line: 234 ]]
        -- upvalues: v45 (copy), l_RetrievalStatus_0 (ref), v42 (copy)
        if v45 ~= l_RetrievalStatus_0.Fetching then
            v42.current = false;
        end;
    end, {
        v45
    });
    local v79 = v6.useCallback(function(v78) --[[ Line: 240 ]]
        return v78.Call.suggestedCallees.suggestedCallees;
    end, {});
    local v84 = l_useSelector_0(v79, function(v80, v81) --[[ Line: 246 ]]
        if #v80 ~= #v81 then
            return false;
        else
            for v82, v83 in ipairs(v80) do
                if v83.userId ~= v81[v82].userId then
                    return false;
                end;
            end;
            return true;
        end;
    end) or {};
    local v86 = v6.useMemo(function() --[[ Line: 263 ]]
        -- upvalues: v45 (copy), l_RetrievalStatus_0 (ref), v41 (copy), v36 (copy), v6 (ref), v31 (ref), v77 (copy), v49 (copy), v51 (copy)
        local v85 = nil;
        v85 = if v45 == l_RetrievalStatus_0.Failed then v41.genericErrorLabel else if v36.searchText ~= "" then v41.noFriendsLabel else v41.addFriendsLabel;
        return v6.createElement(v31, {
            isImageEnabled = v45 ~= l_RetrievalStatus_0.Failed, 
            imageName = v36.searchText == "" and "icons/graphic/findfriends_xlarge" or "icons/status/oof_xlarge", 
            isFailedButtonEnabled = v45 == l_RetrievalStatus_0.Failed, 
            onFailedButtonActivated = function() --[[ Line: 279 ]] --[[ Name: onFailedButtonActivated ]]
                -- upvalues: v77 (ref), v49 (ref), v51 (ref)
                v77(v49, v51);
            end, 
            isCallButtonEnabled = false, 
            onCallButtonActivated = function() --[[ Line: 283 ]] --[[ Name: onCallButtonActivated ]]

            end, 
            messageText = v85
        });
    end, l_dependencyArray_0(v36.searchText, v49, v77, v41.addFriendsLabel, v41.genericErrorLabel, v41.noFriendsLabel, v51, v45));
    local v88 = v6.useCallback(function(v87) --[[ Line: 299 ]]
        -- upvalues: v44 (copy)
        v44.current = v87.Position.Y;
    end, {});
    local v90 = v6.useCallback(function(v89) --[[ Line: 303 ]]
        -- upvalues: v44 (copy), v32 (ref), v43 (copy), v48 (copy)
        if v89.Position.Y - v44.current > v32.TOUCH_SLOP and v43.current and v43.current.CanvasPosition.Y == 0 then
            v48(true);
        end;
    end, {});
    local v93 = v6.useMemo(function() --[[ Line: 317 ]]
        -- upvalues: v5 (ref), v49 (copy), v84 (copy)
        local v91 = v5.List.join(v49, v84);
        return v5.List.map(v91, function(v92) --[[ Line: 319 ]]
            return (tostring(v92.id or v92.userId));
        end);
    end);
    local v94 = v11.Hooks.useUserProfilesFetch({
        userIds = v93, 
        query = v11.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v95 = v6.useCallback(function() --[[ Line: 329 ]]
        -- upvalues: v48 (copy)
        v48(false);
    end, {});
    local v112 = v6.useMemo(function() --[[ Line: 334 ]]
        -- upvalues: v6 (ref), v84 (copy), v55 (copy), v30 (ref), v41 (copy), v33 (ref), v94 (copy), v11 (ref), v29 (ref), v36 (copy), v49 (copy), v51 (copy), v45 (copy), l_RetrievalStatus_0 (ref), v86 (copy), v32 (ref), l_LoadingSpinner_0 (ref)
        local v96 = {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        if #v84 ~= 0 and v55 == "" then
            v96[#v96 + 1] = v6.createElement(v30, {
                name = v41.suggestedFriendsTitle, 
                description = v41.suggestedFriendsDescription, 
                layoutOrder = #v96 + 1
            });
            local v97 = {};
            for _, v99 in ipairs(v84) do
                if not v33:IsPlayerBlockedByUserId(v99.userId) then
                    table.insert(v97, v99);
                end;
            end;
            for v100, v101 in ipairs(v97) do
                local v102 = "";
                local v103 = "";
                if v94.data then
                    v102 = v11.Selectors.getCombinedNameFromId(v94.data, v101.userId);
                    v103 = v11.Selectors.getUsernameFromId(v94.data, v101.userId);
                end;
                v96[#v96 + 1] = v6.createElement(v29, {
                    userId = v101.userId, 
                    combinedName = v102, 
                    userName = v103, 
                    userPresenceType = v101.userPresenceType, 
                    lastLocation = v101.lastLocation, 
                    dismissCallback = v36.dismissCallback, 
                    layoutOrder = #v96 + 1, 
                    showDivider = v100 ~= #v97, 
                    itemListIndex = v100, 
                    isSuggestedUser = true
                });
            end;
        end;
        if #v49 ~= 0 then
            v96[#v96 + 1] = v6.createElement(v30, {
                name = v41.friendsTitle, 
                description = v41.friendsDescription, 
                layoutOrder = #v96 + 1
            });
        end;
        local v104 = {};
        for _, v106 in ipairs(v49) do
            if not v33:IsPlayerBlockedByUserId(v106.id) then
                table.insert(v104, v106);
            end;
        end;
        for v107, v108 in ipairs(v104) do
            local v109 = "";
            local v110 = "";
            if v94.data then
                v109 = v11.Selectors.getCombinedNameFromId(v94.data, v108.id);
                v110 = v11.Selectors.getUsernameFromId(v94.data, v108.id);
            end;
            v96[#v96 + 1] = v6.createElement(v29, {
                userId = v108.id, 
                combinedName = v109, 
                userName = v110, 
                dismissCallback = v36.dismissCallback, 
                layoutOrder = #v96 + 1, 
                showDivider = v107 ~= #v104, 
                searchQueryString = v55, 
                itemListIndex = v107, 
                isSuggestedUser = false
            });
        end;
        if v51 ~= nil then
            local v111 = #v96 + 1;
            if v45 == l_RetrievalStatus_0.Failed then
                v96[v111] = v86;
                return v96;
            else
                v96[v111] = v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v32.ITEM_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v111
                }, {
                    LoadingSpinner = v6.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(48, 48), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
        return v96;
    end, l_dependencyArray_0(v49, v51, v86, v45, v94.data, v84, v55, v41.friendsDescription, v41.friendsTitle, v41.suggestedFriendsDescription, v41.suggestedFriendsTitle));
    local v114 = v6.useCallback(function(v113) --[[ Line: 457 ]]
        -- upvalues: v42 (copy), v45 (copy), l_RetrievalStatus_0 (ref), v51 (copy), v77 (copy), v49 (copy)
        if not v42.current and v45 ~= l_RetrievalStatus_0.Failed and v51 ~= nil and v113.CanvasPosition.Y >= v113.AbsoluteCanvasSize.Y - v113.AbsoluteSize.Y - 50 then
            v77(v49, v51);
        end;
    end, l_dependencyArray_0(v49, v77, v51, v45));
    v6.useEffect(function() --[[ Line: 468 ]]
        -- upvalues: v112 (copy), v32 (ref), v43 (copy), v114 (copy)
        local v115 = (#v112 - 1) * v32.ITEM_HEIGHT;
        if v43.current and v115 <= v43.current.AbsoluteSize.Y then
            v114(v43.current);
        end;
    end, l_dependencyArray_0(v112, v114));
    return if #v49 == 0 and v45 == l_RetrievalStatus_0.Fetching then v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v32.ITEM_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        LoadingSpinner = v6.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(48, 48), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        })
    }) else if #v49 == 0 then v86 else v7.createFragment({
        FriendsScrollingFrame = v6.createElement("ScrollingFrame", {
            Size = UDim2.fromScale(1, 1), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = not v47 and v36.scrollingEnabled, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            ref = v43, 
            [v6.Change.CanvasPosition] = v114
        }, v112), 
        TouchStartedUserInputConnection = v36.isSmallScreen and v36.scrollingEnabled and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchStarted, 
            callback = v88
        }), 
        TouchMovedUserInputConnection = v36.isSmallScreen and v36.scrollingEnabled and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchMoved, 
            callback = v90
        }), 
        TouchEndedUserInputConnection = v36.isSmallScreen and v36.scrollingEnabled and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchEnded, 
            callback = v95
        })
    });
end;