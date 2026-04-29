local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local AppPage = require(AppChatParent.RobloxAppEnums).AppPage
local Constants = require(AppChat.Constants)
local EnumScreens = require(AppChat.EnumScreens)
local SnoozeToastNotificationsButton = require(AppChat.Components.ChatLanding.SnoozeToastNotificationsButton)
local ScheduledSquadsListButton = require(AppChat.Components.ChatLanding.ScheduledSquadsListButton)
local TopBarProvider = require(AppChat.TopBarProvider)
local ArgCheck = require(AppChatParent.ArgCheck)
local Roact = require(AppChatParent.Roact)
local RoactNavigation = require(AppChatParent.RoactNavigation)
local withLocalization = require(AppChatParent.Localization).withLocalization
local UIBlox = require(AppChatParent.UIBlox)
local Foundation = require(AppChatParent.Foundation)
local React = require(AppChatParent.React)
local ScheduledSquadActionSourceEnum = require(AppChatParent.Squads).Enums.ScheduledSquadActionSourceEnum
local IconButton = UIBlox.App.Button.IconButton
local Images = UIBlox.App.ImageSet.Images
local SearchTopBar = require(script.Parent.SearchTopBar)
local ChatLandingContainer = require(script.Parent.ChatLandingContainer)
local Logger = require(script.Parent.Logger)
local getCurrentRoute = require(script.Parent.Utils.getCurrentRoute)
local ChatSearchBox = require(script.Parent.ChatSearchBox)
local CheckAndOpenChatPushUpsell = require(script.Parent.CheckAndOpenChatPushUpsell)
local withTelemetry = require(AppChat.Telemetry.withTelemetry)
local ChatLandingTelemetryLayer = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ChatLandingTelemetryEvents = require(script.Parent.ChatLandingTelemetryEvents)
local resetForSquadLobbyForCompactMode = require(AppChat.Utils.resetForSquadLobbyForCompactMode)
local StreamNotificationsBellIcon = require(AppChatParent.StreamNotifications).StreamNotificationsBellIcon
local DomLocators = require(AppChat.Utils.DomLocators)
local FFlagStreamNotificationBellEntryPoint = require(AppChatParent.SharedFlags).FFlagStreamNotificationBellEntryPoint
local GetFFlagEnableAppChatInExperience = require(AppChatParent.SharedFlags).GetFFlagEnableAppChatInExperience
local FFlagEnablePartyQuickStartButton = require(AppChatParent.SharedFlags).FFlagEnablePartyQuickStartButton
local GetFFlagEnablePushNotificationsUpsellModalChat = require(AppChatParent.SharedFlags).GetFFlagEnablePushNotificationsUpsellModalChat
local GetFFlagIsSquadEnabled = require(AppChatParent.SharedFlags).GetFFlagIsSquadEnabled
local FFlagEnableAppChatFocusableFixes = require(AppChatParent.SharedFlags).FFlagEnableAppChatFocusableFixes
local FFlagEnableHeaderBarButtonsUpdate = require(AppChatParent.SharedFlags).FFlagEnableHeaderBarButtonsUpdate
local FFlagDebugAppChatEnableDomLocators = require(AppChat.Flags.FFlagDebugAppChatEnableDomLocators)
local FFlagAppChatDomLocatorFoundationMigration = require(AppChat.Flags.FFlagAppChatDomLocatorFoundationMigration)
local GetTopBarStore = require(AppChat.Stores.GetTopBarStore)
local FFlagAppChatTopBarSignalsStore = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDriven = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local ScheduledSquadsListExperimentation = require(AppChatParent.SocialExperiments).ScheduledSquadsListExperimentation
local v44 = Roact.PureComponent:extend("ChatLandingScreen")

v44.defaultProps = {
	navigation = nil
}

