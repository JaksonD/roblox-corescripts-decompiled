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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v36 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function(v37) --[[ Line: 63 ]] --[[ Name: FriendListContainer ]]
    -- upvalues: l_useApolloClient_0 (copy), v27 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v6 (copy), l_RetrievalStatus_0 (copy), l_GetFFlagSuggestedCalleeBugFixEnabled_0 (copy), l_GetSuggestedCallees_0 (copy), l_useSelector_0 (copy), v36 (copy), l_HttpService_0 (copy), v28 (copy), l_FindFriendsFromUserId_0 (copy), l_SearchFriendsByQuery_0 (copy), v8 (copy), v5 (copy), v11 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v31 (copy), v32 (copy), v30 (copy), v33 (copy), v29 (copy), l_LoadingSpinner_0 (copy), v7 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v38 = l_useApolloClient_0();
    local v39 = v27();
    local v40 = l_useDispatch_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v42 = l_useLocalization_0({
        genericErrorLabel = "Feature.Call.Error.Description.Generic", 
        noFriendsLabel = "Feature.Call.Description.NoFriendsFound", 
        addFriendsLabel = "Feature.Call.Prompt.AddFriends", 
        suggestedFriendsTitle = "Feature.Call.Label.Suggested", 
        suggestedFriendsDescription = "Feature.Call.Description.SuggestedFriends", 
        friendsTitle = "Feature.Call.Label.Friends", 
        friendsDescription = "Feature.Call.Description.Friends"
    });
    local v43 = v6.useRef(true);
    local v44 = v6.useRef(nil);
    local v45 = v6.useRef(0);
    local v46, v47 = v6.useState(l_RetrievalStatus_0.Fetching);
    local v48, v49 = v6.useState(false);
    local v50, v51 = v6.useState({});
    local v52, v53 = v6.useState(nil);
    local v54 = v6.useRef("");
    local v55 = nil;
    v55 = if l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v6.useMemo(function() --[[ Line: 94 ]]
        -- upvalues: v40 (copy), l_GetSuggestedCallees_0 (ref)
        return v40(l_GetSuggestedCallees_0.API()):catch(function() --[[ Line: 95 ]]

        end);
    end, {}) else v6.useRef(v40(l_GetSuggestedCallees_0.API()):catch(function() --[[ Line: 98 ]]

    end));
    local v56 = v6.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: v37 (copy)
        return string.gsub(v37.searchText, "%s+", "");
    end, {
        v37.searchText
    });
    local v58 = l_useSelector_0(function(v57) --[[ Line: 105 ]]
        return v57.LastRemovedFriend.lastRemovedFriendId;
    end);
    local v78 = v6.useCallback(function(v59, v60) --[[ Line: 112 ]]
        -- upvalues: v36 (ref), v43 (copy), v47 (copy), l_RetrievalStatus_0 (ref), v54 (copy), l_HttpService_0 (ref), v39 (copy), v28 (ref), v56 (copy), v40 (copy), l_FindFriendsFromUserId_0 (ref), l_SearchFriendsByQuery_0 (ref), v8 (ref), l_GetFFlagSuggestedCalleeBugFixEnabled_0 (ref), v55 (ref), v5 (ref), v38 (copy), v11 (ref), v51 (copy), v53 (copy)
        if v36 then
            v43.current = true;
            v47(l_RetrievalStatus_0.Fetching);
            local v61 = v54.current == "" and 0 or 0.5;
            local v62 = l_HttpService_0:GenerateGUID(false);
            v54.current = v62;
            local function v77() --[[ Line: 121 ]]
                -- upvalues: v54 (ref), v62 (copy), v39 (ref), v28 (ref), v56 (ref), v40 (ref), l_FindFriendsFromUserId_0 (ref), v36 (ref), v60 (copy), l_SearchFriendsByQuery_0 (ref), v8 (ref), l_GetFFlagSuggestedCalleeBugFixEnabled_0 (ref), v55 (ref), v59 (copy), v5 (ref), v38 (ref), v11 (ref), v51 (ref), v53 (ref), v47 (ref), l_RetrievalStatus_0 (ref)
                if v54.current ~= v62 then
                    return;
                else
                    v39.fireEvent(v28.PhoneBookSearchAttempted, {
                        eventTimestampMs = os.time() * 1000, 
                        searchQueryString = v56
                    });
                    local v63 = v40(if v56 == "" then l_FindFriendsFromUserId_0.API(v36, {
                        userSort = "CombinedName", 
                        cursor = v60, 
                        limit = 20
                    }) else l_SearchFriendsByQuery_0.API(v36, {
                        userSort = "CombinedName", 
                        cursor = v60, 
                        limit = 20, 
                        query = v56
                    }));
                    v8.all({
                        v63, 
                        if l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v55 else v55.current
                    }):andThen(function(v64) --[[ Line: 149 ]]
                        -- upvalues: v54 (ref), v62 (ref), v39 (ref), v28 (ref), v56 (ref), v59 (ref), v5 (ref), v38 (ref), v11 (ref), v51 (ref), v53 (ref), v47 (ref), l_RetrievalStatus_0 (ref)
                        if v54.current ~= v62 then
                            return;
                        else
                            local v65 = v64[1];
                            local v66 = v64[2];
                            v39.fireEvent(v28.PhoneBookSearchFinished, {
                                eventTimestampMs = os.time() * 1000, 
                                searchQueryString = v56, 
                                searchResultCount = #v65.responseBody.PageItems
                            });
                            local v67 = {};
                            for _, v69 in ipairs(v59) do
                                table.insert(v67, v69);
                            end;
                            for _, v71 in ipairs(v65.responseBody.PageItems) do
                                table.insert(v67, v71);
                            end;
                            local v73 = v5.List.map(v67, function(v72) --[[ Line: 171 ]]
                                return (tostring(v72.id));
                            end);
                            if v56 == "" and v66 ~= nil then
                                for _, v75 in ipairs(v66.responseBody.suggestedCallees) do
                                    table.insert(v73, (tostring(v75.userId)));
                                end;
                            end;
                            v38:query({
                                query = v11.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
                                variables = {
                                    userIds = v73
                                }
                            }):andThen(function() --[[ Line: 190 ]]
                                -- upvalues: v54 (ref), v62 (ref), v51 (ref), v67 (copy), v53 (ref), v65 (copy), v47 (ref), l_RetrievalStatus_0 (ref)
                                if v54.current ~= v62 then
                                    return;
                                else
                                    v51(v67);
                                    v53(v65.responseBody.NextCursor);
                                    v47(l_RetrievalStatus_0.Done);
                                    return;
                                end;
                            end):catch(function(_) --[[ Line: 199 ]]
                                -- upvalues: v54 (ref), v62 (ref), v47 (ref), l_RetrievalStatus_0 (ref)
                                if v54.current ~= v62 then
                                    return;
                                else
                                    v47(l_RetrievalStatus_0.Failed);
                                    return;
                                end;
                            end);
                            return;
                        end;
                    end, function() --[[ Line: 205 ]]
                        -- upvalues: v54 (ref), v62 (ref), v47 (ref), l_RetrievalStatus_0 (ref)
                        if v54.current ~= v62 then
                            return;
                        else
                            v47(l_RetrievalStatus_0.Failed);
                            return;
                        end;
                    end);
                    return;
                end;
            end;
            if v61 == 0 then
                v77();
                return;
            else
                delay(v61, v77);
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v56, 
        v58, 
        if l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v55 else nil
    } else l_dependencyArray_0(v56, v58, if l_GetFFlagSuggestedCalleeBugFixEnabled_0() then v55 else nil));
    v6.useEffect(function() --[[ Line: 233 ]]
        -- upvalues: v78 (copy), v51 (copy), v53 (copy)
        v78({}, "");
        return function() --[[ Line: 236 ]]
            -- upvalues: v51 (ref), v53 (ref)
            v51({});
            v53(nil);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v78
    } else l_dependencyArray_0(v78));
    v6.useEffect(function() --[[ Line: 243 ]]
        -- upvalues: v46 (copy), l_RetrievalStatus_0 (ref), v43 (copy)
        if v46 ~= l_RetrievalStatus_0.Fetching then
            v43.current = false;
        end;
    end, {
        v46
    });
    local v80 = v6.useCallback(function(v79) --[[ Line: 249 ]]
        return v79.Call.suggestedCallees.suggestedCallees;
    end, {});
    local v85 = l_useSelector_0(v80, function(v81, v82) --[[ Line: 255 ]]
        if #v81 ~= #v82 then
            return false;
        else
            for v83, v84 in ipairs(v81) do
                if v84.userId ~= v82[v83].userId then
                    return false;
                end;
            end;
            return true;
        end;
    end) or {};
    local v87 = v6.useMemo(function() --[[ Line: 272 ]]
        -- upvalues: v46 (copy), l_RetrievalStatus_0 (ref), v42 (copy), v37 (copy), v6 (ref), v31 (ref), v78 (copy), v50 (copy), v52 (copy)
        local v86 = nil;
        v86 = if v46 == l_RetrievalStatus_0.Failed then v42.genericErrorLabel else if v37.searchText ~= "" then v42.noFriendsLabel else v42.addFriendsLabel;
        return v6.createElement(v31, {
            isImageEnabled = v46 ~= l_RetrievalStatus_0.Failed, 
            imageName = v37.searchText == "" and "icons/graphic/findfriends_xlarge" or "icons/status/oof_xlarge", 
            isFailedButtonEnabled = v46 == l_RetrievalStatus_0.Failed, 
            onFailedButtonActivated = function() --[[ Line: 288 ]] --[[ Name: onFailedButtonActivated ]]
                -- upvalues: v78 (ref), v50 (ref), v52 (ref)
                v78(v50, v52);
            end, 
            isCallButtonEnabled = false, 
            onCallButtonActivated = function() --[[ Line: 292 ]] --[[ Name: onCallButtonActivated ]]

            end, 
            messageText = v86
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37.searchText, 
        v50, 
        v78, 
        v42.addFriendsLabel, 
        v42.genericErrorLabel, 
        v42.noFriendsLabel, 
        v52, 
        v46
    } else l_dependencyArray_0(v37.searchText, v50, v78, v42.addFriendsLabel, v42.genericErrorLabel, v42.noFriendsLabel, v52, v46));
    local v89 = v6.useCallback(function(v88) --[[ Line: 319 ]]
        -- upvalues: v45 (copy)
        v45.current = v88.Position.Y;
    end, {});
    local v91 = v6.useCallback(function(v90) --[[ Line: 323 ]]
        -- upvalues: v45 (copy), v32 (ref), v44 (copy), v49 (copy)
        if v90.Position.Y - v45.current > v32.TOUCH_SLOP and v44.current and v44.current.CanvasPosition.Y == 0 then
            v49(true);
        end;
    end, {});
    local v94 = v6.useMemo(function() --[[ Line: 337 ]]
        -- upvalues: v5 (ref), v50 (copy), v85 (copy)
        local v92 = v5.List.join(v50, v85);
        return v5.List.map(v92, function(v93) --[[ Line: 339 ]]
            return (tostring(v93.id or v93.userId));
        end);
    end);
    local v95 = v11.Hooks.useUserProfilesFetch({
        userIds = v94, 
        query = v11.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v96 = v6.useCallback(function() --[[ Line: 349 ]]
        -- upvalues: v49 (copy)
        v49(false);
    end, {});
    local v113 = v6.useMemo(function() --[[ Line: 354 ]]
        -- upvalues: v6 (ref), v85 (copy), v56 (copy), v30 (ref), v42 (copy), v33 (ref), v95 (copy), v11 (ref), v29 (ref), v37 (copy), v50 (copy), v52 (copy), v46 (copy), l_RetrievalStatus_0 (ref), v87 (copy), v32 (ref), l_LoadingSpinner_0 (ref)
        local v97 = {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        if #v85 ~= 0 and v56 == "" then
            v97[#v97 + 1] = v6.createElement(v30, {
                name = v42.suggestedFriendsTitle, 
                description = v42.suggestedFriendsDescription, 
                layoutOrder = #v97 + 1
            });
            local v98 = {};
            for _, v100 in ipairs(v85) do
                if not v33:IsPlayerBlockedByUserId(v100.userId) then
                    table.insert(v98, v100);
                end;
            end;
            for v101, v102 in ipairs(v98) do
                local v103 = "";
                local v104 = "";
                if v95.data then
                    v103 = v11.Selectors.getCombinedNameFromId(v95.data, v102.userId);
                    v104 = v11.Selectors.getUsernameFromId(v95.data, v102.userId);
                end;
                v97[#v97 + 1] = v6.createElement(v29, {
                    userId = v102.userId, 
                    combinedName = v103, 
                    userName = v104, 
                    userPresenceType = v102.userPresenceType, 
                    lastLocation = v102.lastLocation, 
                    dismissCallback = v37.dismissCallback, 
                    layoutOrder = #v97 + 1, 
                    showDivider = v101 ~= #v98, 
                    itemListIndex = v101, 
                    isSuggestedUser = true
                });
            end;
        end;
        if #v50 ~= 0 then
            v97[#v97 + 1] = v6.createElement(v30, {
                name = v42.friendsTitle, 
                description = v42.friendsDescription, 
                layoutOrder = #v97 + 1
            });
        end;
        local v105 = {};
        for _, v107 in ipairs(v50) do
            if not v33:IsPlayerBlockedByUserId(v107.id) then
                table.insert(v105, v107);
            end;
        end;
        for v108, v109 in ipairs(v105) do
            local v110 = "";
            local v111 = "";
            if v95.data then
                v110 = v11.Selectors.getCombinedNameFromId(v95.data, v109.id);
                v111 = v11.Selectors.getUsernameFromId(v95.data, v109.id);
            end;
            v97[#v97 + 1] = v6.createElement(v29, {
                userId = v109.id, 
                combinedName = v110, 
                userName = v111, 
                dismissCallback = v37.dismissCallback, 
                layoutOrder = #v97 + 1, 
                showDivider = v108 ~= #v105, 
                searchQueryString = v56, 
                itemListIndex = v108, 
                isSuggestedUser = false
            });
        end;
        if v52 ~= nil then
            local v112 = #v97 + 1;
            if v46 == l_RetrievalStatus_0.Failed then
                v97[v112] = v87;
                return v97;
            else
                v97[v112] = v6.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v32.ITEM_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v112
                }, {
                    LoadingSpinner = v6.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(48, 48), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
        return v97;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v50, 
        v52, 
        v87, 
        v46, 
        v95.data, 
        v85, 
        v56, 
        v42.friendsDescription, 
        v42.friendsTitle, 
        v42.suggestedFriendsDescription, 
        v42.suggestedFriendsTitle
    } else l_dependencyArray_0(v50, v52, v87, v46, v95.data, v85, v56, v42.friendsDescription, v42.friendsTitle, v42.suggestedFriendsDescription, v42.suggestedFriendsTitle));
    local v115 = v6.useCallback(function(v114) --[[ Line: 492 ]]
        -- upvalues: v43 (copy), v46 (copy), l_RetrievalStatus_0 (ref), v52 (copy), v78 (copy), v50 (copy)
        if not v43.current and v46 ~= l_RetrievalStatus_0.Failed and v52 ~= nil and v114.CanvasPosition.Y >= v114.AbsoluteCanvasSize.Y - v114.AbsoluteSize.Y - 50 then
            v78(v50, v52);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v50, 
        v78, 
        v52, 
        v46
    } else l_dependencyArray_0(v50, v78, v52, v46));
    v6.useEffect(function() --[[ Line: 508 ]]
        -- upvalues: v113 (copy), v32 (ref), v44 (copy), v115 (copy)
        local v116 = (#v113 - 1) * v32.ITEM_HEIGHT;
        if v44.current and v116 <= v44.current.AbsoluteSize.Y then
            v115(v44.current);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v113, 
        v115
    } else l_dependencyArray_0(v113, v115));
    return if #v50 == 0 and v46 == l_RetrievalStatus_0.Fetching then v6.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, v32.ITEM_HEIGHT), 
        BackgroundTransparency = 1
    }, {
        LoadingSpinner = v6.createElement(l_LoadingSpinner_0, {
            size = UDim2.fromOffset(48, 48), 
            position = UDim2.fromScale(0.5, 0.5), 
            anchorPoint = Vector2.new(0.5, 0.5)
        })
    }) else if #v50 == 0 then v87 else v7.createFragment({
        FriendsScrollingFrame = v6.createElement("ScrollingFrame", {
            Size = UDim2.fromScale(1, 1), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            CanvasSize = UDim2.new(), 
            ElasticBehavior = Enum.ElasticBehavior.Never, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            ScrollingEnabled = not v48 and v37.scrollingEnabled, 
            ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
            ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
            ScrollBarThickness = 4, 
            ref = v44, 
            [v6.Change.CanvasPosition] = v115
        }, v113), 
        TouchStartedUserInputConnection = v37.isSmallScreen and v37.scrollingEnabled and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchStarted, 
            callback = v89
        }), 
        TouchMovedUserInputConnection = v37.isSmallScreen and v37.scrollingEnabled and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchMoved, 
            callback = v91
        }), 
        TouchEndedUserInputConnection = v37.isSmallScreen and v37.scrollingEnabled and v6.createElement(l_ExternalEventConnection_0, {
            event = l_UserInputService_0.TouchEnded, 
            callback = v96
        })
    });
end;