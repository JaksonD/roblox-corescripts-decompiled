local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Logger = require(script.Parent.Logger)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local useCallback = React.useCallback
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local memo = React.memo
local Images = require(AppChatParent.UIBlox).App.ImageSet.Images
local useTextSizeOffset = require(AppChatParent.UIBlox).Core.Style.useTextSizeOffset
local useTokens = require(AppChatParent.Foundation).Hooks.useTokens
local SectionHeader = require(script.Parent.SectionHeader)
local GroupNameEntryCell = require(script.Parent.GroupNameEntryCell)
local AddFriendsEntry = require(script.Parent.AddFriendsEntry)
local ParticipantList = require(script.Parent.ParticipantList)
local LeaveGroupCell = require(script.Parent.LeaveGroupCell)
local TestStyle = require(AppChat.SocialLibraries).Components.TestStyle
local ConversationTypeCell = require(script.Parent.UnfilteredThreads.ConversationTypeCell)
local CreateUnfilteredChatCell = require(script.Parent.UnfilteredThreads.CreateUnfilteredChatCell)
local useIsAppChatVerticallyConstrained = require(AppChat.App.Hooks.useIsAppChatVerticallyConstrained)
local v21 = game:DefineFastFlag("AppChatDetailsPageAutomaticCanvasSize", false)
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocators = require(AppChat.Utils.DomLocators)
local useIsChatUserMessagesEnabled = require(AppChat.Hooks.useIsChatUserMessagesEnabled)
local FFlagRemoveDependencyArrayAntipattern = require(AppChatParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	participants = {},
	localUserId = nil,
	conversation = nil,
	conversationId = nil,
	isGroupConversation = false,
	topBarHeight = 0,
	shouldShowCreateUnfilteredChat = false,
	shouldHideGroupChatFunctionality = false,
	shouldShowAddFriends = true,
	navigateBack = function() --[[ navigateBack ]] -- line: 86
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
	onGroupNameEntryCellActivated = function(_) --[[ onGroupNameEntryCellActivated ]] -- line: 101
		-- upvalues: Logger (copy)
		Logger:warning("onGroupNameEntryCellActivated was not passed to ChatDetailsPage")
	end,
	onAddFriendsCellActivated = function(_) --[[ onAddFriendsCellActivated ]] -- line: 104
		-- upvalues: Logger (copy)
		Logger:warning("onAddFriendsCellActivated was not passed to ChatDetailsPage")
	end,
	onLeaveGroupCellActivated = function(_) --[[ onLeaveGroupCellActivated ]] -- line: 107
		-- upvalues: Logger (copy)
		Logger:warning("onLeaveGroupCellActivated was not passed to ChatDetailsPage")
	end,
	onParticipantCellActivated = function(_, _) --[[ onParticipantCellActivated ]] -- line: 110
		-- upvalues: Logger (copy)
		Logger:warning("onParticipantCellActivated was not passed to ChatDetailsPage")
	end,
	onConversationTypeIconActivated = function(_) --[[ onConversationTypeIconActivated ]] -- line: 113
		-- upvalues: Logger (copy)
		Logger:warning("onConversationTypeIconActivated was not passed to ChatDetailsPage")
	end,
	onCreateUnfilteredChatCellActivated = function(_) --[[ onCreateUnfilteredChatCellActivated ]] -- line: 116
		-- upvalues: Logger (copy)
		Logger:warning("onCreateUnfilteredChatCellActivated was not passed to ChatDetailsPage")
	end,
	LayoutOrder = 0,
	style = Cryo.Dictionary.join(TestStyle, {
		Tokens = {
			Global = {
				Color = {
					None = {}
				}
			}
		}
	})
}