local function v45() -- line: 61
	-- upvalues: Roact (copy), TopBarProvider (copy), EnumScreens (copy), ArgCheck (copy), withLocalization (copy), SearchTopBar (copy)
	return Roact.createElement(TopBarProvider, {
		screenName = EnumScreens.ChatLanding,
		render = function(p1) --[[ render ]] -- line: 64
			-- upvalues: EnumScreens (copy), ArgCheck (copy), withLocalization (copy), Roact (copy), SearchTopBar (copy)
			local v70 = p1.getScreenTopBar(EnumScreens.ChatLanding)

			ArgCheck.isType(v70, "table", "screenTopBar")

			return withLocalization({
				searchPlaceholderText = "Feature.Chat.Label.SearchWord",
				cancelText = "Feature.Chat.Action.Cancel"
			})(function(p2) -- line: 71
				-- upvalues: Roact (copy), SearchTopBar (copy), v70 (copy), p1 (copy), EnumScreens (copy)
				return Roact.createElement("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					filterBox = Roact.createElement(SearchTopBar, {
						initialInputText = v70.filterText,
						cancelText = p2.cancelText,
						searchPlaceholderText = p2.searchPlaceholderText,
						captureFocusOnMount = v70.shouldAutoFocusCenter,
						onSelectCallback = v70.closeInputBar or function() -- line: 81
						end,
						resetOnMount = function() --[[ resetOnMount ]] -- line: 83
							-- upvalues: p1 (copy), EnumScreens (copy)
							p1.setScreenTopBar(EnumScreens.ChatLanding, {
								shouldAutoFocusCenter = false
							})
						end,
						cancelCallback = function() --[[ cancelCallback ]] -- line: 89
							-- upvalues: p1 (copy), EnumScreens (copy)
							p1.setScreenTopBar(EnumScreens.ChatLanding, {
								shouldRenderCenter = false,
								filterText = ""
							})
						end,
						textChangedCallback = function(p3) --[[ textChangedCallback ]] -- line: 96
							-- upvalues: p1 (copy), EnumScreens (copy)
							p1.setScreenTopBar(EnumScreens.ChatLanding, {
								filterText = p3
							})
						end
					})
				})
			end)
		end
	})
end

