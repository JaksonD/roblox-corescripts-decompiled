local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v3.Core.Style.useTextSizeOffset;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(script.Parent.Utils.useDebouncedUserSearch);
local v8 = require(script.Parent.UserCellWithCheckbox);
local v9 = require(script.Parent.PaginatedChatMembers);
local v10 = require(script.Parent.SelectedMembersBar);
local function v17(v11, v12, v13, v14, _) --[[ Line: 30 ]] --[[ Name: renderUserEntry ]]
    -- upvalues: v1 (copy), v2 (copy), v8 (copy)
    local v16 = if v12 then "search_" .. v11 else v11;
    return v1.createElement(v2.View, {
        tag = "size-full-0 auto-y", 
        key = v16
    }, {
        cellContent = v1.createElement(v8, {
            style = v14, 
            userId = v11
        }), 
        debugId = v13.isDebugEnabled and v1.createElement(v2.Text, {
            tag = "auto-xy position-bottom-right anchor-bottom-right", 
            Text = v11
        }) or nil
    });
end;
return v1.memo(function(v18) --[[ Line: 56 ]] --[[ Name: SelectChatMembers ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v7 (copy), v1 (copy), v17 (copy), v2 (copy), v10 (copy), v9 (copy)
    local v19 = l_useLocalization_0({
        suggested = "Feature.Friends.Label.Suggested"
    });
    local v20 = l_useStyle_0();
    local v21 = l_useTextSizeOffset_0();
    local v22, v23, v24 = v7(v18.conversation);
    local v25 = v1.useRef(nil);
    local v26 = v1.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v23 (copy), v25 (copy)
        v23("");
        if v25 and v25.current then
            v25.current.focus();
        end;
    end, {
        v23
    });
    local v27 = v24 ~= "";
    local v30 = v1.useCallback(function(v28) --[[ Line: 74 ]]
        -- upvalues: v17 (ref), v27 (copy), v18 (copy), v20 (copy), v21 (copy)
        local l_item_0 = v28.item;
        return v17(l_item_0, v27, {
            isDebugEnabled = v18.isDebugEnabled
        }, v20, v21);
    end, {
        v18.isDebugEnabled, 
        v27, 
        v20, 
        v21
    });
    local l_shouldShowSelectChatMembersBar_0 = v18.shouldShowSelectChatMembersBar;
    return v1.createElement(v2.View, {
        tag = "size-full col gap-small bg-surface-0"
    }, {
        TopSection = v1.createElement(v2.View, {
            tag = "col size-full-0 auto-y gap-small padding-x-medium", 
            LayoutOrder = 1
        }, {
            selectedMembersBar = l_shouldShowSelectChatMembersBar_0 and v1.createElement(v10, {
                LayoutOrder = 1
            }) or nil, 
            searchBar = v1.createElement(v2.TextInput, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = 2, 
                label = "", 
                text = v24, 
                width = UDim.new(1, 0), 
                placeholder = v18.searchFriendsText, 
                leadingIcon = "icons/actions/friend_sort/search_people", 
                onChanged = v23, 
                iconTrailing = if v27 then {
                    name = v2.Enums.IconName.CircleX, 
                    onActivated = v26
                } else nil, 
                textBoxRef = v25
            })
        }), 
        friendsList = v1.createElement(v2.View, {
            LayoutOrder = 3, 
            tag = "size-full-0 fill"
        }, {
            paginatedFriendsList = v1.createElement(v9, {
                userIds = if v27 then v22 else v18.friendIds, 
                renderItem = v30, 
                fetchMoreFriends = if v27 then nil else v18.fetchMoreFriends, 
                headerText = if v27 then nil else v19.suggested
            })
        })
    });
end);