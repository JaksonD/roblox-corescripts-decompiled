local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local ServerDrivenUiParent = ServerDrivenUi.Parent
local Cryo = require(ServerDrivenUiParent.Cryo)
local React = require(ServerDrivenUiParent.React)
local Foundation = require(ServerDrivenUiParent.Foundation)
local t = require(ServerDrivenUiParent.t)
local CollectionItemSize = require(ServerDrivenUiParent.CollectionViews).CollectionViewTypes.CollectionItemSize
local ItemHeightMode = require(ServerDrivenUi.Content.Collections.ItemHeightMode)
local SduiCoreSystem = require(ServerDrivenUiParent.SduiCoreSystem)
local SduiComponentType = SduiCoreSystem.SduiComponentType
local SduiParsers = SduiCoreSystem.SduiParsers
local getSduiComponentRegistry = SduiCoreSystem.getSduiComponentRegistry
local FFlagSduiExperienceDetailsSupport = require(ServerDrivenUiParent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagLuaAppResetHoverOnSduiPlayButtonActivation = require(ServerDrivenUiParent.SharedFlags).FFlagLuaAppResetHoverOnSduiPlayButtonActivation
local FFlagSduiGlobalRegistryFallback = require(ServerDrivenUiParent.SharedFlags).FFlagSduiGlobalRegistryFallback
local parseCallbackProp_ = SduiParsers.parseCallbackProp_
local parseUiComponentProp_ = SduiParsers.parseUiComponentProp_
local parseLazyUiComponentProp_ = SduiParsers.parseLazyUiComponentProp_
local parseIntegerProp_ = SduiParsers.parseIntegerProp_
local parseNumberProp_ = SduiParsers.parseNumberProp_
local parseUDim2Prop_ = SduiParsers.parseUDim2Prop_
local parseUDimProp_ = SduiParsers.parseUDimProp_
local parseImageStringProp_ = SduiParsers.parseImageStringProp_
local parseVector2Prop_ = SduiParsers.parseVector2Prop_
local parseColor3Prop_ = SduiParsers.parseColor3Prop_
local parseBooleanProp_ = SduiParsers.parseBooleanProp_
local parseGradientProp_ = SduiParsers.parseGradientProp_
local parseIconProp_ = SduiParsers.parseIconProp_
local parseTypographyTokenProp_ = SduiParsers.parseTypographyTokenProp_
local parseColorTokenProp_ = SduiParsers.parseColorTokenProp_
local parseImageSetOrImageProp_ = SduiParsers.parseImageSetOrImageProp_
local parseStringProp_ = SduiParsers.parseStringProp_
local parseFocusNavActionsProp_ = SduiParsers.parseFocusNavActionsProp_
local getArrayMetatableParser = SduiParsers.getArrayMetatableParser
local getEngineEnumParser = SduiParsers.getEngineEnumParser
local getLuaTableEnumParser = SduiParsers.getLuaTableEnumParser
local v37 = game:DefineFastFlag("SduiBadgeComponent", false)
local FFlagSduiTileDisableLegacyHover = require(ServerDrivenUi.Flags).FFlagSduiTileDisableLegacyHover
local FFlagSduiEnableHeroUnitBottomRow = require(ServerDrivenUi.Flags).FFlagSduiEnableHeroUnitBottomRow
local FFlagSduiEnableAssociatedItemsRow = require(ServerDrivenUiParent.SharedFlags).FFlagSduiEnableAssociatedItemsRow
local FFlagSduiEnableChips = require(ServerDrivenUiParent.SharedFlags).FFlagSduiEnableChips
local FFlagLuaAppSduiExperienceDetailsComponents = require(ServerDrivenUiParent.SharedFlags).FFlagLuaAppSduiExperienceDetailsComponents
local FFlagLuaAppSduiBadgeDetailsComponents = require(ServerDrivenUiParent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local FFlagSduiAttributionRowV2 = require(ServerDrivenUiParent.SharedFlags).FFlagSduiAttributionRowV2
local FFlagSduiPropMapping = require(ServerDrivenUiParent.SharedFlags).FFlagSduiPropMapping
local FFlagSduiServerCompat = require(ServerDrivenUiParent.SharedFlags).FFlagSduiServerCompat
local FFlagSduiExperienceDetailsSocialProof = require(ServerDrivenUiParent.SharedFlags).FFlagSduiExperienceDetailsSocialProof
local FFlagSduiChipAccessoryProps = require(ServerDrivenUiParent.SharedFlags).FFlagSduiChipAccessoryProps
local FFlagAddItemHeightModeToSduiCollectionCarousel = require(ServerDrivenUiParent.SharedFlags).FFlagAddItemHeightModeToSduiCollectionCarousel
local FFlagSduiOverflowMenuComponent = require(ServerDrivenUiParent.SharedFlags).FFlagSduiOverflowMenuComponent
local FFlagSduiImpressionHandlerRegistry = require(ServerDrivenUiParent.SharedFlags).FFlagSduiImpressionHandlerRegistry
local FFlagSduiCarouselHoverFixes = require(ServerDrivenUiParent.SharedFlags).FFlagSduiCarouselHoverFixes
local FFlagSduiChartsSupport = require(ServerDrivenUiParent.SharedFlags).FFlagSduiChartsSupport
local FFlagLuaAppDismissUnlockUpsell = require(ServerDrivenUiParent.SharedFlags).FFlagLuaAppDismissUnlockUpsell
local t1 = {}
local t2 = {}

t2.__index = t2

function t2.new() -- line: 84
	-- upvalues: FFlagSduiServerCompat (copy), parseVector2Prop_ (copy), getEngineEnumParser (copy), parseColor3Prop_ (copy), parseNumberProp_ (copy), parseIntegerProp_ (copy), parseUDim2Prop_ (copy), Cryo (copy), parseBooleanProp_ (copy), parseStringProp_ (copy), SduiComponentType (copy), ServerDrivenUiParent (copy), FFlagSduiAttributionRowV2 (copy), parseCallbackProp_ (copy), parseUiComponentProp_ (copy), parseTypographyTokenProp_ (copy), parseColorTokenProp_ (copy), getLuaTableEnumParser (copy), Foundation (copy), parseImageStringProp_ (copy), t (copy), parseIconProp_ (copy), parseUDimProp_ (copy), ServerDrivenUi (copy), CollectionItemSize (copy), FFlagAddItemHeightModeToSduiCollectionCarousel (copy), ItemHeightMode (copy), getArrayMetatableParser (copy), parseLazyUiComponentProp_ (copy), FFlagSduiImpressionHandlerRegistry (copy), FFlagSduiCarouselHoverFixes (copy), parseFocusNavActionsProp_ (copy), React (copy), parseGradientProp_ (copy), FFlagSduiPropMapping (copy), FFlagLuaAppSduiBadgeDetailsComponents (copy), FFlagLuaAppResetHoverOnSduiPlayButtonActivation (copy), parseImageSetOrImageProp_ (copy), FFlagSduiTileDisableLegacyHover (copy), FFlagSduiEnableHeroUnitBottomRow (copy), FFlagSduiEnableChips (copy), FFlagSduiChipAccessoryProps (copy), FFlagSduiEnableAssociatedItemsRow (copy), FFlagLuaAppSduiExperienceDetailsComponents (copy), FFlagSduiExperienceDetailsSocialProof (copy), FFlagSduiChartsSupport (copy), v37 (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagSduiOverflowMenuComponent (copy), FFlagLuaAppDismissUnlockUpsell (copy), t2 (copy)
	local v58 = if not FFlagSduiServerCompat then {
		AnchorPoint = parseVector2Prop_,
		AutomaticSize = getEngineEnumParser(Enum.AutomaticSize),
		BackgroundColor3 = parseColor3Prop_,
		BackgroundTransparency = parseNumberProp_,
		LayoutOrder = parseIntegerProp_,
		Position = parseUDim2Prop_,
		Size = parseUDim2Prop_,
		ZIndex = parseNumberProp_
	} else {
		anchorPoint = parseVector2Prop_,
		automaticSize = getEngineEnumParser(Enum.AutomaticSize),
		backgroundColor3 = parseColor3Prop_,
		backgroundTransparency = parseNumberProp_,
		layoutOrder = parseIntegerProp_,
		position = parseUDim2Prop_,
		size = parseUDim2Prop_,
		zIndex = parseNumberProp_
	}
	local v59 = if not FFlagSduiServerCompat then Cryo.Dictionary.union({
		RichText = parseBooleanProp_,
		Text = parseStringProp_,
		TextTruncate = getEngineEnumParser(Enum.TextTruncate),
		TextWrapped = parseBooleanProp_,
		TextXAlignment = getEngineEnumParser(Enum.TextXAlignment),
		TextYAlignment = getEngineEnumParser(Enum.TextYAlignment)
	}, v58) else Cryo.Dictionary.union({
		richText = parseBooleanProp_,
		text = parseStringProp_,
		textTruncate = getEngineEnumParser(Enum.TextTruncate),
		textWrapped = parseBooleanProp_,
		textXAlignment = getEngineEnumParser(Enum.TextXAlignment),
		textYAlignment = getEngineEnumParser(Enum.TextYAlignment)
	}, v58)
	local t3 = {
		columnGap = parseNumberProp_,
		sideMargin = parseNumberProp_,
		numColumns = parseNumberProp_,
		fractionalItemAmount = parseNumberProp_,
		loadMoreThreshold = parseNumberProp_,
		verticalGap = parseNumberProp_
	}
	local t4 = {
		_registeredComponents = {
			[SduiComponentType.AttributionRow] = {
				component = require(ServerDrivenUiParent.SduiSharedContent).SduiAttributionRow,
				propParsers = {
					layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					size = if not FFlagSduiServerCompat or not FFlagSduiAttributionRowV2 then nil else parseUDim2Prop_,
					onActivated = parseCallbackProp_,
					rightButtonContent = parseUiComponentProp_,
					title = if not FFlagSduiAttributionRowV2 then nil else parseStringProp_,
					titleFontStyle = if not FFlagSduiAttributionRowV2 then nil else parseTypographyTokenProp_,
					titleTextColor = if not FFlagSduiAttributionRowV2 then nil else parseColorTokenProp_,
					subtitle = if not FFlagSduiAttributionRowV2 then nil else parseStringProp_,
					subtitleFontStyle = if not FFlagSduiAttributionRowV2 then nil else parseTypographyTokenProp_,
					subtitleTextColor = if not FFlagSduiAttributionRowV2 then nil else parseColor3Prop_,
					subtitleIconName = if not FFlagSduiAttributionRowV2 then nil else getLuaTableEnumParser(Foundation.Enums.IconName, "string"),
					subtitleIconSize = if not FFlagSduiAttributionRowV2 then nil else getLuaTableEnumParser(Foundation.Enums.IconSize, "string"),
					subtitleIconStyle = if not FFlagSduiAttributionRowV2 then nil else parseColorTokenProp_,
					subtitleIconVariant = if not FFlagSduiAttributionRowV2 then nil else getLuaTableEnumParser(Foundation.Enums.IconVariant, "string"),
					subtitleBackgroundIconName = if not FFlagSduiAttributionRowV2 then nil else getLuaTableEnumParser(Foundation.Enums.IconName, "string"),
					subtitleBackgroundIconStyle = if not FFlagSduiAttributionRowV2 then nil else parseColorTokenProp_,
					subtitleOnActivated = if not FFlagSduiAttributionRowV2 then nil else parseCallbackProp_,
					caption = if not FFlagSduiAttributionRowV2 then nil else parseStringProp_,
					captionTextColor = if not FFlagSduiAttributionRowV2 then nil else parseColorTokenProp_,
					captionFontStyle = if not FFlagSduiAttributionRowV2 then nil else parseTypographyTokenProp_,
					textContainerSize = if not FFlagSduiAttributionRowV2 then nil else parseUDim2Prop_,
					image = parseImageStringProp_,
					imageSize = if not FFlagSduiAttributionRowV2 then nil else parseUDim2Prop_,
					LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Size = if FFlagSduiServerCompat or not FFlagSduiAttributionRowV2 then nil else parseUDim2Prop_
				},
				propInterface = if not FFlagSduiAttributionRowV2 then nil else {
					title = t.string,
					subtitle = t.string
				}
			},
			[SduiComponentType.Button] = {
				component = if not FFlagSduiServerCompat then require(ServerDrivenUiParent.Foundation).Button else require(ServerDrivenUiParent.SduiSharedContent).SduiButton,
				propParsers = if not FFlagSduiServerCompat then {
					AnchorPoint = parseVector2Prop_,
					LayoutOrder = parseIntegerProp_,
					Position = parseUDim2Prop_,
					onActivated = parseCallbackProp_,
					width = parseUDimProp_
				} else {
					anchorPoint = parseVector2Prop_,
					cursorType = getLuaTableEnumParser(Foundation.Enums.CursorType, "string"),
					fillBehavior = getLuaTableEnumParser(Foundation.Enums.FillBehavior, "string"),
					icon = parseIconProp_,
					inputDelay = parseNumberProp_,
					isDisabled = parseBooleanProp_,
					isLoading = parseBooleanProp_,
					layoutOrder = parseIntegerProp_,
					onActivated = parseCallbackProp_,
					position = parseUDim2Prop_,
					selectable = parseBooleanProp_,
					size = getLuaTableEnumParser(Foundation.Enums.InputSize, "string"),
					tag = parseStringProp_,
					testId = parseStringProp_,
					text = parseStringProp_,
					variant = getLuaTableEnumParser(Foundation.Enums.ButtonVariant, "string"),
					visible = parseBooleanProp_,
					width = parseUDimProp_,
					zIndex = parseNumberProp_
				}
			},
			[SduiComponentType.CollectionCarousel] = {
				component = require(ServerDrivenUi.Content.Collections.SduiCollectionCarousel),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					collectionItemSize = getLuaTableEnumParser(CollectionItemSize, "string"),
					itemHeightFromWidth = parseUDimProp_,
					headerComponent = parseUiComponentProp_,
					itemHeightMode = if not FFlagAddItemHeightModeToSduiCollectionCarousel then nil else getLuaTableEnumParser(ItemHeightMode, "string"),
					layoutOverrides = t3,
					scrollingEnabledOverride = parseBooleanProp_,
					maxItemsToShow = parseNumberProp_,
					shouldUseFrameBoundsForImpressions = parseBooleanProp_,
					backgroundMuralUrl = parseImageStringProp_,
					onScrollToEnd = parseCallbackProp_,
					scrollThresholdFromEnd = parseNumberProp_,
					itemTemplateKey = parseStringProp_,
					focusNavActionsComponent = parseUiComponentProp_,
					disableSelectionOrder = parseBooleanProp_,
					numItemsToRenderOffScreen = parseNumberProp_,
					items = getArrayMetatableParser(parseLazyUiComponentProp_),
					impressionEventName = if not FFlagSduiImpressionHandlerRegistry then nil else parseStringProp_,
					skipItemImpressionsLog = if not FFlagSduiImpressionHandlerRegistry then nil else parseBooleanProp_,
					enableHoverOverflow = if not FFlagSduiCarouselHoverFixes then nil else parseBooleanProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_
				}
			},
			[SduiComponentType.CollectionGrid] = {
				component = require(ServerDrivenUi.Content.Collections.SduiCollectionGrid),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					bufferRowsBelowScreen = parseNumberProp_,
					bufferRowsAboveScreen = parseNumberProp_,
					collectionItemSize = getLuaTableEnumParser(CollectionItemSize, "string"),
					disableRelativeGap = parseBooleanProp_,
					focusNavActionsComponent = parseUiComponentProp_,
					headerComponent = parseUiComponentProp_,
					itemHeightFromWidth = parseUDimProp_,
					itemTemplateKey = parseStringProp_,
					layoutOverrides = t3,
					maxNumRows = parseNumberProp_,
					shouldUseFrameBoundsForImpressions = parseBooleanProp_,
					disableSelectionOrder = parseBooleanProp_,
					items = getArrayMetatableParser(parseLazyUiComponentProp_),
					thresholdRowsFromBottom = parseNumberProp_,
					onReachedThresholdFromEnd = parseCallbackProp_,
					impressionEventName = if not FFlagSduiImpressionHandlerRegistry then nil else parseStringProp_,
					skipItemImpressionsLog = if not FFlagSduiImpressionHandlerRegistry then nil else parseBooleanProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_
				},
				propInterface = {
					itemHeightFromWidth = t.UDim
				}
			},
			[SduiComponentType.Dialog] = {
				component = require(ServerDrivenUi.Content.SduiDialog),
				propParsers = {
					size = getLuaTableEnumParser(Foundation.Enums.DialogSize, "string"),
					image = parseStringProp_,
					imageAspectRatio = parseNumberProp_,
					titleText = parseStringProp_,
					bodyText = parseStringProp_,
					bodyComponent = parseUiComponentProp_,
					actionsLabel = parseStringProp_,
					actionsOrientation = getLuaTableEnumParser(Foundation.Enums.Orientation, "string"),
					primaryButtonAction = parseCallbackProp_,
					primaryButtonText = parseStringProp_,
					primaryButtonIcon = parseIconProp_,
					primaryButtonInputDelay = parseNumberProp_,
					primaryButtonSideEffectAction = parseCallbackProp_,
					secondaryButtonAction = parseCallbackProp_,
					secondaryButtonText = parseStringProp_,
					secondaryButtonIcon = parseIconProp_,
					secondaryButtonInputDelay = parseNumberProp_,
					secondaryButtonSideEffectAction = parseCallbackProp_,
					onClose = parseCallbackProp_,
					disablePortal = parseBooleanProp_,
					hasBackdrop = parseBooleanProp_
				}
			},
			[SduiComponentType.Divider] = {
				component = require(ServerDrivenUi.Content.SduiDivider),
				propParsers = if not FFlagSduiServerCompat then {
					AnchorPoint = parseVector2Prop_,
					BackgroundColor3 = parseColor3Prop_,
					Position = parseUDim2Prop_,
					Size = parseUDim2Prop_
				} else {
					anchorPoint = parseVector2Prop_,
					backgroundColor3 = parseColor3Prop_,
					position = parseUDim2Prop_,
					size = parseUDim2Prop_
				}
			},
			[SduiComponentType.FocusNavActions] = {
				component = require(ServerDrivenUi.FocusNavigation.SduiFocusNavActions),
				propParsers = {
					focusNavActions = parseFocusNavActionsProp_
				},
				propInterface = {
					focusNavActions = t.table
				}
			},
			[SduiComponentType.Fragment] = {
				component = React.Fragment
			},
			[SduiComponentType.GameTileActiveFriendsFooter] = {
				component = require(ServerDrivenUi.Content.SduiGameTileActiveFriendsFooter),
				propParsers = if not FFlagSduiServerCompat then {
					AnchorPoint = parseVector2Prop_,
					AutomaticSize = getEngineEnumParser(Enum.AutomaticSize),
					BackgroundColor3 = parseColor3Prop_,
					LayoutOrder = parseIntegerProp_,
					Position = parseUDim2Prop_,
					Size = parseUDim2Prop_,
					ZIndex = parseNumberProp_,
					universeId = parseStringProp_,
					iconWidth = parseNumberProp_,
					maxAvatars = parseNumberProp_,
					onActivated = parseCallbackProp_
				} else {
					anchorPoint = parseVector2Prop_,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundColor3 = parseColor3Prop_,
					layoutOrder = parseIntegerProp_,
					position = parseUDim2Prop_,
					size = parseUDim2Prop_,
					zIndex = parseNumberProp_,
					universeId = parseStringProp_,
					iconWidth = parseNumberProp_,
					maxAvatars = parseNumberProp_,
					onActivated = parseCallbackProp_
				},
				propInterface = {
					universeId = t.union(t.string, t.number)
				}
			},
			[SduiComponentType.HeroUnit] = {
				component = require(ServerDrivenUi.Content.SduiHeroUnit),
				propParsers = {
					backgroundComponent = parseUiComponentProp_,
					bottomRowComponent = parseUiComponentProp_,
					ctaButtonComponent = parseUiComponentProp_,
					gradient = parseGradientProp_,
					headerComponent = parseUiComponentProp_,
					onActivated = parseCallbackProp_,
					overlayComponent = parseUiComponentProp_,
					backgroundImage = parseImageStringProp_,
					foregroundImage = parseImageStringProp_,
					titleImage = parseImageStringProp_
				}
			},
			[SduiComponentType.HoldToPlay] = {
				component = require(ServerDrivenUi.FocusNavigation.SduiHoldToPlay),
				propParsers = {
					universeId = parseStringProp_,
					placeId = parseStringProp_
				},
				propInterface = {
					universeId = t.union(t.string, t.number)
				}
			},
			[SduiComponentType.Image] = {
				component = if not FFlagSduiServerCompat then require(ServerDrivenUiParent.Foundation).Image else require(ServerDrivenUiParent.SduiSharedContent).SduiImage,
				propParsers = if not FFlagSduiServerCompat then {
					AnchorPoint = parseVector2Prop_,
					ClipsDescendants = parseBooleanProp_,
					LayoutOrder = parseIntegerProp_,
					Position = parseUDim2Prop_,
					Size = parseUDim2Prop_,
					onActivated = parseCallbackProp_,
					Image = parseImageStringProp_
				} else {
					anchorPoint = parseVector2Prop_,
					aspectRatio = parseNumberProp_,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundStyle = parseColorTokenProp_,
					clipsDescendants = parseBooleanProp_,
					cornerRadius = parseUDimProp_,
					cursorType = getLuaTableEnumParser(Foundation.Enums.CursorType, "string"),
					image = parseImageStringProp_,
					imageStyle = parseColorTokenProp_,
					layoutOrder = parseIntegerProp_,
					onActivated = parseCallbackProp_,
					position = parseUDim2Prop_,
					resampleMode = getEngineEnumParser(Enum.ResamplerMode),
					scaleType = getEngineEnumParser(Enum.ScaleType),
					size = parseUDim2Prop_,
					sizeConstraint = getEngineEnumParser(Enum.SizeConstraint),
					tag = parseStringProp_,
					tileSize = parseUDim2Prop_,
					visible = parseBooleanProp_,
					zIndex = parseNumberProp_
				},
				propMapping = if not FFlagSduiPropMapping or FFlagLuaAppSduiBadgeDetailsComponents then nil else {
					image = "Image",
					size = "Size"
				}
			},
			[SduiComponentType.SingleItemCollection] = {
				component = require(ServerDrivenUi.Content.SduiSingleItemCollection),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					automaticSize = if not FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					item = parseLazyUiComponentProp_,
					impressionEventName = if not FFlagSduiImpressionHandlerRegistry then nil else parseStringProp_,
					skipItemImpressionsLog = if not FFlagSduiImpressionHandlerRegistry then nil else parseBooleanProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					AutomaticSize = if FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_
				}
			},
			[SduiComponentType.PlayButton] = {
				component = require(ServerDrivenUiParent.SduiSharedContent).SduiPlayButton,
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					width = parseUDimProp_,
					onActivatedEffect = if not FFlagLuaAppResetHoverOnSduiPlayButtonActivation then nil else parseCallbackProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_
				},
				propInterface = {
					universeId = t.union(t.string, t.number)
				}
			},
			[SduiComponentType.SectionHeader] = {
				component = require(ServerDrivenUi.Content.SduiSectionHeader),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					automaticSize = if not FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					zIndex = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					iconComponent = parseUiComponentProp_,
					infoText = parseStringProp_,
					onTitleActivated = parseCallbackProp_,
					onSubtitleActivated = parseCallbackProp_,
					onInfoIconActivated = parseCallbackProp_,
					subtitleColor = parseColor3Prop_,
					subtitleComponent = parseUiComponentProp_,
					subtitleIcon = parseIconProp_,
					subtitleIconWidth = parseNumberProp_,
					subtitleFontStyle = parseTypographyTokenProp_,
					subtitleGap = parseNumberProp_,
					subtitleText = parseStringProp_,
					titleColor = parseColor3Prop_,
					titleComponent = parseUiComponentProp_,
					titleGap = parseNumberProp_,
					titleIcon = parseIconProp_,
					titleIconWidth = parseNumberProp_,
					titleFontStyle = parseTypographyTokenProp_,
					titleText = parseStringProp_,
					verticalGap = parseNumberProp_,
					allowInteractionForDirectionalInput = parseBooleanProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					AutomaticSize = if FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					ZIndex = if FFlagSduiServerCompat then nil else parseNumberProp_
				}
			},
			[SduiComponentType.SeeAllTile] = {
				component = require(ServerDrivenUiParent.GameCollections).SeeAllTile,
				propParsers = {
					layoutOrder = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					onActivated = parseCallbackProp_,
					icon = parseIconProp_,
					title = parseStringProp_,
					LayoutOrder = if FFlagSduiServerCompat then nil else parseNumberProp_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_
				}
			},
			[SduiComponentType.SlotOverlay] = {
				component = require(ServerDrivenUi.Content.SduiSlotOverlay),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					automaticSize = if not FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					zIndex = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					topLeftSlot = parseUiComponentProp_,
					topMiddleSlot = parseUiComponentProp_,
					topRightSlot = parseUiComponentProp_,
					centerLeftSlot = parseUiComponentProp_,
					centerMiddleSlot = parseUiComponentProp_,
					centerRightSlot = parseUiComponentProp_,
					bottomLeftSlot = parseUiComponentProp_,
					bottomMiddleSlot = parseUiComponentProp_,
					bottomRightSlot = parseUiComponentProp_,
					padding = parseNumberProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					AutomaticSize = if FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					ZIndex = if FFlagSduiServerCompat then nil else parseNumberProp_
				}
			},
			[SduiComponentType.Text] = {
				component = if not FFlagSduiServerCompat then require(ServerDrivenUiParent.Foundation).Text else require(ServerDrivenUiParent.SduiSharedContent).SduiText,
				propParsers = if not FFlagSduiServerCompat then {
					AnchorPoint = parseVector2Prop_,
					ClipsDescendants = parseBooleanProp_,
					LayoutOrder = parseIntegerProp_,
					Position = parseUDim2Prop_,
					Size = parseUDim2Prop_,
					AutomaticSize = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else getEngineEnumParser(Enum.AutomaticSize),
					onActivated = parseCallbackProp_,
					textStyle = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else parseColorTokenProp_,
					fontStyle = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else parseTypographyTokenProp_
				} else {
					anchorPoint = parseVector2Prop_,
					aspectRatio = parseNumberProp_,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundStyle = parseColorTokenProp_,
					children = parseUiComponentProp_,
					cornerRadius = parseUDimProp_,
					cursorType = getLuaTableEnumParser(Foundation.Enums.CursorType, "string"),
					fontStyle = parseTypographyTokenProp_,
					isDisabled = parseBooleanProp_,
					layoutOrder = parseIntegerProp_,
					onActivated = parseCallbackProp_,
					onSecondaryActivated = parseCallbackProp_,
					padding = parseNumberProp_,
					position = parseUDim2Prop_,
					richText = parseBooleanProp_,
					rotation = parseNumberProp_,
					scale = parseNumberProp_,
					selectable = parseBooleanProp_,
					size = parseUDim2Prop_,
					sizeConstraint = getEngineEnumParser(Enum.SizeConstraint),
					tag = parseStringProp_,
					testId = parseStringProp_,
					text = parseStringProp_,
					textStyle = parseColorTokenProp_,
					textTruncate = getEngineEnumParser(Enum.TextTruncate),
					textWrapped = parseBooleanProp_,
					textXAlignment = getEngineEnumParser(Enum.TextXAlignment),
					textYAlignment = getEngineEnumParser(Enum.TextYAlignment),
					visible = parseBooleanProp_,
					zIndex = parseNumberProp_
				},
				propMapping = if not FFlagSduiPropMapping or FFlagSduiServerCompat then nil else {
					text = "Text",
					text_truncate = "TextTruncate",
					automatic_size = "AutomaticSize"
				}
			},
			[SduiComponentType.TextIconRow] = {
				component = require(ServerDrivenUi.Content.SduiTextIconRow),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					automaticSize = if not FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					selectable = if not FFlagSduiServerCompat then nil else parseBooleanProp_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					zIndex = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					iconFirst = parseBooleanProp_,
					onActivated = parseCallbackProp_,
					text = parseStringProp_,
					textColor = parseColor3Prop_,
					fontStyle = parseTypographyTokenProp_,
					gap = parseNumberProp_,
					icon = parseIconProp_,
					iconWidth = parseNumberProp_,
					iconColor = parseColor3Prop_,
					textOverrides = v59,
					iconOverrides = v58,
					textFlexMode = getEngineEnumParser(Enum.UIFlexMode),
					backgroundStyle = parseColorTokenProp_,
					cornerRadius = parseUDimProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					AutomaticSize = if FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Selectable = if FFlagSduiServerCompat then nil else parseBooleanProp_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					ZIndex = if FFlagSduiServerCompat then nil else parseNumberProp_
				}
			},
			[SduiComponentType.TextPill] = {
				component = require(ServerDrivenUi.Content.SduiTextPill),
				propParsers = if not FFlagSduiServerCompat then {
					AnchorPoint = parseVector2Prop_,
					BackgroundColor3 = parseColor3Prop_,
					Position = parseUDim2Prop_,
					Size = parseUDim2Prop_,
					TextColor3 = parseColor3Prop_,
					fontStyle = parseTypographyTokenProp_
				} else {
					anchorPoint = parseVector2Prop_,
					backgroundColor3 = parseColor3Prop_,
					position = parseUDim2Prop_,
					size = parseUDim2Prop_,
					textColor3 = parseColor3Prop_,
					fontStyle = parseTypographyTokenProp_
				}
			},
			[SduiComponentType.Tile] = {
				component = require(ServerDrivenUi.Content.SduiTile),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					automaticSize = if not FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					backgroundColor3 = if not FFlagSduiServerCompat then nil else parseColor3Prop_,
					layoutOrder = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					selectionOrder = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					zIndex = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					backgroundImage = parseImageSetOrImageProp_,
					backgroundImageComponent = parseUiComponentProp_,
					containmentPadding = parseNumberProp_,
					cornerRadius = parseNumberProp_,
					ctaButtonComponent = parseUiComponentProp_,
					footerComponent = parseUiComponentProp_,
					image = parseImageStringProp_,
					imageAspectRatio = parseNumberProp_,
					imageComponent = parseUiComponentProp_,
					isContained = parseBooleanProp_,
					onActivated = parseCallbackProp_,
					thumbnailBackgroundStyle = parseColorTokenProp_,
					thumbnailOverlayComponent = parseUiComponentProp_,
					titleComponent = parseUiComponentProp_,
					titleFont = parseTypographyTokenProp_,
					titleLines = parseIntegerProp_,
					titleText = parseStringProp_,
					enableLegacyHoverState = if not FFlagSduiTileDisableLegacyHover then parseBooleanProp_ else nil,
					focusNavActionsComponent = parseUiComponentProp_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					AutomaticSize = if FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					BackgroundColor3 = if FFlagSduiServerCompat then nil else parseColor3Prop_,
					LayoutOrder = if FFlagSduiServerCompat then nil else parseNumberProp_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					SelectionOrder = if FFlagSduiServerCompat then nil else parseNumberProp_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					ZIndex = if FFlagSduiServerCompat then nil else parseNumberProp_
				}
			},
			[SduiComponentType.TileFooter] = {
				component = require(ServerDrivenUi.Content.SduiTileFooter),
				propParsers = {
					anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
					automaticSize = if not FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
					position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					selectable = if not FFlagSduiServerCompat then nil else parseBooleanProp_,
					size = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
					zIndex = if not FFlagSduiServerCompat then nil else parseNumberProp_,
					sectionGap = parseNumberProp_,
					textIconGap = parseNumberProp_,
					fontStyle = parseTypographyTokenProp_,
					iconColor = parseColor3Prop_,
					iconWidth = parseNumberProp_,
					leftIcon = parseIconProp_,
					leftIconComponent = parseUiComponentProp_,
					leftText = parseStringProp_,
					leftTextFlexMode = getEngineEnumParser(Enum.UIFlexMode),
					onActivated = parseCallbackProp_,
					rightIcon = parseIconProp_,
					rightIconComponent = parseUiComponentProp_,
					rightText = parseStringProp_,
					rightTextFlexMode = getEngineEnumParser(Enum.UIFlexMode),
					textColor = parseColor3Prop_,
					AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
					AutomaticSize = if FFlagSduiServerCompat then nil else getEngineEnumParser(Enum.AutomaticSize),
					LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
					Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					Selectable = if FFlagSduiServerCompat then nil else parseBooleanProp_,
					Size = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
					ZIndex = if FFlagSduiServerCompat then nil else parseNumberProp_
				}
			},
			[SduiComponentType.View] = {
				component = if not FFlagSduiServerCompat then require(ServerDrivenUiParent.Foundation).View else require(ServerDrivenUiParent.SduiSharedContent).SduiView,
				propParsers = if not FFlagSduiServerCompat then {
					AnchorPoint = parseVector2Prop_,
					ClipsDescendants = parseBooleanProp_,
					LayoutOrder = parseIntegerProp_,
					Position = parseUDim2Prop_,
					Size = parseUDim2Prop_,
					onActivated = parseCallbackProp_
				} else {
					anchorPoint = parseVector2Prop_,
					aspectRatio = parseNumberProp_,
					automaticSize = getEngineEnumParser(Enum.AutomaticSize),
					backgroundStyle = parseColorTokenProp_,
					children = parseUiComponentProp_,
					clipsDescendants = parseBooleanProp_,
					cornerRadius = parseUDimProp_,
					cursorType = getLuaTableEnumParser(Foundation.Enums.CursorType, "string"),
					groupTransparency = parseNumberProp_,
					isDisabled = parseBooleanProp_,
					layoutOrder = parseIntegerProp_,
					onActivated = parseCallbackProp_,
					onSecondaryActivated = parseCallbackProp_,
					padding = parseNumberProp_,
					position = parseUDim2Prop_,
					rotation = parseNumberProp_,
					scale = parseNumberProp_,
					selectable = parseBooleanProp_,
					selectionGroup = parseBooleanProp_,
					size = parseUDim2Prop_,
					sizeConstraint = getEngineEnumParser(Enum.SizeConstraint),
					tag = parseStringProp_,
					testId = parseStringProp_,
					visible = parseBooleanProp_,
					zIndex = parseNumberProp_
				}
			}
		}
	}

	t4._registeredComponents[SduiComponentType.CountdownTextIconRow] = {
		component = require(ServerDrivenUi.Content.SduiCountdownTextIconRow),
		propParsers = Cryo.Dictionary.join(t4._registeredComponents[SduiComponentType.TextIconRow], {
			endTimestamp = parseNumberProp_,
			formatStringHoursMinutes = parseStringProp_,
			defaultString = parseStringProp_
		})
	}
	t4._registeredComponents[SduiComponentType.GameTile] = {
		component = require(ServerDrivenUi.Content.SduiGameTile),
		propParsers = Cryo.Dictionary.join(t4._registeredComponents[SduiComponentType.Tile].propParsers, {
			universeId = parseStringProp_,
			placeId = parseStringProp_,
			disableHoldToPlay = parseBooleanProp_,
			ratingText = parseStringProp_,
			playerCount = parseNumberProp_
		}),
		propInterface = {
			universeId = t.union(t.string, t.number),
			placeId = t.union(t.string, t.number)
		}
	}

	if FFlagSduiEnableHeroUnitBottomRow then
		t4._registeredComponents[SduiComponentType.HeroUnitBottomRow] = {
			component = require(ServerDrivenUi.Content.SduiHeroUnitBottomRow),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
				zIndex = if not FFlagSduiServerCompat then nil else parseNumberProp_,
				ctaButton = parseUiComponentProp_,
				labelText = parseStringProp_,
				rightLabelContent = parseUiComponentProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
				Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
				ZIndex = if FFlagSduiServerCompat then nil else parseNumberProp_
			}
		}
	end

	if FFlagSduiEnableChips then
		t4._registeredComponents[SduiComponentType.Chip] = {
			component = require(ServerDrivenUiParent.SduiSharedContent).SduiChip,
			propParsers = {
				anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
				text = parseStringProp_,
				leadingIconName = parseStringProp_,
				leadingIconVariant = getLuaTableEnumParser(Foundation.Enums.IconVariant, "string"),
				leadingIsCircular = parseBooleanProp_,
				leadingOnActivated = parseCallbackProp_,
				trailingIconName = parseStringProp_,
				trailingIconVariant = getLuaTableEnumParser(Foundation.Enums.IconVariant, "string"),
				trailingIsCircular = parseBooleanProp_,
				trailingOnActivated = parseCallbackProp_,
				onActivated = parseCallbackProp_,
				isChecked = parseBooleanProp_,
				size = getLuaTableEnumParser(Foundation.Enums.ChipSize, "string"),
				AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
				Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_
			},
			propInterface = if not FFlagSduiChipAccessoryProps then nil else {
				leading = t.optional(t.table),
				trailing = t.optional(t.table)
			}
		}
		t4._registeredComponents[SduiComponentType.DualActionChip] = {
			component = require(ServerDrivenUiParent.SduiSharedContent).SduiDualActionChip,
			propParsers = {
				anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
				text = parseStringProp_,
				leadingIconName = parseStringProp_,
				leadingIconVariant = getLuaTableEnumParser(Foundation.Enums.IconVariant, "string"),
				leadingOnActivated = parseCallbackProp_,
				trailingIconName = parseStringProp_,
				trailingIconVariant = getLuaTableEnumParser(Foundation.Enums.IconVariant, "string"),
				trailingOnActivated = parseCallbackProp_,
				AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
				Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_
			}
		}
	end

	if FFlagSduiEnableAssociatedItemsRow then
		t4._registeredComponents[SduiComponentType.AssociatedItemsRow] = {
			component = require(ServerDrivenUi.Content.SduiAssociatedItemsRow),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				items = getArrayMetatableParser(parseLazyUiComponentProp_),
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			}
		}
	end

	if FFlagLuaAppSduiExperienceDetailsComponents then
		t4._registeredComponents[SduiComponentType.ExperienceAssociatedItemsRow] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceAssociatedItemsRow),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				items = getArrayMetatableParser(parseLazyUiComponentProp_),
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
		t4._registeredComponents[SduiComponentType.ExperienceDetailsVoteChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsVoteChip),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
		t4._registeredComponents[SduiComponentType.ExperienceDetailsFavoriteChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsFavoriteChip),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
		t4._registeredComponents[SduiComponentType.ExperienceDetailsNotifyChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsNotifyChip),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
		t4._registeredComponents[SduiComponentType.ExperienceDetailsActiveChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsActiveChip),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
		t4._registeredComponents[SduiComponentType.ExperienceDetailsShareChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsShareChip),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
		t4._registeredComponents[SduiComponentType.ExperienceDetailsReportChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsReportChip),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
	end

	if FFlagSduiExperienceDetailsSocialProof then
		t4._registeredComponents[SduiComponentType.ExperienceDetailsConnectionsPlayedChip] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedChip),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string
			}
		}
		t4._registeredComponents[SduiComponentType.ExperienceDetailsConnectionsPlayedTextRow] = {
			component = require(ServerDrivenUi.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedTextRow),
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				universeId = parseStringProp_,
				name = parseStringProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				universeId = t.string,
				name = t.optional(t.string)
			}
		}
	end

	t4._registeredComponents[SduiComponentType.VerticalFeed] = {
		component = require(ServerDrivenUiParent.SduiSharedContent).SduiVerticalFeed,
		propParsers = {
			layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
			feedItems = getArrayMetatableParser(parseLazyUiComponentProp_),
			gapBetweenFeedItems = parseNumberProp_,
			thresholdFromEnd = parseNumberProp_,
			onScrollToEnd = parseCallbackProp_,
			onRefresh = if not FFlagSduiChartsSupport then nil else parseCallbackProp_,
			stickyItems = if not FFlagSduiChartsSupport then nil else getArrayMetatableParser(parseUiComponentProp_),
			gapAfterStickyItems = if not FFlagSduiChartsSupport then nil else parseIntegerProp_,
			gapBetweenStickyItems = if not FFlagSduiChartsSupport then nil else parseIntegerProp_,
			stickyPaddingTop = if not FFlagSduiChartsSupport then nil else parseIntegerProp_,
			stickyPaddingBottom = if not FFlagSduiChartsSupport then nil else parseIntegerProp_,
			stickyBackgroundStyle = if not FFlagSduiChartsSupport then nil else parseColorTokenProp_,
			stickyContentTag = if not FFlagSduiChartsSupport then nil else parseStringProp_,
			backgroundStyle = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else parseColorTokenProp_,
			LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
		}
	}
	t4._registeredComponents[SduiComponentType.BadgeTile] = {
		component = require(ServerDrivenUi.Content.SduiBadgeTile),
		propParsers = Cryo.Dictionary.join(t4._registeredComponents[SduiComponentType.Tile].propParsers, {
			imageCornerRadius = parseNumberProp_,
			imagePadding = parseNumberProp_
		})
	}

	if v37 then
		t4._registeredComponents[SduiComponentType.Badge] = {
			component = require(ServerDrivenUiParent.SduiSharedContent).SduiBadge,
			propParsers = {
				anchorPoint = parseVector2Prop_,
				layoutOrder = parseIntegerProp_,
				position = parseUDim2Prop_,
				visible = parseBooleanProp_,
				zIndex = parseNumberProp_,
				text = parseStringProp_,
				icon = parseStringProp_,
				variant = getLuaTableEnumParser(Foundation.Enums.BadgeVariant, "string")
			}
		}
	end

	if FFlagSduiExperienceDetailsSupport then
		t4._registeredComponents[SduiComponentType.SongTile] = {
			component = require(ServerDrivenUi.Content.SduiSongTile)
		}
	end

	if FFlagLuaAppSduiBadgeDetailsComponents then
		t4._registeredComponents[SduiComponentType.InfoTable] = {
			component = require(ServerDrivenUiParent.SduiSharedContent).SduiInfoTable,
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				gridTag = parseStringProp_,
				items = getArrayMetatableParser(parseLazyUiComponentProp_),
				numColumns = parseIntegerProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				items = t.array(t.table)
			}
		}
		t4._registeredComponents[SduiComponentType.InfoTableCell] = {
			component = require(ServerDrivenUiParent.AppBlox).InfoTableCell,
			propParsers = {
				labelComponent = parseUiComponentProp_,
				isLastInSingleColumn = parseBooleanProp_,
				numColumns = parseIntegerProp_,
				onActivated = parseCallbackProp_,
				valueComponent = parseUiComponentProp_
			},
			propInterface = {
				labelComponent = t.table,
				valueComponent = t.table,
				isLastInSingleColumn = t.optional(t.boolean)
			}
		}
		t4._registeredComponents[SduiComponentType.ExpandableText] = {
			component = require(ServerDrivenUiParent.SduiSharedContent).SduiExpandableText,
			propParsers = {
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				text = parseStringProp_,
				compactNumberOfLines = parseIntegerProp_,
				fontStyle = parseTypographyTokenProp_,
				textColor = parseColor3Prop_,
				expandedInitially = parseBooleanProp_,
				onExpandChanged = parseCallbackProp_,
				headerComponent = if not FFlagSduiExperienceDetailsSupport then nil else parseUiComponentProp_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_
			},
			propInterface = {
				text = t.string
			}
		}
	end

	if FFlagSduiOverflowMenuComponent then
		t4._registeredComponents[SduiComponentType.OverflowMenu] = {
			component = require(ServerDrivenUiParent.SduiSharedContent).SduiOverflowMenu,
			propParsers = {
				anchorPoint = if not FFlagSduiServerCompat then nil else parseVector2Prop_,
				layoutOrder = if not FFlagSduiServerCompat then nil else parseIntegerProp_,
				position = if not FFlagSduiServerCompat then nil else parseUDim2Prop_,
				zIndex = if not FFlagSduiServerCompat then nil else parseNumberProp_,
				buttonVariant = getLuaTableEnumParser(Foundation.Enums.ButtonVariant, "string"),
				buttonSize = getLuaTableEnumParser(Foundation.Enums.InputSize, "string"),
				buttonIcon = getLuaTableEnumParser(Foundation.Enums.IconName, "string"),
				buttonIconBackgroundStyle = parseColorTokenProp_,
				menuItemSize = getLuaTableEnumParser(Foundation.Enums.InputSize, "string"),
				popoverAlign = getLuaTableEnumParser(Foundation.Enums.PopoverAlign, "string"),
				popoverSide = getLuaTableEnumParser(Foundation.Enums.PopoverSide, "string"),
				menuWidth = parseUDimProp_,
				AnchorPoint = if FFlagSduiServerCompat then nil else parseVector2Prop_,
				LayoutOrder = if FFlagSduiServerCompat then nil else parseIntegerProp_,
				Position = if FFlagSduiServerCompat then nil else parseUDim2Prop_,
				ZIndex = if FFlagSduiServerCompat then nil else parseNumberProp_
			},
			propInterface = {
				items = t.array(t.table)
			}
		}
	end

	if FFlagLuaAppDismissUnlockUpsell then
		t4._registeredComponents[SduiComponentType.AgeCheckUpsellRow] = {
			component = require(ServerDrivenUi.Content.SduiAgeCheckUpsellRow),
			propParsers = {
				leading = parseUiComponentProp_,
				content = parseUiComponentProp_,
				trailing = parseUiComponentProp_,
				onActivated = parseCallbackProp_,
				tag = parseStringProp_,
				leadingTag = parseStringProp_,
				contentTag = parseStringProp_,
				trailingTag = parseStringProp_,
				layoutOrder = parseIntegerProp_,
				position = parseUDim2Prop_,
				zIndex = parseNumberProp_,
				testId = parseStringProp_
			}
		}
	end

	setmetatable(t4, t2)

	return t4