function v44.navigationOptions(p4) -- line: 108
	-- upvalues: Constants (copy), GetFFlagEnableAppChatInExperience (copy), FFlagEnableHeaderBarButtonsUpdate (copy), GetFFlagIsSquadEnabled (copy), FFlagAppChatTopBarConfigDriven (copy), v45 (copy), withTelemetry (copy), ChatLandingTelemetryLayer (copy), Roact (copy), TopBarProvider (copy), EnumScreens (copy), ArgCheck (copy), ScheduledSquadsListExperimentation (copy), Foundation (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), SnoozeToastNotificationsButton (copy), React (copy), ScheduledSquadsListButton (copy), ScheduledSquadActionSourceEnum (copy), ChatLandingTelemetryEvents (copy), FFlagAppChatDomLocatorFoundationMigration (copy), IconButton (copy), Images (copy)
	local navigation = p4.navigation
	local v48 = navigation.getScreenProps("navigateToRootStack", nil)
	local v49 = navigation.getScreenProps("wideMode", false)
	local IconButtonWidth = Constants:GetIconButtonWidth(v49)
	local v51 = navigation.getScreenProps("isInExperience", false)
	local v52 = not not v48
	local v53 = GetFFlagEnableAppChatInExperience() and v51
	local v54 = if not navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatOuterPadding", 12) else navigation.getScreenProps("appChatInnerPadding", 12)

	if FFlagEnableHeaderBarButtonsUpdate then
		v54 -= navigation.getScreenProps("topBarUtilityIconSideMargin", 0)
	end

	local v55 = if not GetFFlagIsSquadEnabled() then {
		raw = "CommonUI.Features.Label.Chat",
		shouldLocalize = true
	} else {
		raw = "Feature.Squads.Label.Party",
		shouldLocalize = true
	}

	if FFlagAppChatTopBarConfigDriven() then
		return {
			headerText = v55,
			backButtonEnabled = false,
			closeButtonEnabled = v53 and v52,
			tabBarVisible = not v48 or nil,
			isRoot = true,
			isTitleLeftAligned = true,
			leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = v54,
			shouldBoldHeader = true
		}
	end

	return {
		headerText = v55,
		backButtonEnabled = not v53 and v52,
		closeButtonEnabled = v53 and v52,
		tabBarVisible = not v48 or nil,
		isRoot = true,
		isTitleLeftAligned = true,
		leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
		rightPaddingOverride = v54,
		renderCenter = v45,
		shouldBoldHeader = true,
		renderRight = function() --[[ renderRight ]] -- line: 169
			-- upvalues: withTelemetry (copy), ChatLandingTelemetryLayer (copy), Roact (copy), TopBarProvider (copy), EnumScreens (copy), ArgCheck (copy), navigation (copy), ScheduledSquadsListExperimentation (copy), FFlagEnableHeaderBarButtonsUpdate (copy), Foundation (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), SnoozeToastNotificationsButton (copy), IconButtonWidth (copy), React (copy), ScheduledSquadsListButton (copy), ScheduledSquadActionSourceEnum (copy), ChatLandingTelemetryEvents (copy), FFlagAppChatDomLocatorFoundationMigration (copy), v49 (copy), IconButton (copy), Images (copy), GetFFlagIsSquadEnabled (copy)
			return withTelemetry(ChatLandingTelemetryLayer.Context)(function(p5) -- line: 170
				-- upvalues: Roact (copy), TopBarProvider (copy), EnumScreens (copy), ArgCheck (copy), navigation (copy), ScheduledSquadsListExperimentation (copy), FFlagEnableHeaderBarButtonsUpdate (copy), Foundation (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), SnoozeToastNotificationsButton (copy), IconButtonWidth (copy), React (copy), ScheduledSquadsListButton (copy), ScheduledSquadActionSourceEnum (copy), ChatLandingTelemetryEvents (copy), FFlagAppChatDomLocatorFoundationMigration (copy), v49 (copy), IconButton (copy), Images (copy), GetFFlagIsSquadEnabled (copy)
				return Roact.createElement(TopBarProvider, {
					screenName = EnumScreens.ChatLanding,
					render = function(p6) --[[ render ]] -- line: 173
						-- upvalues: EnumScreens (copy), ArgCheck (copy), navigation (copy), ScheduledSquadsListExperimentation (copy), FFlagEnableHeaderBarButtonsUpdate (copy), Roact (copy), Foundation (copy), StreamNotificationsBellIcon (copy), FFlagStreamNotificationBellEntryPoint (copy), AppPage (copy), FFlagDebugAppChatEnableDomLocators (copy), DomLocators (copy), SnoozeToastNotificationsButton (copy), IconButtonWidth (copy), React (copy), ScheduledSquadsListButton (copy), ScheduledSquadActionSourceEnum (copy), p5 (copy), ChatLandingTelemetryEvents (copy), FFlagAppChatDomLocatorFoundationMigration (copy), v49 (copy), IconButton (copy), Images (copy), GetFFlagIsSquadEnabled (copy)
						local v87 = p6.getScreenTopBar(EnumScreens.ChatLanding)

						ArgCheck.isType(v87, "table", "screenTopBar")

						local v88 = navigation.getScreenProps("notificationCount", 0)
						local v89 = navigation.getScreenProps("topBarShowSearch", false)
						local v90 = navigation.getScreenProps("topBarShowCreateChatGroup", false)
						local v91 = navigation.getScreenProps("topBarShowNotifications", false)
						local v92 = navigation.getScreenProps("topBarShowSnoozeNotifications", false)

						if v87.shouldRenderCenter then
							return nil
						end

						if ScheduledSquadsListExperimentation.getIsTopBarEntrypointEnabled() then
							if FFlagEnableHeaderBarButtonsUpdate then
								return Roact.createElement(Foundation.View, {
									tag = "auto-xy row align-x-right align-y-center gap-xsmall"
								}, {
									notifications = if not v91 then nil else Roact.createElement(StreamNotificationsBellIcon, {
										notificationCount = v88,
										layoutOrder = 1,
										entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat,
										testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("notifications")
									}),
									snoozeChatNotifications = if not v92 then nil else Roact.createElement(SnoozeToastNotificationsButton, {
										layoutOrder = 2,
										size = UDim2.new(0, IconButtonWidth, 1, 0)
									}),
									scheduledSquadsButton = React.createElement(ScheduledSquadsListButton, {
										layoutOrder = 3,
										source = ScheduledSquadActionSourceEnum.ChatLandingScreen
									}),
									filter = if not v89 then nil else Roact.createElement(Foundation.IconButton, {
										size = Foundation.Enums.InputSize.Medium,
										isCircular = true,
										icon = Foundation.Enums.IconName.MagnifyingGlass,
										testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("search"),
										LayoutOrder = 4,
										onActivated = function() --[[ onActivated ]] -- line: 224
											-- upvalues: p6 (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
											p6.setScreenTopBar(EnumScreens.ChatLanding, {
												shouldRenderCenter = true,
												shouldAutoFocusCenter = true,
												isSecondary = true
											})
											p5.emit(ChatLandingTelemetryEvents.ChatLandingSearchBtnClicked, {})
										end
									}),
									createNewChat = if not v90 then nil else Roact.createElement(Foundation.IconButton, {
										size = Foundation.Enums.InputSize.Medium,
										isCircular = true,
										icon = Foundation.Enums.IconName.PlusLarge,
										testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("createChat"),
										LayoutOrder = 5,
										onActivated = function() --[[ onActivated ]] -- line: 247
											-- upvalues: navigation (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
											navigation.navigate(EnumScreens.CreateNewChat)
											p5.emit(ChatLandingTelemetryEvents.ChatLandingComposeBtnClicked, {})
										end
									})
								})
							end

							return Roact.createFragment({
								notifications = v91 and if not FFlagAppChatDomLocatorFoundationMigration then Roact.createElement(StreamNotificationsBellIcon, {
									notificationCount = v88,
									compactWidth = not v49,
									layoutOrder = 1,
									entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
								}) else Roact.createElement(Foundation.View, {
									tag = "radius-circle row align-x-center align-y-center",
									Size = UDim2.new(0, IconButtonWidth, 0, IconButtonWidth),
									LayoutOrder = 1,
									testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("notifications")
								}, {
									BellIcon = Roact.createElement(StreamNotificationsBellIcon, {
										notificationCount = v88,
										compactWidth = not v49,
										entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
									})
								}),
								snoozeChatNotifications = if not v92 then nil else Roact.createElement(SnoozeToastNotificationsButton, {
									layoutOrder = 2,
									size = UDim2.new(0, IconButtonWidth, 1, 0)
								}),
								scheduledSquadsButton = React.createElement(ScheduledSquadsListButton, {
									layoutOrder = 3,
									source = ScheduledSquadActionSourceEnum.ChatLandingScreen
								}),
								filter = v89 and if not FFlagAppChatDomLocatorFoundationMigration then Roact.createElement(IconButton, {
									size = UDim2.new(0, IconButtonWidth, 1, 0),
									icon = Images["icons/common/search"],
									layoutOrder = 4,
									onActivated = function() --[[ onActivated ]] -- line: 321
										-- upvalues: p6 (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
										p6.setScreenTopBar(EnumScreens.ChatLanding, {
											shouldRenderCenter = true,
											shouldAutoFocusCenter = true,
											isSecondary = true
										})
										p5.emit(ChatLandingTelemetryEvents.ChatLandingSearchBtnClicked, {})
									end
								}) else Roact.createElement(Foundation.IconButton, {
									size = Foundation.Enums.InputSize.Medium,
									isCircular = true,
									icon = Foundation.Enums.IconName.MagnifyingGlass,
									testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("search"),
									LayoutOrder = 4,
									onActivated = function() --[[ onActivated ]] -- line: 307
										-- upvalues: p6 (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
										p6.setScreenTopBar(EnumScreens.ChatLanding, {
											shouldRenderCenter = true,
											shouldAutoFocusCenter = true,
											isSecondary = true
										})
										p5.emit(ChatLandingTelemetryEvents.ChatLandingSearchBtnClicked, {})
									end
								}),
								createNewChat = v90 and if not FFlagAppChatDomLocatorFoundationMigration then Roact.createElement(IconButton, {
									size = UDim2.new(0, IconButtonWidth, 1, 0),
									icon = if not GetFFlagIsSquadEnabled() then Images["icons/actions/compose"] else Images["icons/common/plus"],
									layoutOrder = 5,
									onActivated = function() --[[ onActivated ]] -- line: 356
										-- upvalues: navigation (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
										navigation.navigate(EnumScreens.CreateNewChat)
										p5.emit(ChatLandingTelemetryEvents.ChatLandingComposeBtnClicked, {})
									end
								}) else Roact.createElement(Foundation.IconButton, {
									size = Foundation.Enums.InputSize.Medium,
									isCircular = true,
									icon = Foundation.Enums.IconName.PlusLarge,
									testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("createChat"),
									LayoutOrder = 5,
									onActivated = function() --[[ onActivated ]] -- line: 342
										-- upvalues: navigation (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
										navigation.navigate(EnumScreens.CreateNewChat)
										p5.emit(ChatLandingTelemetryEvents.ChatLandingComposeBtnClicked, {})
									end
								})
							})
						end

						if FFlagEnableHeaderBarButtonsUpdate then
							return Roact.createElement(Foundation.View, {
								tag = "auto-xy row align-x-right align-y-center gap-xsmall"
							}, {
								filter = if not v89 then nil else Roact.createElement(Foundation.IconButton, {
									size = Foundation.Enums.InputSize.Medium,
									isCircular = true,
									icon = Foundation.Enums.IconName.MagnifyingGlass,
									testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("search"),
									LayoutOrder = 1,
									onActivated = function() --[[ onActivated ]] -- line: 380
										-- upvalues: p6 (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
										p6.setScreenTopBar(EnumScreens.ChatLanding, {
											shouldRenderCenter = true,
											shouldAutoFocusCenter = true,
											isSecondary = true
										})
										p5.emit(ChatLandingTelemetryEvents.ChatLandingSearchBtnClicked, {})
									end
								}),
								createNewChat = if not v90 then nil else Roact.createElement(Foundation.IconButton, {
									size = Foundation.Enums.InputSize.Medium,
									isCircular = true,
									icon = Foundation.Enums.IconName.PlusLarge,
									testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("createChat"),
									LayoutOrder = 2,
									onActivated = function() --[[ onActivated ]] -- line: 403
										-- upvalues: navigation (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
										navigation.navigate(EnumScreens.CreateNewChat)
										p5.emit(ChatLandingTelemetryEvents.ChatLandingComposeBtnClicked, {})
									end
								}),
								notifications = if not v91 then nil else Roact.createElement(StreamNotificationsBellIcon, {
									notificationCount = v88,
									layoutOrder = 3,
									entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat,
									testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("notifications")
								}),
								snoozeChatNotifications = if not v92 then nil else Roact.createElement(SnoozeToastNotificationsButton, {
									layoutOrder = 4,
									size = UDim2.new(0, IconButtonWidth, 1, 0)
								})
							})
						end

						return Roact.createFragment({
							filter = v89 and if not FFlagAppChatDomLocatorFoundationMigration then Roact.createElement(IconButton, {
								size = UDim2.new(0, IconButtonWidth, 1, 0),
								icon = Images["icons/common/search"],
								layoutOrder = 1,
								onActivated = function() --[[ onActivated ]] -- line: 457
									-- upvalues: p6 (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
									p6.setScreenTopBar(EnumScreens.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p5.emit(ChatLandingTelemetryEvents.ChatLandingSearchBtnClicked, {})
								end
							}) else Roact.createElement(Foundation.IconButton, {
								size = Foundation.Enums.InputSize.Medium,
								isCircular = true,
								icon = Foundation.Enums.IconName.MagnifyingGlass,
								testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("search"),
								LayoutOrder = 1,
								onActivated = function() --[[ onActivated ]] -- line: 443
									-- upvalues: p6 (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
									p6.setScreenTopBar(EnumScreens.ChatLanding, {
										shouldRenderCenter = true,
										shouldAutoFocusCenter = true,
										isSecondary = true
									})
									p5.emit(ChatLandingTelemetryEvents.ChatLandingSearchBtnClicked, {})
								end
							}),
							createNewChat = v90 and if not FFlagAppChatDomLocatorFoundationMigration then Roact.createElement(IconButton, {
								size = UDim2.new(0, IconButtonWidth, 1, 0),
								icon = if not GetFFlagIsSquadEnabled() then Images["icons/actions/compose"] else Images["icons/common/plus"],
								layoutOrder = 2,
								onActivated = function() --[[ onActivated ]] -- line: 492
									-- upvalues: navigation (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
									navigation.navigate(EnumScreens.CreateNewChat)
									p5.emit(ChatLandingTelemetryEvents.ChatLandingComposeBtnClicked, {})
								end
							}) else Roact.createElement(Foundation.IconButton, {
								size = Foundation.Enums.InputSize.Medium,
								isCircular = true,
								icon = Foundation.Enums.IconName.PlusLarge,
								testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("createChat"),
								LayoutOrder = 2,
								onActivated = function() --[[ onActivated ]] -- line: 478
									-- upvalues: navigation (copy), EnumScreens (copy), p5 (copy), ChatLandingTelemetryEvents (copy)
									navigation.navigate(EnumScreens.CreateNewChat)
									p5.emit(ChatLandingTelemetryEvents.ChatLandingComposeBtnClicked, {})
								end
							}),
							notifications = v91 and if not FFlagAppChatDomLocatorFoundationMigration then Roact.createElement(StreamNotificationsBellIcon, {
								notificationCount = v88,
								compactWidth = not v49,
								layoutOrder = 3,
								entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
							}) else Roact.createElement(Foundation.View, {
								Size = UDim2.new(0, IconButtonWidth, 0, IconButtonWidth),
								tag = "radius-circle row align-x-center align-y-center",
								testId = if not FFlagDebugAppChatEnableDomLocators then nil else DomLocators.chatLandingTopBarIconButton("notifications")
							}, {
								BellIcon = Roact.createElement(StreamNotificationsBellIcon, {
									notificationCount = v88,
									compactWidth = not v49,
									entryPoint = if not FFlagStreamNotificationBellEntryPoint then nil else AppPage.Chat
								})
							}),
							snoozeChatNotifications = if not v92 then nil else Roact.createElement(SnoozeToastNotificationsButton, {
								layoutOrder = 4,
								size = UDim2.new(0, IconButtonWidth, 1, 0)
							})
						})
					end
				})
			end)
		end
	}
end
function v44.init(p7) -- line: 543
	-- upvalues: Logger (copy), EnumScreens (copy), FFlagEnableAppChatFocusableFixes (copy), getCurrentRoute (copy), FFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForCompactMode (copy), RoactNavigation (copy), FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), ArgCheck (copy)
	function p7.navigateToConversation(p8) -- line: 544
		-- upvalues: Logger (copy), p7 (copy), EnumScreens (copy), FFlagEnableAppChatFocusableFixes (copy)
		Logger:info("Navigate To Conversation: {} from {screen}", p8)
		p7.props.navigation.navigate(EnumScreens.ChatConversation, {
			conversationId = p8,
			navigatedWithFocus = not FFlagEnableAppChatFocusableFixes and nil
		})
		p7.resetScreenTopBar()
	end
	function p7.navigateToCreateChat() -- line: 553
		-- upvalues: Logger (copy), p7 (copy), EnumScreens (copy)
		Logger:info("Navigate To CreateNewChat from {screen}")
		p7.props.navigation.push(EnumScreens.CreateNewChat)
	end
	function p7.navigateToToast(p9) -- line: 558
		-- upvalues: Logger (copy), p7 (copy), EnumScreens (copy)
		Logger:info("Navigate To Toast from {screen}")
		p7.props.navigation.navigate(EnumScreens.RoactChatToast, p9)
	end
	function p7.navigateToPrivacy() -- line: 563
		-- upvalues: p7 (copy), EnumScreens (copy), Logger (copy)
		local v73 = p7.props.navigation.getScreenProps("navigateToLuaAppPages", {})[EnumScreens.PrivacySettings]

		if v73 then
			Logger:info("Navigate To PrivacySettings from {screen}")
			v73()

			return
		end

		Logger:warning("PrivacySettings page was not set in navigateToLuaAppPages screenProps")
	end
	function p7.navigateToSquadLobby(p10) -- line: 574
		-- upvalues: Logger (copy), getCurrentRoute (copy), p7 (copy), EnumScreens (copy), FFlagEnablePartyQuickStartButton (copy), resetForSquadLobbyForCompactMode (copy), RoactNavigation (copy)
		Logger:info("Navigate To SquadLobby from {screen}")

		local v75 = getCurrentRoute(p7.props.navigation.state)

		if v75 and (v75.params and p10 == v75.params.conversationId and v75.routeName == EnumScreens.ChatConversation) then
			p7.props.navigation.navigate(EnumScreens.SquadLobby, {
				conversationId = p10
			})

			return
		end

		if FFlagEnablePartyQuickStartButton then
			resetForSquadLobbyForCompactMode(p7.props.navigation, p10)

			return
		end

		p7.props.navigation.reset({
			RoactNavigation.Actions.navigate({
				routeName = EnumScreens.ChatLanding
			}),
			RoactNavigation.Actions.navigate({
				routeName = EnumScreens.ChatConversation,
				params = {
					conversationId = p10
				}
			}),
			RoactNavigation.Actions.navigate({
				routeName = EnumScreens.SquadLobby,
				params = {
					conversationId = p10
				}
			})
		}, 3)
	end
	function p7.setScreenTopBar(p11) -- line: 606
		-- upvalues: FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), EnumScreens (copy), p7 (copy), ArgCheck (copy)
		if FFlagAppChatTopBarSignalsStore then
			GetTopBarStore(false).setScreenTopBar(EnumScreens.ChatLanding, p11)

			return
		end

		local v77 = p7.props.navigation.getScreenProps("setScreenTopBar", nil)

		ArgCheck.isNotNil(v77, "setScreenTopBar in screenProps")
		v77(EnumScreens.ChatLanding, p11)
	end
	function p7.resetScreenTopBar() -- line: 616
		-- upvalues: FFlagAppChatTopBarSignalsStore (copy), GetTopBarStore (copy), EnumScreens (copy), ArgCheck (copy), p7 (copy)
		local v78 = if not FFlagAppChatTopBarSignalsStore then ArgCheck.isNotNil(p7.props.navigation.getScreenProps("getScreenTopBar", nil), "getScreenTopBar in screenProps")(EnumScreens.ChatLanding) else GetTopBarStore(false).getScreenTopBar(EnumScreens.ChatLanding)(false) or {}

		if v78.filterText == "" and v78.shouldRenderCenter then
			p7.setScreenTopBar({
				shouldRenderCenter = false,
				isSecondary = false
			})
		end
	end
end
function v44.render(p12) -- line: 636
	-- upvalues: Logger (copy), ArgCheck (copy), Roact (copy), TopBarProvider (copy), EnumScreens (copy), ChatLandingContainer (copy), ChatSearchBox (copy), GetFFlagEnablePushNotificationsUpsellModalChat (copy), CheckAndOpenChatPushUpsell (copy)
	Logger:info("{screen} render")

	local v58 = ArgCheck.isNotNil(p12.props.navigation, "navigation in ChatLandingScreen")
	local v59 = v58 and v58.getParam("key", "") or ""
	local v60 = v58.getScreenProps("showSearchRow", true)
	local v61 = v58.getScreenProps("topBarHeight", 0)

	return Roact.createElement(TopBarProvider, {
		screenName = EnumScreens.ChatLanding,
		render = function(p13) --[[ render ]] -- line: 645
			-- upvalues: EnumScreens (copy), ArgCheck (copy), Roact (copy), ChatLandingContainer (copy), v58 (copy), p12 (copy), v59 (copy), v60 (copy), ChatSearchBox (copy), v61 (copy), GetFFlagEnablePushNotificationsUpsellModalChat (copy), CheckAndOpenChatPushUpsell (copy)
			local v80 = p13.getScreenTopBar(EnumScreens.ChatLanding)

			ArgCheck.isType(v80, "table", "screenTopBar")

			local v81 = Roact.createElement(ChatLandingContainer, {
				isShowingFilterBox = v80.shouldRenderCenter,
				filterText = v80.filterText,
				topBarHeight = v58.getScreenProps("topBarHeight", 0),
				navigateToAddFriends = p12.props.navigation.getScreenProps("navigateToAddFriends", {}),
				navigateToConversation = p12.navigateToConversation,
				navigateToCreateChat = p12.navigateToCreateChat,
				navigateToPrivacy = p12.navigateToPrivacy,
				navigateToSquadLobby = p12.navigateToSquadLobby,
				navigateToToast = p12.navigateToToast,
				key = "ChatLanding" .. v59
			})

			if v60 then
				return Roact.createElement("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1
				}, {
					UIListLayout = Roact.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						VerticalFlex = Enum.UIFlexAlignment.Fill,
						Padding = UDim.new(0, 0)
					}),
					ChatSearchBox = Roact.createElement(ChatSearchBox, {
						height = v61,
						initialText = v80.filterText,
						onFilter = function(p14) --[[ onFilter ]] -- line: 676
							-- upvalues: p13 (copy), EnumScreens (copy)
							p13.setScreenTopBar(EnumScreens.ChatLanding, {
								filterText = p14
							})
						end
					}),
					v81
				})
			end

			if GetFFlagEnablePushNotificationsUpsellModalChat() then
				return Roact.createFragment({
					v81,
					CheckAndOpenChatPushUpsell = Roact.createElement(CheckAndOpenChatPushUpsell)
				})
			end

			return v81
		end
	})
end
function v44.didMount(p15) -- line: 697
	-- upvalues: Logger (copy), FFlagAppChatTopBarConfigDriven (copy), GetFFlagEnableAppChatInExperience (copy), GetFFlagIsSquadEnabled (copy)
	Logger:info("{screen} mounted")

	if FFlagAppChatTopBarConfigDriven() then
		local navigation = p15.props.navigation
		local v64 = navigation.getScreenProps("navigateToRootStack", nil)
		local v65 = navigation.getScreenProps("isInExperience", false)
		local v66 = GetFFlagEnableAppChatInExperience() and v65
		local v67 = if not navigation.getScreenProps("wideMode", false) then navigation.getScreenProps("appChatOuterPadding", 12) else navigation.getScreenProps("appChatInnerPadding", 12)
		local v68 = if not GetFFlagIsSquadEnabled() then {
			raw = "CommonUI.Features.Label.Chat",
			shouldLocalize = true
		} else {
			raw = "Feature.Squads.Label.Party",
			shouldLocalize = true
		}

		p15.setScreenTopBar({
			shouldRenderCenter = false,
			filterText = "",
			headerText = v68,
			backButtonEnabled = false,
			closeButtonEnabled = v66 and not not v64,
			isRoot = true,
			isTitleLeftAligned = true,
			leftPaddingOverride = navigation.getScreenProps("appChatOuterPadding", 12),
			rightPaddingOverride = v67,
			shouldBoldHeader = true
		})

		return
	end

	p15.setScreenTopBar({
		shouldRenderCenter = false,
		filterText = ""
	})
end

return v44
