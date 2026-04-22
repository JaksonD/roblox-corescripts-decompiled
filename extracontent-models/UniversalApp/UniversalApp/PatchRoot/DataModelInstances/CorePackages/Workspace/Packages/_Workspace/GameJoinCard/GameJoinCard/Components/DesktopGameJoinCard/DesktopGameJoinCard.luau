local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useScaledValue_0 = v2.Hooks.useScaledValue;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Image_0 = v2.Image;
local l_Icon_0 = v2.Icon;
local l_Button_0 = v2.Button;
local l_Skeleton_0 = v2.Skeleton;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_IconSize_0 = v2.Enums.IconSize;
local l_InputSize_0 = v2.Enums.InputSize;
local l_Radius_0 = v2.Enums.Radius;
local l_getBuilderIconForCurrentPlatform_0 = v2.Utility.getBuilderIconForCurrentPlatform;
local l_StateLayerAffordance_0 = v2.Enums.StateLayerAffordance;
local l_viewEDPsourceValues_0 = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants).viewEDPsourceValues;
return function(v19) --[[ Line: 47 ]] --[[ Name: DesktopGameJoinCard ]]
    -- upvalues: l_useTokens_0 (copy), l_useScaledValue_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_getBuilderIconForCurrentPlatform_0 (copy), l_viewEDPsourceValues_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_StateLayerAffordance_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), v2 (copy)
    local v20 = l_useTokens_0();
    local v21 = l_useScaledValue_0(260);
    local v22 = l_useLocalization_0({
        isPlaying = "Feature.Friends.Text.IsPlaying", 
        joinButton = "Feature.Profile.Action.JoinGame"
    });
    local l_layoutOrder_0 = v19.layoutOrder;
    local l_playerName_0 = v19.playerName;
    local l_experienceName_0 = v19.experienceName;
    local l_gameIconUrl_0 = v19.gameIconUrl;
    local l_isLoading_0 = v19.isLoading;
    local v28 = if v19.isConsole then v20.Size.Size_1500 else v20.Size.Size_1000;
    local v29 = v1.useMemo(function() --[[ Line: 61 ]]
        -- upvalues: l_getBuilderIconForCurrentPlatform_0 (ref)
        return l_getBuilderIconForCurrentPlatform_0();
    end, {});
    local v30 = v1.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v19 (copy), l_viewEDPsourceValues_0 (ref)
        v19.onViewExperienceDetails(l_viewEDPsourceValues_0.Thumbnail);
    end, {
        v19
    });
    local v31 = v1.useCallback(function() --[[ Line: 69 ]]
        -- upvalues: v19 (copy), l_viewEDPsourceValues_0 (ref)
        v19.onViewExperienceDetails(l_viewEDPsourceValues_0.Title);
    end, {
        v19
    });
    local v32 = v1.createElement(l_View_0, {
        Size = UDim2.fromOffset(v21, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_layoutOrder_0, 
        backgroundStyle = v20.Color.OverMedia.OverMedia_300, 
        tag = "col gap-medium padding-large radius-medium stroke-thin stroke-muted"
    }, {
        GameInfoRow = v1.createElement(l_View_0, {
            tag = "row gap-small items-center size-full-0 auto-y align-x-left", 
            LayoutOrder = 1
        }, {
            GameIcon = if not l_isLoading_0 then v1.createElement(l_View_0, {
                Size = UDim2.fromOffset(v28, v28), 
                LayoutOrder = 1, 
                ClipsDescendants = true
            }, {
                Thumbnail = v1.createElement(l_Image_0, {
                    Image = l_gameIconUrl_0, 
                    Size = UDim2.fromScale(1, 1), 
                    ScaleType = Enum.ScaleType.Fit, 
                    tag = "radius-small", 
                    onActivated = v30, 
                    stateLayer = if v19.onViewExperienceDetails then {
                        affordance = l_StateLayerAffordance_0.None
                    } else nil
                })
            }) else v1.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v28, v28), 
                radius = l_Radius_0.Small
            }), 
            TextContainer = v1.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-xxsmall shrink align-x-left items-start", 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                GameInfo = v1.createElement(l_View_0, {
                    tag = "col size-full-0 auto-y shrink align-x-left items-start", 
                    LayoutOrder = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y
                }, {
                    GameTitle = if not l_isLoading_0 then v1.createElement(l_View_0, {
                        tag = "row auto-y gap-xxsmall size-full-0 align-x-left align-y-center text-body-medium content-default text-align-x-left", 
                        LayoutOrder = 1
                    }, {
                        PlayerName = v1.createElement(l_Text_0, {
                            Text = l_playerName_0, 
                            tag = "shrink auto-xy text-body-medium content-default text-no-wrap text-truncate-end text-align-x-left", 
                            LayoutOrder = 1
                        }), 
                        IsPlaying = v1.createElement(l_Text_0, {
                            Text = v22.isPlaying, 
                            tag = "shrink-0 auto-xy text-body-medium content-default text-align-x-left", 
                            LayoutOrder = 2
                        })
                    }) else v1.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.7, 0, 0, v20.Typography.BodyMedium.FontSize), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 1
                    }), 
                    GameName = if not l_isLoading_0 then v1.createElement(l_View_0, {
                        tag = "size-full-0 auto-y", 
                        LayoutOrder = 2, 
                        onActivated = v31, 
                        stateLayer = {
                            affordance = l_StateLayerAffordance_0.None
                        }
                    }, {
                        Label = v1.createElement(l_Text_0, {
                            Text = l_experienceName_0, 
                            tag = "size-full-0 auto-y text-title-medium content-emphasis text-no-wrap text-truncate-end text-align-x-left"
                        })
                    }) else v1.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0.5, 0, 0, v20.Typography.TitleMedium.FontSize), 
                        radius = l_Radius_0.Small, 
                        LayoutOrder = 2
                    })
                }), 
                PlatformName = if v19.isConsole then if l_isLoading_0 then v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.6, 0, 0, v20.Typography.BodySmall.FontSize), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 2
                }) else v1.createElement(l_View_0, {
                    LayoutOrder = 2, 
                    tag = "row gap-small size-full-0 auto-y align-x-left"
                }, {
                    PlatformLogo = v1.createElement(l_View_0, {
                        tag = "auto-xy shrink", 
                        LayoutOrder = 1
                    }, {
                        LogoImage = v1.createElement(l_Icon_0, {
                            name = v29, 
                            size = l_IconSize_0.XSmall
                        })
                    }), 
                    PlatformNameLabel = v1.createElement(l_Text_0, {
                        Text = v19.consolePlatformLabel, 
                        tag = "fill shrink auto-y text-body-small content-default text-no-wrap text-truncate-end text-align-x-left", 
                        LayoutOrder = 2
                    })
                }) else nil
            })
        }), 
        JoinButton = if not v19.isConsole then v1.createElement(l_Button_0, {
            text = v22.joinButton, 
            onActivated = v19.onJoin, 
            isLoading = l_isLoading_0, 
            variant = l_ButtonVariant_0.Emphasis, 
            inputSize = l_InputSize_0.Medium, 
            tag = "size-full-0 fill align-x-center", 
            width = UDim.new(1, 0), 
            LayoutOrder = 2
        }) else nil
    });
    return v1.createElement(v2.Popover.Root, {
        isOpen = v19.isOpen
    }, {
        Anchor = v1.createElement(v2.Popover.Anchor, {
            anchorRef = v19.anchorRef
        }), 
        Content = v1.createElement(v2.Popover.Content, {
            align = v2.Enums.PopoverAlign.Center, 
            side = v2.Enums.PopoverSide.Bottom, 
            radius = v2.Enums.Radius.Medium, 
            hasArrow = false, 
            backgroundStyle = v20.Color.None
        }, {
            PopoverHoverArea = v1.createElement(l_View_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1, 
                selection = {
                    Selectable = true
                }, 
                onStateChanged = v19.onPopoverStateChanged
            }, {
                GameJoinCard = v32
            })
        })
    });
end;