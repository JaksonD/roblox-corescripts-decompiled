local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v4 = require(l_script_FirstAncestor_0.Components.Common.Frame);
local v5 = require(l_script_FirstAncestor_0.Components.Common.UIListLayout);
local l_useStyle_0 = require(l_Parent_0.UIBlox).Core.Style.useStyle;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_List_0 = require(l_Parent_0.Cryo).List;
local v9 = require(l_Parent_0.UIBlox);
local l_TextField_0 = v9.App.Input.TextField;
local l_Images_0 = v9.App.ImageSet.Images;
local v12 = require(l_script_FirstAncestor_0.Http.NetworkingFriends);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v17 = require(l_Parent_0.Cryo);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v19 = require(l_Parent_0.UserProfiles);
local l_useUserProfilesFetch_0 = v19.Hooks.useUserProfilesFetch;
local v21 = require(script.Parent.Utils.isUserInConversation);
local v22 = require(l_Parent_0.LuauPolyfill);
local l_clearTimeout_0 = v22.clearTimeout;
local l_setTimeout_0 = v22.setTimeout;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local v26 = require(script.Parent.UserCellWithCheckboxDeprecated);
local v27 = require(l_script_FirstAncestor_0.Components.Cells.AvatarCircle);
local v28 = require(script.Parent.PaginatedChatMembersDeprecated);
local v29 = require(script.Parent.SelectedMembersBarDeprecated);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local function _(v31, v32) --[[ Line: 41 ]] --[[ Name: isUserSelected ]]
    -- upvalues: l_List_0 (copy)
    return l_List_0.findWhere(v31, function(v33) --[[ Line: 42 ]]
        -- upvalues: v32 (copy)
        return v33.id == v32;
    end) ~= nil;
