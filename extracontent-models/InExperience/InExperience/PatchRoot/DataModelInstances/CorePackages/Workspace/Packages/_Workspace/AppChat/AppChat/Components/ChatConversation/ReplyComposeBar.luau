local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Foundation);
local v5 = require(l_Parent_0.BuilderIcons);
local v6 = require(script.Parent.ReplyComposeBarText);
local v7 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local l_IXPService_0 = game:GetService("IXPService");
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatReplyComposeBarContainer);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAvatarPresence);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v12 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local v13 = {
    LayoutOrder = 3, 
    totalHeight = 0, 
    replyingToUserText = nil, 
    replyingToUserContent = nil, 
    replyingToUserId = nil, 
    onCloseActivated = function() --[[ Line: 39 ]] --[[ Name: onCloseActivated ]]

    end
};
ReplyComposeBar = function(v14) --[[ Line: 42 ]] --[[ Name: ReplyComposeBar ]]
    -- upvalues: v3 (copy), v13 (copy), v4 (copy), v7 (copy), v2 (copy), v11 (copy), l_IXPService_0 (copy), v12 (copy), v9 (copy), v10 (copy), v6 (copy), v5 (copy)
    local v15 = v3.Dictionary.union(v13, v14);
    local v16 = v4.Hooks.useTokens();
    local v17 = v7(v15.replyingToUserId);
    v2.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: v11 (ref), l_IXPService_0 (ref), v12 (ref)
        if v11 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v12);
        end;
    end, {});
    if v9 then
        return (v2.createElement(v4.View, {
            tag = "row size-full-0 auto-y align-y-center gap-medium", 
            LayoutOrder = v15.LayoutOrder
        }, {
            Avatar = v15.replyingToUserId and v2.createElement(v4.Avatar, {
                userId = v15.replyingToUserId, 
                userPresence = if v10 then v17.presence else nil, 
                backgroundStyle = v16.Color.Surface.Surface_200, 
                size = v4.Enums.InputSize.Medium, 
                LayoutOrder = 1
            }) or nil, 
            Text = v2.createElement(v6, {
                layoutOrder = 2, 
                userText = v15.replyingToUserText, 
                contentText = v15.replyingToUserContent
            }), 
            CloseButton = v2.createElement(v4.IconButton, {
                onActivated = v15.onCloseActivated, 
                icon = v5.Icon.X, 
                variant = v4.Enums.ButtonVariant.Utility, 
                size = v4.Enums.InputSize.Medium, 
                isCircular = true, 
                LayoutOrder = 3
            })
        }));
    else
        return (v2.createElement(v4.View, {
            tag = "col", 
            Size = UDim2.new(1, 0, 0, v15.totalHeight), 
            LayoutOrder = v15.LayoutOrder
        }, {
            TopBorder = v2.createElement(v4.View, {
                tag = "size-full-50 bg-surface-100", 
                LayoutOrder = 1
            }), 
            ContentFrame = v2.createElement(v4.View, {
                tag = "row size-full-0 fill align-y-center padding-medium gap-medium", 
                LayoutOrder = 2
            }, {
                Avatar = v15.replyingToUserId and v2.createElement(v4.Avatar, {
                    userId = v15.replyingToUserId, 
                    userPresence = if v10 then v17.presence else nil, 
                    backgroundStyle = v16.Color.Surface.Surface_100, 
                    size = v4.Enums.InputSize.Medium, 
                    LayoutOrder = 1
                }) or nil, 
                Text = v2.createElement(v6, {
                    layoutOrder = 2, 
                    userText = v15.replyingToUserText, 
                    contentText = v15.replyingToUserContent
                }), 
                CloseButton = v2.createElement(v4.IconButton, {
                    onActivated = v15.onCloseActivated, 
                    icon = v5.Icon.X, 
                    variant = v4.Enums.ButtonVariant.Utility, 
                    size = v4.Enums.InputSize.Medium, 
                    isCircular = true, 
                    LayoutOrder = 3
                })
            })
        }));
    end;
end;
return v2.memo(ReplyComposeBar);