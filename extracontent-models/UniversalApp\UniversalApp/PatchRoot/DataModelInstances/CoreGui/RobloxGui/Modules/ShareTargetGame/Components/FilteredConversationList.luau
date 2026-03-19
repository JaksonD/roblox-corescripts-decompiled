local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_SocialLibraries_0 = v1.SocialLibraries;
local l_UIBlox_0 = v1.UIBlox;
local l_User_0 = v1.User;
local l_FilteredScrollingList_0 = l_SocialLibraries_0.Components.FilteredScrollingList;
local v7 = require(l_script_FirstAncestor_0.Utils.conversationSortComparator);
local v8 = require(script.Parent.ConversationCellWithSendButton);
local v9 = l_Roact_0.PureComponent:extend("FilteredConversationList");
v9.defaultProps = {
    searchFilterPredicate = function(v10, v11) --[[ Line: 17 ]] --[[ Name: searchFilterPredicate ]]
        local l_title_0 = v11.title;
        if not v10 or v10 == "" then
            return true;
        else
            return string.find(string.lower(l_title_0), string.lower(v10), 1, true) ~= nil;
        end;
    end, 
    conversations = {}, 
    conversationSendingStatuses = {}, 
    touchedBottomCallback = nil, 
    filterBoxPlaceHolderText = nil, 
    offlinePresence = nil, 
    onlinePresence = nil, 
    sendText = "Send", 
    sentText = "Sent", 
    sendingText = "Sending", 
    failedText = "Failed", 
    entryHeight = nil, 
    isLoading = false, 
    onSendButtonActivated = function(_) --[[ Line: 42 ]] --[[ Name: onSendButtonActivated ]]

    end
};
v9.init = function(v14) --[[ Line: 45 ]] --[[ Name: init ]]
    -- upvalues: l_User_0 (copy), l_Roact_0 (copy), v8 (copy)
    local v15 = {
        title = ""
    };
    v14.loadingEntries = table.create(3, v15);
    v14.renderConversationCell = function(v16) --[[ Line: 50 ]]
        -- upvalues: l_User_0 (ref), v14 (copy), l_Roact_0 (ref), v8 (ref)
        local v17 = nil;
        v17 = if v16.presence then if v16.presence == l_User_0.PresenceType.ONLINE then v14.props.onlinePresence else if v16.presence == l_User_0.PresenceType.OFFLINE then v14.props.offlinePresence else v16.lastLocation else "";
        return l_Roact_0.createElement(v8, {
            conversation = v16, 
            sentStatus = v14.props.conversationSendingStatuses[v16.conversationId], 
            subTitleText = v17, 
            sendText = v14.props.sendText, 
            sentText = v14.props.sentText, 
            sendingText = v14.props.sendingText, 
            failedText = v14.props.failedText, 
            secondaryTitleText = v16.alias, 
            onSendButtonActivated = v14.props.onSendButtonActivated, 
            isLoading = v14.props.isLoading
        });
    end;
end;
v9.render = function(v18) --[[ Line: 79 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), l_FilteredScrollingList_0 (copy), v7 (copy)
    local v19 = v18.props.isLoading and v18.loadingEntries or v18.props.conversations;
    return l_UIBlox_0.Style.withStyle(function(v20) --[[ Line: 82 ]]
        -- upvalues: l_Roact_0 (ref), l_FilteredScrollingList_0 (ref), v18 (copy), v19 (copy), v7 (ref)
        local l_Theme_0 = v20.Theme;
        local l_Font_0 = v20.Font;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            dividerTop = l_Roact_0.createElement("Frame", {
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                LayoutOrder = 1
            }), 
            filterBoxContainer = l_Roact_0.createElement(l_FilteredScrollingList_0, {
                searchBoxHeight = 48, 
                searchBackgroundColor3 = l_Theme_0.UIMuted.Color, 
                searchBackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
                searchIconCellWidth = 60, 
                searchIconSize = 24, 
                searchIconColor3 = l_Theme_0.TextDefault.Color, 
                searchIconTransparency = l_Theme_0.TextDefault.Transparency, 
                searchIconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png", 
                searchInputTextFont = l_Font_0.Body.Font, 
                searchInputTextColor3 = l_Theme_0.TextDefault.Color, 
                searchInputTextSize = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize, 
                searchInputTextTransparency = l_Theme_0.TextDefault.Transparency, 
                searchPlaceholderTextTransparency = l_Theme_0.PlaceHolder.Transparency, 
                searchPlaceholderTextColor3 = l_Theme_0.TextDefault.Color, 
                searchPlaceholderText = v18.props.filterBoxPlaceHolderText, 
                searchClearIconColor3 = l_Theme_0.TextDefault.Color, 
                searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png", 
                searchDividerColor3 = l_Theme_0.Divider.Color, 
                searchDividerTransparency = l_Theme_0.Divider.Transparency, 
                searchDividerHeight = 1, 
                scrollBarImageTransparency = v20.Theme.UIDefault.Transparency, 
                scrollBarImageColor3 = v20.Theme.UIDefault.Color, 
                entries = v19, 
                renderEntry = v18.renderConversationCell, 
                entryHeight = v18.props.entryHeight, 
                scrollTouchedBottomCallback = v18.props.touchedBottomCallback, 
                filterPredicate = v18.props.searchFilterPredicate, 
                sortComparator = v7, 
                LayoutOrder = 2
            })
        });
    end);
end;
return v9;