end;
local v35 = 48;
local l_v35_0 = v35;
local v37 = 12;
local v38 = 12;
local v39 = game:DefineFastInt("AppChatSelectChatMembersDebounceTime", 250);
return function(v40) --[[ Line: 82 ]] --[[ Name: SelectChatMembers ]]
    -- upvalues: l_useLocalization_0 (copy), l_useTokens_0 (copy), v35 (ref), l_v35_0 (ref), v37 (ref), v38 (ref), l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), l_createNextOrder_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), v2 (copy), l_setTimeout_0 (copy), v39 (copy), l_useUserProfilesFetch_0 (copy), v19 (copy), v12 (copy), l_List_0 (copy), v17 (copy), v21 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_clearTimeout_0 (copy), v5 (copy), v27 (copy), v26 (copy), l_UserModel_0 (copy), v4 (copy), v29 (copy), l_TextField_0 (copy), l_Images_0 (copy), v28 (copy)
    local v41 = l_useLocalization_0({
        suggested = "Feature.Friends.Label.Suggested"
    });
    local v42 = l_useTokens_0();
    v35 = v42.Size.Size_1200;
    l_v35_0 = v42.Size.Size_1200;
    v37 = v42.Padding.Medium;
    v38 = v42.Padding.Medium;
    local v43 = l_useStyle_0();
    local v44 = l_useTextSizeOffset_0();
    local v45 = v35 + 2 * v44;
    local l_Theme_0 = v43.Theme;
    local l_Font_0 = v43.Font;
    local v48 = l_createNextOrder_0();
    local v49 = l_useDispatch_0();
    local v50 = l_useLocalUserId_0();
    local v51 = v2.useRef(l_setTimeout_0(function() --[[ Line: 101 ]]

    end, v39));
    local v52 = v2.useRef("");
    local v53, v54 = v2.useState({});
    local v55 = l_useUserProfilesFetch_0({
        userIds = v53, 
        query = v19.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v63 = v2.useCallback(function(v56) --[[ Line: 111 ]]
        -- upvalues: v49 (copy), v12 (ref), v50 (copy), l_List_0 (ref), v54 (copy), v17 (ref), v40 (copy), v21 (ref)
        v49(v12.SearchFriendsByQuery.API(v50, {
            query = v56, 
            limit = 20
        })):andThen(function(v57) --[[ Line: 116 ]]
            -- upvalues: l_List_0 (ref), v54 (ref), v17 (ref), v40 (ref), v21 (ref)
            local v59 = l_List_0.map(v57.responseBody.PageItems, function(v58) --[[ Line: 117 ]]
                return (tostring(v58.id));
            end);
            v54(v17.List.filter(v59, function(v60) --[[ Line: 120 ]]
                -- upvalues: v40 (ref), v21 (ref)
                local v61 = v40.conversation or {
                    participants = {}
                };
                return not v21(v60, v61);
            end));
        end):catch(function(v62) --[[ Line: 127 ]]
            print("error", v62);
        end);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v49, 
        v50, 
        v40.conversation
    } else l_dependencyArray_0(v49, v50, v40.conversation));
    local v65 = v2.useCallback(function(v64) --[[ Line: 136 ]]
        -- upvalues: l_clearTimeout_0 (ref), v51 (copy), v52 (copy), l_setTimeout_0 (ref), v63 (copy), v54 (copy), v39 (ref)
        l_clearTimeout_0(v51.current);
        v52.current = v64;
        v51.current = l_setTimeout_0(function() --[[ Line: 139 ]]
            -- upvalues: v64 (copy), v63 (ref), v54 (ref)
            if v64 ~= "" then
                v63(v64);
                return;
            else
                v54({});
                return;
            end;
        end, v39);
    end, {
        v63
    });
    local v67 = v2.useCallback(function(v66) --[[ Line: 149 ]]
        -- upvalues: v2 (ref), v5 (ref), v27 (ref), v40 (copy), l_Theme_0 (copy), l_Font_0 (copy)
        return v2.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            layout = v2.createElement(v5, {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            avatarCircle = v2.createElement(v27, {
                thumbnails = {
                    v66.thumbnail
                }, 
                onActivated = function() --[[ Line: 161 ]] --[[ Name: onActivated ]]
                    -- upvalues: v40 (ref), v66 (copy)
                    v40.onEntryActivated(v66);
                end, 
                circleColor3 = l_Theme_0.BackgroundDefault.Color, 
                circleInteriorBackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                circleInteriorBackgroundTransparency = l_Theme_0.PlaceHolder.Transparency, 
                presenceImage = v66.presenceImage or "", 
                showNewPresenceImage = true, 
                presenceImageColor3 = l_Theme_0.OnlineStatus.Color, 
                presenceImageTransparency = l_Theme_0.OnlineStatus.Transparency
            }), 
            displayName = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 15), 
                TextSize = l_Font_0.Footer.RelativeSize * l_Font_0.BaseSize, 
                TextColor3 = l_Theme_0.TextEmphasis.Color, 
                TextTransparency = l_Theme_0.TextEmphasis.Transparency, 
                Font = l_Font_0.Footer.Font, 
                Text = v66.displayName, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v40.onEntryActivated, 
        l_Theme_0, 
        l_Font_0
    } else l_dependencyArray_0(v40.onEntryActivated, l_Theme_0, l_Font_0));
    local v84 = v2.useCallback(function(v68) --[[ Line: 191 ]]
        -- upvalues: v2 (ref), v40 (copy), v45 (copy), v26 (ref), v43 (copy), l_List_0 (ref)
        local l_item_0 = v68.item;
        local l_createElement_0 = v2.createElement;
        local v71 = "Folder";
        local v72 = nil;
        local v73 = {
            userIdValue = v40.isDebugEnabled and v2.createElement("StringValue", {
                Value = l_item_0.id
            })
        };
        local l_createElement_1 = v2.createElement;
        local v75 = "Frame";
        local v76 = {
            Size = UDim2.new(1, 0, 0, v45), 
            BackgroundTransparency = 1
        };
        local v77 = {};
        local l_createElement_2 = v2.createElement;
        local l_v26_0 = v26;
        local v80 = {
            style = v43, 
            user = l_item_0, 
            subTitleText = "@" .. (l_item_0.username or "")
        };
        local l_selectedUsers_0 = v40.selectedUsers;
        local l_id_0 = l_item_0.id;
        v80.isCheckboxActivated = l_List_0.findWhere(l_selectedUsers_0, function(v83) --[[ Line: 42 ]]
            -- upvalues: l_id_0 (copy)
            return v83.id == l_id_0;
        end) ~= nil;
        v80.onActivated = v40.onEntryActivated;
        v77.cellContent = l_createElement_2(l_v26_0, v80);
        v73.userCell = l_createElement_1(v75, v76, v77);
        return l_createElement_0(v71, v72, v73);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v40.onEntryActivated, 
        v40.selectedUsers, 
        v40.isDebugEnabled, 
        v43, 
        v44
    } else l_dependencyArray_0(v40.onEntryActivated, v40.selectedUsers, v40.isDebugEnabled, v43, v44));
    local v85 = v2.useCallback(function() --[[ Line: 223 ]]
        -- upvalues: v65 (copy)
        v65("");
    end, {
        v65
    });
    local v102 = v2.useCallback(function(v86) --[[ Line: 228 ]]
        -- upvalues: v2 (ref), v40 (copy), v45 (copy), v26 (ref), v43 (copy), l_List_0 (ref)
        local l_item_1 = v86.item;
        local l_createElement_3 = v2.createElement;
        local v89 = "Folder";
        local v90 = nil;
        local v91 = {
            userIdValue = v40.isDebugEnabled and v2.createElement("StringValue", {
                Value = l_item_1.id
            })
        };
        local l_createElement_4 = v2.createElement;
        local v93 = "Frame";
        local v94 = {
            Size = UDim2.new(1, 0, 0, v45), 
            BackgroundTransparency = 1
        };
        local v95 = {};
        local l_createElement_5 = v2.createElement;
        local l_v26_1 = v26;
        local v98 = {
            style = v43, 
            user = l_item_1, 
            secondaryTitleText = l_item_1.alias, 
            subTitleText = l_item_1.presenceText
        };
        local l_selectedUsers_1 = v40.selectedUsers;
        local l_id_1 = l_item_1.id;
        v98.isCheckboxActivated = l_List_0.findWhere(l_selectedUsers_1, function(v101) --[[ Line: 42 ]]
            -- upvalues: l_id_1 (copy)
            return v101.id == l_id_1;
        end) ~= nil;
        v98.onActivated = v40.onEntryActivated;
        v95.cellContent = l_createElement_5(l_v26_1, v98);
        v91.userCell = l_createElement_4(v93, v94, v95);
        return l_createElement_3(v89, v90, v91);
    end, {
        v40.selectedUsers, 
        v40.onEntryActivated, 
        v40.isDebugEnabled, 
        v43, 
        v44
    });
    local l_shouldShowSelectChatMembersBar_0 = v40.shouldShowSelectChatMembersBar;
    local v104 = l_shouldShowSelectChatMembersBar_0 and 63 or 0;
    local v105 = if v40.shouldShowSelectChatMembersBar then v38 * 2 else v38;
    local v106 = l_v35_0 + v104 + v105;
    local v107 = #v53 == 0;
    local v111 = v2.useMemo(function() --[[ Line: 266 ]]
        -- upvalues: v55 (copy), v107 (copy), v53 (copy), v19 (ref), l_UserModel_0 (ref)
        local v108 = {};
        if v55.data and not v107 then
            for _, v110 in v53 do
                table.insert(v108, {
                    id = v110, 
                    displayName = v55.data and v19.Selectors.getCombinedNameFromId(v55.data, v110), 
                    username = v55.data and v19.Selectors.getUsernameFromId(v55.data, v110), 
                    thumbnail = ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(v110), 
                    presence = l_UserModel_0.PresenceType.OFFLINE
                });
            end;
        end;
        return v108;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v53, 
        v55.data, 
        v107
    } else l_dependencyArray_0(v53, v55.data, v107));
    return v2.createElement(v4, {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = v40.layoutOrder, 
        ClipsDescendants = true
    }, {
        layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v38)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v38)
        }), 
        selectedMembersBar = if l_shouldShowSelectChatMembersBar_0 then v2.createElement(v29, {
            barBackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            barBackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            selectedUsers = v40.selectedUsers, 
            maxSize = v40.maxSelections, 
            renderEntry = v67, 
            LayoutOrder = v48()
        }) else nil, 
        searchBoxFrame = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, l_v35_0), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            BorderSizePixel = 0, 
            LayoutOrder = v48()
        }, {
            searchBoxInnerFrame = v2.createElement("Frame", {
                Size = UDim2.new(1, -v37 * 2, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.fromScale(0.5, 0), 
                BackgroundTransparency = 1
            }, {
                searchBox = v2.createElement(l_TextField_0, {
                    placeholder = v40.searchFriendsText, 
                    text = v52.current, 
                    iconLeading = l_Images_0["icons/common/search_small"], 
                    iconButton = if v52.current ~= "" then l_Images_0["icons/actions/edit/clear_small"] else nil, 
                    onButtonPress = v85, 
                    onChange = v65, 
                    width = UDim.new(1, 0), 
                    LayoutOrder = 2
                })
            })
        }), 
        friendsListContainer = v2.createElement(v4, {
            Size = UDim2.new(1, 0, 1, -v106), 
            BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
            BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
            LayoutOrder = v48()
        }, {
            friendsList = if v52.current == "" then v2.createElement(v28, {
                renderItem = v102, 
                data = v40.friendEntries, 
                fetchMoreFriends = v40.fetchMoreFriends, 
                headerText = v41.suggested
            }) else v2.createElement(v28, {
                renderItem = v84, 
                data = v111
            })
        })
    });
end;