local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Foundation);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.SocialCards);
local v7 = require(script.Parent.ChatMessageContainerConstants);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v9 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local l_Cards_0 = v6.Cards;
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local l_UserPresence_0 = require(l_Parent_0.Foundation).Enums.UserPresence;
local l_useTokens_0 = v3.Hooks.useTokens;
local v16 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local v17 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v18 = require(l_script_FirstAncestor_0.Models.Conversation);
local l_FFlagAppChatEnableConversationUserTileAvatars_0 = require(l_Parent_0.SharedFlags).FFlagAppChatEnableConversationUserTileAvatars;
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableNewChatBubbleUI);
local v21 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageAuthorPresence);
local v22 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v23 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
return function(v24) --[[ Line: 41 ]] --[[ Name: CardContainer ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useTokens_0 (copy), v9 (copy), l_useChatPlacementContext_0 (copy), v16 (copy), v17 (copy), v18 (copy), v5 (copy), v22 (copy), l_IXPService_0 (copy), v23 (copy), l_FFlagAppChatEnableConversationUserTileAvatars_0 (copy), v7 (copy), v20 (copy), v3 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v21 (copy), l_UserPresence_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Cards_0 (copy)
    local v25 = l_useLocalUserId_0();
    local v26 = tostring(v25) == v24.senderTargetId;
    local v27 = l_useTokens_0();
    local v28 = v9();
    local v29 = l_useChatPlacementContext_0();
    local v30 = v16(v24.senderTargetId or "");
    local v31 = v17(v24.conversationId or "");
    local v32 = v31 and v31.conversationType == v18.Type.MULTI_USER_CONVERSATION;
    v5.useEffect(function() --[[ Line: 52 ]]
        -- upvalues: v22 (ref), l_IXPService_0 (ref), v23 (ref)
        if v22 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v23);
        end;
    end, {});
    local v33 = v5.useMemo(function() --[[ Line: 58 ]]
        -- upvalues: v27 (copy)
        return Vector2.new(v27.Size.Size_700, v27.Size.Size_700);
    end, {
        v27
    });
    local v34 = if l_FFlagAppChatEnableConversationUserTileAvatars_0 then v27.Size.Size_200 else v7.TAIL_WIDTH;
    if not v20 then
        v34 = v34 + v7.AVATAR_MESSAGE_GAP;
    end;
    local v35 = nil;
    v35 = if not v24.senderTargetId then Enum.HorizontalAlignment.Center else if v26 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left;
    return v5.createElement(v3.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v35, 
            Padding = UDim.new(0, v34), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }, 
        padding = {
            bottom = if l_FFlagAppChatEnableConversationUserTileAvatars_0 then nil else UDim.new(0, v27.Padding.XXSmall), 
            left = UDim.new(0, v28.left), 
            right = UDim.new(0, v28.right), 
            top = if l_FFlagAppChatEnableConversationUserTileAvatars_0 then UDim.new(0, v27.Padding.XSmall) else UDim.new(0, v27.Padding.XXSmall)
        }
    }, {
        Avatar = if l_FFlagAppChatEnableConversationUserTileAvatars_0 and v24.senderTargetId and v24.senderTargetId ~= v25 then v5.createElement(v3.View, {
            Size = UDim2.new(0, v33.X, 0, v33.Y), 
            LayoutOrder = v26 and 2 or 1
        }, {
            v5.createElement(l_UserTile_0, {
                userId = v24.senderTargetId, 
                layoutMode = l_LayoutMode_0.compact, 
                userPresenceType = if v21 and v32 then v30.presence else l_UserPresence_0.None
            })
        }) else if not l_FFlagAppChatEnableConversationUserTileAvatars_0 and v24.senderTargetId and v24.senderTargetId ~= v25 then v5.createElement(v3.Image, {
            Size = UDim2.fromOffset(v33.X, v33.Y), 
            backgroundStyle = v27.Color.Shift.Shift_200, 
            cornerRadius = UDim.new(0, v27.Radius.Circle), 
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v24.senderTargetId), 
            LayoutOrder = v26 and 2 or 1
        }) else nil, 
        Cards = if v24.cards then v5.createElement(v3.View, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, if v24.senderTargetId then -(v33.X + v34) else 0, 0, 0), 
            LayoutOrder = v26 and 1 or 2
        }, v5.createElement(l_Cards_0, {
            analyticsInfo = {
                moduleLocation = v29.chatPlacement
            }, 
            anchorPoint = if v26 then Vector2.new(1, 0) else Vector2.new(0, 0), 
            position = if v26 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0), 
            cards = v24.cards
        })) else nil
    });
end;