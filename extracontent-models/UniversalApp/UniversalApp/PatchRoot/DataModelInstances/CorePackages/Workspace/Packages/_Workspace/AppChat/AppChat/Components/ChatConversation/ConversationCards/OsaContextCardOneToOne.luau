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
return v2.memo(v2.forwardRef(function(v16, v17) --[[ Line: 36 ]]
    -- upvalues: l_useTokens_0 (copy), v10 (copy), l_useLocalization_0 (copy), v2 (copy), v14 (copy), l_IXPService_0 (copy), v15 (copy), v11 (copy), v3 (copy), l_Skeleton_0 (copy), v12 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v13 (copy)
    local v18 = l_useTokens_0();
    local l_Size_0 = v18.Size;
    local v20 = v10(v16.userId);
    local v21 = l_useLocalization_0({
        firstConversationWithThisUserHeadingText = "Feature.Chat.Heading.FirstConversationWithThisUser", 
        firstConversationWithHeadingText = {
            "Feature.Chat.Heading.FirstConversationWith"; 
            displayName = v16.displayName
        }, 
        firstInteractionWithThisPersonHeadingText = "Feature.Chat.Heading.FirstInteractionWithThisPerson", 
        firstInteractionWithHeadingText = {
            "Feature.Chat.Heading.FirstInteractionWith"; 
            displayName = v16.displayName
        }, 
        osaContextCardDescriptionText = "Feature.Chat.Description.OSAContextCardDescription", 
        user = "Feature.Chat.Label.User"
    });
    local l_isChatUserMessagesEnabled_0 = v16.isChatUserMessagesEnabled;
    local v23 = if l_isChatUserMessagesEnabled_0 then v21.firstConversationWithHeadingText else v21.firstInteractionWithHeadingText;
    local v24 = if l_isChatUserMessagesEnabled_0 then v21.firstConversationWithThisUserHeadingText else v21.firstInteractionWithThisPersonHeadingText;
    v2.useEffect(function() --[[ Line: 65 ]]
        -- upvalues: v14 (ref), l_IXPService_0 (ref), v15 (ref)
        if v14 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v15);
        end;
    end, {});
    if v11 then
        local v25 = not v16.displayName and not v16.hasError;
        local v26 = not v16.username and not v16.hasError;
        local v27 = not v16.avatarThumbnail and not v16.hasError;
        local v28 = not v25 and not v26 and not v27;
        return v2.createElement(v3.View, {
            tag = "col align-x-center size-full-0 auto-y padding-xxlarge radius-large bg-shift-100 gap-xlarge", 
            sizeConstraint = {
                MaxSize = Vector2.new(700, 500)
            }
        }, {
            AvatarContainer = v2.createElement(v3.View, {
                tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small", 
                LayoutOrder = 1, 
                onActivated = if v28 then v16.onAvatarActivated else nil
            }, {
                AvatarCircle = if v27 then v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, l_Size_0.Size_1200, 0, l_Size_0.Size_1200), 
                    radius = v3.Enums.Radius.Circle, 
                    LayoutOrder = 1
                }) else if v12 then v2.createElement(v3.View, {
                    tag = "size-1200-1200", 
                    LayoutOrder = 1
                }, {
                    v2.createElement(l_UserTile_0, {
                        userId = tostring(v16.userId), 
                        layoutMode = l_LayoutMode_0.compact, 
                        userPresenceType = if v13 then v20.presence else v3.Enums.UserPresence.None, 
                        dontTruncateTitle = true, 
                        onActivated = v16.onAvatarActivated
                    })
                }) else v2.createElement(v3.Image, {
                    tag = "size-1200-1200 bg-shift-200", 
                    cornerRadius = UDim.new(0, v18.Radius.Circle), 
                    Image = v16.avatarThumbnail, 
                    LayoutOrder = 1
                }), 
                AvatarTextContainer = v2.createElement(v3.View, {
                    tag = "col auto-xy align-x-center gap-xxsmall", 
                    LayoutOrder = 2
                }, {
                    DisplayName = if v25 then v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0, l_Size_0.Size_2500, 0, v18.Typography.TitleMedium.FontSize), 
                        radius = v3.Enums.Radius.Large, 
                        LayoutOrder = 1
                    }) else v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 1, 
                        Text = if v16.hasError then v21.user else v16.displayName, 
                        fontStyle = v18.Typography.TitleMedium, 
                        textStyle = v18.Color.Content.Emphasis
                    }), 
                    Username = if v26 then v2.createElement(l_Skeleton_0, {
                        Size = UDim2.new(0, l_Size_0.Size_2000, 0, v18.Typography.BodySmall.FontSize), 
                        radius = v3.Enums.Radius.Large, 
                        LayoutOrder = 2
                    }) else v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 2, 
                        Text = if v16.hasError then v21.user else v16.username, 
                        fontStyle = v18.Typography.BodySmall, 
                        textStyle = v18.Color.Content.Muted
                    })
                })
            }), 
            TextContainer = v2.createElement(v3.View, {
                tag = "col align-x-center auto-xy", 
                LayoutOrder = 2, 
                ref = v17
            }, {
                HeadingText = if v25 then v2.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0, l_Size_0.Size_3000, 0, v18.Typography.TitleLarge.FontSize + v18.Gap.XXSmall), 
                    radius = v3.Enums.Radius.Large, 
                    LayoutOrder = 1
                }) else v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 1, 
                    Text = if v16.hasError then v24 else v23, 
                    fontStyle = v18.Typography.TitleLarge, 
                    textStyle = v18.Color.Content.Emphasis
                }), 
                DescriptionText = v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 2, 
                    Text = v21.osaContextCardDescriptionText, 
                    fontStyle = v18.Typography.BodyLarge, 
                    textStyle = v18.Color.Content.Default
                })
            })
        });
    elseif (not (v16.displayName and v16.username) or not v16.avatarThumbnail) and not v16.hasError then
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
            AvatarContainer = if v16.hasError then nil else v2.createElement(v3.View, {
                tag = "col auto-xy bg-action-subtle align-x-center gap-medium radius-large padding-small", 
                LayoutOrder = 1, 
                onActivated = v16.onAvatarActivated
            }, {
                AvatarCircle = if v12 then v2.createElement(v3.View, {
                    tag = "size-1200-1200", 
                    LayoutOrder = 1
                }, {
                    v2.createElement(l_UserTile_0, {
                        userId = tostring(v16.userId), 
                        layoutMode = l_LayoutMode_0.compact, 
                        userPresenceType = if v13 then v20.presence else v3.Enums.UserPresence.None, 
                        dontTruncateTitle = true, 
                        onActivated = v16.onAvatarActivated
                    })
                }) else v2.createElement(v3.Image, {
                    tag = "size-1200-1200 bg-shift-200", 
                    cornerRadius = UDim.new(0, v18.Radius.Circle), 
                    Image = v16.avatarThumbnail, 
                    LayoutOrder = 1
                }), 
                AvatarTextContainer = v2.createElement(v3.View, {
                    tag = "col auto-xy align-x-center", 
                    LayoutOrder = 2
                }, {
                    DisplayName = v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 1, 
                        Text = v16.displayName, 
                        fontStyle = v18.Typography.TitleMedium, 
                        textStyle = v18.Color.Content.Emphasis
                    }), 
                    Username = v2.createElement(v3.Text, {
                        tag = "auto-xy", 
                        LayoutOrder = 2, 
                        Text = v16.username, 
                        fontStyle = v18.Typography.BodySmall, 
                        textStyle = v18.Color.Content.Muted
                    })
                })
            }), 
            TextContainer = v2.createElement(v3.View, {
                tag = "col align-x-center auto-xy", 
                LayoutOrder = 2, 
                ref = v17
            }, {
                HeadingText = v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 1, 
                    Text = if v16.hasError then v24 else v23, 
                    fontStyle = v18.Typography.TitleLarge, 
                    textStyle = v18.Color.Content.Emphasis
                }), 
                DescriptionText = v2.createElement(v3.Text, {
                    tag = "auto-xy text-wrap", 
                    LayoutOrder = 2, 
                    Text = v21.osaContextCardDescriptionText, 
                    fontStyle = v18.Typography.BodyLarge, 
                    textStyle = v18.Color.Content.Default
                })
            })
        });
    end;
end));