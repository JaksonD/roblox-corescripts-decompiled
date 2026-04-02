local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.t);
local l_CollectionItemSize_0 = require(l_Parent_0.CollectionViews).CollectionViewTypes.CollectionItemSize;
local v7 = require(l_script_FirstAncestor_0.Content.Collections.ItemHeightMode);
local v8 = require(l_Parent_0.SduiCoreSystem);
local l_SduiComponentType_0 = v8.SduiComponentType;
local l_SduiParsers_0 = v8.SduiParsers;
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
local l_parseCallbackProp__0 = l_SduiParsers_0.parseCallbackProp_;
local l_parseUiComponentProp__0 = l_SduiParsers_0.parseUiComponentProp_;
local l_parseLazyUiComponentProp__0 = l_SduiParsers_0.parseLazyUiComponentProp_;
local l_parseIntegerProp__0 = l_SduiParsers_0.parseIntegerProp_;
local l_parseNumberProp__0 = l_SduiParsers_0.parseNumberProp_;
local l_parseUDim2Prop__0 = l_SduiParsers_0.parseUDim2Prop_;
local l_parseUDimProp__0 = l_SduiParsers_0.parseUDimProp_;
local l_parseImageStringProp__0 = l_SduiParsers_0.parseImageStringProp_;
local l_parseVector2Prop__0 = l_SduiParsers_0.parseVector2Prop_;
local l_parseColor3Prop__0 = l_SduiParsers_0.parseColor3Prop_;
local l_parseBooleanProp__0 = l_SduiParsers_0.parseBooleanProp_;
local l_parseGradientProp__0 = l_SduiParsers_0.parseGradientProp_;
local l_parseIconProp__0 = l_SduiParsers_0.parseIconProp_;
local l_parseTypographyTokenProp__0 = l_SduiParsers_0.parseTypographyTokenProp_;
local l_parseColorTokenProp__0 = l_SduiParsers_0.parseColorTokenProp_;
local l_parseImageSetOrImageProp__0 = l_SduiParsers_0.parseImageSetOrImageProp_;
local l_parseStringProp__0 = l_SduiParsers_0.parseStringProp_;
local l_parseFocusNavActionsProp__0 = l_SduiParsers_0.parseFocusNavActionsProp_;
local l_getArrayMetatableParser_0 = l_SduiParsers_0.getArrayMetatableParser;
local l_getEngineEnumParser_0 = l_SduiParsers_0.getEngineEnumParser;
local l_getLuaTableEnumParser_0 = l_SduiParsers_0.getLuaTableEnumParser;
local l_FFlagSduiTileDisableLegacyHover_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiTileDisableLegacyHover;
local l_FFlagSduiEnableHeroUnitBottomRow_0 = require(l_script_FirstAncestor_0.Flags).FFlagSduiEnableHeroUnitBottomRow;
local l_FFlagSduiEnableAssociatedItemsRow_0 = require(l_Parent_0.SharedFlags).FFlagSduiEnableAssociatedItemsRow;
local l_FFlagSduiEnableChips_0 = require(l_Parent_0.SharedFlags).FFlagSduiEnableChips;
local l_FFlagLuaAppSduiExperienceDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiExperienceDetailsComponents;
local l_FFlagLuaAppSduiBadgeDetailsComponents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSduiBadgeDetailsComponents;
local l_FFlagSduiAttributionRowV2_0 = require(l_Parent_0.SharedFlags).FFlagSduiAttributionRowV2;
local l_FFlagSduiPropMapping_0 = require(l_Parent_0.SharedFlags).FFlagSduiPropMapping;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
local l_FFlagSduiExperienceDetailsSocialProof_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSocialProof;
local l_FFlagSduiChipAccessoryProps_0 = require(l_Parent_0.SharedFlags).FFlagSduiChipAccessoryProps;
local l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 = require(l_Parent_0.SharedFlags).FFlagAddItemHeightModeToSduiCollectionCarousel;
local l_FFlagSduiOverflowMenuComponent_0 = require(l_Parent_0.SharedFlags).FFlagSduiOverflowMenuComponent;
local l_FFlagSduiImpressionHandlerRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiImpressionHandlerRegistry;
local v47 = {};
local v48 = {};
v48.__index = v48;
v48.new = function() --[[ Line: 76 ]] --[[ Name: new ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_parseVector2Prop__0 (copy), l_getEngineEnumParser_0 (copy), l_parseColor3Prop__0 (copy), l_parseNumberProp__0 (copy), l_parseIntegerProp__0 (copy), l_parseUDim2Prop__0 (copy), v2 (copy), l_parseBooleanProp__0 (copy), l_parseStringProp__0 (copy), l_SduiComponentType_0 (copy), l_Parent_0 (copy), l_FFlagSduiAttributionRowV2_0 (copy), l_parseCallbackProp__0 (copy), l_parseUiComponentProp__0 (copy), l_parseTypographyTokenProp__0 (copy), l_parseColorTokenProp__0 (copy), l_getLuaTableEnumParser_0 (copy), v4 (copy), l_parseImageStringProp__0 (copy), v5 (copy), l_parseIconProp__0 (copy), l_parseUDimProp__0 (copy), l_script_FirstAncestor_0 (copy), l_CollectionItemSize_0 (copy), l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 (copy), v7 (copy), l_getArrayMetatableParser_0 (copy), l_parseLazyUiComponentProp__0 (copy), l_FFlagSduiImpressionHandlerRegistry_0 (copy), l_parseFocusNavActionsProp__0 (copy), v3 (copy), l_parseGradientProp__0 (copy), l_FFlagSduiPropMapping_0 (copy), l_FFlagLuaAppSduiBadgeDetailsComponents_0 (copy), l_parseImageSetOrImageProp__0 (copy), l_FFlagSduiTileDisableLegacyHover_0 (copy), l_FFlagSduiEnableHeroUnitBottomRow_0 (copy), l_FFlagSduiEnableChips_0 (copy), l_FFlagSduiChipAccessoryProps_0 (copy), l_FFlagSduiEnableAssociatedItemsRow_0 (copy), l_FFlagLuaAppSduiExperienceDetailsComponents_0 (copy), l_FFlagSduiExperienceDetailsSocialProof_0 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy), l_FFlagSduiOverflowMenuComponent_0 (copy), v48 (copy)
    local v49 = if l_FFlagSduiServerCompat_0 then {
        anchorPoint = l_parseVector2Prop__0, 
        automaticSize = l_getEngineEnumParser_0(Enum.AutomaticSize), 
        backgroundColor3 = l_parseColor3Prop__0, 
        backgroundTransparency = l_parseNumberProp__0, 
        layoutOrder = l_parseIntegerProp__0, 
        position = l_parseUDim2Prop__0, 
        size = l_parseUDim2Prop__0, 
        zIndex = l_parseNumberProp__0
    } else {
        AnchorPoint = l_parseVector2Prop__0, 
        AutomaticSize = l_getEngineEnumParser_0(Enum.AutomaticSize), 
        BackgroundColor3 = l_parseColor3Prop__0, 
        BackgroundTransparency = l_parseNumberProp__0, 
        LayoutOrder = l_parseIntegerProp__0, 
        Position = l_parseUDim2Prop__0, 
        Size = l_parseUDim2Prop__0, 
        ZIndex = l_parseNumberProp__0
    };
    local v50 = if l_FFlagSduiServerCompat_0 then v2.Dictionary.union({
        richText = l_parseBooleanProp__0, 
        text = l_parseStringProp__0, 
        textTruncate = l_getEngineEnumParser_0(Enum.TextTruncate), 
        textWrapped = l_parseBooleanProp__0, 
        textXAlignment = l_getEngineEnumParser_0(Enum.TextXAlignment), 
        textYAlignment = l_getEngineEnumParser_0(Enum.TextYAlignment)
    }, v49) else v2.Dictionary.union({
        RichText = l_parseBooleanProp__0, 
        Text = l_parseStringProp__0, 
        TextTruncate = l_getEngineEnumParser_0(Enum.TextTruncate), 
        TextWrapped = l_parseBooleanProp__0, 
        TextXAlignment = l_getEngineEnumParser_0(Enum.TextXAlignment), 
        TextYAlignment = l_getEngineEnumParser_0(Enum.TextYAlignment)
    }, v49);
    local v51 = {
        columnGap = l_parseNumberProp__0, 
        sideMargin = l_parseNumberProp__0, 
        numColumns = l_parseNumberProp__0, 
        fractionalItemAmount = l_parseNumberProp__0, 
        loadMoreThreshold = l_parseNumberProp__0, 
        verticalGap = l_parseNumberProp__0
    };
    local v52 = {
        _registeredComponents = {
            [l_SduiComponentType_0.AttributionRow] = {
                component = require(l_Parent_0.SduiSharedContent).SduiAttributionRow, 
                propParsers = {
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 and l_FFlagSduiAttributionRowV2_0 then l_parseUDim2Prop__0 else nil, 
                    onActivated = l_parseCallbackProp__0, 
                    rightButtonContent = l_parseUiComponentProp__0, 
                    title = if l_FFlagSduiAttributionRowV2_0 then l_parseStringProp__0 else nil, 
                    titleFontStyle = if l_FFlagSduiAttributionRowV2_0 then l_parseTypographyTokenProp__0 else nil, 
                    titleTextColor = if l_FFlagSduiAttributionRowV2_0 then l_parseColorTokenProp__0 else nil, 
                    subtitle = if l_FFlagSduiAttributionRowV2_0 then l_parseStringProp__0 else nil, 
                    subtitleFontStyle = if l_FFlagSduiAttributionRowV2_0 then l_parseTypographyTokenProp__0 else nil, 
                    subtitleTextColor = if l_FFlagSduiAttributionRowV2_0 then l_parseColor3Prop__0 else nil, 
                    subtitleIconName = if l_FFlagSduiAttributionRowV2_0 then l_getLuaTableEnumParser_0(v4.Enums.IconName, "string") else nil, 
                    subtitleIconSize = if l_FFlagSduiAttributionRowV2_0 then l_getLuaTableEnumParser_0(v4.Enums.IconSize, "string") else nil, 
                    subtitleIconStyle = if l_FFlagSduiAttributionRowV2_0 then l_parseColorTokenProp__0 else nil, 
                    subtitleIconVariant = if l_FFlagSduiAttributionRowV2_0 then l_getLuaTableEnumParser_0(v4.Enums.IconVariant, "string") else nil, 
                    subtitleBackgroundIconName = if l_FFlagSduiAttributionRowV2_0 then l_getLuaTableEnumParser_0(v4.Enums.IconName, "string") else nil, 
                    subtitleBackgroundIconStyle = if l_FFlagSduiAttributionRowV2_0 then l_parseColorTokenProp__0 else nil, 
                    subtitleOnActivated = if l_FFlagSduiAttributionRowV2_0 then l_parseCallbackProp__0 else nil, 
                    caption = if l_FFlagSduiAttributionRowV2_0 then l_parseStringProp__0 else nil, 
                    captionTextColor = if l_FFlagSduiAttributionRowV2_0 then l_parseColorTokenProp__0 else nil, 
                    captionFontStyle = if l_FFlagSduiAttributionRowV2_0 then l_parseTypographyTokenProp__0 else nil, 
                    textContainerSize = if l_FFlagSduiAttributionRowV2_0 then l_parseUDim2Prop__0 else nil, 
                    image = l_parseImageStringProp__0, 
                    imageSize = if l_FFlagSduiAttributionRowV2_0 then l_parseUDim2Prop__0 else nil, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 and l_FFlagSduiAttributionRowV2_0 then l_parseUDim2Prop__0 else nil
                }, 
                propInterface = if l_FFlagSduiAttributionRowV2_0 then {
                    title = v5.string, 
                    subtitle = v5.string
                } else nil
            }, 
            [l_SduiComponentType_0.Button] = {
                component = if l_FFlagSduiServerCompat_0 then require(l_Parent_0.SduiSharedContent).SduiButton else require(l_Parent_0.Foundation).Button, 
                propParsers = if l_FFlagSduiServerCompat_0 then {
                    anchorPoint = l_parseVector2Prop__0, 
                    cursorType = l_getLuaTableEnumParser_0(v4.Enums.CursorType, "string"), 
                    fillBehavior = l_getLuaTableEnumParser_0(v4.Enums.FillBehavior, "string"), 
                    icon = l_parseIconProp__0, 
                    inputDelay = l_parseNumberProp__0, 
                    isDisabled = l_parseBooleanProp__0, 
                    isLoading = l_parseBooleanProp__0, 
                    layoutOrder = l_parseIntegerProp__0, 
                    onActivated = l_parseCallbackProp__0, 
                    position = l_parseUDim2Prop__0, 
                    selectable = l_parseBooleanProp__0, 
                    size = l_getLuaTableEnumParser_0(v4.Enums.InputSize, "string"), 
                    tag = l_parseStringProp__0, 
                    testId = l_parseStringProp__0, 
                    text = l_parseStringProp__0, 
                    variant = l_getLuaTableEnumParser_0(v4.Enums.ButtonVariant, "string"), 
                    visible = l_parseBooleanProp__0, 
                    width = l_parseUDimProp__0, 
                    zIndex = l_parseNumberProp__0
                } else {
                    AnchorPoint = l_parseVector2Prop__0, 
                    LayoutOrder = l_parseIntegerProp__0, 
                    Position = l_parseUDim2Prop__0, 
                    onActivated = l_parseCallbackProp__0, 
                    width = l_parseUDimProp__0
                }
            }, 
            [l_SduiComponentType_0.CollectionCarousel] = {
                component = require(l_script_FirstAncestor_0.Content.Collections.SduiCollectionCarousel), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    collectionItemSize = l_getLuaTableEnumParser_0(l_CollectionItemSize_0, "string"), 
                    itemHeightFromWidth = l_parseUDimProp__0, 
                    headerComponent = l_parseUiComponentProp__0, 
                    itemHeightMode = if l_FFlagAddItemHeightModeToSduiCollectionCarousel_0 then l_getLuaTableEnumParser_0(v7, "string") else nil, 
                    layoutOverrides = v51, 
                    scrollingEnabledOverride = l_parseBooleanProp__0, 
                    maxItemsToShow = l_parseNumberProp__0, 
                    shouldUseFrameBoundsForImpressions = l_parseBooleanProp__0, 
                    backgroundMuralUrl = l_parseImageStringProp__0, 
                    onScrollToEnd = l_parseCallbackProp__0, 
                    scrollThresholdFromEnd = l_parseNumberProp__0, 
                    itemTemplateKey = l_parseStringProp__0, 
                    focusNavActionsComponent = l_parseUiComponentProp__0, 
                    disableSelectionOrder = l_parseBooleanProp__0, 
                    numItemsToRenderOffScreen = l_parseNumberProp__0, 
                    items = l_getArrayMetatableParser_0(l_parseLazyUiComponentProp__0), 
                    impressionEventName = if l_FFlagSduiImpressionHandlerRegistry_0 then l_parseStringProp__0 else nil, 
                    skipItemImpressionsLog = if l_FFlagSduiImpressionHandlerRegistry_0 then l_parseBooleanProp__0 else nil, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil
                }
            }, 
            [l_SduiComponentType_0.CollectionGrid] = {
                component = require(l_script_FirstAncestor_0.Content.Collections.SduiCollectionGrid), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    bufferRowsBelowScreen = l_parseNumberProp__0, 
                    bufferRowsAboveScreen = l_parseNumberProp__0, 
                    collectionItemSize = l_getLuaTableEnumParser_0(l_CollectionItemSize_0, "string"), 
                    disableRelativeGap = l_parseBooleanProp__0, 
                    focusNavActionsComponent = l_parseUiComponentProp__0, 
                    headerComponent = l_parseUiComponentProp__0, 
                    itemHeightFromWidth = l_parseUDimProp__0, 
                    itemTemplateKey = l_parseStringProp__0, 
                    layoutOverrides = v51, 
                    maxNumRows = l_parseNumberProp__0, 
                    shouldUseFrameBoundsForImpressions = l_parseBooleanProp__0, 
                    disableSelectionOrder = l_parseBooleanProp__0, 
                    items = l_getArrayMetatableParser_0(l_parseLazyUiComponentProp__0), 
                    thresholdRowsFromBottom = l_parseNumberProp__0, 
                    onReachedThresholdFromEnd = l_parseCallbackProp__0, 
                    impressionEventName = if l_FFlagSduiImpressionHandlerRegistry_0 then l_parseStringProp__0 else nil, 
                    skipItemImpressionsLog = if l_FFlagSduiImpressionHandlerRegistry_0 then l_parseBooleanProp__0 else nil, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil
                }, 
                propInterface = {
                    itemHeightFromWidth = v5.UDim
                }
            }, 
            [l_SduiComponentType_0.Dialog] = {
                component = require(l_script_FirstAncestor_0.Content.SduiDialog), 
                propParsers = {
                    size = l_getLuaTableEnumParser_0(v4.Enums.DialogSize, "string"), 
                    image = l_parseStringProp__0, 
                    imageAspectRatio = l_parseNumberProp__0, 
                    titleText = l_parseStringProp__0, 
                    bodyText = l_parseStringProp__0, 
                    bodyComponent = l_parseUiComponentProp__0, 
                    actionsLabel = l_parseStringProp__0, 
                    actionsOrientation = l_getLuaTableEnumParser_0(v4.Enums.Orientation, "string"), 
                    primaryButtonAction = l_parseCallbackProp__0, 
                    primaryButtonText = l_parseStringProp__0, 
                    primaryButtonIcon = l_parseIconProp__0, 
                    primaryButtonInputDelay = l_parseNumberProp__0, 
                    primaryButtonSideEffectAction = l_parseCallbackProp__0, 
                    secondaryButtonAction = l_parseCallbackProp__0, 
                    secondaryButtonText = l_parseStringProp__0, 
                    secondaryButtonIcon = l_parseIconProp__0, 
                    secondaryButtonInputDelay = l_parseNumberProp__0, 
                    secondaryButtonSideEffectAction = l_parseCallbackProp__0, 
                    onClose = l_parseCallbackProp__0, 
                    disablePortal = l_parseBooleanProp__0, 
                    hasBackdrop = l_parseBooleanProp__0
                }
            }, 
            [l_SduiComponentType_0.Divider] = {
                component = require(l_script_FirstAncestor_0.Content.SduiDivider), 
                propParsers = if l_FFlagSduiServerCompat_0 then {
                    anchorPoint = l_parseVector2Prop__0, 
                    backgroundColor3 = l_parseColor3Prop__0, 
                    position = l_parseUDim2Prop__0, 
                    size = l_parseUDim2Prop__0
                } else {
                    AnchorPoint = l_parseVector2Prop__0, 
                    BackgroundColor3 = l_parseColor3Prop__0, 
                    Position = l_parseUDim2Prop__0, 
                    Size = l_parseUDim2Prop__0
                }
            }, 
            [l_SduiComponentType_0.FocusNavActions] = {
                component = require(l_script_FirstAncestor_0.FocusNavigation.SduiFocusNavActions), 
                propParsers = {
                    focusNavActions = l_parseFocusNavActionsProp__0
                }, 
                propInterface = {
                    focusNavActions = v5.table
                }
            }, 
            [l_SduiComponentType_0.Fragment] = {
                component = v3.Fragment
            }, 
            [l_SduiComponentType_0.GameTileActiveFriendsFooter] = {
                component = require(l_script_FirstAncestor_0.Content.SduiGameTileActiveFriendsFooter), 
                propParsers = if l_FFlagSduiServerCompat_0 then {
                    anchorPoint = l_parseVector2Prop__0, 
                    automaticSize = l_getEngineEnumParser_0(Enum.AutomaticSize), 
                    backgroundColor3 = l_parseColor3Prop__0, 
                    layoutOrder = l_parseIntegerProp__0, 
                    position = l_parseUDim2Prop__0, 
                    size = l_parseUDim2Prop__0, 
                    zIndex = l_parseNumberProp__0, 
                    universeId = l_parseStringProp__0, 
                    iconWidth = l_parseNumberProp__0, 
                    maxAvatars = l_parseNumberProp__0, 
                    onActivated = l_parseCallbackProp__0
                } else {
                    AnchorPoint = l_parseVector2Prop__0, 
                    AutomaticSize = l_getEngineEnumParser_0(Enum.AutomaticSize), 
                    BackgroundColor3 = l_parseColor3Prop__0, 
                    LayoutOrder = l_parseIntegerProp__0, 
                    Position = l_parseUDim2Prop__0, 
                    Size = l_parseUDim2Prop__0, 
                    ZIndex = l_parseNumberProp__0, 
                    universeId = l_parseStringProp__0, 
                    iconWidth = l_parseNumberProp__0, 
                    maxAvatars = l_parseNumberProp__0, 
                    onActivated = l_parseCallbackProp__0
                }, 
                propInterface = {
                    universeId = v5.union(v5.string, v5.number)
                }
            }, 
            [l_SduiComponentType_0.HeroUnit] = {
                component = require(l_script_FirstAncestor_0.Content.SduiHeroUnit), 
                propParsers = {
                    backgroundComponent = l_parseUiComponentProp__0, 
                    bottomRowComponent = l_parseUiComponentProp__0, 
                    ctaButtonComponent = l_parseUiComponentProp__0, 
                    gradient = l_parseGradientProp__0, 
                    headerComponent = l_parseUiComponentProp__0, 
                    onActivated = l_parseCallbackProp__0, 
                    overlayComponent = l_parseUiComponentProp__0, 
                    backgroundImage = l_parseImageStringProp__0, 
                    foregroundImage = l_parseImageStringProp__0, 
                    titleImage = l_parseImageStringProp__0
                }
            }, 
            [l_SduiComponentType_0.HoldToPlay] = {
                component = require(l_script_FirstAncestor_0.FocusNavigation.SduiHoldToPlay), 
                propParsers = {
                    universeId = l_parseStringProp__0, 
                    placeId = l_parseStringProp__0
                }, 
                propInterface = {
                    universeId = v5.union(v5.string, v5.number)
                }
            }, 
            [l_SduiComponentType_0.Image] = {
                component = if l_FFlagSduiServerCompat_0 then require(l_Parent_0.SduiSharedContent).SduiImage else require(l_Parent_0.Foundation).Image, 
                propParsers = if l_FFlagSduiServerCompat_0 then {
                    anchorPoint = l_parseVector2Prop__0, 
                    aspectRatio = l_parseNumberProp__0, 
                    automaticSize = l_getEngineEnumParser_0(Enum.AutomaticSize), 
                    backgroundStyle = l_parseColorTokenProp__0, 
                    clipsDescendants = l_parseBooleanProp__0, 
                    cornerRadius = l_parseUDimProp__0, 
                    cursorType = l_getLuaTableEnumParser_0(v4.Enums.CursorType, "string"), 
                    image = l_parseImageStringProp__0, 
                    imageStyle = l_parseColorTokenProp__0, 
                    layoutOrder = l_parseIntegerProp__0, 
                    onActivated = l_parseCallbackProp__0, 
                    position = l_parseUDim2Prop__0, 
                    resampleMode = l_getEngineEnumParser_0(Enum.ResamplerMode), 
                    scaleType = l_getEngineEnumParser_0(Enum.ScaleType), 
                    size = l_parseUDim2Prop__0, 
                    sizeConstraint = l_getEngineEnumParser_0(Enum.SizeConstraint), 
                    tag = l_parseStringProp__0, 
                    tileSize = l_parseUDim2Prop__0, 
                    visible = l_parseBooleanProp__0, 
                    zIndex = l_parseNumberProp__0
                } else {
                    AnchorPoint = l_parseVector2Prop__0, 
                    ClipsDescendants = l_parseBooleanProp__0, 
                    LayoutOrder = l_parseIntegerProp__0, 
                    Position = l_parseUDim2Prop__0, 
                    Size = l_parseUDim2Prop__0, 
                    onActivated = l_parseCallbackProp__0, 
                    Image = l_parseImageStringProp__0
                }, 
                propMapping = if not l_FFlagSduiPropMapping_0 or l_FFlagLuaAppSduiBadgeDetailsComponents_0 then nil else {
                    image = "Image", 
                    size = "Size"
                }
            }, 
            [l_SduiComponentType_0.SingleItemCollection] = {
                component = require(l_script_FirstAncestor_0.Content.SduiSingleItemCollection), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    item = l_parseLazyUiComponentProp__0, 
                    impressionEventName = if l_FFlagSduiImpressionHandlerRegistry_0 then l_parseStringProp__0 else nil, 
                    skipItemImpressionsLog = if l_FFlagSduiImpressionHandlerRegistry_0 then l_parseBooleanProp__0 else nil, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil
                }
            }, 
            [l_SduiComponentType_0.PlayButton] = {
                component = require(l_Parent_0.SduiSharedContent).SduiPlayButton, 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    width = l_parseUDimProp__0, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil
                }, 
                propInterface = {
                    universeId = v5.union(v5.string, v5.number)
                }
            }, 
            [l_SduiComponentType_0.SectionHeader] = {
                component = require(l_script_FirstAncestor_0.Content.SduiSectionHeader), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    iconComponent = l_parseUiComponentProp__0, 
                    infoText = l_parseStringProp__0, 
                    onTitleActivated = l_parseCallbackProp__0, 
                    onSubtitleActivated = l_parseCallbackProp__0, 
                    onInfoIconActivated = l_parseCallbackProp__0, 
                    subtitleColor = l_parseColor3Prop__0, 
                    subtitleComponent = l_parseUiComponentProp__0, 
                    subtitleIcon = l_parseIconProp__0, 
                    subtitleIconWidth = l_parseNumberProp__0, 
                    subtitleFontStyle = l_parseTypographyTokenProp__0, 
                    subtitleGap = l_parseNumberProp__0, 
                    subtitleText = l_parseStringProp__0, 
                    titleColor = l_parseColor3Prop__0, 
                    titleComponent = l_parseUiComponentProp__0, 
                    titleGap = l_parseNumberProp__0, 
                    titleIcon = l_parseIconProp__0, 
                    titleIconWidth = l_parseNumberProp__0, 
                    titleFontStyle = l_parseTypographyTokenProp__0, 
                    titleText = l_parseStringProp__0, 
                    verticalGap = l_parseNumberProp__0, 
                    allowInteractionForDirectionalInput = l_parseBooleanProp__0, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil
                }
            }, 
            [l_SduiComponentType_0.SeeAllTile] = {
                component = require(l_Parent_0.GameCollections).SeeAllTile, 
                propParsers = {
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    onActivated = l_parseCallbackProp__0, 
                    icon = l_parseIconProp__0, 
                    title = l_parseStringProp__0, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil
                }
            }, 
            [l_SduiComponentType_0.SlotOverlay] = {
                component = require(l_script_FirstAncestor_0.Content.SduiSlotOverlay), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    topLeftSlot = l_parseUiComponentProp__0, 
                    topMiddleSlot = l_parseUiComponentProp__0, 
                    topRightSlot = l_parseUiComponentProp__0, 
                    centerLeftSlot = l_parseUiComponentProp__0, 
                    centerMiddleSlot = l_parseUiComponentProp__0, 
                    centerRightSlot = l_parseUiComponentProp__0, 
                    bottomLeftSlot = l_parseUiComponentProp__0, 
                    bottomMiddleSlot = l_parseUiComponentProp__0, 
                    bottomRightSlot = l_parseUiComponentProp__0, 
                    padding = l_parseNumberProp__0, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil
                }
            }, 
            [l_SduiComponentType_0.Text] = {
                component = if l_FFlagSduiServerCompat_0 then require(l_Parent_0.SduiSharedContent).SduiText else require(l_Parent_0.Foundation).Text, 
                propParsers = if l_FFlagSduiServerCompat_0 then {
                    anchorPoint = l_parseVector2Prop__0, 
                    aspectRatio = l_parseNumberProp__0, 
                    automaticSize = l_getEngineEnumParser_0(Enum.AutomaticSize), 
                    backgroundStyle = l_parseColorTokenProp__0, 
                    children = l_parseUiComponentProp__0, 
                    cornerRadius = l_parseUDimProp__0, 
                    cursorType = l_getLuaTableEnumParser_0(v4.Enums.CursorType, "string"), 
                    fontStyle = l_parseTypographyTokenProp__0, 
                    isDisabled = l_parseBooleanProp__0, 
                    layoutOrder = l_parseIntegerProp__0, 
                    onActivated = l_parseCallbackProp__0, 
                    onSecondaryActivated = l_parseCallbackProp__0, 
                    padding = l_parseNumberProp__0, 
                    position = l_parseUDim2Prop__0, 
                    richText = l_parseBooleanProp__0, 
                    rotation = l_parseNumberProp__0, 
                    scale = l_parseNumberProp__0, 
                    selectable = l_parseBooleanProp__0, 
                    size = l_parseUDim2Prop__0, 
                    sizeConstraint = l_getEngineEnumParser_0(Enum.SizeConstraint), 
                    tag = l_parseStringProp__0, 
                    testId = l_parseStringProp__0, 
                    text = l_parseStringProp__0, 
                    textStyle = l_parseColorTokenProp__0, 
                    textTruncate = l_getEngineEnumParser_0(Enum.TextTruncate), 
                    textWrapped = l_parseBooleanProp__0, 
                    textXAlignment = l_getEngineEnumParser_0(Enum.TextXAlignment), 
                    textYAlignment = l_getEngineEnumParser_0(Enum.TextYAlignment), 
                    visible = l_parseBooleanProp__0, 
                    zIndex = l_parseNumberProp__0
                } else {
                    AnchorPoint = l_parseVector2Prop__0, 
                    ClipsDescendants = l_parseBooleanProp__0, 
                    LayoutOrder = l_parseIntegerProp__0, 
                    Position = l_parseUDim2Prop__0, 
                    Size = l_parseUDim2Prop__0, 
                    AutomaticSize = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    onActivated = l_parseCallbackProp__0, 
                    textStyle = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then l_parseColorTokenProp__0 else nil, 
                    fontStyle = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then l_parseTypographyTokenProp__0 else nil
                }, 
                propMapping = if not l_FFlagSduiPropMapping_0 or l_FFlagSduiServerCompat_0 then nil else {
                    text = "Text", 
                    text_truncate = "TextTruncate", 
                    automatic_size = "AutomaticSize"
                }
            }, 
            [l_SduiComponentType_0.TextIconRow] = {
                component = require(l_script_FirstAncestor_0.Content.SduiTextIconRow), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    selectable = if l_FFlagSduiServerCompat_0 then l_parseBooleanProp__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    iconFirst = l_parseBooleanProp__0, 
                    onActivated = l_parseCallbackProp__0, 
                    text = l_parseStringProp__0, 
                    textColor = l_parseColor3Prop__0, 
                    fontStyle = l_parseTypographyTokenProp__0, 
                    gap = l_parseNumberProp__0, 
                    icon = l_parseIconProp__0, 
                    iconWidth = l_parseNumberProp__0, 
                    iconColor = l_parseColor3Prop__0, 
                    textOverrides = v50, 
                    iconOverrides = v49, 
                    textFlexMode = l_getEngineEnumParser_0(Enum.UIFlexMode), 
                    backgroundStyle = l_parseColorTokenProp__0, 
                    cornerRadius = l_parseUDimProp__0, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Selectable = if not l_FFlagSduiServerCompat_0 then l_parseBooleanProp__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil
                }
            }, 
            [l_SduiComponentType_0.TextPill] = {
                component = require(l_script_FirstAncestor_0.Content.SduiTextPill), 
                propParsers = if l_FFlagSduiServerCompat_0 then {
                    anchorPoint = l_parseVector2Prop__0, 
                    backgroundColor3 = l_parseColor3Prop__0, 
                    position = l_parseUDim2Prop__0, 
                    size = l_parseUDim2Prop__0, 
                    textColor3 = l_parseColor3Prop__0, 
                    fontStyle = l_parseTypographyTokenProp__0
                } else {
                    AnchorPoint = l_parseVector2Prop__0, 
                    BackgroundColor3 = l_parseColor3Prop__0, 
                    Position = l_parseUDim2Prop__0, 
                    Size = l_parseUDim2Prop__0, 
                    TextColor3 = l_parseColor3Prop__0, 
                    fontStyle = l_parseTypographyTokenProp__0
                }
            }, 
            [l_SduiComponentType_0.Tile] = {
                component = require(l_script_FirstAncestor_0.Content.SduiTile), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    backgroundColor3 = if l_FFlagSduiServerCompat_0 then l_parseColor3Prop__0 else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    selectionOrder = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    backgroundImage = l_parseImageSetOrImageProp__0, 
                    backgroundImageComponent = l_parseUiComponentProp__0, 
                    containmentPadding = l_parseNumberProp__0, 
                    cornerRadius = l_parseNumberProp__0, 
                    ctaButtonComponent = l_parseUiComponentProp__0, 
                    footerComponent = l_parseUiComponentProp__0, 
                    image = l_parseImageStringProp__0, 
                    imageAspectRatio = l_parseNumberProp__0, 
                    imageComponent = l_parseUiComponentProp__0, 
                    isContained = l_parseBooleanProp__0, 
                    onActivated = l_parseCallbackProp__0, 
                    thumbnailBackgroundStyle = l_parseColorTokenProp__0, 
                    thumbnailOverlayComponent = l_parseUiComponentProp__0, 
                    titleComponent = l_parseUiComponentProp__0, 
                    titleFont = l_parseTypographyTokenProp__0, 
                    titleLines = l_parseIntegerProp__0, 
                    titleText = l_parseStringProp__0, 
                    enableLegacyHoverState = if l_FFlagSduiTileDisableLegacyHover_0 then nil else l_parseBooleanProp__0, 
                    focusNavActionsComponent = l_parseUiComponentProp__0, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    BackgroundColor3 = if not l_FFlagSduiServerCompat_0 then l_parseColor3Prop__0 else nil, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    SelectionOrder = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil
                }
            }, 
            [l_SduiComponentType_0.TileFooter] = {
                component = require(l_script_FirstAncestor_0.Content.SduiTileFooter), 
                propParsers = {
                    anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    automaticSize = if l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    selectable = if l_FFlagSduiServerCompat_0 then l_parseBooleanProp__0 else nil, 
                    size = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    zIndex = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                    sectionGap = l_parseNumberProp__0, 
                    textIconGap = l_parseNumberProp__0, 
                    fontStyle = l_parseTypographyTokenProp__0, 
                    iconColor = l_parseColor3Prop__0, 
                    iconWidth = l_parseNumberProp__0, 
                    leftIcon = l_parseIconProp__0, 
                    leftIconComponent = l_parseUiComponentProp__0, 
                    leftText = l_parseStringProp__0, 
                    leftTextFlexMode = l_getEngineEnumParser_0(Enum.UIFlexMode), 
                    onActivated = l_parseCallbackProp__0, 
                    rightIcon = l_parseIconProp__0, 
                    rightIconComponent = l_parseUiComponentProp__0, 
                    rightText = l_parseStringProp__0, 
                    rightTextFlexMode = l_getEngineEnumParser_0(Enum.UIFlexMode), 
                    textColor = l_parseColor3Prop__0, 
                    AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                    AutomaticSize = if not l_FFlagSduiServerCompat_0 then l_getEngineEnumParser_0(Enum.AutomaticSize) else nil, 
                    LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                    Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    Selectable = if not l_FFlagSduiServerCompat_0 then l_parseBooleanProp__0 else nil, 
                    Size = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                    ZIndex = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil
                }
            }, 
            [l_SduiComponentType_0.View] = {
                component = if l_FFlagSduiServerCompat_0 then require(l_Parent_0.SduiSharedContent).SduiView else require(l_Parent_0.Foundation).View, 
                propParsers = if l_FFlagSduiServerCompat_0 then {
                    anchorPoint = l_parseVector2Prop__0, 
                    aspectRatio = l_parseNumberProp__0, 
                    automaticSize = l_getEngineEnumParser_0(Enum.AutomaticSize), 
                    backgroundStyle = l_parseColorTokenProp__0, 
                    children = l_parseUiComponentProp__0, 
                    clipsDescendants = l_parseBooleanProp__0, 
                    cornerRadius = l_parseUDimProp__0, 
                    cursorType = l_getLuaTableEnumParser_0(v4.Enums.CursorType, "string"), 
                    groupTransparency = l_parseNumberProp__0, 
                    isDisabled = l_parseBooleanProp__0, 
                    layoutOrder = l_parseIntegerProp__0, 
                    onActivated = l_parseCallbackProp__0, 
                    onSecondaryActivated = l_parseCallbackProp__0, 
                    padding = l_parseNumberProp__0, 
                    position = l_parseUDim2Prop__0, 
                    rotation = l_parseNumberProp__0, 
                    scale = l_parseNumberProp__0, 
                    selectable = l_parseBooleanProp__0, 
                    selectionGroup = l_parseBooleanProp__0, 
                    size = l_parseUDim2Prop__0, 
                    sizeConstraint = l_getEngineEnumParser_0(Enum.SizeConstraint), 
                    tag = l_parseStringProp__0, 
                    testId = l_parseStringProp__0, 
                    visible = l_parseBooleanProp__0, 
                    zIndex = l_parseNumberProp__0
                } else {
                    AnchorPoint = l_parseVector2Prop__0, 
                    ClipsDescendants = l_parseBooleanProp__0, 
                    LayoutOrder = l_parseIntegerProp__0, 
                    Position = l_parseUDim2Prop__0, 
                    Size = l_parseUDim2Prop__0, 
                    onActivated = l_parseCallbackProp__0
                }
            }
        }
    };
    v52._registeredComponents[l_SduiComponentType_0.CountdownTextIconRow] = {
        component = require(l_script_FirstAncestor_0.Content.SduiCountdownTextIconRow), 
        propParsers = v2.Dictionary.join(v52._registeredComponents[l_SduiComponentType_0.TextIconRow], {
            endTimestamp = l_parseNumberProp__0, 
            formatStringHoursMinutes = l_parseStringProp__0, 
            defaultString = l_parseStringProp__0
        })
    };
    v52._registeredComponents[l_SduiComponentType_0.GameTile] = {
        component = require(l_script_FirstAncestor_0.Content.SduiGameTile), 
        propParsers = v2.Dictionary.join(v52._registeredComponents[l_SduiComponentType_0.Tile].propParsers, {
            universeId = l_parseStringProp__0, 
            placeId = l_parseStringProp__0, 
            disableHoldToPlay = l_parseBooleanProp__0, 
            ratingText = l_parseStringProp__0, 
            playerCount = l_parseNumberProp__0
        }), 
        propInterface = {
            universeId = v5.union(v5.string, v5.number), 
            placeId = v5.union(v5.string, v5.number)
        }
    };
    if l_FFlagSduiEnableHeroUnitBottomRow_0 then
        v52._registeredComponents[l_SduiComponentType_0.HeroUnitBottomRow] = {
            component = require(l_script_FirstAncestor_0.Content.SduiHeroUnitBottomRow), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                zIndex = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                ctaButton = l_parseUiComponentProp__0, 
                labelText = l_parseStringProp__0, 
                rightLabelContent = l_parseUiComponentProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                ZIndex = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil
            }
        };
    end;
    if l_FFlagSduiEnableChips_0 then
        v52._registeredComponents[l_SduiComponentType_0.Chip] = {
            component = require(l_Parent_0.SduiSharedContent).SduiChip, 
            propParsers = {
                anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                text = l_parseStringProp__0, 
                leadingIconName = l_parseStringProp__0, 
                leadingIconVariant = l_getLuaTableEnumParser_0(v4.Enums.IconVariant, "string"), 
                leadingIsCircular = l_parseBooleanProp__0, 
                leadingOnActivated = l_parseCallbackProp__0, 
                trailingIconName = l_parseStringProp__0, 
                trailingIconVariant = l_getLuaTableEnumParser_0(v4.Enums.IconVariant, "string"), 
                trailingIsCircular = l_parseBooleanProp__0, 
                trailingOnActivated = l_parseCallbackProp__0, 
                onActivated = l_parseCallbackProp__0, 
                isChecked = l_parseBooleanProp__0, 
                size = l_getLuaTableEnumParser_0(v4.Enums.ChipSize, "string"), 
                AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil
            }, 
            propInterface = if l_FFlagSduiChipAccessoryProps_0 then {
                leading = v5.optional(v5.table), 
                trailing = v5.optional(v5.table)
            } else nil
        };
        v52._registeredComponents[l_SduiComponentType_0.DualActionChip] = {
            component = require(l_Parent_0.SduiSharedContent).SduiDualActionChip, 
            propParsers = {
                anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                text = l_parseStringProp__0, 
                leadingIconName = l_parseStringProp__0, 
                leadingIconVariant = l_getLuaTableEnumParser_0(v4.Enums.IconVariant, "string"), 
                leadingOnActivated = l_parseCallbackProp__0, 
                trailingIconName = l_parseStringProp__0, 
                trailingIconVariant = l_getLuaTableEnumParser_0(v4.Enums.IconVariant, "string"), 
                trailingOnActivated = l_parseCallbackProp__0, 
                AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil
            }
        };
    end;
    if l_FFlagSduiEnableAssociatedItemsRow_0 then
        v52._registeredComponents[l_SduiComponentType_0.AssociatedItemsRow] = {
            component = require(l_script_FirstAncestor_0.Content.SduiAssociatedItemsRow), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                items = l_getArrayMetatableParser_0(l_parseLazyUiComponentProp__0), 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }
        };
    end;
    if l_FFlagLuaAppSduiExperienceDetailsComponents_0 then
        v52._registeredComponents[l_SduiComponentType_0.ExperienceAssociatedItemsRow] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceAssociatedItemsRow), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                items = l_getArrayMetatableParser_0(l_parseLazyUiComponentProp__0), 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsVoteChip] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsVoteChip), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsFavoriteChip] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsFavoriteChip), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsNotifyChip] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsNotifyChip), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsActiveChip] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsActiveChip), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsShareChip] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsShareChip), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsReportChip] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsReportChip), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
    end;
    if l_FFlagSduiExperienceDetailsSocialProof_0 then
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsConnectionsPlayedChip] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedChip), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExperienceDetailsConnectionsPlayedTextRow] = {
            component = require(l_script_FirstAncestor_0.Content.ExperienceDetails.ExperienceDetailsConnectionsPlayedTextRow), 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                universeId = l_parseStringProp__0, 
                name = l_parseStringProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                universeId = v5.string, 
                name = v5.optional(v5.string)
            }
        };
    end;
    v52._registeredComponents[l_SduiComponentType_0.VerticalFeed] = {
        component = require(l_Parent_0.SduiSharedContent).SduiVerticalFeed, 
        propParsers = {
            layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
            feedItems = l_getArrayMetatableParser_0(l_parseLazyUiComponentProp__0), 
            gapBetweenFeedItems = l_parseNumberProp__0, 
            thresholdFromEnd = l_parseNumberProp__0, 
            onScrollToEnd = l_parseCallbackProp__0, 
            backgroundStyle = if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then l_parseColorTokenProp__0 else nil, 
            LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
        }
    };
    v52._registeredComponents[l_SduiComponentType_0.BadgeTile] = {
        component = require(l_script_FirstAncestor_0.Content.SduiBadgeTile), 
        propParsers = v2.Dictionary.join(v52._registeredComponents[l_SduiComponentType_0.Tile].propParsers, {
            imageCornerRadius = l_parseNumberProp__0, 
            imagePadding = l_parseNumberProp__0
        })
    };
    if l_FFlagLuaAppSduiBadgeDetailsComponents_0 then
        v52._registeredComponents[l_SduiComponentType_0.InfoTable] = {
            component = require(l_Parent_0.SduiSharedContent).SduiInfoTable, 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                gridTag = l_parseStringProp__0, 
                items = l_getArrayMetatableParser_0(l_parseLazyUiComponentProp__0), 
                numColumns = l_parseIntegerProp__0, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                items = v5.array(v5.table)
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.InfoTableCell] = {
            component = require(l_Parent_0.AppBlox).InfoTableCell, 
            propParsers = {
                labelComponent = l_parseUiComponentProp__0, 
                isLastInSingleColumn = l_parseBooleanProp__0, 
                numColumns = l_parseIntegerProp__0, 
                onActivated = l_parseCallbackProp__0, 
                valueComponent = l_parseUiComponentProp__0
            }, 
            propInterface = {
                labelComponent = v5.table, 
                valueComponent = v5.table, 
                isLastInSingleColumn = v5.optional(v5.boolean)
            }
        };
        v52._registeredComponents[l_SduiComponentType_0.ExpandableText] = {
            component = require(l_Parent_0.SduiSharedContent).SduiExpandableText, 
            propParsers = {
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                text = l_parseStringProp__0, 
                compactNumberOfLines = l_parseIntegerProp__0, 
                fontStyle = l_parseTypographyTokenProp__0, 
                textColor = l_parseColor3Prop__0, 
                expandedInitially = l_parseBooleanProp__0, 
                onExpandChanged = l_parseCallbackProp__0, 
                headerComponent = if l_FFlagSduiExperienceDetailsSupport_0 then l_parseUiComponentProp__0 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil
            }, 
            propInterface = {
                text = v5.string
            }
        };
    end;
    if l_FFlagSduiOverflowMenuComponent_0 then
        v52._registeredComponents[l_SduiComponentType_0.OverflowMenu] = {
            component = require(l_Parent_0.SduiSharedContent).SduiOverflowMenu, 
            propParsers = {
                anchorPoint = if l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                layoutOrder = if l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                position = if l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                zIndex = if l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil, 
                buttonVariant = l_getLuaTableEnumParser_0(v4.Enums.ButtonVariant, "string"), 
                buttonSize = l_getLuaTableEnumParser_0(v4.Enums.InputSize, "string"), 
                buttonIcon = l_getLuaTableEnumParser_0(v4.Enums.IconName, "string"), 
                buttonIconBackgroundStyle = l_parseColorTokenProp__0, 
                menuItemSize = l_getLuaTableEnumParser_0(v4.Enums.InputSize, "string"), 
                popoverAlign = l_getLuaTableEnumParser_0(v4.Enums.PopoverAlign, "string"), 
                popoverSide = l_getLuaTableEnumParser_0(v4.Enums.PopoverSide, "string"), 
                menuWidth = l_parseUDimProp__0, 
                AnchorPoint = if not l_FFlagSduiServerCompat_0 then l_parseVector2Prop__0 else nil, 
                LayoutOrder = if not l_FFlagSduiServerCompat_0 then l_parseIntegerProp__0 else nil, 
                Position = if not l_FFlagSduiServerCompat_0 then l_parseUDim2Prop__0 else nil, 
                ZIndex = if not l_FFlagSduiServerCompat_0 then l_parseNumberProp__0 else nil
            }, 
            propInterface = {
                items = v5.array(v5.table)
            }
        };
    end;
    setmetatable(v52, v48);
    return v52;
