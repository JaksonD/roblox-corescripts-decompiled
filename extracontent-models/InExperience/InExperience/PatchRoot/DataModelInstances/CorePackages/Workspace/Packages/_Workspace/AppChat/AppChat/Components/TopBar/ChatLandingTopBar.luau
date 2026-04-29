local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local AppPage = require(AppChatParent.RobloxAppEnums).AppPage
local Constants = require(AppChat.Constants)
local EnumScreens = require(AppChat.EnumScreens)
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local ChatTopBarBase = require(script.Parent.ChatTopBarBase)
local GetTopBarStore = require(AppChat.Stores.GetTopBarStore)
local SearchTopBar = require(AppChat.Components.ChatLanding.SearchTopBar)
local SnoozeToastNotificationsButton = require(AppChat.Components.ChatLanding.SnoozeToastNotificationsButton)
local ScheduledSquadsListButton = require(AppChat.Components.ChatLanding.ScheduledSquadsListButton)
local useChatLandingVisibility = require(AppChat.Hooks.useChatLandingVisibility)
local Foundation = require(AppChatParent.Foundation)
local React = require(AppChatParent.React)
local UIBlox = require(AppChatParent.UIBlox)
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local dependencyArray = require(AppChatParent.RoactUtils).Hooks.dependencyArray
local useSignalState = require(AppChatParent.SignalsReact).useSignalState
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local ChatLandingTelemetryLayer = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEvents = require(AppChat.Components.ChatLanding.ChatLandingTelemetryEvents)
local StreamNotificationsBellIcon = require(AppChatParent.StreamNotifications).StreamNotificationsBellIcon
local IconButton = UIBlox.App.Button.IconButton
local Images = UIBlox.App.ImageSet.Images
local DomLocators = require(AppChat.Utils.DomLocators)
local SharedFlags = require(AppChatParent.SharedFlags)
local GetFFlagIsSquadEnabled = SharedFlags.GetFFlagIsSquadEnabled
local FFlagEnableHeaderBarButtonsUpdate = SharedFlags.FFlagEnableHeaderBarButtonsUpdate
local FFlagRemoveDependencyArrayAntipattern = SharedFlags.FFlagRemoveDependencyArrayAntipattern
local FFlagStreamNotificationBellEntryPoint = SharedFlags.FFlagStreamNotificationBellEntryPoint
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local ScheduledSquadActionSourceEnum = require(AppChatParent.Squads).Enums.ScheduledSquadActionSourceEnum
local ScheduledSquadsListExperimentation = require(AppChatParent.SocialExperiments).ScheduledSquadsListExperimentation

local function SearchTopBarWrapper() -- line: 54
	-- upvalues: GetTopBarStore (copy), EnumScreens (copy), useLocalization (copy), React (copy), SearchTopBar (copy)
	local v36 = GetTopBarStore(false)
	local setScreenTopBar = v36.setScreenTopBar
	local v38 = v36.getScreenTopBar(EnumScreens.ChatLanding)(false)
	local v39 = useLocalization({
		searchPlaceholderText = "Feature.Chat.Label.SearchWord",
		cancelText = "Feature.Chat.Action.Cancel"
	})
	local v40 = React.useCallback(function() -- line: 64
		-- upvalues: v38 (copy)
		local closeInputBar = v38.closeInputBar

		if closeInputBar then
			closeInputBar()
		end
	end, { v38.closeInputBar })
	local v41 = React.useCallback(function() -- line: 71
		-- upvalues: setScreenTopBar (copy), EnumScreens (copy)
		setScreenTopBar(EnumScreens.ChatLanding, {
			shouldAutoFocusCenter = false
		})
	end, { setScreenTopBar })
	local v42 = React.useCallback(function() -- line: 77
		-- upvalues: setScreenTopBar (copy), EnumScreens (copy)
		setScreenTopBar(EnumScreens.ChatLanding, {
			shouldRenderCenter = false,
			filterText = ""
		})
	end, { setScreenTopBar })
	local v43 = React.useCallback(function(p1) -- line: 84
		-- upvalues: setScreenTopBar (copy), EnumScreens (copy)
		setScreenTopBar(EnumScreens.ChatLanding, {
			filterText = p1
		})
	end, { setScreenTopBar })

	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1
	}, {
		filterBox = React.createElement(SearchTopBar, {
			initialInputText = v38.filterText,
			cancelText = v39.cancelText,
			searchPlaceholderText = v39.searchPlaceholderText,
			captureFocusOnMount = v38.shouldAutoFocusCenter,
			onSelectCallback = v40,
			resetOnMount = v41,
			cancelCallback = v42,
			textChangedCallback = v43
		})
	})
