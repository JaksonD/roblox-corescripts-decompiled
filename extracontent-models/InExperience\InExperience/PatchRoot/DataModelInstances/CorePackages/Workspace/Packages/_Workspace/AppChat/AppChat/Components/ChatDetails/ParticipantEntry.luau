local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Foundation);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_IXPService_0 = game:GetService("IXPService");
local v7 = require(l_script_FirstAncestor_0.Hooks.useUserData);
local l_useTokens_0 = v4.Hooks.useTokens;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAvatarPresence);
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v12 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local v13 = game:DefineFastFlag("AppChatFixParticipantListDivider", false);
local l_FFlagAppChatShowInvitedStatusInParticipantList_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatShowInvitedStatusInParticipantList;
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local v17 = string.rep("W", 20);
local v18 = {
    showDivider = true
};
return v3.memo(function(v19) --[[ Line: 41 ]] --[[ Name: ParticipantEntry ]]
    -- upvalues: v2 (copy), v18 (copy), v7 (copy), l_useTokens_0 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v3 (copy), l_Text_0 (copy), v17 (copy), v11 (copy), l_IXPService_0 (copy), v12 (copy), v4 (copy), v13 (copy), v10 (copy), l_FFlagAppChatShowInvitedStatusInParticipantList_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v20 = v2.Dictionary.union(v18, v19);
    local v21 = v7(v20.userId);
    local v22 = l_useTokens_0();
    local v23 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 then v20.userId else nil);
    local v24 = v3.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v20 (copy)
        if v20.onActivated then
            v20.onActivated();
        end;
    end);
    local v26 = v3.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: l_Text_0 (ref), v17 (ref), v22 (copy)
        local v25 = l_Text_0.GetTextBounds(v17, v22.Typography.TitleLarge.Font, v22.Typography.TitleLarge.FontSize, Vector2.zero);
        return UDim2.fromOffset(v25.X, v25.Y);
    end, {
        v22.Typography.TitleLarge.Font, 
        v22.Typography.TitleLarge.FontSize
    });
    local v28 = v3.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: l_Text_0 (ref), v22 (copy)
        local v27 = l_Text_0.GetTextBounds("Roblox Studio", v22.Typography.CaptionMedium.Font, v22.Typography.CaptionMedium.FontSize, Vector2.zero);
        return UDim2.fromOffset(v27.X, v27.Y);
    end, {
        v22.Typography.CaptionMedium.Font, 
        v22.Typography.CaptionMedium.FontSize
    });
    v3.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v11 (ref), l_IXPService_0 (ref), v12 (ref)
        if v11 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v12);
        end;
    end, {});
    return v3.createElement(v4.View, {
        Name = "ParticipantEntryContainer", 
        tag = {
            ["row gap-medium padding-x-medium align-y-center"] = true, 
            ["size-full"] = v13, 
            ["size-full-0 auto-y padding-y-small"] = not v13, 
            ["stroke-muted stroke-thin"] = v20.showDivider
        }, 
        onActivated = v24
    }, {
        Avatar = v3.createElement(v4.Avatar, {
            userId = v21.id, 
            userPresence = if v10 then v21.presence else nil, 
            size = v4.Enums.InputSize.Medium, 
            backgroundStyle = v22.Color.Shift.Shift_300, 
            LayoutOrder = 1
        }), 
        UserInfo = v3.createElement(v4.View, {
            tag = "col fill auto-y clip", 
            LayoutOrder = 2
        }, {
            UserDataSkeleton = v3.createElement(v4.Skeleton, {
                Size = UDim2.new(v26.X, v26.Y + v28.Y), 
                Visible = v21.isLoading, 
                LayoutOrder = 1
            }), 
            DisplayName = if l_FFlagEnableBlackbirdCheckDev_0 and v23 then v3.createElement(v4.View, {
                tag = "row auto-xy align-y-center gap-xxsmall", 
                LayoutOrder = 1, 
                Visible = v21.isLoading:map(function(v29) --[[ Line: 111 ]]
                    return not v29;
                end)
            }, {
                NameText = v3.createElement(v4.Text, {
                    tag = "auto-xy shrink text-title-large text-truncate-end content-emphasis", 
                    Text = v21.combinedName, 
                    LayoutOrder = 1
                }), 
                SubscriptionBadge = v3.createElement(v4.Icon, {
                    LayoutOrder = 2, 
                    name = v4.Enums.IconName.PaperAirplane, 
                    size = v4.Enums.IconSize.Small, 
                    style = v22.Color.Content.Emphasis
                })
            }) else v3.createElement(v4.Text, {
                tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                Text = v21.combinedName, 
                LayoutOrder = 1, 
                Visible = v21.isLoading:map(function(v30) --[[ Line: 132 ]]
                    return not v30;
                end)
            }), 
            PresenceText = v3.createElement(v4.Text, {
                tag = "auto-xy text-caption-medium text-truncate-end content-muted", 
                Text = if l_FFlagAppChatShowInvitedStatusInParticipantList_0 and v20.statusText then v21.presenceText:map(function(v31) --[[ Line: 140 ]]
                    -- upvalues: v20 (copy)
                    return v31 .. " . " .. v20.statusText;
                end) else v21.presenceText, 
                LayoutOrder = 3, 
                Visible = v21.isLoading:map(function(v32) --[[ Line: 145 ]]
                    return not v32;
                end)
            })
        }), 
        ChildrenContainer = if v20.children then v3.createElement(v4.View, {
            tag = "auto-y row align-x-right align-y-center", 
            LayoutOrder = 3, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = false
            } else nil, 
            stateLayer = {
                affordance = v4.Enums.StateLayerAffordance.None
            }, 
            onActivated = v24
        }, v20.children) else nil
    });
end);