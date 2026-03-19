local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local l_Skeleton_0 = v3.Skeleton;
local l_IXPService_0 = game:GetService("IXPService");
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatContextCardNameLoadingShimmer);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatUseTCUserTileForOSACard);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAvatarPresence);
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v15 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
return v2.memo(v2.forwardRef(function(v17, v18) --[[ Line: 40 ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), l_useLocalization_0 (copy), v2 (copy), v14 (copy), l_IXPService_0 (copy), v15 (copy), v11 (copy), v3 (copy), l_Skeleton_0 (copy), v12 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v13 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy)
    local v19 = l_useTokens_0();
    local l_Size_0 = v19.Size;
    local v21 = v10(v17.userId);
    local v22 = l_useLocalization_0({
        firstConversationWithThisUserHeadingText = "Feature.Chat.Heading.FirstConversationWithThisUser", 
        firstConversationWithHeadingText = {
            "Feature.Chat.Heading.FirstConversationWith"; 
            displayName = v17.displayName
        }, 
        firstInteractionWithThisPersonHeadingText = "Feature.Chat.Heading.FirstInteractionWithThisPerson", 
        firstInteractionWithHeadingText = {
            "Feature.Chat.Heading.FirstInteractionWith"; 
            displayName = v17.displayName
        }, 
        osaContextCardDescriptionText = "Feature.Chat.Description.OSAContextCardDescription", 
        user = "Feature.Chat.Label.User"
    });
    local l_isChatUserMessagesEnabled_0 = v17.isChatUserMessagesEnabled;
    local v24 = if l_isChatUserMessagesEnabled_0 then v22.firstConversationWithHeadingText else v22.firstInteractionWithHeadingText;
    local v25 = if l_isChatUserMessagesEnabled_0 then v22.firstConversationWithThisUserHeadingText else v22.firstInteractionWithThisPersonHeadingText;
    v2.useEffect(function() --[[ Line: 69 ]]
        -- upvalues: v14 (ref), l_IXPService_0 (ref), v15 (ref)
        if v14 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v15);
        end;
    end, {});
    if v11 then
        local v26 = not v17.displayName and not v17.hasError;
        local v27 = not v17.username and not v17.hasError;
        local v28 = not v17.avatarThumbnail and not v17.hasError;
        local v29 = not v26 and not v27 and not v28;
        return v2.createElement(v3.View, {
            tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge", 
            sizeConstraint = {
                MaxSize = Vector2.new(700, 500)
            }
        }, {
            AvatarContainer = v2.createElement(v3.View, {
                tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small", 
                LayoutOrder = 1, 
                onActivated = if v29 then v17.onAvatarActivated else nil
            }, {
                AvatarCircle = if v28 then v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, l_Size_0.Size_1200, 0, l_Size_0.Size_1200), 
                    radius = v3.Enums.Radius.Circle, 
                    LayoutOrder = 1
                }) else if v12 then v2.createElement(v3.View, {
                    tag = "size-1200-1200", 
                    LayoutOrder = 1
                }, {
                    v2.createElement(l_UserTile_0, {
                        userId = tostring(v17.userId), 
                        layoutMode = l_LayoutMode_0.compact, 
                        userPresenceType = if v13 then v21.presence else v3.Enums.UserPresence.None, 
                        dontTruncateTitle = true, 
                        onActivated = v17.onAvatarActivated, 
                        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v17.isRobloxSubscriber else nil
                    })
                }) else v2.createElement(v3.Image, {
                    tag = "size-1200-1200 bg-shift-200", 
                    cornerRadius = UDim.new(0, v19.Radius.Circle), 
                    Image = v17.avatarThumbnail, 
                    LayoutOrder = 1
                }), 
                AvatarTextContainer = v2.createElement(v3.View, {
                    tag = "col auto-xy align-x-center gap-xxsmall", 
                    LayoutOrder = 2
                }, {
                    DisplayName = if v26 then v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0, l_Size_0.Size_2500, 0, v19.Typography.TitleMedium.FontSize), 
                        radius = v3.Enums.Radius.Large, 
                        LayoutOrder = 1
                    }) else if not (l_FFlagEnableBlackbirdCheckDev_0 and v17.isRobloxSubscriber) or v17.hasError then v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 1, 
                        Text = if v17.hasError then v22.user else v17.displayName, 
                        fontStyle = v19.Typography.TitleMedium, 
                        textStyle = v19.Color.Content.Emphasis
                    }) else v2.createElement(v3.View, {
                        tag = "row auto-xy align-y-center gap-xsmall", 
                        LayoutOrder = 1
                    }, {
                        Name = v2.createElement(v3.Text, {
                            tag = "auto-xy", 
                            LayoutOrder = 1, 
                            Text = v17.displayName, 
                            fontStyle = v19.Typography.TitleMedium, 
                            textStyle = v19.Color.Content.Emphasis
                        }), 
                        Badge = v2.createElement(v3.Icon, {
                            LayoutOrder = 2, 
                            name = v3.Enums.IconName.PaperAirplane, 
                            size = v3.Enums.IconSize.Small, 
                            style = v19.Color.Content.Emphasis
                        })
                    }), 
                    Username = if v27 then v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0, l_Size_0.Size_2000, 0, v19.Typography.BodySmall.FontSize), 
                        radius = v3.Enums.Radius.Large, 
                        LayoutOrder = 2
                    }) else v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 2, 
                        Text = if v17.hasError then v22.user else v17.username, 
                        fontStyle = v19.Typography.BodySmall, 
                        textStyle = v19.Color.Content.Muted
                    })
                })
            }), 
            TextContainer = v2.createElement(v3.View, {
                tag = "col align-x-center auto-xy", 
                LayoutOrder = 2, 
                ref = v18
            }, {
                HeadingText = if v26 then v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, l_Size_0.Size_3000, 0, v19.Typography.TitleLarge.FontSize + v19.Gap.XXSmall), 
                    radius = v3.Enums.Radius.Large, 
                    LayoutOrder = 1
                }) else v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 1, 
                    Text = if v17.hasError then v25 else v24, 
                    fontStyle = v19.Typography.TitleLarge, 
                    textStyle = v19.Color.Content.Emphasis
                }), 
                DescriptionText = v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 2, 
                    Text = v22.osaContextCardDescriptionText, 
                    fontStyle = v19.Typography.BodyLarge, 
                    textStyle = v19.Color.Content.Default
                })
            })
        });
    elseif (not (v17.displayName and v17.username) or not v17.avatarThumbnail) and not v17.hasError then
        return v2.createElement(v3.View, {
            tag = "size-full-0 auto-y", 
            sizeConstraint = {
                MaxSize = Vector2.new(700, 500)
            }
        }, {
            v2.createElement(v3.Skeleton, {
                Size = UDim2.new(1, 0, 0, 270), 
                radius = v3.Enums.Radius.Large
            })
        });
    else
        return v2.createElement(v3.View, {
            tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge", 
            sizeConstraint = {
                MaxSize = Vector2.new(700, 500)
            }
        }, {
            AvatarContainer = if v17.hasError then nil else v2.createElement(v3.View, {
                tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small", 
                LayoutOrder = 1, 
                onActivated = v17.onAvatarActivated
            }, {
                AvatarCircle = if v12 then v2.createElement(v3.View, {
                    tag = "size-1200-1200", 
                    LayoutOrder = 1
                }, {
                    v2.createElement(l_UserTile_0, {
                        userId = tostring(v17.userId), 
                        layoutMode = l_LayoutMode_0.compact, 
                        userPresenceType = if v13 then v21.presence else v3.Enums.UserPresence.None, 
                        dontTruncateTitle = true, 
                        onActivated = v17.onAvatarActivated, 
                        isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v17.isRobloxSubscriber else nil
                    })
                }) else v2.createElement(v3.Image, {
                    tag = "size-1200-1200 bg-shift-200", 
                    cornerRadius = UDim.new(0, v19.Radius.Circle), 
                    Image = v17.avatarThumbnail, 
                    LayoutOrder = 1
                }), 
                AvatarTextContainer = v2.createElement(v3.View, {
                    tag = "col auto-xy align-x-center", 
                    LayoutOrder = 2
                }, {
                    DisplayName = if l_FFlagEnableBlackbirdCheckDev_0 and v17.isRobloxSubscriber then v2.createElement(v3.View, {
                        tag = "row auto-xy align-y-center gap-xsmall", 
                        LayoutOrder = 1
                    }, {
                        Name = v2.createElement(v3.Text, {
                            tag = "auto-xy", 
                            LayoutOrder = 1, 
                            Text = v17.displayName, 
                            fontStyle = v19.Typography.TitleMedium, 
                            textStyle = v19.Color.Content.Emphasis
                        }), 
                        Badge = v2.createElement(v3.Icon, {
                            LayoutOrder = 2, 
                            name = v3.Enums.IconName.PaperAirplane, 
                            size = v3.Enums.IconSize.Small, 
                            style = v19.Color.Content.Emphasis
                        })
                    }) else v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 1, 
                        Text = v17.displayName, 
                        fontStyle = v19.Typography.TitleMedium, 
                        textStyle = v19.Color.Content.Emphasis
                    }), 
                    Username = v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 2, 
                        Text = v17.username, 
                        fontStyle = v19.Typography.BodySmall, 
                        textStyle = v19.Color.Content.Muted
                    })
                })
            }), 
            TextContainer = v2.createElement(v3.View, {
                tag = "col align-x-center auto-xy", 
                LayoutOrder = 2, 
                ref = v18
            }, {
                HeadingText = v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 1, 
                    Text = if v17.hasError then v25 else v24, 
                    fontStyle = v19.Typography.TitleLarge, 
                    textStyle = v19.Color.Content.Emphasis
                }), 
                DescriptionText = v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 2, 
                    Text = v22.osaContextCardDescriptionText, 
                    fontStyle = v19.Typography.BodyLarge, 
                    textStyle = v19.Color.Content.Default
                })
            })
        });
    end;
end));