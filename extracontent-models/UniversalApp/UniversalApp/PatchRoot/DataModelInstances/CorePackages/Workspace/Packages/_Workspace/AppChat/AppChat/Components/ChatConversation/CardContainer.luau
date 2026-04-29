local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Foundation = require(AppChatParent.Foundation)
local React = require(AppChatParent.React)
local SocialCards = require(AppChatParent.SocialCards)
local useLocalUserId = require(AppChatParent.RobloxAppHooks).useLocalUserId
local useChatPagePadding = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local useChatPlacementContext = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local Cards = SocialCards.Cards
local UserTile = require(AppChatParent.UserTile).UserTile
local LayoutMode = require(AppChatParent.UserTile).LayoutMode
local UserPresence = require(AppChatParent.Foundation).Enums.UserPresence
local useTokens = Foundation.Hooks.useTokens

return function(t1: {[any]: any}) --[[ CardContainer ]] -- line: 28
	-- upvalues: useLocalUserId (copy), useTokens (copy), useChatPagePadding (copy), useChatPlacementContext (copy), React (copy), Foundation (copy), UserTile (copy), LayoutMode (copy), UserPresence (copy), Cards (copy)
	local v15 = useLocalUserId()
	local v16 = tostring(v15) == t1.senderTargetId
	local v17 = useTokens()
	local v18 = useChatPagePadding()
	local v19 = useChatPlacementContext()
	local v20 = React.useMemo(function() -- line: 35
		-- upvalues: v17 (copy)
		return Vector2.new(v17.Size.Size_700, v17.Size.Size_700)
	end, { v17 })
	local Size_200 = v17.Size.Size_200
	local v22 = if t1.senderTargetId then if not v16 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center

	return React.createElement(Foundation.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		testId = t1.testId,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = v22,
			Padding = UDim.new(0, Size_200),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		},
		padding = {
			left = UDim.new(0, v18.left),
			right = UDim.new(0, v18.right),
			top = UDim.new(0, v17.Padding.XSmall)
		}
	}, {
		Avatar = if not t1.senderTargetId or v15 == t1.senderTargetId then nil else React.createElement(Foundation.View, {
			Size = UDim2.new(0, v20.X, 0, v20.Y),
			LayoutOrder = not v16 and 1 or 2
		}, { React.createElement(UserTile, {
			userId = t1.senderTargetId,
			layoutMode = LayoutMode.compact,
			userPresenceType = UserPresence.None
		}) }),
		Cards = if not t1.cards then nil else React.createElement(Foundation.View, {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, not t1.senderTargetId and 0 or -(v20.X + Size_200), 0, 0),
			LayoutOrder = not v16 and 2 or 1
		}, React.createElement(Cards, {
			analyticsInfo = {
				moduleLocation = v19.chatPlacement
			},
			anchorPoint = if not v16 then Vector2.new(0, 0) else Vector2.new(1, 0),
			position = if not v16 then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
			cards = t1.cards
		}))
	})
end
