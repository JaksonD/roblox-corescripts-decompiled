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
local l_Skeleton_0 = v3.Skeleton;
local l_Enums_0 = v3.Enums;
local l_StateLayerAffordance_0 = l_Enums_0.StateLayerAffordance;
local l_Radius_0 = l_Enums_0.Radius;
local l_FFlagProfilePlatformNewProfileHeader_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformNewProfileHeader;
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagUserTileShowShimmerWhenLoading);
local v19 = game:DefineFastFlag("UserTileAdjustOverallWidthForLayoutModes", false);
local v20 = game:DefineFastFlag("UserTileRemoveExtraPadding", false);
local l_FFlagAppChatUserTileCustomTitleTruncation_0 = require(l_Parent_0.SharedFlags).FFlagAppChatUserTileCustomTitleTruncation;
local l_FFlagUserTileTextTCIndicator_0 = require(l_Parent_0.SharedFlags).FFlagUserTileTextTCIndicator;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_FFlagUserTileShowBadges_0 = require(l_Parent_0.SharedFlags).FFlagUserTileShowBadges;
local v25 = {
    layoutOrder = 2
};
return function(v26) --[[ Line: 59 ]] --[[ Name: TitleStack ]]
    -- upvalues: l_llama_0 (copy), v25 (copy), l_useTokens_0 (copy), l_FFlagAppChatUserTileCustomTitleTruncation_0 (copy), v8 (copy), v2 (copy), l_Image_0 (copy), v20 (copy), v18 (copy), v7 (copy), v19 (copy), l_FFlagUserTileTextTCIndicator_0 (copy), l_useLocalization_0 (copy), v9 (copy), l_View_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_FFlagProfilePlatformNewProfileHeader_0 (copy), l_Text_0 (copy), l_FFlagUserTileShowBadges_0 (copy), v3 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), l_StateLayerAffordance_0 (copy)
    v26 = l_llama_0.Dictionary.join(v25, v26 or {});
    local v27 = l_useTokens_0();
    local v28 = l_FFlagAppChatUserTileCustomTitleTruncation_0 and "" or v26.layoutMode == v8.compact and "text-align-x-center" or "text-align-x-left";
    local v29 = v26.layoutMode == v8.compact and "align-x-center" or "align-x-left";
    local v30 = l_FFlagAppChatUserTileCustomTitleTruncation_0 and "" or v26.layoutMode == v8.compact and "auto-xy " or "auto-y size-full-0 ";
    local v31 = if v26.titleIcon then v2.createElement(l_Image_0, {
        Image = v26.titleIcon, 
        tag = "size-300-300 radius-circle", 
        LayoutOrder = 1
    }) else nil;
    local v32 = if not v26.contextualInfo or v26.subtitle then v26.layoutMode == v8.compact or v26.subtitle ~= nil else false;
    local v33 = (v26.titleStyle or v27.Typography.TitleMedium).FontSize - if v20 then v27.Padding.XSmall * 2 else 0;
    local v34 = (v26.subtitleStyle or v27.Typography.BodyMedium).FontSize - if v20 then v27.Padding.XSmall * 2 else 0;
    local v35 = (v26.contextualInfoStyle or v27.Typography.BodySmall).FontSize - if v20 then v27.Padding.XSmall * 2 else 0;
    local v36 = if v18 then v26.layoutMode == v8.compact else nil;
    local v37 = nil;
    local v38 = nil;
    local v39 = nil;
    if v18 then
        if v36 then
            v37 = v7.TITLE_SHIMMER_WIDTH_SCALE_COMPACT;
            v38 = v7.SUBTITLE_SHIMMER_WIDTH_SCALE_COMPACT;
            v39 = v7.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_COMPACT;
        else
            v37 = v7.TITLE_SHIMMER_WIDTH_SCALE_WIDE;
            v38 = v7.SUBTITLE_SHIMMER_WIDTH_SCALE_WIDE;
            v39 = v7.CONTEXTUAL_INFO_SHIMMER_WIDTH_SCALE_WIDE;
        end;
    end;
    local v40 = v18 and v26.layoutMode == v8.compact and "align-x-center" or "align-x-left";
    local v41 = if v19 then v26.layoutMode == v8.compact and "size-full-0" or "grow" else "size-full-0";
    local v42 = v26.customTextTruncation or Enum.TextTruncate.AtEnd;
    local v43 = nil;
    if l_FFlagUserTileTextTCIndicator_0 then
        v43 = l_useLocalization_0({
            trustedLabel = v9.trustedLabel
        });
    end;
    return v2.createElement(l_View_0, {
        tag = {
            [("%* auto-y col"):format(v41)] = true, 
            ["gap-xsmall"] = not v20
        }, 
        LayoutOrder = v26.layoutOrder
    }, {
        Title = if v18 and v26.isTitleLoading then v2.createElement(l_View_0, {
            tag = {
                [("size-full-0 auto-y %*"):format(v40)] = true, 
                ["padding-xsmall"] = v20
            }, 
            LayoutOrder = 1
        }, {
            TitleSkeleton = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(v37, 0, 0, v33), 
                radius = l_Radius_0.Small
            })
        }) else v2.createElement(l_View_0, {
            tag = ("size-full-0 row auto-y gap-xxsmall align-y-center %*"):format(v29), 
            LayoutOrder = 1
        }, {
            TitleIcon = v31, 
            TitleText = if l_FFlagProfilePlatformNewProfileHeader_0 then v26.title and v2.createElement(l_View_0, {
                tag = {
                    ["row align-y-center gap-xsmall"] = true, 
                    [("text-truncate-end content-emphasis %*"):format(v30 .. v28)] = not l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                    ["content-emphasis"] = l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                    ["auto-xy text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact, 
                    ["auto-y size-full-0 text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide
                }, 
                LayoutOrder = 2
            }, {
                Title = v2.createElement(l_Text_0, {
                    tag = {
                        ["shrink content-default auto-xy"] = true, 
                        ["text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide, 
                        ["text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact
                    }, 
                    fontStyle = v26.titleStyle or v27.Typography.TitleMedium, 
                    Text = v26.title, 
                    LayoutOrder = 1, 
                    RichText = true, 
                    TextTruncate = v42
                }), 
                BadgesRow = if l_FFlagUserTileShowBadges_0 then v2.createElement(l_View_0, {
                    tag = "row align-y-center auto-xy content-default gap-xxsmall", 
                    ["text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide, 
                    ["text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact, 
                    LayoutOrder = 2
                }, {
                    VerifiedBadge = v26.isVerified and v2.createElement(l_View_0, {
                        tag = "auto-xy content-default", 
                        LayoutOrder = 2
                    }, {
                        VerifiedBackplateIcon = v2.createElement(v3.Icon, {
                            name = v3.Enums.IconName.VerifiedBackplate, 
                            size = v3.Enums.IconSize.Large, 
                            style = v27.Color.System.Emphasis, 
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
                    SubscriptionBadge = if l_FFlagEnableBlackbirdCheckDev_0 and v26.isRobloxSubscriber then v2.createElement(v3.Icon, {
                        name = v3.Enums.IconName.PaperAirplane, 
                        size = v3.Enums.IconSize.Small, 
                        style = v27.Color.Content.Emphasis, 
                        LayoutOrder = 3
                    }) else nil, 
                    PremiumBadge = if l_FFlagEnableBlackbirdCheckDev_0 then not v26.isRobloxSubscriber and v26.isPremium and v2.createElement(v3.Icon, {
                        name = v3.Enums.IconName.Premium, 
                        size = v3.Enums.IconSize.Large, 
                        LayoutOrder = 4
                    }) else v26.isPremium and v2.createElement(v3.Icon, {
                        name = v3.Enums.IconName.Premium, 
                        size = v3.Enums.IconSize.Large, 
                        LayoutOrder = 4
                    }), 
                    AdminBadge = v26.isRobloxAdmin and v2.createElement(v3.Icon, {
                        name = v3.Enums.IconName.Tilt, 
                        size = v3.Enums.IconSize.Large, 
                        LayoutOrder = 5
                    })
                }) else nil
            }) else v26.title and v2.createElement(l_Text_0, {
                tag = {
                    [("text-truncate-end content-emphasis %*"):format(v30 .. v28)] = not l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                    ["content-emphasis"] = l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                    ["auto-xy text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact, 
                    ["auto-y size-full-0 text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide
                }, 
                fontStyle = v26.titleStyle or v27.Typography.TitleMedium, 
                Text = v26.title, 
                LayoutOrder = 2, 
                RichText = true, 
                TextTruncate = v42
            }) or nil
        }), 
        Subtitle = if v18 and v26.isSubtitleLoading then v2.createElement(l_View_0, {
            tag = {
                [("size-full-0 auto-y %*"):format(v40)] = true, 
                ["padding-xsmall"] = v20
            }, 
            LayoutOrder = 2
        }, {
            SubtitleSkeleton = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(v38, 0, 0, v34), 
                radius = l_Radius_0.Small
            })
        }) else if not l_FFlagUserTileTextTCIndicator_0 and v32 then v2.createElement(l_Text_0, {
            tag = {
                [("auto-y size-full-0 text-truncate-end content-default %*"):format(v28)] = not l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                ["auto-y size-full-0 content-default"] = l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                ["text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact, 
                ["text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide
            }, 
            fontStyle = v26.subtitleStyle or v27.Typography.BodyMedium, 
            Text = v26.subtitle or "", 
            LayoutOrder = 2, 
            RichText = true, 
            TextTruncate = v42, 
            onActivated = l_FFlagProfilePlatformNewProfileHeader_0 and v26.onSubtitleClicked and function() --[[ Line: 286 ]]
                -- upvalues: v26 (ref)
                v26.onSubtitleClicked();
            end or nil, 
            stateLayer = if l_FFlagProfilePlatformNewProfileHeader_0 and v26.onSubtitleClicked then {
                affordance = l_StateLayerAffordance_0.None
            } else nil
        }) else if l_FFlagUserTileTextTCIndicator_0 and v32 then v2.createElement(l_View_0, {
            tag = {
                ["row auto-y size-full-0 align-y-center"] = true, 
                ["align-x-center"] = v26.layoutMode == v8.compact, 
                ["align-x-left"] = v26.layoutMode == v8.wide
            }, 
            LayoutOrder = 2, 
            onActivated = l_FFlagProfilePlatformNewProfileHeader_0 and v26.onSubtitleClicked and function() --[[ Line: 305 ]]
                -- upvalues: v26 (ref)
                v26.onSubtitleClicked();
            end or nil, 
            stateLayer = if l_FFlagProfilePlatformNewProfileHeader_0 and v26.onSubtitleClicked then {
                affordance = l_StateLayerAffordance_0.None
            } else nil
        }, {
            SubtitleText = v2.createElement(l_Text_0, {
                tag = {
                    ["auto-xy shrink content-default"] = true, 
                    [("%*"):format(v28)] = not l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                    ["text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact, 
                    ["text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide
                }, 
                fontStyle = v26.subtitleStyle or v27.Typography.BodyMedium, 
                Text = v26.subtitle or "", 
                LayoutOrder = 1, 
                RichText = true, 
                TextTruncate = v42
            }), 
            TCTextLabel = if v26.trustedConnectionIndicatorEnabled and v26.isTrustedConnection then v2.createElement(l_Text_0, {
                tag = {
                    ["auto-xy content-default"] = true, 
                    [("%*"):format(v28)] = not l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                    ["text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact, 
                    ["text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide
                }, 
                fontStyle = v26.subtitleStyle or v27.Typography.BodyMedium, 
                Text = " \226\128\162 " .. v43.trustedLabel, 
                LayoutOrder = 2, 
                RichText = true, 
                TextTruncate = v42
            }) else nil
        }) else nil, 
        ContextualInfo = if v18 and v26.isContextualInfoLoading then v2.createElement(l_View_0, {
            tag = {
                [("size-full-0 auto-y %*"):format(v40)] = true, 
                ["padding-xsmall"] = v20
            }, 
            LayoutOrder = 3
        }, {
            ContextualInfoSkeleton = v2.createElement(l_Skeleton_0, {
                Size = UDim2.new(v39, 0, 0, v35), 
                radius = l_Radius_0.Small
            })
        }) else v26.contextualInfo and v2.createElement(l_Text_0, {
            tag = {
                [("auto-y size-full-0 text-truncate-end content-secondary %*"):format(v28)] = not l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                ["auto-y size-full-0 content-secondary"] = l_FFlagAppChatUserTileCustomTitleTruncation_0, 
                ["text-align-x-center"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.compact, 
                ["text-align-x-left"] = l_FFlagAppChatUserTileCustomTitleTruncation_0 and v26.layoutMode == v8.wide
            }, 
            fontStyle = v26.contextualInfoStyle or v27.Typography.BodySmall, 
            TextTruncate = v42, 
            Text = v26.contextualInfo, 
            LayoutOrder = 3, 
            RichText = true
        }) or nil
    });
end;