end;
v48.getComponentDefinition = function(v53, v54) --[[ Line: 1092 ]] --[[ Name: getComponentDefinition ]]
    return v53._registeredComponents[v54];
end;
v48.doesComponentManageChildren = function(v55, v56) --[[ Line: 1099 ]] --[[ Name: doesComponentManageChildren ]]
    local v57 = v55:getComponentDefinition(v56);
    return v57 and v57.doesManageChildren or false;
end;
v48.getComponent = function(v58, v59) --[[ Line: 1107 ]] --[[ Name: getComponent ]]
    local v60 = v58:getComponentDefinition(v59);
    return v60 and v60.component;
end;
v48.getPropParsers = function(v61, v62) --[[ Line: 1112 ]] --[[ Name: getPropParsers ]]
    -- upvalues: v47 (copy)
    local v63 = v61:getComponentDefinition(v62);
    return v63 and v63.propParsers or v47;
end;
v48.getPropInterface = function(v64, v65) --[[ Line: 1120 ]] --[[ Name: getPropInterface ]]
    local v66 = v64:getComponentDefinition(v65);
    return v66 and v66.propInterface or nil;
end;
local v67 = {
    [l_parseUiComponentProp__0] = true, 
    [l_parseCallbackProp__0] = true, 
    [l_parseFocusNavActionsProp__0] = true
};
v48.doesParserRequireRenderContext = function(_, v69) --[[ Line: 1131 ]] --[[ Name: doesParserRequireRenderContext ]]
    -- upvalues: v67 (copy)
    if v69 and v67[v69] then
        return true;
    elseif typeof(v69) == "table" then
        return true;
    else
        return false;
    end;
end;
v48.registerComponent = function(v70, v71, v72) --[[ Line: 1146 ]] --[[ Name: registerComponent ]]
    v70._registeredComponents[v71] = v72;
end;
return v48;