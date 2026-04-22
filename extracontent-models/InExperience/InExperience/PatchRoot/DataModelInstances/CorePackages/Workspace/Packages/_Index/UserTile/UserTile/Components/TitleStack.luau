local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserTile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v7 = require(l_script_FirstAncestor_0.Constants);
local v8 = require(script.Parent.Parent.Enums.LayoutMode);
local v9 = require(l_script_FirstAncestor_0.TextKeys);
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Image_0 = v3.Image;
local l_Icon_0 = v3.Icon;
local l_Skeleton_0 = v3.Skeleton;
local l_Enums_0 = v3.Enums;
local l_StateLayerAffordance_0 = l_Enums_0.StateLayerAffordance;
local l_Radius_0 = l_Enums_0.Radius;
local l_IconSize_0 = l_Enums_0.IconSize;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagUserTileShowShimmerWhenLoading);
local l_FFlagUserTileTextTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagUserTileTextTCIndicator;
local l_FFlagUserTileShowBadges_0 = require(l_Parent_0.SharedFlags).FFlagUserTileShowBadges;
local l_FFlagEnableBlackbirdCheck_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheck;
local l_FFlagHidePremiumIconography_0 = require(l_Parent_0.SharedFlags).FFlagHidePremiumIconography;
local l_FFlagEnableMobileGameJoinCard_0 = require(l_Parent_0.SharedFlags).FFlagEnableMobileGameJoinCard;
local l_FFlagUserTileAddContextualInfoIcon_0 = require(l_Parent_0.SharedFlags).FFlagUserTileAddContextualInfoIcon;
local v27 = game:DefineFastFlag("UserTileRemoveContextualInfoTag", false);
local v28 = {
    layoutOrder = 2
};
return function(v29) --[[ Line: 63 ]] --[[ Name: TitleStack ]]
    -- upvalues: l_llama_0 (copy), v28 (copy), l_useTokens_0 (copy), v8 (copy), v2 (copy), l_Image_0 (copy), v20 (copy), v7 (copy), l_FFlagEnableBlackbirdCheck_0 (copy), l_FFlagHidePremiumIconography_0 (copy), l_FFlagUserTileTextTCIndicator_0 (copy), l_useLocalization_0 (copy), v9 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_Text_0 (copy), l_FFlagUserTileShowBadges_0 (copy), v3 (copy), l_FFlagEnableMobileGameJoinCard_0 (copy), l_StateLayerAffordance_0 (copy), l_FFlagUserTileAddContextualInfoIcon_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), v27 (copy)
    v29 = l_llama_0.Dictionary.join(v28, v29 or {});
    local v30 = l_useTokens_0();
    local v31 = v29.layoutMode == v8.compact and "align-x-center" or "align-x-left";
    local v32 = if v29.titleIcon then v2.createElement(l_Image_0, {
        Image = v29.titleIcon, 
        tag = "size-300-300 radius-circle", 
        LayoutOrder = 1
    }) else nil;
    local v33 = if not v29.contextualInfo or v29.subtitle then v29.layoutMode == v8.compact or v29.subtitle ~= nil else false;
    local v34 = (v29.titleStyle or v30.Typography.TitleMedium).FontSize - v30.Padding.XSmall * 2;
    local v35 = (v29.subtitleStyle or v30.Typography.BodyMedium).FontSize - v30.Padding.XSmall * 2;
    local v36 = (v29.contextualInfoStyle or v30.Typography.BodySmall).FontSize - v30.Padding.XSmall * 2;
    local v37 = if v20 then v29.layoutMode == v8.compact else nil;
    local v38 = nil;
    local v39 = nil;
    local v40 = nil;
    if v20 then
        if v37 then
            v38 = v7.TITLE_SHIMMER_WIDTH_SCALE_COMPACT;
            v39 = v7.SUBTITLE_SHIMMER_WIDTH_SCALE_COMPACT;
            v40 = v7.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_COMPACT;
        else
            v38 = v7.TITLE_SHIMMER_WIDTH_SCALE_WIDE;
            v39 = v7.SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE;
            v40 = v7.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE;
        end;
    end;
    local v41 = v20 and v29.layoutMode == v8.compact and "align-x-center" or "align-x-left";
    local v42 = v29.layoutMode == v8.compact and "size-full-0" or "grow";
    local v43 = v29.customTextTruncation or Enum.TextTruncate.AtEnd;
    local v44 = if l_FFlagEnableBlackbirdCheck_0 then v29.isRobloxSubscriber == true else nil;
    local v45 = not l_FFlagHidePremiumIconography_0 and v29.isPremium and not v44;
    local v46 = nil;
    if l_FFlagUserTileTextTCIndicator_0 then
        v46 = l_useLocalization_0({
            trustedLabel = v9.trustedLabel
        });
    end;
    return v2.createElement(l_View_0, {
        tag = ("%* auto-y col"):format(v42), 
        LayoutOrder = v29.layoutOrder
    }, {
        Title = if v20 and v29.isTitleLoading then v2.createElement(l_View_0, {
            tag = ("size-full-0 auto-y padding-xsmall %*"):format(v41), 
            LayoutOrder = 1
        }, {
            TitleSkeleton = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(v38, 0, 0, v34), 
                radius = l_Radius_0.Small
            })
        }) else v2.createElement(l_View_0, {
            tag = ("size-full-0 row auto-y gap-xxsmall align-y-center %*"):format(v31), 
            LayoutOrder = 1
        }, {
            TitleIcon = v32, 
            TitleText = if l_FFlagProfilePlatformNewProfileHeader_0 then v29.title and v2.createElement(l_View_0, {
                tag = {
                    ["row align-y-center gap-xsmall content-emphasis"] = true, 
                    ["auto-xy text-align-x-center"] = v29.layoutMode == v8.compact, 
                    ["auto-y size-full-0 text-align-x-left"] = v29.layoutMode == v8.wide
                }, 
                LayoutOrder = 2
            }, {
                Title = v2.createElement(l_Text_0, {
                    tag = {
                        ["shrink content-default auto-xy"] = true, 
                        ["text-align-x-left"] = v29.layoutMode == v8.wide, 
                        ["text-align-x-center"] = v29.layoutMode == v8.compact
                    }, 
                    fontStyle = v29.titleStyle or v30.Typography.TitleMedium, 
                    Text = v29.title, 
                    LayoutOrder = 1, 
                    RichText = true, 
                    TextTruncate = v43
                }), 
                BadgesRow = if l_FFlagUserTileShowBadges_0 then v2.createElement(l_View_0, {
                    tag = "row align-y-center auto-xy content-default gap-xxsmall", 
                    ["text-align-x-left"] = v29.layoutMode == v8.wide, 
                    ["text-align-x-center"] = v29.layoutMode == v8.compact, 
                    LayoutOrder = 2
                }, {
                    VerifiedBadge = v29.isVerified and v2.createElement(l_View_0, {
                        tag = "auto-xy content-default", 
                        LayoutOrder = 2
                    }, {
                        VerifiedBackplateIcon = v2.createElement(v3.Icon, {
                            name = v3.Enums.IconName.VerifiedBackplate, 
                            size = v3.Enums.IconSize.Large, 
                            style = v30.Color.System.Emphasis, 
                            AnchorPoint = Vector2.new(0, 0), 
                            Position = UDim2.fromScale(0, 0), 
                            ZIndex = 1
                        }), 
                        VerifiedCheckIcon = v2.createElement(v3.Icon, {
                            name = v3.Enums.IconName.VerifiedCheck, 
                            size = v3.Enums.IconSize.Large, 
                            style = {
                                Color3 = Color3.fromRGB(255, 255, 255), 
                                Transparency = 0
                            }, 
                            AnchorPoint = Vector2.new(0, 0), 
                            Position = UDim2.fromScale(0, 0), 
                            ZIndex = 2
                        })
                    }), 
                    SubscriptionBadge = if v44 then v2.createElement(v3.Icon, {
                        name = v3.Enums.IconName.RobloxPlus, 
                        size = v3.Enums.IconSize.Small, 
                        style = v30.Color.Content.Emphasis, 
                        LayoutOrder = 3
                    }) else nil, 
                    PremiumBadge = if v45 then v2.createElement(v3.Icon, {
                        name = v3.Enums.IconName.Premium, 
                        size = v3.Enums.IconSize.Large, 
                        LayoutOrder = 4
                    }) else nil, 
                    AdminBadge = v29.isRobloxAdmin and v2.createElement(v3.Icon, {
                        name = v3.Enums.IconName.Tilt, 
                        size = v3.Enums.IconSize.Large, 
                        LayoutOrder = 5
                    })
                }) else nil
            }) else v29.title and v2.createElement(l_Text_0, {
                tag = {
                    ["content-emphasis"] = true, 
                    ["auto-xy text-align-x-center"] = v29.layoutMode == v8.compact, 
                    ["auto-y size-full-0 text-align-x-left"] = v29.layoutMode == v8.wide
                }, 
                fontStyle = v29.titleStyle or v30.Typography.TitleMedium, 
                Text = v29.title, 
                LayoutOrder = 2, 
                RichText = true, 
                TextTruncate = v43
            }) or nil
        }), 
        Subtitle = if v20 and v29.isSubtitleLoading then v2.createElement(l_View_0, {
            tag = ("size-full-0 auto-y padding-xsmall %*"):format(v41), 
            LayoutOrder = 2
        }, {
            SubtitleSkeleton = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(v39, 0, 0, v35), 
                radius = l_Radius_0.Small
            })
        }) else if not l_FFlagUserTileTextTCIndicator_0 and v33 then v2.createElement(l_Text_0, {
            tag = {
                ["auto-y size-full-0 content-default"] = true, 
                ["text-align-x-center"] = v29.layoutMode == v8.compact, 
                ["text-align-x-left"] = v29.layoutMode == v8.wide
            }, 
            fontStyle = v29.subtitleStyle or v30.Typography.BodyMedium, 
            Text = v29.subtitle or "", 
            LayoutOrder = 2, 
            RichText = true, 
            TextTruncate = v43, 
            onActivated = (not not l_FFlagProfilePlatformNewProfileHeader_0 or l_FFlagEnableMobileGameJoinCard_0) and v29.onSubtitleClicked and function() --[[ Line: 256 ]]
                -- upvalues: v29 (ref)
                v29.onSubtitleClicked();
            end or nil, 
            stateLayer = if (not not l_FFlagProfilePlatformNewProfileHeader_0 or l_FFlagEnableMobileGameJoinCard_0) and v29.onSubtitleClicked then {
                affordance = l_StateLayerAffordance_0.None
            } else nil
        }) else if l_FFlagUserTileTextTCIndicator_0 and v33 then v2.createElement(l_View_0, {
            tag = {
                ["row auto-y size-full-0 align-y-center"] = true, 
                ["align-x-center"] = v29.layoutMode == v8.compact, 
                ["align-x-left"] = v29.layoutMode == v8.wide
            }, 
            LayoutOrder = 2, 
            onActivated = (not not l_FFlagProfilePlatformNewProfileHeader_0 or l_FFlagEnableMobileGameJoinCard_0) and v29.onSubtitleClicked and function() --[[ Line: 277 ]]
                -- upvalues: v29 (ref)
                v29.onSubtitleClicked();
            end or nil, 
            stateLayer = if (not not l_FFlagProfilePlatformNewProfileHeader_0 or l_FFlagEnableMobileGameJoinCard_0) and v29.onSubtitleClicked then {
                affordance = l_StateLayerAffordance_0.None
            } else nil
        }, {
            SubtitleText = v2.createElement(l_Text_0, {
                tag = {
                    ["auto-xy shrink content-default"] = true, 
                    ["text-align-x-center"] = v29.layoutMode == v8.compact, 
                    ["text-align-x-left"] = v29.layoutMode == v8.wide
                }, 
                fontStyle = v29.subtitleStyle or v30.Typography.BodyMedium, 
                Text = v29.subtitle or "", 
                LayoutOrder = 1, 
                RichText = true, 
                TextTruncate = v43
            }), 
            TCTextLabel = if v29.trustedConnectionIndicatorEnabled and v29.isTrustedConnection then v2.createElement(l_Text_0, {
                tag = {
                    ["auto-xy content-default"] = true, 
                    ["text-align-x-center"] = v29.layoutMode == v8.compact, 
                    ["text-align-x-left"] = v29.layoutMode == v8.wide
                }, 
                fontStyle = v29.subtitleStyle or v30.Typography.BodyMedium, 
                Text = " \226\128\162 " .. v46.trustedLabel, 
                LayoutOrder = 2, 
                RichText = true, 
                TextTruncate = v43
            }) else nil
        }) else nil, 
        ContextualInfo = if v20 and v29.isContextualInfoLoading then v2.createElement(l_View_0, {
            tag = ("size-full-0 auto-y padding-xsmall %*"):format(v41), 
            LayoutOrder = 3
        }, {
            ContextualInfoSkeleton = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(v40, 0, 0, v36), 
                radius = l_Radius_0.Small
            })
        }) else v29.contextualInfo and (if l_FFlagUserTileAddContextualInfoIcon_0 and v29.contextualInfoIcon then v2.createElement(l_View_0, {
            tag = {
                ["row align-y-center gap-xsmall size-full-0 auto-y"] = true, 
                ["align-x-center"] = v29.layoutMode == v8.compact, 
                ["align-x-left"] = v29.layoutMode == v8.wide
            }, 
            LayoutOrder = 3
        }, {
            ContextualInfoIcon = v2.createElement(l_Icon_0, {
                name = v29.contextualInfoIcon, 
                size = l_IconSize_0.XSmall, 
                LayoutOrder = 1
            }), 
            ContextualInfoText = v2.createElement(l_Text_0, {
                tag = {
                    ["content-secondary shrink auto-xy"] = not v27, 
                    ["shrink auto-xy"] = v27
                }, 
                fontStyle = v29.contextualInfoStyle or v30.Typography.BodySmall, 
                TextTruncate = v43, 
                Text = v29.contextualInfo, 
                LayoutOrder = 2, 
                RichText = true
            })
        }) else v2.createElement(l_Text_0, {
            tag = {
                ["auto-y size-full-0 content-secondary"] = not v27, 
                ["size-full-0 auto-y"] = v27, 
                ["text-align-x-center"] = v29.layoutMode == v8.compact, 
                ["text-align-x-left"] = v29.layoutMode == v8.wide
            }, 
            fontStyle = v29.contextualInfoStyle or v30.Typography.BodySmall, 
            TextTruncate = v43, 
            Text = v29.contextualInfo, 
            LayoutOrder = 3, 
            RichText = true
        })) or nil
    });
end;