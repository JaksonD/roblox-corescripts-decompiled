local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local Foundation = require(AppChatParent.Foundation)
local useTokens = Foundation.Hooks.useTokens
local useSignalState = require(AppChatParent.SignalsReact).useSignalState
local GetSelectedUsersStore = require(AppChat.Stores.GetSelectedUsersStore)
local useUserData = require(AppChat.Hooks.useUserData)

return React.memo(function(t1: {[any]: any}) --[[ MemberEntry ]] -- line: 23
	-- upvalues: useTokens (copy), GetSelectedUsersStore (copy), useSignalState (copy), useUserData (copy), React (copy), Foundation (copy)
	local v10 = useTokens()
	local v11 = GetSelectedUsersStore(false)
	local v12 = useSignalState(v11.getSelectedUserIdAtIndex(t1.index))
	local v13 = useUserData(v12 or "")
	local v14 = React.useCallback(function() -- line: 30
		-- upvalues: v12 (copy), v11 (copy)
		if v12 then
			v11.removeUserId(v12)
		end
	end, { v12 })

	return React.createElement(Foundation.View, {
		tag = "auto-xy",
		onActivated = if not v12 then nil else v14,
		stateLayer = {
			affordance = Foundation.Enums.StateLayerAffordance.None
		},
		LayoutOrder = t1.index
	}, {
		UserContainer = React.createElement(Foundation.View, {
			tag = "col size-0-full auto-x flex-x-fill align-x-center gap-xsmall"
		}, {
			Avatar = if not v12 then React.createElement(Foundation.Image, {
				tag = "content-emphasis",
				Image = "rbxasset://textures/ui/LuaChatV2/ic-friend-empty-border.png",
				aspectRatio = {
					AspectRatio = 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Height
				},
				Size = UDim2.fromOffset(v10.Semantic.Icon.Size.Large, v10.Semantic.Icon.Size.Large),
				LayoutOrder = 1
			}) else React.createElement(Foundation.Avatar, {
				userId = v13.id,
				userPresence = v13.presence,
				size = Foundation.Enums.InputSize.Large,
				backgroundStyle = v10.Color.Shift.Shift_300,
				LayoutOrder = 1
			}),
			Label = React.createElement(Foundation.Text, {
				tag = "auto-y text-truncate-end text-caption-small",
				Text = v13.combinedName,
				textStyle = v10.Color.Content.Default,
				fontStyle = v10.Typography.CaptionSmall,
				LayoutOrder = 2
			})
		}),
		RemoveIcon = if not v12 then nil else React.createElement(Foundation.View, {
			tag = "auto-xy position-top-right anchor-top-right bg-over-media-0 radius-circle",
			ZIndex = 2
		}, {
			Icon = React.createElement(Foundation.Icon, {
				style = v10.Semantic.Color.Icon.Emphasis,
				name = Foundation.Enums.IconName.CircleX,
				variant = Foundation.Enums.IconVariant.Filled,
				size = Foundation.Enums.IconSize.Small,
				ZIndex = 2
			})
		})
	})
end)
