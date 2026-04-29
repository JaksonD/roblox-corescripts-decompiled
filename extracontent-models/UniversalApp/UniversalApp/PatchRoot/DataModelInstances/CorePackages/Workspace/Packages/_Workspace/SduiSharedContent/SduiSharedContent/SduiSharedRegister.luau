local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local SduiSharedContentParent = SduiSharedContent.Parent
local React = require(SduiSharedContentParent.React)
local Foundation = require(SduiSharedContentParent.Foundation)
local SduiCoreSystem = require(SduiSharedContentParent.SduiCoreSystem)
local SduiActionType = SduiCoreSystem.SduiActionType
local SduiComponentType = SduiCoreSystem.SduiComponentType
local SduiParsers = SduiCoreSystem.SduiParsers
local getSduiActionHandlerRegistry = SduiCoreSystem.getSduiActionHandlerRegistry
local getSduiComponentRegistry = SduiCoreSystem.getSduiComponentRegistry
local parseBooleanProp_ = SduiParsers.parseBooleanProp_
local parseCallbackProp_ = SduiParsers.parseCallbackProp_
local parseColorTokenProp_ = SduiParsers.parseColorTokenProp_
local parseIntegerProp_ = SduiParsers.parseIntegerProp_
local parseNumberProp_ = SduiParsers.parseNumberProp_
local parseStringProp_ = SduiParsers.parseStringProp_
local parseUDim2Prop_ = SduiParsers.parseUDim2Prop_
local parseUiComponentProp_ = SduiParsers.parseUiComponentProp_
local parseVector2Prop_ = SduiParsers.parseVector2Prop_
local getLuaTableEnumParser = SduiParsers.getLuaTableEnumParser
local FFlagLuaAppSduiBadgeDetailsComponents = require(SduiSharedContentParent.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents
local FFlagSduiCardComponent = require(SduiSharedContentParent.SharedFlags).FFlagSduiCardComponent
local v23 = game:DefineFastFlag("SduiCoachmarkComponent", false)
local FFlagSduiSystemBannerComponent = require(SduiSharedContentParent.SharedFlags).FFlagSduiSystemBannerComponent
local FFlagSduiChartsSupport = require(SduiSharedContentParent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiExperienceDetailsSupport = require(SduiSharedContentParent.SharedFlags).FFlagSduiExperienceDetailsSupport
local FFlagLuaAppUnlockUpsellSupport = require(SduiSharedContentParent.SharedFlags).FFlagLuaAppUnlockUpsellSupport

local function registerSharedActions() -- line: 41
	-- upvalues: SduiActionType (copy), SduiSharedContent (copy), FFlagSduiChartsSupport (copy), FFlagLuaAppSduiBadgeDetailsComponents (copy), getSduiActionHandlerRegistry (copy)
	local t1 = {
		[SduiActionType.LoadMoreFromApi] = {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 44
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Actions.SduiLoadMoreFromApi)
			end,
			firesOwnTelemetry = true
		},
		[SduiActionType.RefreshFromApi] = if not FFlagSduiChartsSupport then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 51
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Actions.SduiRefreshFromApi)
			end,
			firesOwnTelemetry = true
		},
		[SduiActionType.Share] = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else {
			lazyHandler = function() --[[ lazyHandler ]] -- line: 59
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Actions.SduiShareAction)
			end,
			firesOwnTelemetry = false
		}
	}

	getSduiActionHandlerRegistry().registerActionHandlerConfigs(t1)
end
local function registerSharedUiComponents() -- line: 69
	-- upvalues: SduiComponentType (copy), FFlagLuaAppSduiBadgeDetailsComponents (copy), SduiSharedContent (copy), FFlagSduiCardComponent (copy), v23 (copy), FFlagSduiSystemBannerComponent (copy), FFlagSduiExperienceDetailsSupport (copy), FFlagLuaAppUnlockUpsellSupport (copy), getLuaTableEnumParser (copy), Foundation (copy), parseColorTokenProp_ (copy), parseVector2Prop_ (copy), parseIntegerProp_ (copy), parseUDim2Prop_ (copy), parseBooleanProp_ (copy), parseNumberProp_ (copy), parseStringProp_ (copy), parseUiComponentProp_ (copy), parseCallbackProp_ (copy), getSduiComponentRegistry (copy)
	local t2 = {
		[SduiComponentType.DetailsPageImageHeader] = if not FFlagLuaAppSduiBadgeDetailsComponents then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 73
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiDetailsPageImageHeader)
			end
		},
		[SduiComponentType.Card] = if not FFlagSduiCardComponent then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 80
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiCard)
			end
		},
		[SduiComponentType.Coachmark] = if not v23 then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 87
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiCoachmark)
			end
		},
		[SduiComponentType.SystemBanner] = if not FFlagSduiSystemBannerComponent then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 94
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiSystemBanner)
			end
		},
		[SduiComponentType.CircleIcon] = if not FFlagSduiExperienceDetailsSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 101
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiCircleIcon)
			end
		},
		[SduiComponentType.Icon] = if not FFlagSduiExperienceDetailsSupport and not FFlagLuaAppUnlockUpsellSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 108
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiIcon)
			end,
			propParsers = if not FFlagLuaAppUnlockUpsellSupport then nil else {
				name = getLuaTableEnumParser(Foundation.Enums.IconName, "string"),
				style = parseColorTokenProp_,
				size = getLuaTableEnumParser(Foundation.Enums.IconSize, "string"),
				variant = getLuaTableEnumParser(Foundation.Enums.IconVariant, "string"),
				anchorPoint = parseVector2Prop_,
				layoutOrder = parseIntegerProp_,
				position = parseUDim2Prop_,
				visible = parseBooleanProp_,
				zIndex = parseNumberProp_,
				testId = parseStringProp_
			}
		},
		[SduiComponentType.LinkText] = if not FFlagSduiExperienceDetailsSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 130
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiLinkText)
			end
		},
		[SduiComponentType.ContentRatingLabel] = if not FFlagSduiExperienceDetailsSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 137
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiContentRatingLabel)
			end
		},
		[SduiComponentType.MediaGallery] = if not FFlagSduiExperienceDetailsSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 144
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiMediaGallery)
			end
		},
		[SduiComponentType.ActionBar] = if not FFlagSduiExperienceDetailsSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 151
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiActionBar)
			end
		},
		[SduiComponentType.PlayButtonContextualMessage] = if not FFlagSduiExperienceDetailsSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 158
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiPlayButtonContextualMessage)
			end
		},
		[SduiComponentType.ContentRow] = if not FFlagSduiExperienceDetailsSupport and not FFlagLuaAppUnlockUpsellSupport then nil else {
			getLazyComponent = function() --[[ getLazyComponent ]] -- line: 165
				-- upvalues: SduiSharedContent (copy)
				return require(SduiSharedContent.Components.SduiContentRow)
			end,
			propParsers = if not FFlagLuaAppUnlockUpsellSupport then nil else {
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
	}

	getSduiComponentRegistry().registerComponentDefinitions(t2)
end

return React.memo(function() --[[ SduiSharedRegister ]] -- line: 191
	-- upvalues: React (copy), registerSharedActions (copy), registerSharedUiComponents (copy)
	React.useEffect(function() -- line: 192
		-- upvalues: registerSharedActions (copy), registerSharedUiComponents (copy)
		registerSharedActions()
		registerSharedUiComponents()
	end, {})

	return nil
end)
