local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.Logger);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local l_useCallback_0 = v4.useCallback;
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_memo_0 = v4.memo;
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local l_useTextSizeOffset_0 = require(l_Parent_0.UIBlox).Core.Style.useTextSizeOffset;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v11 = require(script.Parent.SectionHeader);
local v12 = require(script.Parent.GroupNameEntryCell);
local v13 = require(script.Parent.AddFriendsEntry);
local v14 = require(script.Parent.ParticipantList);
local v15 = require(script.Parent.LeaveGroupCell);
local l_TestStyle_0 = require(l_script_FirstAncestor_0.SocialLibraries).Components.TestStyle;
local v17 = require(script.Parent.UnfilteredThreads.ConversationTypeCell);
local v18 = require(script.Parent.UnfilteredThreads.CreateUnfilteredChatCell);
local v19 = require(l_script_FirstAncestor_0.App.Hooks.useIsAppChatVerticallyConstrained);
local v20 = game:DefineFastFlag("AppChatDetailsPageAutomaticCanvasSize", false);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v22 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local v29 = {
    participants = {}, 
    localUserId = nil, 
    conversation = nil, 
    conversationId = nil, 
    isGroupConversation = false, 
    topBarHeight = 0, 
    shouldShowCreateUnfilteredChat = false, 
    shouldHideGroupChatFunctionality = false, 
    shouldShowAddFriends = true, 
    navigateBack = function() --[[ Line: 81 ]] --[[ Name: navigateBack ]]

    end, 
    conversationTitle = "PlaceholderTitle", 
    pageHeaderText = "localizedText.ChatDetails", 
    generalText = "localizedText.General", 
    membersText = "localizedText.Members", 
    addFriendsText = "localizedText.AddFriends", 
    leaveGroupText = "localizedText.LeaveGroup", 
    onlinePresenceText = "localizedText.OnlineText", 
    offlinePresenceText = "localizedText.OfflineText", 
    conversationTypeHeaderText = "Expressive Chat Features", 
    conversationTypeText = "localizedText.ConversationTypeText", 
    createUnfilteredChatText = "Create new chat without filters", 
    createUnfilteredChatSubTitleText = "All members of this conversation will be invited, but some are not eligible to join.", 
    onGroupNameEntryCellActivated = function(_) --[[ Line: 96 ]] --[[ Name: onGroupNameEntryCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage");
    end, 
    onAddFriendsCellActivated = function(_) --[[ Line: 99 ]] --[[ Name: onAddFriendsCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage");
    end, 
    onLeaveGroupCellActivated = function(_) --[[ Line: 102 ]] --[[ Name: onLeaveGroupCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage");
    end, 
    onParticipantCellActivated = function(_) --[[ Line: 105 ]] --[[ Name: onParticipantCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onParticipantCellActivated was not passed to ChatDetailsPage");
    end, 
    onConversationTypeIconActivated = function(_) --[[ Line: 108 ]] --[[ Name: onConversationTypeIconActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage");
    end, 
    onCreateUnfilteredChatCellActivated = function(_) --[[ Line: 111 ]] --[[ Name: onCreateUnfilteredChatCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage");
    end, 
    LayoutOrder = 0, 
    style = v3.Dictionary.join(l_TestStyle_0, {
        Tokens = {
            Global = {
                Color = {
                    None = {}
                }
            }
        }
    })
};
ChatDetailsPage = function(v30) --[[ Line: 129 ]] --[[ Name: ChatDetailsPage ]]
    -- upvalues: v3 (copy), v29 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v19 (copy), v2 (copy), l_useCallback_0 (copy), l_dependencyArray_0 (copy), v22 (copy), v4 (copy), v20 (copy), v11 (copy), v12 (copy), l_Images_0 (copy), v13 (copy), v14 (copy), v15 (copy), v17 (copy), v18 (copy)
    local v31 = v3.Dictionary.join(v29, v30);
    local l_style_0 = v31.style;
    local v33 = l_useTextSizeOffset_0();
    local v34 = l_useTokens_0();
    local v35 = if l_FFlagEnableAppChatFocusableFixes_0 then v34.Size.Size_1200 + 2 * v33 else 48 + 2 * v33;
    local v36 = v19();
    local v37 = {
        ChatGroupHeader = {
            marginTop = l_style_0.Tokens.Global.Size_0, 
            marginBottom = l_style_0.Tokens.Global.Size_0
        }, 
        MembersHeader = {
            marginTop = l_style_0.Tokens.Global.Size_0, 
            marginBottom = l_style_0.Tokens.Global.Size_0
        }, 
        GroupNameEntryCell = {
            paddingBottom = l_style_0.Tokens.Global.Size_0
        }
    };
    local function v38() --[[ Line: 154 ]]
        -- upvalues: v31 (copy)
        v31.onGroupNameEntryCellActivated(v31.conversation);
    end;
    local function v39() --[[ Line: 158 ]]
        -- upvalues: v31 (copy)
        v31.onAddFriendsCellActivated(v31.conversation);
    end;
    local function v40() --[[ Line: 162 ]]
        -- upvalues: v31 (copy)
        v31.onLeaveGroupCellActivated(v31.conversation);
    end;
    local function v42(v41) --[[ Line: 166 ]]
        -- upvalues: v2 (ref), v31 (copy)
        v2:info("onParticipantCellActivated: {}", v41.id);
        if v41.isLocalUser then
            return;
        else
            v31.onParticipantCellActivated(v41.id);
            return;
        end;
    end;
    local v43 = l_useCallback_0(function() --[[ Line: 175 ]]
        -- upvalues: v31 (copy)
        v31.onCreateUnfilteredChatCellActivated(v31.conversation);
    end, l_dependencyArray_0(v31.conversation));
    local v47 = l_useCallback_0(function(_, v45, v46) --[[ Line: 180 ]]
        -- upvalues: v31 (copy)
        if not v31.wideMode and v45 == Enum.SwipeDirection.Right and v46 == 1 then
            v31.navigateBack();
        end;
    end);
    local v48 = 0;
    for _, _ in pairs(v31.participants) do
        v48 = v48 + 1;
    end;
    local v51 = v22();
    local l_shouldShowAddFriends_0 = v31.shouldShowAddFriends;
    local v53 = (if l_shouldShowAddFriends_0 then v48 + 1 else v48) * v35;
    local v54 = v53 + 8 * v35;
    local v55 = not v51;
    return v4.createElement("TextButton", {
        AutoButtonColor = false, 
        BackgroundColor3 = l_style_0.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = v31.LayoutOrder, 
        Size = UDim2.new(1, 0, 1, 0), 
        Text = "", 
        Transparency = l_style_0.Tokens.Global.Color.None.Transparency, 
        [v4.Event.TouchSwipe] = v47, 
        Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
    }, {
        ScrollingContent = v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, v20 and 0 or v54), 
            AutomaticCanvasSize = if v20 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            LayoutOrder = v31.LayoutOrder, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ChatGroupHeader = v31.isGroupConversation and v4.createElement(v11, {
                marginTop = if v36 then v37.ChatGroupHeader.marginTop else 20, 
                marginBottom = if v36 then v37.ChatGroupHeader.marginBottom else nil, 
                LayoutOrder = 1, 
                Text = v31.chatGroupText, 
                style = v31.style
            }), 
            GroupNameEntryCell = v31.isGroupConversation and v4.createElement(v12, {
                LayoutOrder = 2, 
                groupNameText = v31.conversationTitle, 
                iconImage = l_Images_0["icons/actions/edit/edit"], 
                isDisabled = v31.shouldHideGroupChatFunctionality or v55, 
                cellHeight = v35, 
                paddingBottom = if v36 then v37.GroupNameEntryCell.paddingBottom else nil, 
                onActivated = v38, 
                style = v31.style
            }), 
            MembersHeader = v4.createElement(v11, {
                LayoutOrder = 3, 
                marginTop = if v36 then v37.MembersHeader.marginTop else 14, 
                marginBottom = if v36 then v37.MembersHeader.marginBottom else 8, 
                Text = v31.membersText, 
                style = v31.style
            }), 
            MembersFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v53), 
                BackgroundColor3 = l_style_0.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = l_style_0.Tokens.Global.Color.None.Transparency, 
                BorderSizePixel = 0, 
                LayoutOrder = 4
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                AddFriendsCell = if l_shouldShowAddFriends_0 then v4.createElement(v13, {
                    LayoutOrder = 1, 
                    Text = v31.addFriendsText, 
                    iconImage = l_Images_0["icons/actions/edit/add"], 
                    cellHeight = v35, 
                    onActivated = v39, 
                    style = v31.style
                }) else nil, 
                ParticipantList = v4.createElement(v14, {
                    LayoutOrder = 2, 
                    entries = v31.participants, 
                    entryHeight = v35, 
                    onlinePresenceText = v31.onlinePresenceText, 
                    offlinePresenceText = v31.offlinePresenceText, 
                    childWidth = 120, 
                    onEntryActivated = v42
                })
            }), 
            LeaveGroupCell = v31.isGroupConversation and v4.createElement(v15, {
                LayoutOrder = 5, 
                leaveGroupText = v31.leaveGroupText, 
                iconImage = l_Images_0["icons/controls/vehicle/exit"], 
                cellHeight = v35, 
                onActivated = v40, 
                style = v31.style
            }), 
            ConversationTypeHeader = if v51 then v4.createElement(v11, {
                LayoutOrder = 6, 
                marginTop = 26, 
                Text = v31.conversationTypeHeaderText, 
                style = v31.style
            }) else nil, 
            ConversationTypeCell = if v51 then v4.createElement(v17, {
                layoutOrder = 7, 
                bodyText = v31.conversationTypeText, 
                iconImage = l_Images_0["icons/actions/info"], 
                onIconActivated = v31.onConversationTypeIconActivated, 
                style = v31.style
            }) else nil, 
            CreateUnfilteredChatCell = if v51 and v31.shouldShowCreateUnfilteredChat then v4.createElement(v18, {
                layoutOrder = 8, 
                bodyText = v31.createUnfilteredChatText, 
                subTitleText = v31.createUnfilteredChatSubTitleText, 
                iconImage = l_Images_0["icons/actions/edit/copy"], 
                cellHeight = v35, 
                isLoading = v31.isCreateUnfilteredChatLoading, 
                conversationId = v31.conversationId, 
                onActivated = v43, 
                style = v31.style
            }) else nil
        })
    });
end;
return l_memo_0(ChatDetailsPage);