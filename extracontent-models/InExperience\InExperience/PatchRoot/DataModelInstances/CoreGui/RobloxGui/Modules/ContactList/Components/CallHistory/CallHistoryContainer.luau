local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_CorePackages_0.Packages.ApolloClient);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Roact);
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v9 = require(l_CorePackages_0.Workspace.Packages.UserProfiles);
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_useApolloClient_0 = v3.useApolloClient;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local v13 = require(l_ContactList_0.Actions.SetCurrentPage);
local v14 = require(l_ContactList_0.Enums.Pages);
local v15 = require(l_ContactList_0.dependencies);
local l_NetworkingCall_0 = v15.NetworkingCall;
local l_dependencyArray_0 = v15.Hooks.dependencyArray;
local l_useDispatch_0 = v15.Hooks.useDispatch;
local l_UIBlox_0 = v15.UIBlox;
local l_useLocalization_0 = v15.Hooks.useLocalization;
local l_useSelector_0 = v15.Hooks.useSelector;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_LoadingSpinner_0 = l_UIBlox_0.App.Loading.LoadingSpinner;
local v24 = require(l_ContactList_0.Analytics.useAnalytics);
local v25 = require(l_ContactList_0.Analytics.EventNamesEnum);
local v26 = require(l_ContactList_0.Components.CallHistory.CallHistoryItem);
local v27 = require(l_ContactList_0.Components.ContactListCommon.NoItemView);
local v28 = require(l_ContactList_0.Components.ContactListCommon.Constants);
local v29 = require(l_CorePackages_0.Workspace.Packages.BlockingUtility);
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v31 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function(v32) --[[ Line: 51 ]] --[[ Name: CallHistoryContainer ]]
    -- upvalues: l_useApolloClient_0 (copy), v24 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_RetrievalStatus_0 (copy), l_useSelector_0 (copy), l_NetworkingCall_0 (copy), v9 (copy), v4 (copy), v25 (copy), v14 (copy), v13 (copy), v27 (copy), l_dependencyArray_0 (copy), v28 (copy), v31 (copy), v29 (copy), v26 (copy), l_LoadingSpinner_0 (copy), v6 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v33 = l_useApolloClient_0();
    local v34 = v24();
    local v35 = l_useDispatch_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v37 = l_useLocalization_0({
        genericErrorLabel = "Feature.Call.Error.Description.Generic", 
        noCallsLabel = "Feature.Call.Prompt.FirstCall"
    });
    local v38 = v5.useRef(true);
    local v39 = v5.useRef(nil);
    local v40 = v5.useRef(0);
    local v41, v42 = v5.useState(l_RetrievalStatus_0.Fetching);
    local v43, v44 = v5.useState(false);
    local v45, v46 = v5.useState({});
    local v47, v48 = v5.useState("");
    local v50 = l_useSelector_0(function(v49) --[[ Line: 73 ]]
        return v49.LastRemovedFriend.lastRemovedFriendId;
    end);
    local v52 = v5.useCallback(function(v51) --[[ Line: 77 ]]
        return v51.Navigation.currentPage;
    end, {});
    local v53 = l_useSelector_0(v52);
    local v68 = v5.useCallback(function(v54, v55) --[[ Line: 82 ]]
        -- upvalues: v38 (copy), v42 (copy), l_RetrievalStatus_0 (ref), v35 (copy), l_NetworkingCall_0 (ref), v33 (copy), v9 (ref), v4 (ref), v46 (copy), v48 (copy)
        v38.current = true;
        v42(l_RetrievalStatus_0.Fetching);
        local v56 = v55 == "" and 16 or 8;
        v35(l_NetworkingCall_0.GetCallHistory.API({
            cursor = v55, 
            limit = v56, 
            universeId = game.GameId
        })):andThen(function(v57) --[[ Line: 87 ]]
            -- upvalues: v54 (copy), v33 (ref), v9 (ref), v4 (ref), v46 (ref), v48 (ref), v42 (ref), l_RetrievalStatus_0 (ref)
            local v58 = {};
            for _, v60 in ipairs(v54) do
                table.insert(v58, v60);
            end;
            for _, v62 in ipairs(v57.responseBody.callRecords) do
                table.insert(v58, v62);
            end;
            local v63 = {};
            for _, v65 in ipairs(v58) do
                for _, v67 in ipairs(v65.participants) do
                    v63[tostring(v67.userId)] = true;
                end;
            end;
            v33:query({
                query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
                variables = {
                    userIds = v4.Dictionary.keys(v63)
                }
            }):andThen(function() --[[ Line: 108 ]]
                -- upvalues: v46 (ref), v58 (copy), v48 (ref), v57 (copy), v42 (ref), l_RetrievalStatus_0 (ref)
                v46(v58);
                v48(v57.responseBody.nextPageCursor);
                v42(l_RetrievalStatus_0.Done);
            end):catch(function() --[[ Line: 114 ]]
                -- upvalues: v42 (ref), l_RetrievalStatus_0 (ref)
                v42(l_RetrievalStatus_0.Failed);
            end);
        end, function() --[[ Line: 118 ]]
            -- upvalues: v42 (ref), l_RetrievalStatus_0 (ref)
            v42(l_RetrievalStatus_0.Failed);
        end);
    end, {
        v50
    });
    v5.useEffect(function() --[[ Line: 124 ]]
        -- upvalues: v68 (copy), v46 (copy), v48 (copy)
        v68({}, "");
        return function() --[[ Line: 127 ]]
            -- upvalues: v46 (ref), v48 (ref)
            v46({});
            v48("");
        end;
    end, {
        v68
    });
    local v69 = v5.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: v34 (copy), v25 (ref), v53 (copy), v14 (ref), v35 (copy), v13 (ref)
        v34.fireEvent(v25.PhoneBookNavigate, {
            eventTimestampMs = os.time() * 1000, 
            startingPage = v53, 
            destinationPage = v14.FriendList
        });
        v35(v13(v14.FriendList));
    end, {
        v53
    });
    v5.useEffect(function() --[[ Line: 142 ]]
        -- upvalues: v41 (copy), l_RetrievalStatus_0 (ref), v38 (copy)
        if v41 ~= l_RetrievalStatus_0.Fetching then
            v38.current = false;
        end;
    end, {
        v41
    });
    local v71 = v5.useMemo(function() --[[ Line: 149 ]]
        -- upvalues: v41 (copy), l_RetrievalStatus_0 (ref), v37 (copy), v5 (ref), v27 (ref), v68 (copy), v45 (copy), v47 (copy), v69 (copy)
        local v70 = nil;
        v70 = if v41 == l_RetrievalStatus_0.Failed then v37.genericErrorLabel else v37.noCallsLabel;
        return v5.createElement(v27, {
            isImageEnabled = v41 ~= l_RetrievalStatus_0.Failed, 
            imageName = "icons/graphic/findfriends_xlarge", 
            isFailedButtonEnabled = v41 == l_RetrievalStatus_0.Failed, 
            onFailedButtonActivated = function() --[[ Line: 161 ]] --[[ Name: onFailedButtonActivated ]]
                -- upvalues: v68 (ref), v45 (ref), v47 (ref)
                v68(v45, v47);
            end, 
            isCallButtonEnabled = v41 == l_RetrievalStatus_0.Done, 
            onCallButtonActivated = v69, 
            messageText = v70
        });
    end, l_dependencyArray_0(v45, v68, v37.genericErrorLabel, v37.noCallsLabel, v69, v47, v41));
    local v73 = v5.useCallback(function(v72) --[[ Line: 180 ]]
        -- upvalues: v40 (copy)
        v40.current = v72.Position.Y;
    end, {});
    local v75 = v5.useCallback(function(v74) --[[ Line: 184 ]]
        -- upvalues: v40 (copy), v28 (ref), v39 (copy), v44 (copy)
        if v74.Position.Y - v40.current > v28.TOUCH_SLOP and v39.current and v39.current.CanvasPosition.Y == 0 then
            v44(true);
        end;
    end, {});
    local v76 = v5.useCallback(function() --[[ Line: 199 ]]
        -- upvalues: v44 (copy)
        v44(false);
    end, {});
    local v85 = v5.useMemo(function() --[[ Line: 203 ]]
        -- upvalues: v5 (ref), v45 (copy), v31 (ref), v29 (ref), v26 (ref), v32 (copy), v47 (copy), v41 (copy), l_RetrievalStatus_0 (ref), v71 (copy), v28 (ref), l_LoadingSpinner_0 (ref)
        local v77 = {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v78 = {};
        for _, v80 in ipairs(v45) do
            local l_userId_0 = v80.participants[1].userId;
            if l_userId_0 == v31 then
                l_userId_0 = v80.participants[2].userId;
            end;
            if not v29:IsPlayerBlockedByUserId(l_userId_0) then
                table.insert(v78, v80);
            end;
        end;
        for v82, v83 in ipairs(v78) do
            v77[v82] = v5.createElement(v26, {
                callRecord = v83, 
                localUserId = v31, 
                showDivider = v82 ~= #v78, 
                dismissCallback = v32.dismissCallback, 
                layoutOrder = v82
            });
        end;
        if v47 ~= "" then
            local v84 = #v77 + 1;
            if v41 == l_RetrievalStatus_0.Failed then
                v77[v84] = v71;
                return v77;
            else
                v77[v84] = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v28.ITEM_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v84
                }, {
                    LoadingSpinner = v5.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(48, 48), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
        return v77;
    end, l_dependencyArray_0(v45, v47, v71, v41));
    local v87 = v5.useCallback(function(v86) --[[ Line: 256 ]]
        -- upvalues: v38 (copy), v41 (copy), l_RetrievalStatus_0 (ref), v47 (copy), v68 (copy), v45 (copy)
        if not v38.current and v41 ~= l_RetrievalStatus_0.Failed and v47 ~= "" and v86.CanvasPosition.Y >= v86.AbsoluteCanvasSize.Y - v86.AbsoluteSize.Y - 50 then
            v68(v45, v47);
        end;
    end, l_dependencyArray_0(v45, v68, v47, v41));
    v5.useEffect(function() --[[ Line: 267 ]]
        -- upvalues: v85 (copy), v28 (ref), v39 (copy), v87 (copy)
        local v88 = (#v85 - 1) * v28.ITEM_HEIGHT;
        if v39.current and v88 <= v39.current.AbsoluteSize.Y then
            v87(v39.current);
        end;
    end, l_dependencyArray_0(v85, v87));
    if #v45 == 0 and v41 == l_RetrievalStatus_0.Fetching then
        return (v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v28.ITEM_HEIGHT), 
            BackgroundTransparency = 1
        }, {
            LoadingSpinner = v5.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(48, 48), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            })
        }));
    elseif #v45 == 0 then
        return v71;
    else
        return (v6.createFragment({
            v5.createElement("ScrollingFrame", {
                Size = UDim2.fromScale(1, 1), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(), 
                ElasticBehavior = Enum.ElasticBehavior.Never, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollingEnabled = not v43 and v32.scrollingEnabled, 
                ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
                ScrollBarThickness = 4, 
                ref = v39, 
                [v5.Change.CanvasPosition] = v87
            }, v85); 
            TouchStartedUserInputConnection = v32.isSmallScreen and v32.scrollingEnabled and v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.TouchStarted, 
                callback = v73
            }), 
            TouchMovedUserInputConnection = v32.isSmallScreen and v32.scrollingEnabled and v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.TouchMoved, 
                callback = v75
            }), 
            TouchEndedUserInputConnection = v32.isSmallScreen and v32.scrollingEnabled and v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.TouchEnded, 
                callback = v76
            })
        }));
    end;
end;