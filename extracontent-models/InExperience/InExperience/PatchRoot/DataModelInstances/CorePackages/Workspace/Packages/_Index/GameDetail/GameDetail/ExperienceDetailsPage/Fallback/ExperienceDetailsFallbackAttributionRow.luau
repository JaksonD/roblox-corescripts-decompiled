local l_Parent_0 = script:FindFirstAncestor("GameDetail").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_View_0 = v2.View;
local l_Image_0 = v2.Image;
local l_Text_0 = v2.Text;
local l_Icon_0 = v2.Icon;
local l_Skeleton_0 = v2.Skeleton;
local l_Radius_0 = v2.Enums.Radius;
local l_ButtonSize_0 = v2.Enums.ButtonSize;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_PlayButton_0 = require(l_Parent_0.GamePlayButton).PlayButton;
local v12 = require(script.Parent.Parent.useImageLoadFade);
local function v14() --[[ Line: 48 ]] --[[ Name: VerifiedBadgeIcon ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Icon_0 (copy), v2 (copy)
    local v13 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        LayoutOrder = 2, 
        tag = "auto-xy"
    }, {
        Backplate = v1.createElement(l_Icon_0, {
            name = v2.Enums.IconName.VerifiedBackplate, 
            style = v13.Color.System.Emphasis, 
            size = v2.Enums.IconSize.Small, 
            ZIndex = 1
        }), 
        Check = v1.createElement(l_Icon_0, {
            name = v2.Enums.IconName.VerifiedCheck, 
            size = v2.Enums.IconSize.Small, 
            variant = v2.Enums.IconVariant.Filled, 
            style = v13.Color.Extended.White.White_100, 
            ZIndex = 2
        })
    });
end;
return v1.memo(function(v15) --[[ Line: 70 ]] --[[ Name: FallbackAttributionRow ]]
    -- upvalues: l_useTokens_0 (copy), v12 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_Text_0 (copy), l_Radius_0 (copy), v14 (copy), l_PlayButton_0 (copy), l_ButtonSize_0 (copy)
    local v16 = l_useTokens_0();
    local l_isSmallScreen_0 = v15.isSmallScreen;
    local v18 = v15.isLoading == true;
    local v19 = if l_isSmallScreen_0 then v16.Size.Size_1400 else v16.Size.Size_2500 * 2;
    local v20 = l_isSmallScreen_0 and 150 or 256;
    local v21 = string.format("rbxthumb://type=GameIcon&id=%s&w=%d&h=%d", v15.universeId, v20, v20);
    local v22 = v12();
    local v23 = v1.createElement(l_View_0, {
        LayoutOrder = 1, 
        Size = UDim2.fromOffset(v19, v19)
    }, {
        GameIcon = v1.createElement(l_Image_0, {
            tag = "radius-medium", 
            Image = v21, 
            Size = UDim2.fromScale(1, 1), 
            onLoaded = v22.onLoaded
        }), 
        SkeletonOverlay = if v22.skeletonVisible then v1.createElement(l_View_0, {
            tag = "radius-medium", 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 2, 
            ClipsDescendants = true, 
            GroupTransparency = v22.overlayTransparency
        }, {
            Skeleton = v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromScale(1, 1)
            })
        }) else nil
    });
    local v24 = nil;
    if v15.gameName then
        v24 = v1.createElement(l_Text_0, {
            tag = {
                ["auto-xy text-wrap text-align-x-left text-truncate-none"] = true, 
                ["text-heading-small"] = l_isSmallScreen_0, 
                ["text-heading-large"] = not l_isSmallScreen_0
            }, 
            Text = v15.gameName, 
            LayoutOrder = 1
        });
    elseif v18 then
        v24 = v1.createElement(l_Skeleton_0, {
            Size = UDim2.fromOffset(v16.Size.Size_2800 * 2, if l_isSmallScreen_0 then v16.Typography.HeadingSmall.LineHeight * v16.Typography.HeadingSmall.FontSize else v16.Typography.HeadingLarge.LineHeight * v16.Typography.HeadingLarge.FontSize), 
            radius = l_Radius_0.Small, 
            LayoutOrder = 1
        });
    end;
    local v25 = nil;
    if v15.creatorName then
        v25 = v1.createElement(l_View_0, {
            tag = "row align-y-center gap-xsmall auto-xy", 
            LayoutOrder = 2
        }, {
            CreatorName = v1.createElement(l_Text_0, {
                tag = "auto-xy text-body-medium content-default", 
                Text = v15.creatorName, 
                TextTruncate = Enum.TextTruncate.None, 
                LayoutOrder = 1
            }), 
            Badge = if v15.hasVerifiedBadge then v1.createElement(v14) else nil
        });
    elseif v18 then
        v25 = v1.createElement(l_Skeleton_0, {
            Size = UDim2.fromOffset(v16.Size.Size_2800 * 2, v16.Typography.BodyLarge.LineHeight * v16.Typography.BodyLarge.FontSize), 
            radius = l_Radius_0.Small, 
            LayoutOrder = 2
        });
    end;
    local v26 = nil;
    if v15.ageRecDisplayName then
        v26 = v1.createElement(l_Text_0, {
            tag = "auto-xy text-body-medium content-default", 
            Text = v15.ageRecDisplayName, 
            LayoutOrder = 3
        });
    elseif v18 then
        v26 = v1.createElement(l_Skeleton_0, {
            Size = UDim2.fromOffset(v16.Size.Size_2400, v16.Typography.BodyLarge.LineHeight * v16.Typography.BodyLarge.FontSize), 
            radius = l_Radius_0.Small, 
            LayoutOrder = 3
        });
    end;
    local v27 = nil;
    if not l_isSmallScreen_0 then
        v27 = v1.createElement(l_View_0, {
            tag = "row align-y-center gap-small auto-xy", 
            LayoutOrder = 4
        }, {
            PlayBtn = v1.createElement(l_PlayButton_0, {
                universeId = v15.universeId, 
                referralSource = v15.referralSource, 
                launchSource = v15.launchSource, 
                experienceJoinData = v15.experienceJoinData, 
                placeId = v15.placeIdOverride, 
                buttonSize = l_ButtonSize_0.Large, 
                width = UDim.new(0, v16.Size.Size_2500 * 2), 
                LayoutOrder = 1, 
                testId = "--edp-fallback-feed-play-button"
            }), 
            OverflowSkeleton1 = if v18 then v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v16.Size.Size_1200, v16.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 2
            }) else nil, 
            OverflowSkeleton2 = if v18 then v1.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v16.Size.Size_1200, v16.Size.Size_1200), 
                radius = l_Radius_0.Medium, 
                LayoutOrder = 3
            }) else nil
        });
    end;
    return v1.createElement(l_View_0, {
        tag = {
            ["row gap-medium size-full-0 auto-y"] = true, 
            ["align-y-center"] = l_isSmallScreen_0, 
            ["align-y-bottom"] = not l_isSmallScreen_0
        }, 
        LayoutOrder = 1
    }, {
        Icon = v23, 
        ContentColumn = v1.createElement(l_View_0, {
            tag = "col fill gap-small auto-xy", 
            LayoutOrder = 2
        }, {
            Title = v24, 
            Creator = v25, 
            AgeRating = v26, 
            ActionRow = v27
        })
    });
end);