local ParentParent = script.Parent.Parent
local ParentParentParent = ParentParent.Parent
local dependencies = require(ParentParent.dependencies)
local NotificationTypeEnum = require(ParentParent.type).NotificationTypeEnum
local ShowNotificationSnoozeMenuSignal = require(ParentParent.Signals).ShowNotificationSnoozeMenuSignal
local DismissNotificationSnoozeMenuSignal = require(ParentParent.Signals).DismissNotificationSnoozeMenuSignal
local NotificationSnoozeMenuVisibleSignal = require(ParentParent.Signals).NotificationSnoozeMenuVisibleSignal
local default = require(ParentParent.ToastNotificationSnoozeManager).default
local useTokens = require(ParentParentParent.Foundation).Hooks.useTokens
local Cryo = dependencies.Cryo
local dependencyArray = dependencies.Hooks.dependencyArray
local Localization = dependencies.Localization
local React = dependencies.React
local Roact = dependencies.Roact
local UIBlox = dependencies.UIBlox
local useLocalization = Localization.Hooks.useLocalization
local Colors = UIBlox.App.Style.Colors
local Interactable = UIBlox.Core.Control.Interactable
local useCursor = UIBlox.App.SelectionCursor.useCursor
local useStyle = UIBlox.Core.Style.useStyle
local FocusNavigationUtils = require(ParentParentParent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtils.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtils.FocusNavigationEventNameEnum
local FocusRoot = FocusNavigationUtils.FocusRoot
local InputHandlers = require(ParentParentParent.InputHandlers)

require(ParentParentParent.ReactFocusNavigation)

local FFlagEnableAppChatSnoozeMenuFocus = require(ParentParentParent.SharedFlags).FFlagEnableAppChatSnoozeMenuFocus
local GetFFlagAppChatInExpToastSnoozeMenuDismissFix = require(ParentParentParent.SharedFlags).GetFFlagAppChatInExpToastSnoozeMenuDismissFix
local GetFFlagIsSquadEnabled = require(ParentParentParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagRemoveDependencyArrayAntipattern = require(ParentParentParent.SharedFlags).FFlagRemoveDependencyArrayAntipattern
local t1 = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}
local t2 = {
	[NotificationTypeEnum.ChatNewMessage] = not GetFFlagIsSquadEnabled() and "Feature.Chat.Action.StartChatWithFriends" or "Feature.Squads.Label.Party"
}
local t3 = {
	[1] = {
		textKey = "fifteenMinutes",
		durationMinutes = 15
	},
	[2] = {
		textKey = "fourHours",
		durationMinutes = 240
	},
	[3] = {
		textKey = "oneDay",
		durationMinutes = 1440
	},
	[4] = {
		textKey = "untilITurnItBackOn",
		durationMinutes = -1
	}
}

return function() -- line: 76
	-- upvalues: useStyle (copy), FFlagEnableAppChatSnoozeMenuFocus (copy), useTokens (copy), useLocalization (copy), Cryo (copy), t2 (copy), React (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), ShowNotificationSnoozeMenuSignal (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), DismissNotificationSnoozeMenuSignal (copy), FocusNavigationEventNameEnum (copy), InputHandlers (copy), NotificationSnoozeMenuVisibleSignal (copy), useCursor (copy), t3 (ref), Colors (copy), default (copy), Interactable (copy), FocusRoot (copy), t1 (copy), FocusNavigableSurfaceIdentifierEnum (copy), Roact (copy)
	local v33 = useStyle()
	local v34 = if not FFlagEnableAppChatSnoozeMenuFocus then nil else useTokens()
	local v35 = useLocalization((Cryo.Dictionary.union(t2, {
		fifteenMinutes = "Feature.Notifications.Action.SnoozeFifteenMinutes",
		fourHours = "Feature.Notifications.Action.SnoozeFourHours",
		oneDay = "Feature.Notifications.Action.SnoozeOneDay",
		oneHour = "Feature.Notifications.Action.SnoozeOneHour",
		untilITurnItBackOn = "Feature.Notifications.Action.UntilITurnItBackOn",
		snoozeFeedback = "Feature.Notifications.Heading.SnoozeFeedback"
	})))
	local v36, v37 = React.useState(false)
	local v38, v39 = React.useState({})
	local v40 = React.useCallback(function() -- line: 91
		-- upvalues: v37 (copy)
		v37(false)
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v37) else { v37 })

	React.useEffect(function() -- line: 95
		-- upvalues: ShowNotificationSnoozeMenuSignal (copy), v39 (copy), v37 (copy), GetFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), DismissNotificationSnoozeMenuSignal (copy), v40 (copy)
		local u44 = ShowNotificationSnoozeMenuSignal:connect(function(t4: {[any]: any}) -- line: 97
			-- upvalues: v39 (copy), v37 (copy)
			v39(t4)
			v37(true)
		end)
		local u45 = nil

		if GetFFlagAppChatInExpToastSnoozeMenuDismissFix() then
			u45 = DismissNotificationSnoozeMenuSignal:connect(function() -- line: 109
				-- upvalues: v40 (copy)
				v40()
			end)
		end

		return function() -- line: 114
			-- upvalues: u44 (ref), GetFFlagAppChatInExpToastSnoozeMenuDismissFix (copy), u45 (ref)
			u44:disconnect()

			if GetFFlagAppChatInExpToastSnoozeMenuDismissFix() then
				u45:disconnect()
			end
		end
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v37) else { v37 })

	local v41 = nil

	if FFlagEnableAppChatSnoozeMenuFocus then
		v41 = React.useMemo(function() -- line: 124
			-- upvalues: FocusNavigationEventNameEnum (copy), InputHandlers (copy), v40 (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlers.onRelease(function(p1) -- line: 127
						-- upvalues: v40 (copy)
						v40()
						p1:cancel()
					end)
				}
			}
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v40) else { v40 })
		React.useEffect(function() -- line: 135
			-- upvalues: NotificationSnoozeMenuVisibleSignal (copy), v36 (copy)
			NotificationSnoozeMenuVisibleSignal:fire({
				visible = v36
			})
		end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v36) else { v36 })
	end

	local v42 = if not FFlagEnableAppChatSnoozeMenuFocus then nil else useCursor()
	local v43 = React.useMemo(function() -- line: 142
		-- upvalues: t3 (ref), React (copy), FFlagEnableAppChatSnoozeMenuFocus (copy), v34 (copy), v33 (copy), v42 (copy), v35 (copy), Colors (copy), v38 (copy), default (copy), v37 (copy)
		local t5 = {}

		for i, v in ipairs(t3) do
			local v49 = i

			table.insert(t5, React.createElement("TextButton", {
				Size = UDim2.new(1, 0, 0, not FFlagEnableAppChatSnoozeMenuFocus and 56 or v34.Size.Size_1400),
				BackgroundTransparency = 1,
				Font = v33.Font.Header2.Font,
				LayoutOrder = v49,
				SelectionImageObject = v42,
				Text = v35[v.textKey],
				TextSize = v33.Font.Header2.RelativeSize * v33.Font.BaseSize,
				TextColor3 = Colors.White,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				[React.Event.Activated] = function() -- line: 164
					-- upvalues: v38 (copy), default (copy), v (copy), v35 (copy), v37 (copy)
					if v38.notificationType then
						local notificationType = v38.notificationType

						if type(v38.notificationType) == "table" then
							notificationType = v38.notificationType[1]
						end

						default:snoozeNotification({
							context = v38.context,
							notificationType = v38.notificationType,
							durationMinutes = v.durationMinutes,
							modalMessage = v35.snoozeFeedback:gsub("{title}", v35[notificationType] or ""):gsub("{duration}", v35[v.textKey])
						})
					end

					v37(false)
				end
			}, {
				UIPadding = if not FFlagEnableAppChatSnoozeMenuFocus then nil else React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, v34.Padding.XXLarge),
					PaddingRight = UDim.new(0, v34.Padding.XXLarge)
				}),
				Border = React.createElement("Frame", {
					Size = if not FFlagEnableAppChatSnoozeMenuFocus then UDim2.new(1, 0, 0, 1) else UDim2.new(1, v34.Padding.XXLarge, 0, 1),
					BackgroundTransparency = 0.8,
					BackgroundColor3 = Colors.White,
					LayoutOrder = v49
				})
			}))

			local _ = v49 + 1
		end

		return t5
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v38) else { v38 })

	if v36 then
		return (React.createElement(Interactable, {
			Size = UDim2.fromScale(1, 1),
			AutoButtonColor = false,
			BackgroundColor3 = Colors.Black,
			BackgroundTransparency = 0.6,
			onStateChanged = function() --[[ onStateChanged ]] -- line: 213
			end,
			[React.Event.Activated] = v40
		}, {
			SnoozeMenu = React.createElement(if not FFlagEnableAppChatSnoozeMenuFocus then Interactable else FocusRoot, if not FFlagEnableAppChatSnoozeMenuFocus then {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -16, 0, 0),
				AutoButtonColor = false,
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = v33.Theme.BackgroundDefault.Color,
				BackgroundTransparency = v33.Theme.BackgroundDefault.Transparency,
				onStateChanged = function() --[[ onStateChanged ]] -- line: 242
				end
			} else {
				eventHandlers = v41,
				eventMap = t1,
				frameProps = {
					AnchorPoint = Vector2.new(0.5, 0.5),
					AutomaticSize = Enum.AutomaticSize.Y,
					BackgroundColor3 = v33.Theme.BackgroundDefault.Color,
					BackgroundTransparency = v33.Theme.BackgroundDefault.Transparency,
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.new(1, -v34.Padding.Small * 2, 0, 0)
				},
				isAutoFocusRoot = true,
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
			}, {
				UICorner = React.createElement("UICorner", {
					CornerRadius = UDim.new(0, v33.Tokens.Semantic.Radius.XLarge)
				}),
				UIListLayout = React.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				UIPadding = if not FFlagEnableAppChatSnoozeMenuFocus then React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, 24)
				}) else nil,
				UISizeConstraint = React.createElement("UISizeConstraint", {
					MaxSize = Vector2.new(400, 1e999)
				}),
				TitleContainer = React.createElement("Frame", {
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 1,
					LayoutOrder = 1
				}, {
					UIListLayout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						SortOrder = Enum.SortOrder.LayoutOrder,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					UIPadding = React.createElement("UIPadding", {
						PaddingBottom = UDim.new(0, not FFlagEnableAppChatSnoozeMenuFocus and 20 or v34.Padding.XLarge),
						PaddingRight = UDim.new(0, not FFlagEnableAppChatSnoozeMenuFocus and 24 or v34.Padding.XXLarge),
						PaddingTop = UDim.new(0, not FFlagEnableAppChatSnoozeMenuFocus and 20 or v34.Padding.XLarge),
						PaddingLeft = if not FFlagEnableAppChatSnoozeMenuFocus then nil else UDim.new(0, v34.Padding.XXLarge)
					}),
					Title = React.createElement("TextLabel", {
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						Font = v33.Font.Body.Font,
						LayoutOrder = 1,
						Text = v38.title or "",
						TextSize = v33.Font.Body.RelativeSize * v33.Font.BaseSize,
						TextColor3 = Colors.White,
						TextWrapped = true
					}),
					Description = if not v38 or (not v38.description or v38.description == "") then nil else React.createElement("TextLabel", {
						AutomaticSize = Enum.AutomaticSize.XY,
						BackgroundTransparency = 1,
						Font = v33.Font.CaptionBody.Font,
						LayoutOrder = 2,
						Text = v38.description or "",
						TextSize = v33.Font.CaptionBody.RelativeSize * v33.Font.BaseSize,
						TextColor3 = v33.Theme.TextDefault.Color
					})
				}),
				SnoozeOptions = React.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0)
				}, {
					UIListLayout = React.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					SnoozeOptions = Roact.createFragment(v43)
				})
			})
		}))
	end

	return nil
end
