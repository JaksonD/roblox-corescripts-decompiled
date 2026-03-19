local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_script_FirstAncestor_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Enums.RoundedVariant);
local l_Text_0 = v4.Text;
local l_Skeleton_0 = v4.Skeleton;
local l_Icon_0 = v4.Icon;
local l_IconName_0 = v4.Enums.IconName;
local l_IconSize_0 = v4.Enums.IconSize;
local l_View_0 = v4.View;
local l_useTokens_0 = v4.Hooks.useTokens;
local l_useScaledValue_0 = v4.Hooks.useScaledValue;
local l_useAbbreviatedNumberLocalization_0 = require(l_Parent_0.Localization).Hooks.useAbbreviatedNumberLocalization;
local v16 = require(script.Parent.GameCardThumbnail);
local v17 = require(l_script_FirstAncestor_0.Flags.getFFlagAppChatEnableRepliesUI);
local v18 = {
    thumbnailAspectRatio = 1.7777777777777777, 
    thumbnailRoundedVariant = v6.Top, 
    cornerRadius = 20, 
    isRepliedTo = false, 
    isIncoming = false, 
    isPending = false
};
GameCardGroupable = function(v19) --[[ Line: 64 ]] --[[ Name: GameCardGroupable ]]
    -- upvalues: v3 (copy), v18 (copy), l_useTokens_0 (copy), l_useAbbreviatedNumberLocalization_0 (copy), l_useScaledValue_0 (copy), v5 (copy), v17 (copy), v2 (copy), l_View_0 (copy), v16 (copy), l_Skeleton_0 (copy), v4 (copy), l_Text_0 (copy), l_Icon_0 (copy), l_IconName_0 (copy), l_IconSize_0 (copy)
    local v20 = v3.Dictionary.union(v18, v19);
    local v21 = l_useTokens_0();
    local v22 = l_useAbbreviatedNumberLocalization_0(v20.gamePlayerCount);
    local l_Size_1600_0 = v21.Size.Size_1600;
    local v24 = UDim2.fromOffset(l_useScaledValue_0(v5.GameCard.THUMBNAIL_WIDTH), l_useScaledValue_0(v5.GameCard.THUMBNAIL_HEIGHT));
    local v25 = UDim2.new(1, 0, 0, l_Size_1600_0);
    local v26 = nil;
    v26 = if v17() and v20.isRepliedTo then v21.Color.Content.Default else v21.Color.Content.Emphasis;
    return v2.createElement(l_View_0, {
        tag = "col auto-xy", 
        LayoutOrder = v20.LayoutOrder
    }, {
        ThumbnailContainer = v2.createElement(l_View_0, {
            Size = v24, 
            LayoutOrder = 1
        }, {
            Thumbnail = v2.createElement(v16, {
                LayoutOrder = 1, 
                gameThumbnail = v20.gameThumbnail, 
                cornerRadius = v20.cornerRadius, 
                roundedVariant = v20.thumbnailRoundedVariant, 
                aspectRatio = v20.thumbnailAspectRatio, 
                onActivated = v20.onThumbnailActivated, 
                Visible = not v20.isLoading
            })
        }), 
        Footer = v2.createElement(l_View_0, {
            tag = "padding-medium", 
            Size = v25, 
            LayoutOrder = 2
        }, {
            Skeleton = v2.createElement(l_View_0, {
                tag = "col size-full-full gap-xsmall", 
                Visible = v20.isLoading
            }, {
                TitleSkeleton = v2.createElement(l_View_0, {
                    tag = "grow-4", 
                    Size = UDim2.new(0.9, 0, 0, 0), 
                    LayoutOrder = 1
                }, {
                    v2.createElement(l_Skeleton_0, {
                        tag = "size-full-full", 
                        radius = v4.Enums.Radius.Small
                    })
                }), 
                MetadataSkeleton = v2.createElement(l_View_0, {
                    tag = "grow-3", 
                    Size = UDim2.new(0.5, 0, 0, 0), 
                    LayoutOrder = 2
                }, {
                    v2.createElement(l_Skeleton_0, {
                        tag = "size-full-full", 
                        radius = v4.Enums.Radius.Small
                    })
                })
            }), 
            Content = v2.createElement(l_View_0, {
                tag = "row size-full-full gap-small items-center align-y-center flex-between", 
                Visible = not v20.isLoading
            }, {
                TextContainer = v2.createElement(l_View_0, {
                    tag = "col size-0-full fill align-y-center radius-small", 
                    LayoutOrder = 1, 
                    onActivated = v20.onMetadataActivated, 
                    Selectable = v20.onMetadataActivated ~= nil
                }, {
                    Title = if v20.gameName then v2.createElement(l_Text_0, {
                        tag = "auto-y size-full-500 text-title-medium text-align-x-left text-truncate-split", 
                        Text = v20.gameName, 
                        textStyle = v26, 
                        LayoutOrder = 1
                    }) else nil, 
                    Metadata = if not not v20.gameRating or v22 then v2.createElement(l_View_0, {
                        tag = "row auto-y size-full-500 gap-medium align-y-center", 
                        LayoutOrder = 2
                    }, {
                        RatingContainer = if v20.gameRating then v2.createElement(l_View_0, {
                            tag = "auto-xy row gap-xsmall align-y-center", 
                            LayoutOrder = 1
                        }, {
                            RatingIcon = v2.createElement(l_Icon_0, {
                                name = l_IconName_0.ThumbUp, 
                                size = l_IconSize_0.Small, 
                                LayoutOrder = 1
                            }), 
                            Rating = v2.createElement(l_Text_0, {
                                tag = "auto-xy text-body-small content-default text-truncate-split", 
                                Text = v20.gameRating, 
                                LayoutOrder = 2
                            })
                        }) else nil, 
                        PlayerCountContainer = if v22 then v2.createElement(l_View_0, {
                            tag = "auto-xy row gap-xsmall align-y-center", 
                            LayoutOrder = 2
                        }, {
                            PlayerCountIcon = v2.createElement(l_Icon_0, {
                                name = l_IconName_0.PersonPlay, 
                                size = l_IconSize_0.Small, 
                                LayoutOrder = 1
                            }), 
                            PlayerCount = v2.createElement(l_Text_0, {
                                tag = "auto-xy text-body-small content-default text-truncate-split", 
                                Text = v22, 
                                LayoutOrder = 2
                            })
                        }) else nil
                    }) else nil
                }), 
                PlayButton = if v20.onPlayButtonActivated then v2.createElement(v4.IconButton, {
                    icon = l_IconName_0.PlayLarge, 
                    isCircular = true, 
                    variant = v4.Enums.ButtonVariant.Emphasis, 
                    onActivated = v20.onPlayButtonActivated, 
                    LayoutOrder = 2
                }) else nil
            })
        })
    });
end;
return v2.memo(GameCardGroupable);