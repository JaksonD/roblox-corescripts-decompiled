local l_IXPService_0 = game:GetService("IXPService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.SocialCards);
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v7 = require(l_script_FirstAncestor_0.Contexts.ChatPagePadding.useChatPagePadding);
local l_useChatPlacementContext_0 = require(l_script_FirstAncestor_0.Contexts.ChatPlacementContext).useChatPlacementContext;
local l_Cards_0 = v5.Cards;
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local l_UserPresence_0 = require(l_Parent_0.Foundation).Enums.UserPresence;
local l_useTokens_0 = v3.Hooks.useTokens;
local v14 = require(l_script_FirstAncestor_0.Hooks.useFoundationPresence);
local v15 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v16 = require(l_script_FirstAncestor_0.Models.Conversation);
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableMessageAuthorPresence);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v19 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
return function(v20) --[[ Line: 36 ]] --[[ Name: CardContainer ]]
    -- upvalues: l_useLocalUserId_0 (copy), l_useTokens_0 (copy), v7 (copy), l_useChatPlacementContext_0 (copy), v14 (copy), v15 (copy), v16 (copy), v4 (copy), v18 (copy), l_IXPService_0 (copy), v19 (copy), v3 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), v17 (copy), l_UserPresence_0 (copy), l_Cards_0 (copy)
    local v21 = l_useLocalUserId_0();
    local v22 = tostring(v21) == v20.senderTargetId;
    local v23 = l_useTokens_0();
    local v24 = v7();
    local v25 = l_useChatPlacementContext_0();
    local v26 = v14(v20.senderTargetId or "");
    local v27 = v15(v20.conversationId or "");
    local v28 = v27 and v27.conversationType == v16.Type.MULTI_USER_CONVERSATION;
    v4.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v18 (ref), l_IXPService_0 (ref), v19 (ref)
        if v18 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v19);
        end;
    end, {});
    local v29 = v4.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v23 (copy)
        return Vector2.new(v23.Size.Size_700, v23.Size.Size_700);
    end, {
        v23
    });
    local l_Size_200_0 = v23.Size.Size_200;
    local v31 = nil;
    v31 = if not v20.senderTargetId then Enum.HorizontalAlignment.Center else if v22 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left;
    return v4.createElement(v3.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        testId = v20.testId, 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = v31, 
            Padding = UDim.new(0, l_Size_200_0), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom
        }, 
        padding = {
            left = UDim.new(0, v24.left), 
            right = UDim.new(0, v24.right), 
            top = UDim.new(0, v23.Padding.XSmall)
        }
    }, {
        Avatar = if v20.senderTargetId and v20.senderTargetId ~= v21 then v4.createElement(v3.View, {
            Size = UDim2.new(0, v29.X, 0, v29.Y), 
            LayoutOrder = v22 and 2 or 1
        }, {
            v4.createElement(l_UserTile_0, {
                userId = v20.senderTargetId, 
                layoutMode = l_LayoutMode_0.compact, 
                userPresenceType = if v17 and v28 then v26.presence else l_UserPresence_0.None
            })
        }) else nil, 
        Cards = if v20.cards then v4.createElement(v3.View, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, if v20.senderTargetId then -(v29.X + l_Size_200_0) else 0, 0, 0), 
            LayoutOrder = v22 and 1 or 2
        }, v4.createElement(l_Cards_0, {
            analyticsInfo = {
                moduleLocation = v25.chatPlacement
            }, 
            anchorPoint = if v22 then Vector2.new(1, 0) else Vector2.new(0, 0), 
            position = if v22 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0), 
            cards = v20.cards
        })) else nil
    });
end;