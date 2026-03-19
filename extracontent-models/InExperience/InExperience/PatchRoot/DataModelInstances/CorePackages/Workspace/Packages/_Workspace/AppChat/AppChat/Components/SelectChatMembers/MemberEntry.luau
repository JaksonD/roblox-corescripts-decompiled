local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local l_IXPService_0 = game:GetService("IXPService");
local v7 = require(l_script_FirstAncestor_0.Stores.GetSelectedUsersStore);
local v8 = require(l_script_FirstAncestor_0.Hooks.useUserData);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAvatarPresence);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v11 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
return v2.memo(function(v12) --[[ Line: 28 ]] --[[ Name: MemberEntry ]]
    -- upvalues: l_useTokens_0 (copy), v7 (copy), l_useSignalState_0 (copy), v8 (copy), v2 (copy), v10 (copy), l_IXPService_0 (copy), v11 (copy), v3 (copy), v9 (copy)
    local v13 = l_useTokens_0();
    local v14 = v7(false);
    local v15 = l_useSignalState_0(v14.getSelectedUserIdAtIndex(v12.index));
    local v16 = v8(v15 or "");
    local v17 = v2.useCallback(function() --[[ Line: 35 ]]
        -- upvalues: v15 (copy), v14 (copy)
        if v15 then
            v14.removeUserId(v15);
        end;
    end, {
        v15
    });
    v2.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: v10 (ref), l_IXPService_0 (ref), v11 (ref)
        if v10 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v11);
        end;
    end, {});
    return v2.createElement(v3.View, {
        tag = "auto-xy", 
        onActivated = if v15 then v17 else nil, 
        stateLayer = {
            affordance = v3.Enums.StateLayerAffordance.None
        }, 
        LayoutOrder = v12.index
    }, {
        UserContainer = v2.createElement(v3.View, {
            tag = "col size-0-full auto-x flex-x-fill align-x-center gap-xsmall"
        }, {
            Avatar = if v15 then v2.createElement(v3.Avatar, {
                userId = v16.id, 
                userPresence = if v9 then v16.presence else nil, 
                size = v3.Enums.InputSize.Large, 
                backgroundStyle = v13.Color.Shift.Shift_300, 
                LayoutOrder = 1
            }) else v2.createElement(v3.Image, {
                tag = "content-emphasis", 
                Image = "rbxasset://textures/ui/LuaChatV2/ic-friend-empty-border.png", 
                aspectRatio = {
                    AspectRatio = 1, 
                    AspectType = Enum.AspectType.FitWithinMaxSize, 
                    DominantAxis = Enum.DominantAxis.Height
                }, 
                Size = UDim2.fromOffset(v13.Semantic.Icon.Size.Large, v13.Semantic.Icon.Size.Large), 
                LayoutOrder = 1
            }), 
            Label = v2.createElement(v3.Text, {
                tag = "auto-y text-truncate-end text-caption-small", 
                Text = v16.combinedName, 
                textStyle = v13.Color.Content.Default, 
                fontStyle = v13.Typography.CaptionSmall, 
                LayoutOrder = 2
            })
        }), 
        RemoveIcon = if v15 then v2.createElement(v3.View, {
            tag = "auto-xy position-top-right anchor-top-right bg-over-media-0 radius-circle", 
            ZIndex = 2
        }, {
            Icon = v2.createElement(v3.Icon, {
                style = v13.Semantic.Color.Icon.Emphasis, 
                name = v3.Enums.IconName.CircleX, 
                variant = v3.Enums.IconVariant.Filled, 
                size = v3.Enums.IconSize.Small, 
                ZIndex = 2
            })
        }) else nil
    });
end);