end
local function v35() -- line: 108
	-- upvalues: React (copy), SearchTopBarWrapper (copy)
	return React.createElement(SearchTopBarWrapper)
end

return function(t1: {[any]: any}) --[[ ChatLandingTopBar ]] -- line: 112
	-- upvalues: FFlagAppChatTopBarConfigDriven (copy), Constants (copy), GetTopBarStore (copy), useSignalState (copy), useChatLandingVisibility (copy), useTelemetry (copy), ChatLandingTelemetryLayer (copy), v35 (copy), React (copy), EnumScreens (copy), ChatLandingTelemetryEvents (copy), FFlagRemoveDependencyArrayAntipattern (copy), dependencyArray (copy), ScheduledSquadsListExperimentation (copy), FFlagEnableHeaderBarButtonsUpdate (copy), Foundation (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), SnoozeToastNotificationsButton (copy), ScheduledSquadsListButton (copy), ScheduledSquadActionSourceEnum (copy), IconButton (copy), Images (copy), GetFFlagIsSquadEnabled (copy), ChatTopBarBase (copy)
	if not FFlagAppChatTopBarConfigDriven() then
		return nil
	end

	local screenName = t1.screenName
	local navigation = t1.navigation
	local v47 = navigation.getScreenProps("wideMode", false)
	local IconButtonWidth = Constants:GetIconButtonWidth(v47)
	local v49 = GetTopBarStore(false)
	local setScreenTopBar = v49.setScreenTopBar
	local v51 = v49.getScreenTopBar(screenName)
	local v52 = useSignalState(v51)
	local v53 = useChatLandingVisibility()
	local v54 = useTelemetry(ChatLandingTelemetryLayer.Context)
	local shouldRenderCenter = v52.shouldRenderCenter
	local rightHidden = v52.rightHidden
	local v57 = if not shouldRenderCenter then nil else v35
	local v58 = React.useCallback(function() -- line: 136
		-- upvalues: setScreenTopBar (copy), EnumScreens (copy), v54 (copy), ChatLandingTelemetryEvents (copy)
		setScreenTopBar(EnumScreens.ChatLanding, {
			shouldRenderCenter = true,
			shouldAutoFocusCenter = true,
			isSecondary = true
		})
		v54.emit(ChatLandingTelemetryEvents.ChatLandingSearchBtnClicked, {})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v54, setScreenTopBar) else {
		v54,
		setScreenTopBar
	})
	local v59 = React.useCallback(function() -- line: 150
		-- upvalues: navigation (copy), EnumScreens (copy), v54 (copy), ChatLandingTelemetryEvents (copy)
		navigation.navigate(EnumScreens.CreateNewChat)
		v54.emit(ChatLandingTelemetryEvents.ChatLandingComposeBtnClicked, {})
	end, if not FFlagRemoveDependencyArrayAntipattern then dependencyArray(v54, navigation) else {
		v54,
		navigation
	})
	local v60 = nil

	if not shouldRenderCenter then
		function v60() -- line: 161
			-- upvalues: rightHidden (copy), v53 (copy), ScheduledSquadsListExperimentation (copy), FFlagEnableHeaderBarButtonsUpdate (copy), React (copy), Foundation (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), SnoozeToastNotificationsButton (copy), IconButtonWidth (copy), ScheduledSquadsListButton (copy), ScheduledSquadActionSourceEnum (copy), v58 (copy), v59 (copy), v47 (copy), IconButton (copy), Images (copy), GetFFlagIsSquadEnabled (copy)
			if rightHidden then
				return nil
			end

			local topBarShowSearch = v53.topBarShowSearch
			local topBarShowCreateChatGroup = v53.topBarShowCreateChatGroup
			local topBarShowNotifications = v53.topBarShowNotifications
			local topBarShowSnoozeNotifications = v53.topBarShowSnoozeNotifications
			local notificationCount = v53.notificationCount

			if ScheduledSquadsListExperimentation.getIsTopBarEntrypointEnabled() then
				if FFlagEnableHeaderBarButtonsUpdate then
					return React.createElement(Foundation.View, {
						tag = "row align-x-right align-y-center gap-xsmall auto-xy"
					}, {
						notifications = if not topBarShowNotifications then nil else React.createElement(StreamNotificationsBellIcon, {
							notificationCount = notificationCount,
							layoutOrder = 1,
							entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat,
							testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("notifications")
						}),
						snoozeChatNotifications = if not topBarShowSnoozeNotifications then nil else React.createElement(SnoozeToastNotificationsButton, {
							layoutOrder = 2,
							size = UDim2.new(0, IconButtonWidth, 1, 0)
						}),
						scheduledSquadsButton = React.createElement(ScheduledSquadsListButton, {
							layoutOrder = 3,
							source = ScheduledSquadActionSourceEnum.ChatLandingScreen
						}),
						filter = if not topBarShowSearch then nil else React.createElement(Foundation.IconButton, {
							size = Foundation.Enums.InputSize.Medium,
							isCircular = true,
							icon = Foundation.Enums.IconName.MagnifyingGlass,
							testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("search"),
							LayoutOrder = 4,
							onActivated = v58
						}),
						createNewChat = if not topBarShowCreateChatGroup then nil else React.createElement(Foundation.IconButton, {
							size = Foundation.Enums.InputSize.Medium,
							isCircular = true,
							icon = Foundation.Enums.IconName.PlusLarge,
							testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("createChat"),
							LayoutOrder = 5,
							onActivated = v59
						})
					})
				end

				return React.createElement(React.Fragment, nil, {
					notifications = topBarShowNotifications and if not FFlagDebugAppChatEnableDomLocators then React.createElement(StreamNotificationsBellIcon, {
						notificationCount = notificationCount,
						compactWidth = not v47,
						layoutOrder = 1,
						entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
					}) else React.createElement(Foundation.View, {
						tag = "row align-x-center align-y-center radius-circle",
						Size = UDim2.new(0, IconButtonWidth, 0, IconButtonWidth),
						LayoutOrder = 1,
						testId = DomLocators.chatLandingTopBarIconButton("notifications")
					}, {
						BellIcon = React.createElement(StreamNotificationsBellIcon, {
							notificationCount = notificationCount,
							compactWidth = not v47,
							entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
						})
					}),
					snoozeChatNotifications = if not topBarShowSnoozeNotifications then nil else React.createElement(SnoozeToastNotificationsButton, {
						layoutOrder = 2,
						size = UDim2.new(0, IconButtonWidth, 1, 0)
					}),
					scheduledSquadsButton = React.createElement(ScheduledSquadsListButton, {
						layoutOrder = 3,
						source = ScheduledSquadActionSourceEnum.ChatLandingScreen
					}),
					filter = topBarShowSearch and if not FFlagDebugAppChatEnableDomLocators then React.createElement(IconButton, {
						size = UDim2.new(0, IconButtonWidth, 1, 0),
						icon = Images["icons/common/search"],
						layoutOrder = 4,
						onActivated = v58
					}) else React.createElement(Foundation.IconButton, {
						size = Foundation.Enums.InputSize.Medium,
						isCircular = true,
						icon = Foundation.Enums.IconName.MagnifyingGlass,
						testId = DomLocators.chatLandingTopBarIconButton("search"),
						LayoutOrder = 4,
						onActivated = v58
					}),
					createNewChat = topBarShowCreateChatGroup and if not FFlagDebugAppChatEnableDomLocators then React.createElement(IconButton, {
						size = UDim2.new(0, IconButtonWidth, 1, 0),
						icon = if not GetFFlagIsSquadEnabled() then Images["icons/actions/compose"] else Images["icons/common/plus"],
						layoutOrder = 5,
						onActivated = v59
					}) else React.createElement(Foundation.IconButton, {
						size = Foundation.Enums.InputSize.Medium,
						isCircular = true,
						icon = Foundation.Enums.IconName.PlusLarge,
						testId = DomLocators.chatLandingTopBarIconButton("createChat"),
						LayoutOrder = 5,
						onActivated = v59
					})
				})
			end

			if FFlagEnableHeaderBarButtonsUpdate then
				return React.createElement(Foundation.View, {
					tag = "row align-x-right align-y-center gap-xsmall auto-xy"
				}, {
					filter = if not topBarShowSearch then nil else React.createElement(Foundation.IconButton, {
						size = Foundation.Enums.InputSize.Medium,
						isCircular = true,
						icon = Foundation.Enums.IconName.MagnifyingGlass,
						testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("search"),
						LayoutOrder = 1,
						onActivated = v58
					}),
					createNewChat = if not topBarShowCreateChatGroup then nil else React.createElement(Foundation.IconButton, {
						size = Foundation.Enums.InputSize.Medium,
						isCircular = true,
						icon = Foundation.Enums.IconName.PlusLarge,
						testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("createChat"),
						LayoutOrder = 2,
						onActivated = v59
					}),
					notifications = if not topBarShowNotifications then nil else React.createElement(StreamNotificationsBellIcon, {
						notificationCount = notificationCount,
						layoutOrder = 3,
						entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat,
						testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("notifications")
					}),
					snoozeChatNotifications = if not topBarShowSnoozeNotifications then nil else React.createElement(SnoozeToastNotificationsButton, {
						layoutOrder = 4,
						size = UDim2.new(0, IconButtonWidth, 1, 0)
					})
				})
			end

			return React.createElement(React.Fragment, nil, {
				filter = topBarShowSearch and if not FFlagDebugAppChatEnableDomLocators then React.createElement(IconButton, {
					size = UDim2.new(0, IconButtonWidth, 1, 0),
					icon = Images["icons/common/search"],
					layoutOrder = 1,
					onActivated = v58
				}) else React.createElement(Foundation.IconButton, {
					size = Foundation.Enums.InputSize.Medium,
					isCircular = true,
					icon = Foundation.Enums.IconName.MagnifyingGlass,
					testId = DomLocators.chatLandingTopBarIconButton("search"),
					LayoutOrder = 1,
					onActivated = v58
				}),
				createNewChat = topBarShowCreateChatGroup and if not FFlagDebugAppChatEnableDomLocators then React.createElement(IconButton, {
					size = UDim2.new(0, IconButtonWidth, 1, 0),
					icon = if not GetFFlagIsSquadEnabled() then Images["icons/actions/compose"] else Images["icons/common/plus"],
					layoutOrder = 2,
					onActivated = v59
				}) else React.createElement(Foundation.IconButton, {
					size = Foundation.Enums.InputSize.Medium,
					isCircular = true,
					icon = Foundation.Enums.IconName.PlusLarge,
					testId = DomLocators.chatLandingTopBarIconButton("createChat"),
					LayoutOrder = 2,
					onActivated = v59
				}),
				notifications = topBarShowNotifications and if not FFlagDebugAppChatEnableDomLocators then React.createElement(StreamNotificationsBellIcon, {
					notificationCount = notificationCount,
					compactWidth = not v47,
					layoutOrder = 3,
					entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
				}) else React.createElement(Foundation.View, {
					Size = UDim2.new(0, IconButtonWidth, 0, IconButtonWidth),
					tag = "row align-x-center align-y-center radius-circle",
					testId = DomLocators.chatLandingTopBarIconButton("notifications")
				}, {
					BellIcon = React.createElement(StreamNotificationsBellIcon, {
						notificationCount = notificationCount,
						compactWidth = not v47,
						entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
					})
				}),
				snoozeChatNotifications = if not topBarShowSnoozeNotifications then nil else React.createElement(SnoozeToastNotificationsButton, {
					layoutOrder = 4,
					size = UDim2.new(0, IconButtonWidth, 1, 0)
				})
			})
		end
	end

	return React.createElement(ChatTopBarBase, {
		screenName = screenName,
		navigation = navigation,
		renderRight = v60,
		renderCenter = v57
	})
end
