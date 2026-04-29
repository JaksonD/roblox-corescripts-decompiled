local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local Foundation = require(AppChatParent.Foundation)
local Text = require(AppChatParent.AppCommonLib).Text
local useUserData = require(AppChat.Hooks.useUserData)
local useTokens = Foundation.Hooks.useTokens
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagAppChatShowInvitedStatusInParticipantList = require(AppChat.Flags).FFlagAppChatShowInvitedStatusInParticipantList
local FFlagEnableBlackbirdCheck = require(AppChatParent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(AppChatParent.UserProfiles).Hooks.useIsRobloxSubscriber
local v13 = string.rep("W", 20)
local t1 = {
	showDivider = true
}

return React.memo(function(t2: {[any]: any}) --[[ ParticipantEntry ]] -- line: 36
	-- upvalues: Cryo (copy), t1 (copy), useUserData (copy), useTokens (copy), useIsRobloxSubscriber (copy), FFlagEnableBlackbirdCheck (copy), React (copy), Text (copy), v13 (copy), Foundation (copy), FFlagAppChatShowInvitedStatusInParticipantList (copy), FFlagEnableAppChatFocusableFixes (copy)
	local v16 = Cryo.Dictionary.union(t1, t2)
	local v17 = useUserData(v16.userId)
	local v18 = useTokens()
	local v19 = useIsRobloxSubscriber(if not FFlagEnableBlackbirdCheck then nil else v16.userId)
	local v20 = React.useCallback(function() -- line: 43
		-- upvalues: v16 (copy)
		if v16.onActivated then
			v16.onActivated()
		end
	end, { v16.onActivated })
	local v21 = React.useMemo(function() -- line: 49
		-- upvalues: Text (copy), v13 (copy), v18 (copy)
		local v23 = Text.GetTextBounds(v13, v18.Typography.TitleLarge.Font, v18.Typography.TitleLarge.FontSize, Vector2.zero)

		return UDim2.fromOffset(v23.X, v23.Y)
	end, {
		v18.Typography.TitleLarge.Font,
		v18.Typography.TitleLarge.FontSize
	})
	local v22 = React.useMemo(function() -- line: 59
		-- upvalues: Text (copy), v18 (copy)
		local v24 = Text.GetTextBounds("Roblox Studio", v18.Typography.CaptionMedium.Font, v18.Typography.CaptionMedium.FontSize, Vector2.zero)

		return UDim2.fromOffset(v24.X, v24.Y)
	end, {
		v18.Typography.CaptionMedium.Font,
		v18.Typography.CaptionMedium.FontSize
	})

	return React.createElement(Foundation.View, {
		Name = "ParticipantEntryContainer",
		tag = {
			["row align-y-center gap-medium size-full padding-x-medium"] = true,
			["stroke-thin stroke-muted"] = v16.showDivider
		},
		onActivated = if not v16.onActivated then nil else v20
	}, {
		Avatar = React.createElement(Foundation.Avatar, {
			userId = v17.id,
			userPresence = v17.presence,
			size = Foundation.Enums.InputSize.Medium,
			backgroundStyle = v18.Color.Shift.Shift_300,
			LayoutOrder = 1
		}),
		UserInfo = React.createElement(Foundation.View, {
			tag = "col fill auto-y clip",
			LayoutOrder = 2
		}, {
			UserDataSkeleton = React.createElement(Foundation.Skeleton, {
				Size = UDim2.new(v21.X, v21.Y + v22.Y),
				Visible = v17.isLoading,
				LayoutOrder = 1
			}),
			DisplayName = if not FFlagEnableBlackbirdCheck or not v19 then React.createElement(Foundation.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				Text = v17.combinedName,
				LayoutOrder = 1,
				Visible = v17.isLoading:map(function(p1) -- line: 118
					return not p1
				end)
			}) else React.createElement(Foundation.View, {
				tag = "row align-y-center gap-xxsmall auto-xy",
				LayoutOrder = 1,
				Visible = v17.isLoading:map(function(p2) -- line: 98
					return not p2
				end)
			}, {
				NameText = React.createElement(Foundation.Text, {
					tag = "shrink auto-xy text-title-large text-truncate-end content-emphasis",
					Text = v17.combinedName,
					LayoutOrder = 1
				}),
				SubscriptionBadge = React.createElement(Foundation.Icon, {
					LayoutOrder = 2,
					name = Foundation.Enums.IconName.RobloxPlus,
					size = Foundation.Enums.IconSize.Small,
					style = v18.Color.Content.Emphasis
				})
			}),
			PresenceText = React.createElement(Foundation.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				Text = if not FFlagAppChatShowInvitedStatusInParticipantList or not v16.statusText then v17.presenceText else v17.presenceText:map(function(s1: string) -- line: 126
					-- upvalues: v16 (copy)
					return s1 .. " . " .. v16.statusText
				end),
				LayoutOrder = 3,
				Visible = v17.isLoading:map(function(p3) -- line: 131
					return not p3
				end)
			})
		}),
		ChildrenContainer = if not v16.children then nil else React.createElement(Foundation.View, {
			tag = "row align-x-right align-y-center auto-y",
			LayoutOrder = 3,
			selection = if not FFlagEnableAppChatFocusableFixes then nil else {
				Selectable = false
			},
			stateLayer = {
				affordance = Foundation.Enums.StateLayerAffordance.None
			}
		}, v16.children)
	})
end)
