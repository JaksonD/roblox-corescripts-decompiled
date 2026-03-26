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
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableDomLocators);
local v23 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local v24 = require(l_script_FirstAncestor_0.Hooks.useIsChatUserMessagesEnabled);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v32 = {
    participants = {}, 
    localUserId = nil, 
    conversation = nil, 
    conversationId = nil, 
    isGroupConversation = false, 
    topBarHeight = 0, 
    shouldShowCreateUnfilteredChat = false, 
    shouldHideGroupChatFunctionality = false, 
    shouldShowAddFriends = true, 
    navigateBack = function() --[[ Line: 85 ]] --[[ Name: navigateBack ]]

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
    onGroupNameEntryCellActivated = function(_) --[[ Line: 100 ]] --[[ Name: onGroupNameEntryCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage");
    end, 
    onAddFriendsCellActivated = function(_) --[[ Line: 103 ]] --[[ Name: onAddFriendsCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage");
    end, 
    onLeaveGroupCellActivated = function(_) --[[ Line: 106 ]] --[[ Name: onLeaveGroupCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage");
    end, 
    onParticipantCellActivated = function(_) --[[ Line: 109 ]] --[[ Name: onParticipantCellActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onParticipantCellActivated was not passed to ChatDetailsPage");
    end, 
    onConversationTypeIconActivated = function(_) --[[ Line: 112 ]] --[[ Name: onConversationTypeIconActivated ]]
        -- upvalues: v2 (copy)
        v2:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage");
    end, 
    onCreateUnfilteredChatCellActivated = function(_) --[[ Line: 115 ]] --[[ Name: onCreateUnfilteredChatCellActivated ]]
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
ChatDetailsPage = function(v33) --[[ Line: 133 ]] --[[ Name: ChatDetailsPage ]]
    -- upvalues: v3 (copy), v32 (copy), l_useTextSizeOffset_0 (copy), l_useTokens_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), v19 (copy), v2 (copy), l_useCallback_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v24 (copy), v4 (copy), v20 (copy), v11 (copy), v12 (copy), l_Images_0 (copy), v13 (copy), v14 (copy), v15 (copy), v22 (copy), v23 (copy), v17 (copy), v18 (copy)
    local v34 = v3.Dictionary.join(v32, v33);
    local l_style_0 = v34.style;
    local v36 = l_useTextSizeOffset_0();
    local v37 = l_useTokens_0();
    local v38 = if l_FFlagEnableAppChatFocusableFixes_0 then v37.Size.Size_1200 + 2 * v36 else 48 + 2 * v36;
    local v39 = v19();
    local v40 = {
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
    local function v41() --[[ Line: 158 ]]
        -- upvalues: v34 (copy)
        v34.onGroupNameEntryCellActivated(v34.conversation);
    end;
    local function v42() --[[ Line: 162 ]]
        -- upvalues: v34 (copy)
        v34.onAddFriendsCellActivated(v34.conversation);
    end;
    local function v43() --[[ Line: 166 ]]
        -- upvalues: v34 (copy)
        v34.onLeaveGroupCellActivated(v34.conversation);
    end;
    local function v45(v44) --[[ Line: 170 ]]
        -- upvalues: v2 (ref), v34 (copy)
        v2:info("onParticipantCellActivated: {}", v44.id);
        if v44.isLocalUser then
            return;
        else
            v34.onParticipantCellActivated(v44.id);
            return;
        end;
    end;
    local v46 = l_useCallback_0(function() --[[ Line: 179 ]]
        -- upvalues: v34 (copy)
        v34.onCreateUnfilteredChatCellActivated(v34.conversation);
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v34.conversation
    } else l_dependencyArray_0(v34.conversation));
    local v50 = l_useCallback_0(function(_, v48, v49) --[[ Line: 184 ]]
        -- upvalues: v34 (copy)
        if not v34.wideMode and v48 == Enum.SwipeDirection.Right and v49 == 1 then
            v34.navigateBack();
        end;
    end);
    local v51 = 0;
    for _, _ in pairs(v34.participants) do
        v51 = v51 + 1;
    end;
    local v54 = v24();
    local l_shouldShowAddFriends_0 = v34.shouldShowAddFriends;
    local v56 = (if l_shouldShowAddFriends_0 then v51 + 1 else v51) * v38;
    local v57 = v56 + 8 * v38;
    local v58 = not v54;
    return v4.createElement("TextButton", {
        AutoButtonColor = false, 
        BackgroundColor3 = l_style_0.Theme.BackgroundDefault.Color, 
        BorderSizePixel = 0, 
        LayoutOrder = v34.LayoutOrder, 
        Size = UDim2.new(1, 0, 1, 0), 
        Text = "", 
        Transparency = l_style_0.Tokens.Global.Color.None.Transparency, 
        [v4.Event.TouchSwipe] = v50, 
        Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
    }, {
        ScrollingContent = v4.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, 0), 
            CanvasSize = UDim2.new(1, 0, 0, v20 and 0 or v57), 
            AutomaticCanvasSize = if v20 then Enum.AutomaticSize.Y else nil, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScrollBarThickness = 0, 
            LayoutOrder = v34.LayoutOrder, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
        }, {
            UIListLayout = v4.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ChatGroupHeader = v34.isGroupConversation and v4.createElement(v11, {
                marginTop = if v39 then v40.ChatGroupHeader.marginTop else 20, 
                marginBottom = if v39 then v40.ChatGroupHeader.marginBottom else nil, 
                LayoutOrder = 1, 
                Text = v34.chatGroupText, 
                style = v34.style
            }), 
            GroupNameEntryCell = v34.isGroupConversation and v4.createElement(v12, {
                LayoutOrder = 2, 
                groupNameText = v34.conversationTitle, 
                iconImage = l_Images_0["icons/actions/edit/edit"], 
                isDisabled = v34.shouldHideGroupChatFunctionality or v58, 
                cellHeight = v38, 
                paddingBottom = if v39 then v40.GroupNameEntryCell.paddingBottom else nil, 
                onActivated = v41, 
                style = v34.style
            }), 
            MembersHeader = v4.createElement(v11, {
                LayoutOrder = 3, 
                marginTop = if v39 then v40.MembersHeader.marginTop else 14, 
                marginBottom = if v39 then v40.MembersHeader.marginBottom else 8, 
                Text = v34.membersText, 
                style = v34.style
            }), 
            MembersFrame = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v56), 
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
                    Text = v34.addFriendsText, 
                    iconImage = l_Images_0["icons/actions/edit/add"], 
                    cellHeight = v38, 
                    onActivated = v42, 
                    style = v34.style
                }) else nil, 
                ParticipantList = v4.createElement(v14, {
                    LayoutOrder = 2, 
                    entries = v34.participants, 
                    entryHeight = v38, 
                    onlinePresenceText = v34.onlinePresenceText, 
                    offlinePresenceText = v34.offlinePresenceText, 
                    childWidth = 120, 
                    onEntryActivated = v45
                })
            }), 
            LeaveGroupCell = v34.isGroupConversation and v4.createElement(v15, {
                LayoutOrder = 5, 
                leaveGroupText = v34.leaveGroupText, 
                iconImage = l_Images_0["icons/controls/vehicle/exit"], 
                cellHeight = v38, 
                onActivated = v43, 
                style = v34.style, 
                testId = if v22 then v23.chatDetailsListActionButton("leaveGroup") else nil
            }), 
            ConversationTypeHeader = if v54 then v4.createElement(v11, {
                LayoutOrder = 6, 
                marginTop = 26, 
                Text = v34.conversationTypeHeaderText, 
                style = v34.style
            }) else nil, 
            ConversationTypeCell = if v54 then v4.createElement(v17, {
                layoutOrder = 7, 
                bodyText = v34.conversationTypeText, 
                iconImage = l_Images_0["icons/actions/info"], 
                onIconActivated = v34.onConversationTypeIconActivated, 
                style = v34.style
            }) else nil, 
            CreateUnfilteredChatCell = if v54 and v34.shouldShowCreateUnfilteredChat then v4.createElement(v18, {
                layoutOrder = 8, 
                bodyText = v34.createUnfilteredChatText, 
                subTitleText = v34.createUnfilteredChatSubTitleText, 
                iconImage = l_Images_0["icons/actions/edit/copy"], 
                cellHeight = v38, 
                isLoading = v34.isCreateUnfilteredChatLoading, 
                conversationId = v34.conversationId, 
                onActivated = v46, 
                style = v34.style
            }) else nil
        })
    });
end;
return l_memo_0(ChatDetailsPage);