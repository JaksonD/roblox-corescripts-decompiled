local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v4.Core.Style.useTextSizeOffset;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v8 = require(script.Parent.Utils.useDebouncedUserSearch);
local v9 = require(script.Parent.UserCellWithCheckbox);
local v10 = require(script.Parent.PaginatedChatMembers);
local v11 = require(script.Parent.SelectedMembersBar);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v13 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local function v20(v14, v15, v16, v17, _) --[[ Line: 32 ]] --[[ Name: renderUserEntry ]]
    -- upvalues: v2 (copy), v3 (copy), v9 (copy)
    local v19 = if v15 then "search_" .. v14 else v14;
    return v2.createElement(v3.View, {
        tag = "size-full-0 auto-y", 
        key = v19
    }, {
        cellContent = v2.createElement(v9, {
            style = v17, 
            userId = v14
        }), 
        debugId = v16.isDebugEnabled and v2.createElement(v3.Text, {
            tag = "auto-xy position-bottom-right anchor-bottom-right", 
            Text = v14
        }) or nil
    });
end;
return v2.memo(function(v21) --[[ Line: 58 ]] --[[ Name: SelectChatMembers ]]
    -- upvalues: l_useLocalization_0 (copy), l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v8 (copy), v2 (copy), v20 (copy), v3 (copy), v11 (copy), v12 (copy), v13 (copy), v10 (copy)
    local v22 = l_useLocalization_0({
        suggested = "Feature.Friends.Label.Suggested"
    });
    local v23 = l_useStyle_0();
    local v24 = l_useTextSizeOffset_0();
    local v25, v26, v27 = v8(v21.conversation);
    local v28 = v2.useRef(nil);
    local v29 = v2.useCallback(function() --[[ Line: 66 ]]
        -- upvalues: v26 (copy), v28 (copy)
        v26("");
        if v28 and v28.current then
            v28.current.focus();
        end;
    end, {
        v26
    });
    local v30 = v27 ~= "";
    local v33 = v2.useCallback(function(v31) --[[ Line: 76 ]]
        -- upvalues: v20 (ref), v30 (copy), v21 (copy), v23 (copy), v24 (copy)
        local l_item_0 = v31.item;
        return v20(l_item_0, v30, {
            isDebugEnabled = v21.isDebugEnabled
        }, v23, v24);
    end, {
        v21.isDebugEnabled, 
        v30, 
        v23, 
        v24
    });
    local l_shouldShowSelectChatMembersBar_0 = v21.shouldShowSelectChatMembersBar;
    return v2.createElement(v3.View, {
        tag = "size-full col gap-small bg-surface-0"
    }, {
        TopSection = v2.createElement(v3.View, {
            tag = "col size-full-0 auto-y gap-small padding-x-medium", 
            LayoutOrder = 1
        }, {
            selectedMembersBar = l_shouldShowSelectChatMembersBar_0 and v2.createElement(v11, {
                LayoutOrder = 1
            }) or nil, 
            searchBar = v2.createElement(v3.TextInput, {
                tag = "size-full-0 auto-y", 
                LayoutOrder = 2, 
                label = "", 
                text = v27, 
                width = UDim.new(1, 0), 
                placeholder = v21.searchFriendsText, 
                leadingIcon = "icons/actions/friend_sort/search_people", 
                onChanged = v26, 
                iconTrailing = if v30 then {
                    name = v3.Enums.IconName.CircleX, 
                    onActivated = v29
                } else nil, 
                textBoxRef = v28, 
                testId = if v12 then v13.selectChatMembersSearchInput(v27) else nil
            })
        }), 
        friendsList = v2.createElement(v3.View, {
            LayoutOrder = 3, 
            tag = "size-full-0 fill"
        }, {
            paginatedFriendsList = v2.createElement(v10, {
                userIds = if v30 then v25 else v21.friendIds, 
                renderItem = v33, 
                fetchMoreFriends = if v30 then nil else v21.fetchMoreFriends, 
                headerText = if v30 then nil else v22.suggested
            })
        })
    });
end);