function ChatDetailsPage(t2: {[any]: any}) -- line: 134
	-- upvalues: Cryo (copy), t1 (copy), useTextSizeOffset (copy), useTokens (copy), FFlagEnableAppChatFocusableFixes (copy), useIsAppChatVerticallyConstrained (copy), Logger (copy), useCallback (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), useIsChatUserMessagesEnabled (copy), React (copy), v21 (copy), SectionHeader (copy), GroupNameEntryCell (copy), Images (copy), AddFriendsEntry (copy), ParticipantList (copy), LeaveGroupCell (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), ConversationTypeCell (copy), CreateUnfilteredChatCell (copy)
	local v36 = Cryo.Dictionary.join(t1, t2)
	local style = v36.style
	local v38 = useTextSizeOffset()
	local v39 = useTokens()
	local v40 = if not FFlagEnableAppChatFocusableFixes then 48 + 2 * v38 else v39.Size.Size_1200 + 2 * v38
	local v41 = useIsAppChatVerticallyConstrained()
	local t3 = {
		ChatGroupHeader = {
			marginTop = style.Tokens.Global.Size_0,
			marginBottom = style.Tokens.Global.Size_0
		},
		MembersHeader = {
			marginTop = style.Tokens.Global.Size_0,
			marginBottom = style.Tokens.Global.Size_0
		},
		GroupNameEntryCell = {
			paddingBottom = style.Tokens.Global.Size_0
		}
	}
	local v43 = useCallback(function() -- line: 180
		-- upvalues: v36 (copy)
		v36.onCreateUnfilteredChatCellActivated(v36.conversation)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v36.conversation) else { v36.conversation })
	local v44 = useCallback(function(_, p9, p10) -- line: 185
		-- upvalues: v36 (copy)
		if not v36.wideMode and (p9 == Enum.SwipeDirection.Right and p10 == 1) then
			v36.navigateBack()
		end
	end)
	local n1 = 0

	for _, _ in pairs(v36.participants) do
		n1 += 1
	end

	local v48 = useIsChatUserMessagesEnabled()
	local shouldShowAddFriends = v36.shouldShowAddFriends
	local v50 = ((if not shouldShowAddFriends then n1 else n1 + 1)) * v40
	local v51 = v50 + 8 * v40

	return React.createElement("TextButton", {
		AutoButtonColor = false,
		BackgroundColor3 = style.Theme.BackgroundDefault.Color,
		BorderSizePixel = 0,
		LayoutOrder = v36.LayoutOrder,
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Transparency = style.Tokens.Global.Color.None.Transparency,
		[React.Event.TouchSwipe] = v44,
		Selectable = not FFlagEnableAppChatFocusableFixes and nil
	}, {
		ScrollingContent = React.createElement("ScrollingFrame", {
			Size = UDim2.new(1, 0, 1, 0),
			CanvasSize = UDim2.new(1, 0, 0, if not v21 then v51 else 0),
			AutomaticCanvasSize = if not v21 then nil else Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ScrollBarThickness = 0,
			LayoutOrder = v36.LayoutOrder,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			Selectable = not FFlagEnableAppChatFocusableFixes and nil
		}, {
			UIListLayout = React.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			ChatGroupHeader = v36.isGroupConversation and React.createElement(SectionHeader, {
				marginTop = not v41 and 20 or t3.ChatGroupHeader.marginTop,
				marginBottom = if not v41 then nil else t3.ChatGroupHeader.marginBottom,
				LayoutOrder = 1,
				Text = v36.chatGroupText,
				style = v36.style
			}),
			GroupNameEntryCell = v36.isGroupConversation and React.createElement(GroupNameEntryCell, {
				LayoutOrder = 2,
				groupNameText = v36.conversationTitle,
				iconImage = Images["icons/actions/edit/edit"],
				isDisabled = v36.shouldHideGroupChatFunctionality or not v48,
				cellHeight = v40,
				paddingBottom = if not v41 then nil else t3.GroupNameEntryCell.paddingBottom,
				onActivated = function() -- line: 159
					-- upvalues: v36 (copy)
					v36.onGroupNameEntryCellActivated(v36.conversation)
				end,
				style = v36.style
			}),
			MembersHeader = React.createElement(SectionHeader, {
				LayoutOrder = 3,
				marginTop = not v41 and 14 or t3.MembersHeader.marginTop,
				marginBottom = not v41 and 8 or t3.MembersHeader.marginBottom,
				Text = v36.membersText,
				style = v36.style
			}),
			MembersFrame = React.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, v50),
				BackgroundColor3 = style.Theme.BackgroundDefault.Color,
				BackgroundTransparency = style.Tokens.Global.Color.None.Transparency,
				BorderSizePixel = 0,
				LayoutOrder = 4
			}, {
				UIListLayout = React.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				AddFriendsCell = if not shouldShowAddFriends then nil else React.createElement(AddFriendsEntry, {
					LayoutOrder = 1,
					Text = v36.addFriendsText,
					iconImage = Images["icons/actions/edit/add"],
					cellHeight = v40,
					onActivated = function() -- line: 163
						-- upvalues: v36 (copy)
						v36.onAddFriendsCellActivated(v36.conversation)
					end,
					style = v36.style
				}),
				ParticipantList = React.createElement(ParticipantList, {
					activeParticipantId = v36.activeParticipantId,
					LayoutOrder = 2,
					entries = v36.participants,
					entryHeight = v40,
					onlinePresenceText = v36.onlinePresenceText,
					offlinePresenceText = v36.offlinePresenceText,
					childWidth = 120,
					onEntryActivated = function(p11, p12) -- line: 171
						-- upvalues: Logger (copy), v36 (copy)
						Logger:info("onParticipantCellActivated: {}", p11.id)

						if p11.isLocalUser then
							return
						end

						v36.onParticipantCellActivated(p11.id, p12)
					end
				})
			}),
			LeaveGroupCell = v36.isGroupConversation and React.createElement(LeaveGroupCell, {
				LayoutOrder = 5,
				leaveGroupText = v36.leaveGroupText,
				iconImage = Images["icons/controls/vehicle/exit"],
				cellHeight = v40,
				onActivated = function() -- line: 167
					-- upvalues: v36 (copy)
					v36.onLeaveGroupCellActivated(v36.conversation)
				end,
				style = v36.style,
				testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatDetailsListActionButton("leaveGroup")
			}),
			ConversationTypeHeader = if not v48 then nil else React.createElement(SectionHeader, {
				LayoutOrder = 6,
				marginTop = 26,
				Text = v36.conversationTypeHeaderText,
				style = v36.style
			}),
			ConversationTypeCell = if not v48 then nil else React.createElement(ConversationTypeCell, {
				layoutOrder = 7,
				bodyText = v36.conversationTypeText,
				iconImage = Images["icons/actions/info"],
				onIconActivated = v36.onConversationTypeIconActivated,
				style = v36.style
			}),
			CreateUnfilteredChatCell = if not v48 or not v36.shouldShowCreateUnfilteredChat then nil else React.createElement(CreateUnfilteredChatCell, {
				layoutOrder = 8,
				bodyText = v36.createUnfilteredChatText,
				subTitleText = v36.createUnfilteredChatSubTitleText,
				iconImage = Images["icons/actions/edit/copy"],
				cellHeight = v40,
				isLoading = v36.isCreateUnfilteredChatLoading,
				conversationId = v36.conversationId,
				onActivated = v43,
				style = v36.style
			})
		})
	})
end

return memo(ChatDetailsPage)
