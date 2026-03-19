local v0 = require(script.Core.Config.makeConfigurable);
local v1 = require(script.UIBloxDefaultConfig);
local l_createLazyComponent_0 = require(script.Parent.LazyRequire).createLazyComponent;
local _ = require(script.App.Style.Fonts);
local _ = require(script.App.ImageSet.ImagesTypes);
local _ = require(script.App.Style.StyleTypes);
local _ = require(script.Core.Layout.Responsive.ResponsiveLayoutConfigReader);
local v7 = require(script.App.Dialog.Overlay.Overlay);
local v8 = require(script.Core.Control.Enum.ControlState);
local _ = require(script.Parent.React);
return v0(function(v10) --[[ Line: 33 ]] --[[ Name: initializeLibrary ]]
    -- upvalues: l_createLazyComponent_0 (copy), v8 (copy), v7 (copy)
    local v11 = require(script.Utility.strict);
    local function _(v12) --[[ Line: 36 ]] --[[ Name: lazify ]]
        -- upvalues: l_createLazyComponent_0 (ref)
        return l_createLazyComponent_0(v12);
    end;
    local v14 = {
        Core = v11({
            Layout = v11({
                Responsive = v11({
                    ResponsiveLayoutProvider = require(script.Core.Layout.Responsive.ResponsiveLayoutProvider), 
                    useResponsiveLayout = require(script.Core.Layout.Responsive.useResponsiveLayout)
                }), 
                Grid = v11({
                    withGridConfig_DEPRECATED = require(script.Core.Layout.Grid.withGridConfig_DEPRECATED)
                }), 
                LayerCollector = v11({
                    LayerCollectorProvider = require(script.Core.Layout.LayerCollector.LayerCollectorProvider), 
                    useLayerCollector = require(script.Core.Layout.LayerCollector.useLayerCollector)
                })
            }), 
            Animation = v11({
                withAnimation = require(script.Core.Animation.withAnimation)
            }), 
            ImageSet = v11({
                ImageSetButton = require(script.Core.ImageSet.ImageSetComponent).Button, 
                ImageSetLabel = require(script.Core.ImageSet.ImageSetComponent).Label, 
                Validator = v11({
                    validateImage = require(script.Core.ImageSet.Validator.validateImage)
                })
            }), 
            Control = v11({
                Enum = v11({
                    ControlState = v8
                }), 
                Interactable = l_createLazyComponent_0(function() --[[ Line: 73 ]]
                    return require(script.Core.Control.Interactable);
                end), 
                StateLayer = l_createLazyComponent_0(function() --[[ Line: 76 ]]
                    return require(script.Core.Control.StateLayer);
                end), 
                FeedbackManagerInjectionContext = require(script.Core.Control.FeedbackManagerInjectionContext)
            }), 
            Style = v11({
                Provider = require(script.Core.Style.StyleProvider), 
                withStyle = require(script.Core.Style.withStyle), 
                useStyle = require(script.Core.Style.useStyle), 
                useTextSizeOffset = require(script.Core.Style.useTextSizeOffset), 
                withTextSizeOffset = require(script.Core.Style.withTextSizeOffset), 
                useStyleMetadata = require(script.Core.Style.useStyleMetadata)
            }), 
            VR = v11({
                Panel3D = l_createLazyComponent_0(function() --[[ Line: 93 ]]
                    return require(script.Core.VR.Panel3D);
                end), 
                Constants = require(script.Core.VR.Constants), 
                PointerOverlay = l_createLazyComponent_0(function() --[[ Line: 97 ]]
                    return require(script.Core.VR.PointerOverlay);
                end)
            }), 
            Text = v11({
                ExpandableText = v11({
                    GetCanExpand = require(script.Core.Text.ExpandableText.ExpandableTextUtils).getCanExpand
                }), 
                EmojiTextLabel = l_createLazyComponent_0(function() --[[ Line: 106 ]]
                    return require(script.Core.Text.EmojiTextLabel.EmojiTextLabel);
                end)
            }), 
            Enums = v11({
                InputType = require(script.Enums.InputType)
            })
        }), 
        Common = v11({
            Style = v11({
                ColorSystem = require(script.Common.Style.ColorSystem)
            })
        }), 
        App = v11({
            Context = v11({
                ContentProvider = require(script.App.Context.ContentProvider)
            }), 
            ImageSet = v11({
                Images = require(script.App.ImageSet.Images), 
                getIconSize = require(script.App.ImageSet.getIconSize), 
                getIconSizeUDim2 = require(script.App.ImageSet.getIconSizeUDim2), 
                Enum = v11({
                    IconSize = require(script.App.ImageSet.Enum.IconSize)
                })
            }), 
            Bar = v11({
                HeaderBar = l_createLazyComponent_0(function() --[[ Line: 137 ]]
                    return require(script.App.Bar.HeaderBar);
                end), 
                FullscreenTitleBar = l_createLazyComponent_0(function() --[[ Line: 140 ]]
                    return require(script.App.Bar.FullscreenTitleBar);
                end), 
                ControllerBar = l_createLazyComponent_0(function() --[[ Line: 143 ]]
                    return require(script.App.Bar.ControllerBar);
                end)
            }), 
            Button = v11({
                Enum = v11({
                    ButtonType = require(script.App.Button.Enum.ButtonType), 
                    StandardButtonSize = require(script.Core.Button.Enum.StandardButtonSize)
                }), 
                Button = l_createLazyComponent_0(function() --[[ Line: 153 ]]
                    return require(script.App.Button.Button);
                end), 
                ButtonStack = l_createLazyComponent_0(function() --[[ Line: 156 ]]
                    return require(script.App.Button.ButtonStack);
                end), 
                TextButton = l_createLazyComponent_0(function() --[[ Line: 159 ]]
                    return require(script.App.Button.TextButton);
                end), 
                LinkButton = l_createLazyComponent_0(function() --[[ Line: 162 ]]
                    return require(script.App.Button.LinkButton);
                end), 
                IconButton = l_createLazyComponent_0(function() --[[ Line: 165 ]]
                    return require(script.App.Button.IconButton);
                end), 
                ActionBar = l_createLazyComponent_0(function() --[[ Line: 168 ]]
                    return require(script.App.Button.ActionBar);
                end), 
                UtilityActionIcon = l_createLazyComponent_0(function() --[[ Line: 171 ]]
                    return require(script.App.Button.UtilityActionIcon);
                end), 
                ComboButton = l_createLazyComponent_0(function() --[[ Line: 174 ]]
                    return require(script.App.Button.ComboButton);
                end)
            }), 
            Cell = v11({
                Small = v11({
                    SelectionGroup = v11({
                        SmallRadioButtonGroup = l_createLazyComponent_0(function() --[[ Line: 182 ]]
                            return require(script.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup);
                        end)
                    })
                })
            }), 
            Text = v11({
                ExpandableTextArea = l_createLazyComponent_0(function() --[[ Line: 190 ]]
                    return require(script.App.Text.ExpandableTextArea.ExpandableTextArea);
                end), 
                StyledTextLabel = l_createLazyComponent_0(function() --[[ Line: 193 ]]
                    return require(script.App.Text.StyledTextLabel);
                end)
            }), 
            Loading = v11({
                Enum = v11({
                    RetrievalStatus = require(script.App.Loading.Enum.RetrievalStatus), 
                    LoadingStrategy = require(script.App.Loading.Enum.LoadingStrategy)
                }), 
                LoadableImage = l_createLazyComponent_0(function() --[[ Line: 203 ]]
                    return require(script.App.Loading.LoadableImage);
                end), 
                ShimmerPanel = l_createLazyComponent_0(function() --[[ Line: 206 ]]
                    return require(script.App.Loading.ShimmerPanel);
                end), 
                LoadingSpinner = l_createLazyComponent_0(function() --[[ Line: 209 ]]
                    return require(script.App.Loading.LoadingSpinner);
                end)
            }), 
            InputButton = v11({
                RadioButtonList = l_createLazyComponent_0(function() --[[ Line: 215 ]]
                    return require(script.App.InputButton.RadioButtonList);
                end), 
                CheckboxList = l_createLazyComponent_0(function() --[[ Line: 218 ]]
                    return require(script.App.InputButton.CheckboxList);
                end), 
                Checkbox = l_createLazyComponent_0(function() --[[ Line: 221 ]]
                    return require(script.App.InputButton.Checkbox);
                end)
            }), 
            Container = v11({
                Enum = v11({
                    ScrollBarType = require(script.App.Container.Enum.ScrollBarType)
                }), 
                Carousel = v11({
                    FreeFlowCarousel = l_createLazyComponent_0(function() --[[ Line: 231 ]]
                        return require(script.App.Container.Carousel.FreeFlowCarousel);
                    end)
                }), 
                Grid = v11({
                    ResponsiveGrid = l_createLazyComponent_0(function() --[[ Line: 236 ]]
                        return require(script.App.Container.Grid.ResponsiveGrid);
                    end)
                }), 
                VerticalScrollView = l_createLazyComponent_0(function() --[[ Line: 240 ]]
                    return require(script.App.Container.VerticalScrollView);
                end), 
                VerticalScrollViewWithMargin = require(script.App.Container.VerticalScrollViewWithMargin), 
                getPageMargin = require(script.App.Container.getPageMargin), 
                LoadingStateContainer = l_createLazyComponent_0(function() --[[ Line: 245 ]]
                    return require(script.App.Container.LoadingStateContainer);
                end), 
                LoadingStatePage = l_createLazyComponent_0(function() --[[ Line: 248 ]]
                    return require(script.App.Container.LoadingStatePage);
                end), 
                HorizontalPageMargin = l_createLazyComponent_0(function() --[[ Line: 251 ]]
                    return require(script.App.Container.HorizontalPageMargin);
                end)
            }), 
            Slider = v11({
                ContextualSlider = l_createLazyComponent_0(function() --[[ Line: 257 ]]
                    return require(script.App.Slider.ContextualSlider);
                end), 
                SystemSlider = l_createLazyComponent_0(function() --[[ Line: 260 ]]
                    return require(script.App.Slider.SystemSlider);
                end)
            }), 
            Emoji = v11({
                Enum = v11({
                    Emoji = require(script.Core.Emoji.Enum.Emoji)
                })
            }), 
            Grid = v11({
                GridView = l_createLazyComponent_0(function() --[[ Line: 272 ]]
                    return require(script.App.Grid.GridView);
                end), 
                GridMetrics = require(script.App.Grid.GridMetrics), 
                DefaultMetricsGridView = l_createLazyComponent_0(function() --[[ Line: 276 ]]
                    return require(script.App.Grid.DefaultMetricsGridView);
                end)
            }), 
            Tile = v11({
                MenuTile = l_createLazyComponent_0(function() --[[ Line: 282 ]]
                    return require(script.App.Tile.MenuTile.MenuTile);
                end), 
                PlayerTile = l_createLazyComponent_0(function() --[[ Line: 285 ]]
                    return require(script.App.Tile.PlayerTile.PlayerTile);
                end), 
                ExperienceTileV3 = l_createLazyComponent_0(function() --[[ Line: 288 ]]
                    return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceTileV3);
                end), 
                AspectRatioModeEnum = require(script.App.Tile.SplitTile.ExperienceTile.Enum.AspectRatioMode), 
                getExperienceTileRelativeHeight = require(script.App.Tile.SplitTile.ExperienceTile.getExperienceTileRelativeHeight), 
                ExperienceActionRow = l_createLazyComponent_0(function() --[[ Line: 295 ]]
                    return require(script.App.Tile.SplitTile.ExperienceTile.ExperienceActionRow);
                end), 
                VerticalTile = l_createLazyComponent_0(function() --[[ Line: 298 ]]
                    return require(script.App.Tile.SplitTile.VerticalTile.VerticalTile);
                end), 
                VerticalTileThumbnail = l_createLazyComponent_0(function() --[[ Line: 301 ]]
                    return require(script.App.Tile.SplitTile.VerticalTile.VerticalTileThumbnail);
                end), 
                ExperienceTileMetadata = v11({
                    SocialProofFooter = l_createLazyComponent_0(function() --[[ Line: 305 ]]
                        return require(script.App.Tile.ExperienceTileMetadata.SocialProofFooter);
                    end), 
                    CoPlayFooter = l_createLazyComponent_0(function() --[[ Line: 308 ]]
                        return require(script.App.Tile.ExperienceTileMetadata.CoPlayFooter);
                    end), 
                    TextFooter = l_createLazyComponent_0(function() --[[ Line: 311 ]]
                        return require(script.App.Tile.ExperienceTileMetadata.TextFooter);
                    end)
                })
            }), 
            Dialog = v11({
                Modal = v11({
                    FullPageModal = l_createLazyComponent_0(function() --[[ Line: 319 ]]
                        return require(script.App.Dialog.Modal.FullPageModal);
                    end), 
                    getPartialPageModalMiddleContentWidth = require(script.App.Dialog.Modal.getPartialPageModalMiddleContentWidth), 
                    PartialPageModal = l_createLazyComponent_0(function() --[[ Line: 325 ]]
                        return require(script.App.Dialog.Modal.PartialPageModal);
                    end), 
                    EducationalModal = l_createLazyComponent_0(function() --[[ Line: 328 ]]
                        return require(script.App.Dialog.Modal.EducationalModal);
                    end), 
                    ModalWindow = l_createLazyComponent_0(function() --[[ Line: 331 ]]
                        return require(script.App.Dialog.Modal.ModalWindow);
                    end)
                }), 
                Alert = v11({
                    InteractiveAlert = l_createLazyComponent_0(function() --[[ Line: 336 ]]
                        return require(script.App.Dialog.Alert.InteractiveAlert);
                    end), 
                    LoadingAlert = l_createLazyComponent_0(function() --[[ Line: 339 ]]
                        return require(script.App.Dialog.Alert.LoadingAlert);
                    end)
                }), 
                Enum = v11({
                    CloseButtonIcon = require(script.App.Dialog.Modal.Enum.CloseButtonIcon), 
                    TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation)
                }), 
                Toast = l_createLazyComponent_0(function() --[[ Line: 347 ]]
                    return require(script.App.Dialog.Toast.Toast);
                end), 
                Tooltip = l_createLazyComponent_0(function() --[[ Line: 350 ]]
                    return require(script.App.Dialog.Tooltip.Tooltip);
                end), 
                TooltipV2 = require(script.App.Dialog.TooltipV2.Controllers), 
                TooltipCallout = l_createLazyComponent_0(function() --[[ Line: 354 ]]
                    return require(script.App.Dialog.TooltipV2.TooltipCallout);
                end), 
                TooltipOrientation = require(script.App.Dialog.Tooltip.Enum.TooltipOrientation), 
                Overlay = v7
            }), 
            Constant = v11({
                IconSize = require(script.App.Constant.IconSize)
            }), 
            Style = v11({
                AppStyleProvider = require(script.App.Style.AppStyleProvider), 
                Colors = require(script.App.Style.Colors), 
                Constants = require(script.App.Style.Constants), 
                Themes = {
                    DarkTheme = require(script.App.Style.Themes.DarkTheme), 
                    LightTheme = require(script.App.Style.Themes.LightTheme)
                }, 
                Tokens = require(script.App.Style.Tokens)
            }), 
            Indicator = v11({
                Badge = l_createLazyComponent_0(function() --[[ Line: 378 ]]
                    return require(script.App.Indicator.Badge);
                end), 
                EmptyState = l_createLazyComponent_0(function() --[[ Line: 381 ]]
                    return require(script.App.Indicator.EmptyState);
                end), 
                Enum = v11({
                    BadgeStates = require(script.App.Indicator.Enum.BadgeStates), 
                    BadgeVariant = require(script.App.Indicator.Enum.BadgeVariant), 
                    VoteStates = require(script.App.Indicator.Enum.VoteStates)
                }), 
                PlayerContext = require(script.App.Indicator.PlayerContext), 
                PlayerCount = l_createLazyComponent_0(function() --[[ Line: 390 ]]
                    return require(script.App.Indicator.PlayerCount);
                end), 
                RateCount = l_createLazyComponent_0(function() --[[ Line: 393 ]]
                    return require(script.App.Indicator.RateCount);
                end), 
                StatWidget = l_createLazyComponent_0(function() --[[ Line: 396 ]]
                    return require(script.App.Indicator.StatWidget);
                end), 
                StatGroup = l_createLazyComponent_0(function() --[[ Line: 399 ]]
                    return require(script.App.Indicator.StatGroup);
                end), 
                PlayerName = l_createLazyComponent_0(function() --[[ Line: 402 ]]
                    return require(script.App.Indicator.PlayerName);
                end)
            }), 
            Menu = v11({
                BaseMenu = l_createLazyComponent_0(function() --[[ Line: 408 ]]
                    return require(script.App.Menu.BaseMenu);
                end), 
                ContextualMenu = l_createLazyComponent_0(function() --[[ Line: 411 ]]
                    return require(script.App.Menu.ContextualMenu);
                end), 
                MenuDirection = require(script.App.Menu.MenuDirection), 
                DropdownMenu = l_createLazyComponent_0(function() --[[ Line: 417 ]]
                    return require(script.App.Menu.DropdownMenu);
                end), 
                KeyLabel = l_createLazyComponent_0(function() --[[ Line: 421 ]]
                    return require(script.App.Menu.KeyLabel.KeyLabel);
                end), 
                KeyLabelUtilities = require(script.App.Menu.KeyLabel.Utilities)
            }), 
            Control = v11({
                SegmentedControl = l_createLazyComponent_0(function() --[[ Line: 428 ]]
                    return require(script.App.Control.SegmentedControl);
                end), 
                Pill = l_createLazyComponent_0(function() --[[ Line: 431 ]]
                    return require(script.App.Control.Pill.Pill);
                end), 
                Pillv2 = l_createLazyComponent_0(function() --[[ Line: 434 ]]
                    return require(script.App.Control.Pill.Pillv2);
                end), 
                Slot = v11({
                    SlotTray = l_createLazyComponent_0(function() --[[ Line: 438 ]]
                        return require(script.App.Control.Slot.SlotTray);
                    end)
                }), 
                PillGroup = l_createLazyComponent_0(function() --[[ Line: 442 ]]
                    return require(script.App.Control.Pill.PillGroup);
                end)
            }), 
            Navigation = v11({
                Enum = v11({
                    Placement = require(script.App.Navigation.Enum.Placement), 
                    NavigationBarAlignment = require(script.App.Navigation.Enum.NavigationBarAlignment), 
                    NavigationRailAlignment = require(script.App.Navigation.Enum.NavigationRailAlignment), 
                    NavigationTabLayout = require(script.App.Navigation.Enum.NavigationTabLayout)
                }), 
                SystemBar = l_createLazyComponent_0(function() --[[ Line: 454 ]]
                    return require(script.App.Navigation.SystemBar);
                end), 
                NavigationBar = l_createLazyComponent_0(function() --[[ Line: 457 ]]
                    return require(script.App.Navigation.NavigationBar);
                end), 
                NavigationRailV2 = l_createLazyComponent_0(function() --[[ Line: 460 ]]
                    return require(script.App.Navigation.NavigationRailV2);
                end), 
                NavigationTab = require(script.App.Navigation.NavigationTab), 
                PrimaryNavBar = v11({
                    IconTabGroup = l_createLazyComponent_0(function() --[[ Line: 465 ]]
                        return require(script.App.Navigation.PrimaryNavBar.IconTabGroup);
                    end)
                }), 
                ShortcutBar = l_createLazyComponent_0(function() --[[ Line: 469 ]]
                    return require(script.App.Navigation.ShortcutBar.ShortcutBar);
                end), 
                Shortcut = l_createLazyComponent_0(function() --[[ Line: 472 ]]
                    return require(script.App.Navigation.ShortcutBar.Shortcut);
                end)
            }), 
            SelectionImage = v11({
                SelectionCursorProvider = require(script.App.SelectionImage.SelectionCursorProvider), 
                CursorKind = require(script.App.SelectionImage.CursorKind), 
                withSelectionCursorProvider = require(script.App.SelectionImage.withSelectionCursorProvider), 
                useSelectionCursor = require(script.App.SelectionImage.useSelectionCursor)
            }), 
            SelectionCursor = v11({
                CursorProvider = require(script.App.SelectionCursor.CursorProvider), 
                useCursor = require(script.App.SelectionCursor.useCursor), 
                useCursorByType = require(script.App.SelectionCursor.useCursorByType), 
                CursorType = require(script.App.SelectionCursor.CursorType)
            }), 
            Table = v11({
                ListTable = l_createLazyComponent_0(function() --[[ Line: 492 ]]
                    return require(script.App.Table.ListTable);
                end), 
                ScrollingListTable = l_createLazyComponent_0(function() --[[ Line: 495 ]]
                    return require(script.App.Table.ScrollingListTable);
                end), 
                Cell = l_createLazyComponent_0(function() --[[ Line: 498 ]]
                    return require(script.App.Table.Cell);
                end), 
                CellHeadDetail = l_createLazyComponent_0(function() --[[ Line: 501 ]]
                    return require(script.App.Table.CellHeadDetail);
                end), 
                CellTailDescription = l_createLazyComponent_0(function() --[[ Line: 504 ]]
                    return require(script.App.Table.CellTailDescription);
                end)
            }), 
            Input = v11({
                TextField = l_createLazyComponent_0(function() --[[ Line: 510 ]]
                    return require(script.App.Input.TextField);
                end)
            })
        }), 
        UnitTestHelpers = {
            MockContentProvider = require(script.UnitTestHelpers.MockContentProvider)
        }
    };
    v14.Style = {
        Provider = v14.Core.Style.Provider, 
        withStyle = v14.Core.Style.withStyle, 
        Validator = {
            validateStyle = require(script.App.Style.Validator.validateStyle), 
            validateFontInfo = require(script.Core.Style.Validator.validateFontInfo), 
            validateTypographyInfo = require(script.Core.Style.Validator.validateTypographyInfo), 
            validateColorInfo = require(script.Core.Style.Validator.validateColorInfo)
        }, 
        Context = require(script.Core.Style.StyleContext)
    };
    v14.AccordionView = l_createLazyComponent_0(function() --[[ Line: 533 ]]
        return require(script.App.Accordion.AccordionView);
    end);
    v14.Tile = {
        SaveTile = l_createLazyComponent_0(function() --[[ Line: 538 ]]
            return require(script.App.Tile.SaveTile.SaveTile);
        end), 
        ItemTile = l_createLazyComponent_0(function() --[[ Line: 541 ]]
            return require(script.App.Tile.ItemTile.ItemTile);
        end), 
        ItemTileEnums = require(script.App.Tile.Enum.ItemTileEnums)
    };
    v14.Utility = {
        SpringAnimatedItem = require(script.Utility.SpringAnimatedItem), 
        OpenTypeSupport = require(script.Utility.OpenTypeSupport)
    };
    v14.ModalBottomSheet = l_createLazyComponent_0(function() --[[ Line: 556 ]]
        return require(script.ModalBottomSheet.ModalBottomSheet);
    end);
    if _G.__UIBLOX_TRACK_USAGE__ then
        local v15 = require(script.Parent.UsageTracker);
        v14 = v15.trackMemberAccess("UIBlox", v14, v15.isReactComponent);
    end;
    if v10.enableTraceLevelLog then
        require(script.Logger):enableTraceLog();
    end;
    return v14;
end, "UIBlox", v1);