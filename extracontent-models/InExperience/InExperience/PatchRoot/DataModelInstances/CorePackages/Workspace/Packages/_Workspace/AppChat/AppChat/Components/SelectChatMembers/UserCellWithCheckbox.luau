local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local Foundation = require(AppChatParent.Foundation)
local SignalsReact = require(AppChatParent.SignalsReact)
local Text = require(AppChatParent.AppCommonLib).Text
local useSignalState = SignalsReact.useSignalState
local GetSelectedUsersStore = require(AppChat.Stores.GetSelectedUsersStore)
local useUserData = require(AppChat.Hooks.useUserData)
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagEnableBlackbirdCheck = require(AppChatParent.SharedFlags).FFlagEnableBlackbirdCheck
local useIsRobloxSubscriber = require(AppChatParent.UserProfiles).Hooks.useIsRobloxSubscriber
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local DomLocators = require(AppChat.Utils.DomLocators)

local function noOp() -- line: 31
end

local v16 = string.rep("W", 20)

return React.memo(function(t1: {[any]: any}) -- line: 37
	-- upvalues: useUserData (copy), Foundation (copy), useIsRobloxSubscriber (copy), FFlagEnableBlackbirdCheck (copy), GetSelectedUsersStore (copy), useSignalState (copy), React (copy), Text (copy), v16 (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), noOp (copy), FFlagEnableAppChatFocusableFixes (copy)
	local v18 = useUserData(t1.userId)
	local v19 = Foundation.Hooks.useTokens()
	local v20 = useIsRobloxSubscriber(if not FFlagEnableBlackbirdCheck then nil else t1.userId)
	local v21 = GetSelectedUsersStore(false)
	local v22 = useSignalState(v21.getIsUserSelected(t1.userId))
	local v23 = React.useCallback(function() -- line: 46
		-- upvalues: v21 (copy), t1 (copy)
		v21.toggleUserId(t1.userId)
	end, { t1.userId })
	local v24 = React.useMemo(function() -- line: 50
		-- upvalues: Text (copy), v16 (copy), v19 (copy)
		local v29 = Text.GetTextBounds(v16, v19.Typography.TitleLarge.Font, v19.Typography.TitleLarge.FontSize, Vector2.zero)

		return UDim2.fromOffset(v29.X, v29.Y)
	end, {
		v19.Typography.TitleLarge.Font,
		v19.Typography.TitleLarge.FontSize
	})
	local v25 = React.useMemo(function() -- line: 60
		-- upvalues: Text (copy), v19 (copy)
		local v30 = Text.GetTextBounds("Roblox Studio", v19.Typography.CaptionMedium.Font, v19.Typography.CaptionMedium.FontSize, Vector2.zero)

		return UDim2.fromOffset(v30.X, v30.Y)
	end, {
		v19.Typography.CaptionMedium.Font,
		v19.Typography.CaptionMedium.FontSize
	})
	local v26 = nil
	local u27 = nil

	if FFlagDebugAppChatEnableDomLocators then
		local v28

		v26, v28 = React.useState("")
		u27 = v28
		React.__subscribeToBinding(v18.username, function(p1) -- line: 73
			-- upvalues: u27 (ref)
			u27(p1)
		end)
	end

	return React.createElement(Foundation.View, {
		tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center",
		onActivated = v23,
		testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.selectChatMembersUserCellWithCheckbox(v26, v22)
	}, {
		Avatar = React.createElement(Foundation.Avatar, {
			userId = v18.id,
			userPresence = v18.presence,
			size = Foundation.Enums.InputSize.Medium,
			backgroundStyle = v19.Color.Shift.Shift_300,
			LayoutOrder = 1
		}),
		UserInfo = React.createElement(Foundation.View, {
			tag = "col fill auto-y clip",
			LayoutOrder = 2
		}, {
			UserDataSkeleton = React.createElement(Foundation.Skeleton, {
				Size = UDim2.new(v24.X, v24.Y + v25.Y),
				Visible = v18.isLoading,
				LayoutOrder = 1
			}),
			DisplayNameRow = if not FFlagEnableBlackbirdCheck then nil else React.createElement(Foundation.View, {
				tag = "row auto-xy align-y-center gap-xsmall",
				LayoutOrder = 1,
				Visible = v18.isLoading:map(function(p2) -- line: 106
					return not p2
				end)
			}, {
				DisplayName = React.createElement(Foundation.Text, {
					tag = "auto-xy text-title-large text-truncate-end content-emphasis",
					Text = v18.combinedName,
					LayoutOrder = 1
				}),
				SubscriptionBadge = if not v20 then nil else React.createElement(Foundation.Icon, {
					LayoutOrder = 2,
					name = Foundation.Enums.IconName.RobloxPlus,
					size = Foundation.Enums.IconSize.Small,
					style = v19.Color.Content.Emphasis
				})
			}),
			DisplayName = if FFlagEnableBlackbirdCheck then nil else React.createElement(Foundation.Text, {
				tag = "auto-xy text-title-large text-truncate-end content-emphasis",
				Text = v18.combinedName,
				LayoutOrder = 1,
				Visible = v18.isLoading:map(function(p3) -- line: 130
					return not p3
				end)
			}),
			PresenceText = React.createElement(Foundation.Text, {
				tag = "auto-xy text-caption-medium text-truncate-end content-muted",
				Text = v18.presenceText,
				LayoutOrder = 3,
				Visible = v18.isLoading:map(function(p4) -- line: 139
					return not p4
				end)
			})
		}),
		CheckboxContainer = React.createElement(Foundation.View, {
			tag = "auto-xy padding-x-medium",
			onActivated = noOp,
			isDisabled = true,
			LayoutOrder = 3,
			selection = if not FFlagEnableAppChatFocusableFixes then nil else {
				Selectable = false
			}
		}, {
			checkbox = React.createElement(Foundation.Checkbox, {
				label = "",
				isChecked = v22,
				size = Foundation.Enums.InputSize.XSmall,
				onActivated = noOp,
				Selectable = not FFlagEnableAppChatFocusableFixes and nil
			})
		})
	})
end)
