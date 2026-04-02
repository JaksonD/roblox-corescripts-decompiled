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
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_LocalPlayer_0 = game:GetService("Players").LocalPlayer;
local v32 = l_LocalPlayer_0 and l_LocalPlayer_0.UserId or 0;
return function(v33) --[[ Line: 54 ]] --[[ Name: CallHistoryContainer ]]
    -- upvalues: l_useApolloClient_0 (copy), v24 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v5 (copy), l_RetrievalStatus_0 (copy), l_useSelector_0 (copy), l_NetworkingCall_0 (copy), v9 (copy), v4 (copy), v25 (copy), v14 (copy), v13 (copy), v27 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v28 (copy), v32 (copy), v29 (copy), v26 (copy), l_LoadingSpinner_0 (copy), v6 (copy), l_ExternalEventConnection_0 (copy), l_UserInputService_0 (copy)
    local v34 = l_useApolloClient_0();
    local v35 = v24();
    local v36 = l_useDispatch_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v38 = l_useLocalization_0({
        genericErrorLabel = "Feature.Call.Error.Description.Generic", 
        noCallsLabel = "Feature.Call.Prompt.FirstCall"
    });
    local v39 = v5.useRef(true);
    local v40 = v5.useRef(nil);
    local v41 = v5.useRef(0);
    local v42, v43 = v5.useState(l_RetrievalStatus_0.Fetching);
    local v44, v45 = v5.useState(false);
    local v46, v47 = v5.useState({});
    local v48, v49 = v5.useState("");
    local v51 = l_useSelector_0(function(v50) --[[ Line: 76 ]]
        return v50.LastRemovedFriend.lastRemovedFriendId;
    end);
    local v53 = v5.useCallback(function(v52) --[[ Line: 80 ]]
        return v52.Navigation.currentPage;
    end, {});
    local v54 = l_useSelector_0(v53);
    local v69 = v5.useCallback(function(v55, v56) --[[ Line: 85 ]]
        -- upvalues: v39 (copy), v43 (copy), l_RetrievalStatus_0 (ref), v36 (copy), l_NetworkingCall_0 (ref), v34 (copy), v9 (ref), v4 (ref), v47 (copy), v49 (copy)
        v39.current = true;
        v43(l_RetrievalStatus_0.Fetching);
        local v57 = v56 == "" and 16 or 8;
        v36(l_NetworkingCall_0.GetCallHistory.API({
            cursor = v56, 
            limit = v57, 
            universeId = game.GameId
        })):andThen(function(v58) --[[ Line: 90 ]]
            -- upvalues: v55 (copy), v34 (ref), v9 (ref), v4 (ref), v47 (ref), v49 (ref), v43 (ref), l_RetrievalStatus_0 (ref)
            local v59 = {};
            for _, v61 in ipairs(v55) do
                table.insert(v59, v61);
            end;
            for _, v63 in ipairs(v58.responseBody.callRecords) do
                table.insert(v59, v63);
            end;
            local v64 = {};
            for _, v66 in ipairs(v59) do
                for _, v68 in ipairs(v66.participants) do
                    v64[tostring(v68.userId)] = true;
                end;
            end;
            v34:query({
                query = v9.Queries.userProfilesCombinedNameAndUsernameByUserIds, 
                variables = {
                    userIds = v4.Dictionary.keys(v64)
                }
            }):andThen(function() --[[ Line: 111 ]]
                -- upvalues: v47 (ref), v59 (copy), v49 (ref), v58 (copy), v43 (ref), l_RetrievalStatus_0 (ref)
                v47(v59);
                v49(v58.responseBody.nextPageCursor);
                v43(l_RetrievalStatus_0.Done);
            end):catch(function() --[[ Line: 117 ]]
                -- upvalues: v43 (ref), l_RetrievalStatus_0 (ref)
                v43(l_RetrievalStatus_0.Failed);
            end);
        end, function() --[[ Line: 121 ]]
            -- upvalues: v43 (ref), l_RetrievalStatus_0 (ref)
            v43(l_RetrievalStatus_0.Failed);
        end);
    end, {
        v51
    });
    v5.useEffect(function() --[[ Line: 127 ]]
        -- upvalues: v69 (copy), v47 (copy), v49 (copy)
        v69({}, "");
        return function() --[[ Line: 130 ]]
            -- upvalues: v47 (ref), v49 (ref)
            v47({});
            v49("");
        end;
    end, {
        v69
    });
    local v70 = v5.useCallback(function() --[[ Line: 136 ]]
        -- upvalues: v35 (copy), v25 (ref), v54 (copy), v14 (ref), v36 (copy), v13 (ref)
        v35.fireEvent(v25.PhoneBookNavigate, {
            eventTimestampMs = os.time() * 1000, 
            startingPage = v54, 
            destinationPage = v14.FriendList
        });
        v36(v13(v14.FriendList));
    end, {
        v54
    });
    v5.useEffect(function() --[[ Line: 145 ]]
        -- upvalues: v42 (copy), l_RetrievalStatus_0 (ref), v39 (copy)
        if v42 ~= l_RetrievalStatus_0.Fetching then
            v39.current = false;
        end;
    end, {
        v42
    });
    local v72 = v5.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: v42 (copy), l_RetrievalStatus_0 (ref), v38 (copy), v5 (ref), v27 (ref), v69 (copy), v46 (copy), v48 (copy), v70 (copy)
        local v71 = nil;
        v71 = if v42 == l_RetrievalStatus_0.Failed then v38.genericErrorLabel else v38.noCallsLabel;
        return v5.createElement(v27, {
            isImageEnabled = v42 ~= l_RetrievalStatus_0.Failed, 
            imageName = "icons/graphic/findfriends_xlarge", 
            isFailedButtonEnabled = v42 == l_RetrievalStatus_0.Failed, 
            onFailedButtonActivated = function() --[[ Line: 164 ]] --[[ Name: onFailedButtonActivated ]]
                -- upvalues: v69 (ref), v46 (ref), v48 (ref)
                v69(v46, v48);
            end, 
            isCallButtonEnabled = v42 == l_RetrievalStatus_0.Done, 
            onCallButtonActivated = v70, 
            messageText = v71
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v46, 
        v69, 
        v38.genericErrorLabel, 
        v38.noCallsLabel, 
        v70, 
        v48, 
        v42
    } else l_dependencyArray_0(v46, v69, v38.genericErrorLabel, v38.noCallsLabel, v70, v48, v42));
    local v74 = v5.useCallback(function(v73) --[[ Line: 193 ]]
        -- upvalues: v41 (copy)
        v41.current = v73.Position.Y;
    end, {});
    local v76 = v5.useCallback(function(v75) --[[ Line: 197 ]]
        -- upvalues: v41 (copy), v28 (ref), v40 (copy), v45 (copy)
        if v75.Position.Y - v41.current > v28.TOUCH_SLOP and v40.current and v40.current.CanvasPosition.Y == 0 then
            v45(true);
        end;
    end, {});
    local v77 = v5.useCallback(function() --[[ Line: 212 ]]
        -- upvalues: v45 (copy)
        v45(false);
    end, {});
    local v86 = v5.useMemo(function() --[[ Line: 217 ]]
        -- upvalues: v5 (ref), v46 (copy), v32 (ref), v29 (ref), v26 (ref), v33 (copy), v48 (copy), v42 (copy), l_RetrievalStatus_0 (ref), v72 (copy), v28 (ref), l_LoadingSpinner_0 (ref)
        local v78 = {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        local v79 = {};
        for _, v81 in ipairs(v46) do
            local l_userId_0 = v81.participants[1].userId;
            if l_userId_0 == v32 then
                l_userId_0 = v81.participants[2].userId;
            end;
            if not v29:IsPlayerBlockedByUserId(l_userId_0) then
                table.insert(v79, v81);
            end;
        end;
        for v83, v84 in ipairs(v79) do
            v78[v83] = v5.createElement(v26, {
                callRecord = v84, 
                localUserId = v32, 
                showDivider = v83 ~= #v79, 
                dismissCallback = v33.dismissCallback, 
                layoutOrder = v83
            });
        end;
        if v48 ~= "" then
            local v85 = #v78 + 1;
            if v42 == l_RetrievalStatus_0.Failed then
                v78[v85] = v72;
                return v78;
            else
                v78[v85] = v5.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v28.ITEM_HEIGHT), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = v85
                }, {
                    LoadingSpinner = v5.createElement(l_LoadingSpinner_0, {
                        size = UDim2.fromOffset(48, 48), 
                        position = UDim2.fromScale(0.5, 0.5), 
                        anchorPoint = Vector2.new(0.5, 0.5)
                    })
                });
            end;
        end;
        return v78;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v46, 
        v48, 
        v72, 
        v42
    } else l_dependencyArray_0(v46, v48, v72, v42));
    local v88 = v5.useCallback(function(v87) --[[ Line: 275 ]]
        -- upvalues: v39 (copy), v42 (copy), l_RetrievalStatus_0 (ref), v48 (copy), v69 (copy), v46 (copy)
        if not v39.current and v42 ~= l_RetrievalStatus_0.Failed and v48 ~= "" and v87.CanvasPosition.Y >= v87.AbsoluteCanvasSize.Y - v87.AbsoluteSize.Y - 50 then
            v69(v46, v48);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v46, 
        v69, 
        v48, 
        v42
    } else l_dependencyArray_0(v46, v69, v48, v42));
    v5.useEffect(function() --[[ Line: 291 ]]
        -- upvalues: v86 (copy), v28 (ref), v40 (copy), v88 (copy)
        local v89 = (#v86 - 1) * v28.ITEM_HEIGHT;
        if v40.current and v89 <= v40.current.AbsoluteSize.Y then
            v88(v40.current);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v86, 
        v88
    } else l_dependencyArray_0(v86, v88));
    if #v46 == 0 and v42 == l_RetrievalStatus_0.Fetching then
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
    elseif #v46 == 0 then
        return v72;
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
                ScrollingEnabled = not v44 and v33.scrollingEnabled, 
                ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                ScrollBarImageTransparency = l_Theme_0.UIEmphasis.Transparency, 
                ScrollBarThickness = 4, 
                ref = v40, 
                [v5.Change.CanvasPosition] = v88
            }, v86); 
            TouchStartedUserInputConnection = v33.isSmallScreen and v33.scrollingEnabled and v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.TouchStarted, 
                callback = v74
            }), 
            TouchMovedUserInputConnection = v33.isSmallScreen and v33.scrollingEnabled and v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.TouchMoved, 
                callback = v76
            }), 
            TouchEndedUserInputConnection = v33.isSmallScreen and v33.scrollingEnabled and v5.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.TouchEnded, 
                callback = v77
            })
        }));
    end;
end;