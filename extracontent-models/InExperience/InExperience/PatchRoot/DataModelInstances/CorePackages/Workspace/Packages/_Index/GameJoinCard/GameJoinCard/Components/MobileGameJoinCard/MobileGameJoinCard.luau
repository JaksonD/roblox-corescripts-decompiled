local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.UserTile);
local l_UserTile_0 = v3.UserTile;
local l_LayoutMode_0 = v3.LayoutMode;
local l_Sheet_0 = v2.Sheet;
local l_View_0 = v2.View;
local l_Button_0 = v2.Button;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_InputSize_0 = v2.Enums.InputSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_Image_0 = v2.Image;
local l_Skeleton_0 = v2.Skeleton;
local l_useTokens_0 = v2.Hooks.useTokens;
return function(v15) --[[ Line: 42 ]] --[[ Name: MobileGameJoinCard ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_useLocalization_0 (copy), l_Sheet_0 (copy), l_View_0 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v16 = l_useTokens_0();
    local v17, v18 = v1.useState(false);
    local v20 = v1.useCallback(function(v19) --[[ Line: 46 ]]
        -- upvalues: v18 (copy)
        if v19 == Enum.AssetFetchStatus.Success then
            v18(true);
        end;
    end, {});
    local v21 = 88 + (v16.Typography.TitleMedium.FontSize * v16.Typography.TitleMedium.LineHeight + v16.Typography.BodyMedium.FontSize * v16.Typography.BodyMedium.LineHeight + v16.Padding.Small);
    local v22 = l_useLocalization_0({
        playingExperience = {
            "Feature.Profile.Label.PlayingExperience"; 
            experienceName = v15.experienceName
        }, 
        join = "Feature.Profile.Action.JoinGame", 
        viewProfile = "Feature.Profile.Action.ViewProfile"
    });
    return v1.createElement(l_Sheet_0.Root, {
        preferCenterSheet = true, 
        onClose = v15.onClose
    }, {
        Content = v1.createElement(l_Sheet_0.Content, nil, {
            BottomPadding = v1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v16.Padding.Medium)
            }), 
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
                        Position = UDim2.new(0, -v16.Padding.XLarge, 0, -v16.Padding.XLarge), 
                        Size = UDim2.new(1, 40, 0, 187)
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
                                Image = v15.bannerImageUrl, 
                                Size = UDim2.fromScale(1, 1), 
                                ScaleType = Enum.ScaleType.Crop, 
                                ZIndex = 2, 
                                onLoaded = v20
                            }), 
                            BannerSkeleton = if not v17 then v1.createElement(l_Skeleton_0, {
                                Size = UDim2.fromScale(1, 1), 
                                ZIndex = 1
                            }) else nil
                        })
                    })
                }), 
                UserTileWrapper = if v15.userId then v1.createElement(l_View_0, {
                    Size = UDim2.new(1, 0, 0, v21), 
                    ZIndex = 2, 
                    LayoutOrder = 2
                }, {
                    Tile = v1.createElement(l_UserTile_0, {
                        userId = v15.userId, 
                        title = v15.playerName, 
                        subtitle = v22.playingExperience, 
                        layoutMode = l_LayoutMode_0.compact, 
                        avatarSize = UDim2.fromOffset(88, 88), 
                        backplateStyle = v16.Color.Surface.Surface_100, 
                        onActivated = v15.onViewProfile, 
                        onSubtitleClicked = v15.onViewExperienceDetails
                    })
                }) else nil, 
                Buttons = v1.createElement(l_View_0, {
                    tag = "col gap-small size-full-0 auto-y", 
                    LayoutOrder = 3
                }, {
                    PrimaryButton = v1.createElement(l_Button_0, {
                        text = v22.join, 
                        onActivated = v15.onJoin, 
                        variant = l_ButtonVariant_0.Emphasis, 
                        inputSize = l_InputSize_0.Medium, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 1
                    }), 
                    SecondaryButton = v1.createElement(l_Button_0, {
                        text = v22.viewProfile, 
                        onActivated = v15.onViewProfile, 
                        variant = l_ButtonVariant_0.Standard, 
                        inputSize = l_InputSize_0.Medium, 
                        width = UDim.new(1, 0), 
                        LayoutOrder = 2
                    })
                })
            })
        })
    });
end;