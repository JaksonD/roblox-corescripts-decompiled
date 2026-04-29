local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local React = require(AppChatParent.React)
local Foundation = require(AppChatParent.Foundation)
local UserTile = require(AppChatParent.UserTile).UserTile
local LayoutMode = require(AppChatParent.UserTile).LayoutMode
local Skeleton = Foundation.Skeleton
local useTokens = Foundation.Hooks.useTokens
local useLocalization = require(AppChatParent.Localization).Hooks.useLocalization
local useFoundationPresence = require(AppChat.Hooks.useFoundationPresence)
local FFlagAppChatContextCardNameLoadingShimmer = require(AppChat.Flags.FFlagAppChatContextCardNameLoadingShimmer)
local FFlagAppChatUseTCUserTileForOSACard = require(AppChat.Flags.FFlagAppChatUseTCUserTileForOSACard)
local FFlagEnableBlackbirdCheck = require(AppChatParent.SharedFlags).FFlagEnableBlackbirdCheck

return React.memo(React.forwardRef(function(t1: {[any]: any}, p1) -- line: 36
	-- upvalues: useTokens (copy), useFoundationPresence (copy), useLocalization (copy), FFlagAppChatContextCardNameLoadingShimmer (copy), React (copy), Foundation (copy), Skeleton (copy), FFlagAppChatUseTCUserTileForOSACard (copy), UserTile (copy), LayoutMode (copy), FFlagEnableBlackbirdCheck (copy)
	local v16 = useTokens()
	local Size = v16.Size
	local v18 = useFoundationPresence(t1.userId)
	local v19 = useLocalization({
		firstConversationWithThisUserHeadingText = "Feature.Chat.Heading.FirstConversationWithThisUser",
		firstConversationWithHeadingText = {
			"Feature.Chat.Heading.FirstConversationWith",
			displayName = t1.displayName
		},
		firstInteractionWithThisPersonHeadingText = "Feature.Chat.Heading.FirstInteractionWithThisPerson",
		firstInteractionWithHeadingText = {
			"Feature.Chat.Heading.FirstInteractionWith",
			displayName = t1.displayName
		},
		osaContextCardDescriptionText = "Feature.Chat.Description.OSAContextCardDescription",
		user = "Feature.Chat.Label.User"
	})
	local isChatUserMessagesEnabled = t1.isChatUserMessagesEnabled
	local v21 = if not isChatUserMessagesEnabled then v19.firstInteractionWithHeadingText else v19.firstConversationWithHeadingText
	local v22 = if not isChatUserMessagesEnabled then v19.firstInteractionWithThisPersonHeadingText else v19.firstConversationWithThisUserHeadingText

	if FFlagAppChatContextCardNameLoadingShimmer then
		local v23 = not t1.displayName and not t1.hasError
		local v24 = not t1.username and not t1.hasError
		local v25 = not t1.avatarThumbnail and not t1.hasError
		local v26 = not v23 and (not v24 and not v25)

		return React.createElement(Foundation.View, {
			tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
			sizeConstraint = {
				MaxSize = Vector2.new(700, 500)
			}
		}, {
			AvatarContainer = React.createElement(Foundation.View, {
				tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
				LayoutOrder = 1,
				onActivated = if not v26 then nil else t1.onAvatarActivated
			}, {
				AvatarCircle = if not v25 then if not FFlagAppChatUseTCUserTileForOSACard then React.createElement(Foundation.Image, {
					tag = "size-1200-1200 bg-shift-200",
					cornerRadius = UDim.new(0, v16.Radius.Circle),
					Image = t1.avatarThumbnail,
					LayoutOrder = 1
				}) else React.createElement(Foundation.View, {
					tag = "size-1200-1200",
					LayoutOrder = 1
				}, { React.createElement(UserTile, {
					userId = tostring(t1.userId),
					layoutMode = LayoutMode.compact,
					userPresenceType = v18.presence,
					dontTruncateTitle = true,
					onActivated = t1.onAvatarActivated,
					isRobloxSubscriber = if not FFlagEnableBlackbirdCheck then nil else t1.isRobloxSubscriber
				}) }) else React.createElement(Skeleton, {
					Size = UDim2.new(0, Size.Size_1200, 0, Size.Size_1200),
					radius = Foundation.Enums.Radius.Circle,
					LayoutOrder = 1
				}),
				AvatarTextContainer = React.createElement(Foundation.View, {
					tag = "col auto-xy align-x-center gap-xxsmall",
					LayoutOrder = 2
				}, {
					DisplayName = if not v23 then if not FFlagEnableBlackbirdCheck or (not t1.isRobloxSubscriber or t1.hasError) then React.createElement(Foundation.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = if not t1.hasError then t1.displayName else v19.user,
						fontStyle = v16.Typography.TitleMedium,
						textStyle = v16.Color.Content.Emphasis
					}) else React.createElement(Foundation.View, {
						tag = "row auto-xy align-y-center gap-xsmall",
						LayoutOrder = 1
					}, {
						Name = React.createElement(Foundation.Text, {
							tag = "auto-xy",
							LayoutOrder = 1,
							Text = t1.displayName,
							fontStyle = v16.Typography.TitleMedium,
							textStyle = v16.Color.Content.Emphasis
						}),
						Badge = React.createElement(Foundation.Icon, {
							LayoutOrder = 2,
							name = Foundation.Enums.IconName.RobloxPlus,
							size = Foundation.Enums.IconSize.Small,
							style = v16.Color.Content.Emphasis
						})
					}) else React.createElement(Skeleton, {
						Size = UDim2.new(0, Size.Size_2500, 0, v16.Typography.TitleMedium.FontSize),
						radius = Foundation.Enums.Radius.Large,
						LayoutOrder = 1
					}),
					Username = if not v24 then React.createElement(Foundation.Text, {
						tag = "auto-xy",
						LayoutOrder = 2,
						Text = if not t1.hasError then t1.username else v19.user,
						fontStyle = v16.Typography.BodySmall,
						textStyle = v16.Color.Content.Muted
					}) else React.createElement(Skeleton, {
						Size = UDim2.new(0, Size.Size_2000, 0, v16.Typography.BodySmall.FontSize),
						radius = Foundation.Enums.Radius.Large,
						LayoutOrder = 2
					})
				})
			}),
			TextContainer = React.createElement(Foundation.View, {
				tag = "col align-x-center auto-xy",
				LayoutOrder = 2,
				ref = p1
			}, {
				HeadingText = if not v23 then React.createElement(Foundation.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 1,
					Text = if not t1.hasError then v21 else v22,
					fontStyle = v16.Typography.TitleLarge,
					textStyle = v16.Color.Content.Emphasis
				}) else React.createElement(Skeleton, {
					Size = UDim2.new(0, Size.Size_3000, 0, v16.Typography.TitleLarge.FontSize + v16.Gap.XXSmall),
					radius = Foundation.Enums.Radius.Large,
					LayoutOrder = 1
				}),
				DescriptionText = React.createElement(Foundation.Text, {
					tag = "auto-xy text-wrap",
					LayoutOrder = 2,
					Text = v19.osaContextCardDescriptionText,
					fontStyle = v16.Typography.BodyLarge,
					textStyle = v16.Color.Content.Default
				})
			})
		})
	end

	if (not t1.displayName or (not t1.username or not t1.avatarThumbnail)) and not t1.hasError then
		return React.createElement(Foundation.View, {
			tag = "size-full-0 auto-y",
			sizeConstraint = {
				MaxSize = Vector2.new(700, 500)
			}
		}, { React.createElement(Foundation.Skeleton, {
			Size = UDim2.new(1, 0, 0, 270),
			radius = Foundation.Enums.Radius.Large
		}) })
	end

	return React.createElement(Foundation.View, {
		tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge",
		sizeConstraint = {
			MaxSize = Vector2.new(700, 500)
		}
	}, {
		AvatarContainer = if not t1.hasError then React.createElement(Foundation.View, {
			tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small",
			LayoutOrder = 1,
			onActivated = t1.onAvatarActivated
		}, {
			AvatarCircle = if not FFlagAppChatUseTCUserTileForOSACard then React.createElement(Foundation.Image, {
				tag = "size-1200-1200 bg-shift-200",
				cornerRadius = UDim.new(0, v16.Radius.Circle),
				Image = t1.avatarThumbnail,
				LayoutOrder = 1
			}) else React.createElement(Foundation.View, {
				tag = "size-1200-1200",
				LayoutOrder = 1
			}, { React.createElement(UserTile, {
				userId = tostring(t1.userId),
				layoutMode = LayoutMode.compact,
				userPresenceType = v18.presence,
				dontTruncateTitle = true,
				onActivated = t1.onAvatarActivated,
				isRobloxSubscriber = if not FFlagEnableBlackbirdCheck then nil else t1.isRobloxSubscriber
			}) }),
			AvatarTextContainer = React.createElement(Foundation.View, {
				tag = "col auto-xy align-x-center",
				LayoutOrder = 2
			}, {
				DisplayName = if not FFlagEnableBlackbirdCheck or not t1.isRobloxSubscriber then React.createElement(Foundation.Text, {
					tag = "auto-xy",
					LayoutOrder = 1,
					Text = t1.displayName,
					fontStyle = v16.Typography.TitleMedium,
					textStyle = v16.Color.Content.Emphasis
				}) else React.createElement(Foundation.View, {
					tag = "row auto-xy align-y-center gap-xsmall",
					LayoutOrder = 1
				}, {
					Name = React.createElement(Foundation.Text, {
						tag = "auto-xy",
						LayoutOrder = 1,
						Text = t1.displayName,
						fontStyle = v16.Typography.TitleMedium,
						textStyle = v16.Color.Content.Emphasis
					}),
					Badge = React.createElement(Foundation.Icon, {
						LayoutOrder = 2,
						name = Foundation.Enums.IconName.RobloxPlus,
						size = Foundation.Enums.IconSize.Small,
						style = v16.Color.Content.Emphasis
					})
				}),
				Username = React.createElement(Foundation.Text, {
					tag = "auto-xy",
					LayoutOrder = 2,
					Text = t1.username,
					fontStyle = v16.Typography.BodySmall,
					textStyle = v16.Color.Content.Muted
				})
			})
		}) else nil,
		TextContainer = React.createElement(Foundation.View, {
			tag = "col align-x-center auto-xy",
			LayoutOrder = 2,
			ref = p1
		}, {
			HeadingText = React.createElement(Foundation.Text, {
				tag = "auto-xy text-wrap",
				LayoutOrder = 1,
				Text = if not t1.hasError then v21 else v22,
				fontStyle = v16.Typography.TitleLarge,
				textStyle = v16.Color.Content.Emphasis
			}),
			DescriptionText = React.createElement(Foundation.Text, {
				tag = "auto-xy text-wrap",
				LayoutOrder = 2,
				Text = v19.osaContextCardDescriptionText,
				fontStyle = v16.Typography.BodyLarge,
				textStyle = v16.Color.Content.Default
			})
		})
	})
end))