end
function t2.getComponentDefinition(p1, p2) -- line: 1154
	-- upvalues: FFlagSduiGlobalRegistryFallback (copy), getSduiComponentRegistry (copy)
	local v64 = p1._registeredComponents[p2]

	if not v64 then
		if FFlagSduiGlobalRegistryFallback then
			return (getSduiComponentRegistry().getComponentDefinition(p2))
		end

		v64 = nil
	end

	return v64
end
function t2.doesComponentManageChildren(p3, p4) -- line: 1166
	local v67 = p3:getComponentDefinition(p4)

	return not not v67 and (v67.doesManageChildren or false)
end
function t2.getComponent(p5, p6) -- line: 1174
	local v70 = p5:getComponentDefinition(p6)

	return v70 and v70.component
end
function t2.getPropParsers(p7, p8) -- line: 1179
	-- upvalues: t1 (copy)
	local v73 = p7:getComponentDefinition(p8)

	return v73 and v73.propParsers or t1
end
function t2.getPropInterface(p9, p10) -- line: 1187
	local v76 = p9:getComponentDefinition(p10)

	return v76 and v76.propInterface or nil
end

local t5 = {
	[parseUiComponentProp_] = true,
	[parseCallbackProp_] = true,
	[parseFocusNavActionsProp_] = true
}

function t2.doesParserRequireRenderContext(_, p12) -- line: 1198
	-- upvalues: t5 (copy)
	if p12 and t5[p12] then
		return true
	end

	if typeof(p12) == "table" then
		return true
	end

	return false
end
function t2.registerComponent(p13, p14, p15) -- line: 1213
	p13._registeredComponents[p14] = p15
end

return t2
