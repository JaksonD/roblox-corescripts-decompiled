local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_FlatList_0 = require(l_Parent_0.VirtualizedList).FlatList;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v8 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatPerfChatMembersPaginationEnabled);
local v9 = game:DefineFastInt("AppChatPerfChatMembersPaginationWindowSize", 2);
local v10 = game:DefineFastInt("AppChatPerfChatMembersPaginationInitialRender", 8);
local v11 = game:DefineFastInt("AppChatPerfChatMembersPaginationOnEndReachedUnits", 1);
return function(v12) --[[ Line: 37 ]] --[[ Name: PaginatedChatMembers ]]
    -- upvalues: l_useStyle_0 (copy), v2 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_StyledTextLabel_0 (copy), l_FlatList_0 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy)
    local v13 = l_useStyle_0();
    local v14 = v2.useRef(nil);
    local function v17(_, v16) --[[ Line: 41 ]]
        return {
            length = 48, 
            offset = 48 * v16, 
            index = v16
        };
    end;
    v2.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: l_FFlagEnableAppChatFocusableFixes_0 (ref), v14 (copy)
        if l_FFlagEnableAppChatFocusableFixes_0 and v14.current then
            local v18 = v14.current:getNativeScrollRef();
            if v18 and v18._nativeRef and v18._nativeRef.current then
                v18._nativeRef.current.Selectable = false;
            end;
        end;
    end, {});
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0
    }, {
        uiListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, 0)
        }), 
        friendsListHeader = if v12.headerText then v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = 1
        }, {
            padding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12)
            }), 
            headerTextLabel = v2.createElement(l_StyledTextLabel_0, {
                fontStyle = v13.Font.Header2, 
                colorStyle = v13.Theme.TextDefault, 
                text = v12.headerText, 
                size = UDim2.new(1, 0, 0, 20)
            })
        }) else nil, 
        scrollingFriendsListContainer = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            uiFlexItem = v2.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            }), 
            scrollingFriendsList = v2.createElement(l_FlatList_0, {
                style = {
                    ScrollBarThickness = 0, 
                    Name = "PaginatedChatMembers", 
                    BackgroundTransparency = 1
                }, 
                contentContainerStyle = {
                    BackgroundTransparency = 1
                }, 
                renderItem = v12.renderItem, 
                data = v12.data, 
                windowSize = if v8() then v9 else nil, 
                initialNumToRender = if v8() then v10 else 50, 
                onEndReachedThreshold = if v8() then v11 else 0.8, 
                onEndReached = function() --[[ Line: 120 ]] --[[ Name: onEndReached ]]
                    -- upvalues: v12 (copy)
                    if v12.fetchMoreFriends then
                        v12.fetchMoreFriends();
                    end;
                end, 
                getItemLayout = v17, 
                keyExtractor = function(v19, v20) --[[ Line: 126 ]] --[[ Name: keyExtractor ]]
                    return v19.stable_key or v19.id or v20;
                end, 
                ref = if l_FFlagEnableAppChatFocusableFixes_0 then v14 else nil
            })
        })
    });
end;