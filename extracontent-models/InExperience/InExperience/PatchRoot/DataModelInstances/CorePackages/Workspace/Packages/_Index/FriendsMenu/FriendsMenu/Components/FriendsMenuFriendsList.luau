local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsMenu");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_Components_0 = l_script_FirstAncestor_0.Components;
local l_Context_0 = l_script_FirstAncestor_0.Context;
local l_Enums_0 = l_script_FirstAncestor_0.Enums;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.UIBlox);
local v9 = require(l_Components_0.FriendRow);
local v10 = require(l_Components_0.EmptyFriendsList);
local v11 = require(l_Components_0.FriendsListMsg);
local v12 = require(l_Context_0.FriendsListContext);
local _ = require(l_Enums_0.FriendMenuType);
local _ = require(l_script_FirstAncestor_0.friendsMenuModalType);
local l_VerticalScrollView_0 = v8.App.Container.VerticalScrollView;
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagUpdateInvitesToUsePaginatedFriends);
local v17 = require(l_Components_0.FriendsMenuShareGameInviteLink);
local v18 = game:DefineFastFlag("EnableFriendsMenuShareGameInviteLink3", false);
local l_FFlagEnableAppChatFocusableFixesUpdate_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixesUpdate;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
return function(v21) --[[ Line: 43 ]]
    -- upvalues: v7 (copy), v12 (copy), l_UserInputService_0 (copy), l_FFlagEnableAppChatFocusableFixesUpdate_0 (copy), l_GuiService_0 (copy), l_useAppPolicy_0 (copy), v18 (copy), v9 (copy), v17 (copy), v11 (copy), v10 (copy), l_VerticalScrollView_0 (copy), v16 (copy)
    local v22 = v7.useContext(v12);
    local l_friends_0 = v22.friends;
    local l_isFetchingFriends_0 = v22.isFetchingFriends;
    local v25 = l_isFetchingFriends_0 or v22.friendsNames and v22.friendsNames.loading;
    local l_isFriendsListFetchFailed_0 = v22.isFriendsListFetchFailed;
    local l_hasFriends_0 = v22.hasFriends;
    local v28 = v7.useRef(nil);
    local v29, v30 = v7.useState(0);
    v7.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: l_UserInputService_0 (ref), l_FFlagEnableAppChatFocusableFixesUpdate_0 (ref), v21 (copy), v28 (copy), l_GuiService_0 (ref)
        if not l_UserInputService_0.GamepadEnabled or l_FFlagEnableAppChatFocusableFixesUpdate_0 and v21.disableListFocus then
            return;
        else
            local l_current_0 = v28.current;
            local v32 = nil;
            if l_current_0 then
                v32 = l_current_0:FindFirstAncestorOfClass("ScreenGui");
                if v32 and v32.Enabled and l_GuiService_0.SelectedCoreObject == nil then
                    if not v21.disableSelectionParentManagement then
                        l_GuiService_0:AddSelectionParent(v21.parentComponentName, l_current_0);
                    end;
                    for _, v34 in ipairs(l_current_0:GetChildren()) do
                        if v34:IsA("ImageButton") and v34.LayoutOrder == 1 then
                            l_GuiService_0.SelectedCoreObject = v34;
                        end;
                    end;
                end;
            end;
            return function() --[[ Line: 80 ]]
                -- upvalues: l_GuiService_0 (ref), v32 (ref), v21 (ref)
                if l_GuiService_0.SelectedCoreObject and v32 and (l_GuiService_0.SelectedCoreObject.Parent == nil or v32:IsAncestorOf(l_GuiService_0.SelectedCoreObject)) then
                    l_GuiService_0.SelectedCoreObject = nil;
                end;
                if not v21.disableSelectionParentManagement then
                    l_GuiService_0:RemoveSelectionGroup(v21.parentComponentName);
                end;
            end;
        end;
    end, if l_FFlagEnableAppChatFocusableFixesUpdate_0 then {
        l_friends_0, 
        v21.disableListFocus, 
        v21.disableSelectionParentManagement
    } else {
        v28.current, 
        l_friends_0
    });
    local v36 = l_useAppPolicy_0(function(v35) --[[ Line: 104 ]]
        return v35.getExperienceInviteShareLinkEnabled();
    end);
    local v37 = v18 and v21.parentComponentName == "GameInviteModal" and game.GameId > 0 and v21.gameDetailsData and v21.gameDetailsData.isCoreScript and v21.gameDetailsData.serverType == "StandardServer" and v36;
    local v41 = v7.useMemo(function() --[[ Line: 117 ]]
        -- upvalues: v7 (ref), l_friends_0 (copy), v9 (ref), l_UserInputService_0 (ref), v21 (copy), l_isFetchingFriends_0 (copy), v25 (copy)
        local v38 = {
            RowListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            })
        };
        for v39, v40 in ipairs(l_friends_0) do
            v38["User-" .. tostring(v40.id)] = v7.createElement(v9, {
                friend = v40, 
                layoutOrder = v39, 
                isFullRowActivatable = (l_UserInputService_0.GamepadEnabled or v21.isFullRowActivatable) == true, 
                menuType = v21.menuType, 
                sidePadding = v21.sidePadding, 
                backgroundTransparency = v21.backgroundTransparency, 
                isFetchingFriends = l_isFetchingFriends_0, 
                isFetchingFriendsNames = v25
            });
        end;
        return v38;
    end, {
        l_friends_0
    });
    local v42 = nil;
    if l_isFriendsListFetchFailed_0 then
        v42 = if v37 then {
            InviteLink = v7.createElement(v17, {
                layoutOrder = 0
            }), 
            FriendsListMsg = v7.createElement(v11, {
                msgType = "errorFriendsList"
            })
        } else v7.createElement(v11, {
            msgType = "errorFriendsList"
        });
    elseif l_isFetchingFriends_0 then
        v42 = v41;
        if v37 then
            v42.InviteLink = v7.createElement(v17, {
                layoutOrder = 0
            });
        end;
    elseif l_hasFriends_0 then
        if #l_friends_0 > 0 then
            v42 = v41;
            if v37 then
                v42.InviteLink = v7.createElement(v17, {
                    layoutOrder = 0
                });
            end;
        else
            v42 = if v37 then {
                InviteLink = v7.createElement(v17, {
                    layoutOrder = 0
                }), 
                FriendsListMsg = v7.createElement(v11, {
                    msgType = "noResultFriendsList"
                })
            } else v7.createElement(v11, {
                msgType = "noResultFriendsList"
            });
        end;
    else
        v42 = if v37 then {
            InviteLink = v7.createElement(v17, {
                layoutOrder = 0
            }), 
            EmptyFriendsList = v7.createElement(v10)
        } else v7.createElement(v10);
    end;
    return v7.createElement(l_VerticalScrollView_0, {
        layoutOrder = v21.layoutOrder, 
        size = v21.size, 
        useAutomaticCanvasSize = true, 
        canvasSizeY = UDim.new(1, 0), 
        selectable = false, 
        scrollingFrameRef = v28, 
        [v7.Change.CanvasPosition] = v16 and function(v43) --[[ Line: 204 ]]
            -- upvalues: v29 (copy), v30 (copy), v22 (copy)
            if v43.CanvasPosition.Y / (v43.AbsoluteCanvasSize.Y - v43.AbsoluteWindowSize.Y) >= 0.8 and v29 < v43.AbsoluteCanvasSize.Y then
                v30(v43.AbsoluteCanvasSize.Y);
                v22.fetchMoreFriends();
            end;
        end or nil
    }, v42);
end;