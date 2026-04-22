local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UserTile);
local l_UserTile_0 = v3.UserTile;
local l_LayoutMode_0 = v3.LayoutMode;
local l_OverlayProvider_0 = v2.OverlayProvider;
local l_Sheet_0 = v2.Sheet;
local l_View_0 = v2.View;
local l_Button_0 = v2.Button;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_InputSize_0 = v2.Enums.InputSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Image_0 = v2.Image;
local l_Skeleton_0 = v2.Skeleton;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_GuiService_0 = game:GetService("GuiService");
local v17 = require(script.Parent.Parent.Parent.Analytics.AnalyticsConstants);
local l_viewEDPsourceValues_0 = v17.viewEDPsourceValues;
local l_viewProfileSourceValues_0 = v17.viewProfileSourceValues;
local v20 = game:DefineFastFlag("GameJoinCardBannerClick", false);
return function(v21) --[[ Line: 53 ]] --[[ Name: MobileGameJoinCard ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), v2 (copy), l_GuiService_0 (copy), l_viewProfileSourceValues_0 (copy), l_viewEDPsourceValues_0 (copy), l_useLocalization_0 (copy), l_OverlayProvider_0 (copy), l_Sheet_0 (copy), l_View_0 (copy), v20 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v22 = l_useTokens_0();
    local v23, v24 = v1.useState(false);
    local v25, v26 = v1.useState(nil);
    local v27 = v2.Hooks.useOverlay();
    local v28 = not v27 or v27.AbsoluteSize.X > v27.AbsoluteSize.Y;
    local v29 = false;
    if l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Small then
        v29 = not v28;
    end;
    local v30 = not v29;
    v29 = v1.useCallback(function(v31) --[[ Line: 61 ]]
        -- upvalues: v24 (copy)
        if v31 == Enum.AssetFetchStatus.Success then
            v24(true);
        end;
    end, {});
    local v32 = v1.useCallback(function() --[[ Line: 67 ]]
        -- upvalues: v21 (copy), l_viewProfileSourceValues_0 (ref)
        v21.onViewProfile(l_viewProfileSourceValues_0.UserTile);
    end, {
        v21
    });
    local v33 = v1.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v21 (copy), l_viewProfileSourceValues_0 (ref)
        v21.onViewProfile(l_viewProfileSourceValues_0.ViewProfileButton);
    end, {
        v21
    });
    local v34 = v1.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v21 (copy), l_viewEDPsourceValues_0 (ref)
        v21.onViewExperienceDetails(l_viewEDPsourceValues_0.Title);
    end, {
        v21
    });
    local v35 = v1.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v21 (copy), l_viewEDPsourceValues_0 (ref)
        v21.onViewExperienceDetails(l_viewEDPsourceValues_0.Thumbnail);
    end, {
        v21
    });
    local v36 = 88 + (v22.Typography.TitleMedium.FontSize * v22.Typography.TitleMedium.LineHeight + v22.Typography.BodyMedium.FontSize * v22.Typography.BodyMedium.LineHeight + v22.Padding.Small);
    local v37 = l_useLocalization_0({
        playingExperience = {
            "Feature.Profile.Label.PlayingExperience"; 
            experienceName = v21.experienceName
        }, 
        join = "Feature.Profile.Action.JoinGame", 
        viewProfile = "Feature.Profile.Action.ViewProfile"
    });
    return v1.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        ref = v26
    }, {
        SheetProvider = v25 and v1.createElement(l_OverlayProvider_0, {
            gui = v25
        }, {
            SheetRoot = v1.createElement(l_Sheet_0.Root, {
                preferCenterSheet = true, 
                onClose = v21.onClose
            }, {
                Content = v1.createElement(l_Sheet_0.Content, nil, {
                    BottomPadding = if v30 then v1.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v22.Padding.Medium)
                    }) else nil, 
                    Layout = v1.createElement(l_View_0, {
                        tag = "col gap-medium size-full-0 auto-y"
                    }, {
                        BannerImageContainer = v1.createElement(l_View_0, {
                            tag = "size-full-0", 
                            Size = UDim2.new(1, 0, 0, 111), 
                            LayoutOrder = 1
                        }, {
                            BannerImageClipper = v1.createElement(l_View_0, {
                                tag = "clip", 
                                Position = UDim2.new(0, -v22.Padding.XLarge, 0, -v22.Padding.XLarge), 
                                Size = UDim2.new(1, 40, 0, 187), 
                                onActivated = if v20 then v35 else nil
                            }, {
                                BannerImageCanvas = v1.createElement("CanvasGroup", {
                                    Size = UDim2.new(1, 0, 0, 202), 
                                    BackgroundTransparency = 1, 
                                    GroupTransparency = 0
                                }, {
                                    Corner = v1.createElement("UICorner", {
                                        CornerRadius = UDim.new(0, 15)
                                    }), 
                                    BannerImage = v1.createElement(l_Image_0, {
                                        BackgroundTransparency = 1, 
                                        Image = v21.bannerImageUrl, 
                                        Size = UDim2.fromScale(1, 1), 
                                        ScaleType = Enum.ScaleType.Crop, 
                                        ZIndex = 2, 
                                        onLoaded = v29
                                    }), 
                                    BannerSkeleton = if not v23 then v1.createElement(l_Skeleton_0, {
                                        Size = UDim2.fromScale(1, 1), 
                                        ZIndex = 1
                                    }) else nil
                                })
                            })
                        }), 
                        UserTileWrapper = if v21.userId then v1.createElement(l_View_0, {
                            Size = UDim2.new(1, 0, 0, v36), 
                            ZIndex = 2, 
                            LayoutOrder = 2
                        }, {
                            Tile = v1.createElement(l_UserTile_0, {
                                userId = v21.userId, 
                                title = v21.playerName, 
                                subtitle = v37.playingExperience, 
                                layoutMode = l_LayoutMode_0.compact, 
                                avatarSize = UDim2.fromOffset(88, 88), 
                                backplateStyle = v22.Color.Surface.Surface_100, 
                                onActivated = v32, 
                                onSubtitleClicked = v34
                            })
                        }) else nil, 
                        Buttons = v1.createElement(l_View_0, {
                            tag = "col gap-small size-full-0 auto-y", 
                            LayoutOrder = 3
                        }, {
                            PrimaryButton = v1.createElement(l_Button_0, {
                                text = v37.join, 
                                onActivated = v21.onJoin, 
                                variant = l_ButtonVariant_0.Emphasis, 
                                inputSize = l_InputSize_0.Medium, 
                                isLoading = v21.isLoading, 
                                isDisabled = not v21.isInExperience, 
                                width = UDim.new(1, 0), 
                                LayoutOrder = 1
                            }), 
                            SecondaryButton = v1.createElement(l_Button_0, {
                                text = v37.viewProfile, 
                                onActivated = v33, 
                                variant = l_ButtonVariant_0.Standard, 
                                inputSize = l_InputSize_0.Medium, 
                                width = UDim.new(1, 0), 
                                LayoutOrder = 2
                            })
                        })
                    })
                })
            })
        })
    });
end;