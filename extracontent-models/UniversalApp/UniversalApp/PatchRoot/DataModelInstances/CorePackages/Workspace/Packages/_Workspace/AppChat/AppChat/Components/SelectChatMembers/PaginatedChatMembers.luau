local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_FlatList_0 = require(l_Parent_0.VirtualizedList).FlatList;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPerfChatMembersPaginationEnabled);
local v7 = game:DefineFastInt("AppChatPerfChatMembersPaginationWindowSize", 2);
local v8 = game:DefineFastInt("AppChatPerfChatMembersPaginationInitialRender", 8);
local v9 = game:DefineFastInt("AppChatPerfChatMembersPaginationOnEndReachedUnits", 1);
local function v12(v10, v11) --[[ Line: 35 ]]
    return (tostring(v10 or v11));
end;
local v13 = {
    ScrollBarThickness = 0, 
    Name = "PaginatedChatMembers", 
    BackgroundTransparency = 1
};
local v14 = {
    BackgroundTransparency = 1
};
return v2.memo(function(v15) --[[ Line: 48 ]] --[[ Name: PaginatedChatMembers ]]
    -- upvalues: v2 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v3 (copy), l_FlatList_0 (copy), v13 (copy), v14 (copy), v12 (copy)
    local v16 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 51 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v16 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v16.current then
            local v17 = v16.current:getNativeScrollRef();
            if v17 and v17._nativeRef and v17._nativeRef.current then
                v17._nativeRef.current.Selectable = false;
            end;
        end;
    end, {});
    local v18 = if v6() then v7 else nil;
    local v19 = if v6() then v8 else 50;
    local v20 = if v6() then v9 else 0.8;
    local v21 = v2.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v15 (copy)
        if v15.fetchMoreFriends then
            v15.fetchMoreFriends();
        end;
    end, {
        v15.fetchMoreFriends
    });
    return v2.createElement(v3.View, {
        tag = "size-full col gap-small"
    }, {
        Header = if v15.headerText then v2.createElement(v3.Text, {
            tag = "size-full-0 auto-y text-align-x-left text-align-y-bottom text-title-large padding-x-medium", 
            Text = v15.headerText, 
            LayoutOrder = 1
        }) else nil, 
        ListContainer = v2.createElement(v3.View, {
            LayoutOrder = 2, 
            tag = "size-full-0 fill"
        }, {
            List = v2.createElement(l_FlatList_0, {
                style = v13, 
                contentContainerStyle = v14, 
                renderItem = v15.renderItem, 
                data = v15.userIds, 
                windowSize = v18, 
                initialNumToRender = v19, 
                onEndReachedThreshold = v20, 
                onEndReached = v21, 
                keyExtractor = v12, 
                ref = if l_FFlagEnableAppChatFocusableFixes_0 then v16 else nil
            })
        })
    });
end);