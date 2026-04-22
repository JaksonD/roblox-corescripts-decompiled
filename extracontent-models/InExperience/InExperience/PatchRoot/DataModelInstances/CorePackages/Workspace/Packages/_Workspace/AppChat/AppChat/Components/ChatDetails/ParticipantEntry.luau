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
local l_FFlagAppChatShowInvitedStatusInParticipantList_0 = require(l_script_FirstAncestor_0.Flags).FFlagAppChatShowInvitedStatusInParticipantList;
local l_FFlagEnableBlackbirdCheck_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheck;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local v16 = string.rep("W", 20);
local v17 = {
    showDivider = true
};
return v3.memo(function(v18) --[[ Line: 40 ]] --[[ Name: ParticipantEntry ]]
    -- upvalues: v2 (copy), v17 (copy), v7 (copy), l_useTokens_0 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableBlackbirdCheck_0 (copy), v3 (copy), l_Text_0 (copy), v16 (copy), v11 (copy), l_IXPService_0 (copy), v12 (copy), v4 (copy), v10 (copy), l_FFlagAppChatShowInvitedStatusInParticipantList_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v19 = v2.Dictionary.union(v17, v18);
    local v20 = v7(v19.userId);
    local v21 = l_useTokens_0();
    local v22 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheck_0 then v19.userId else nil);
    local v23 = v3.useCallback(function() --[[ Line: 47 ]]
        -- upvalues: v19 (copy)
        if v19.onActivated then
            v19.onActivated();
        end;
    end);
    local v25 = v3.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: l_Text_0 (ref), v16 (ref), v21 (copy)
        local v24 = l_Text_0.GetTextBounds(v16, v21.Typography.TitleLarge.Font, v21.Typography.TitleLarge.FontSize, Vector2.zero);
        return UDim2.fromOffset(v24.X, v24.Y);
    end, {
        v21.Typography.TitleLarge.Font, 
        v21.Typography.TitleLarge.FontSize
    });
    local v27 = v3.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: l_Text_0 (ref), v21 (copy)
        local v26 = l_Text_0.GetTextBounds("Roblox Studio", v21.Typography.CaptionMedium.Font, v21.Typography.CaptionMedium.FontSize, Vector2.zero);
        return UDim2.fromOffset(v26.X, v26.Y);
    end, {
        v21.Typography.CaptionMedium.Font, 
        v21.Typography.CaptionMedium.FontSize
    });
    v3.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v11 (ref), l_IXPService_0 (ref), v12 (ref)
        if v11 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v12);
        end;
    end, {});
    return v3.createElement(v4.View, {
        Name = "ParticipantEntryContainer", 
        tag = {
            ["row align-y-center gap-medium size-full padding-x-medium"] = true, 
            ["stroke-muted stroke-thin"] = v19.showDivider
        }, 
        onActivated = v23
    }, {
        Avatar = v3.createElement(v4.Avatar, {
            userId = v20.id, 
            userPresence = if v10 then v20.presence else nil, 
            size = v4.Enums.InputSize.Medium, 
            backgroundStyle = v21.Color.Shift.Shift_300, 
            LayoutOrder = 1
        }), 
        UserInfo = v3.createElement(v4.View, {
            tag = "col fill auto-y clip", 
            LayoutOrder = 2
        }, {
            UserDataSkeleton = v3.createElement(v4.Skeleton, {
                Size = UDim2.new(v25.X, v25.Y + v27.Y), 
                Visible = v20.isLoading, 
                LayoutOrder = 1
            }), 
            DisplayName = if l_FFlagEnableBlackbirdCheck_0 and v22 then v3.createElement(v4.View, {
                tag = "row auto-xy align-y-center gap-xxsmall", 
                LayoutOrder = 1, 
                Visible = v20.isLoading:map(function(v28) --[[ Line: 108 ]]
                    return not v28;
                end)
            }, {
                NameText = v3.createElement(v4.Text, {
                    tag = "auto-xy shrink text-title-large text-truncate-end content-emphasis", 
                    Text = v20.combinedName, 
                    LayoutOrder = 1
                }), 
                SubscriptionBadge = v3.createElement(v4.Icon, {
                    LayoutOrder = 2, 
                    name = v4.Enums.IconName.RobloxPlus, 
                    size = v4.Enums.IconSize.Small, 
                    style = v21.Color.Content.Emphasis
                })
            }) else v3.createElement(v4.Text, {
                tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                Text = v20.combinedName, 
                LayoutOrder = 1, 
                Visible = v20.isLoading:map(function(v29) --[[ Line: 128 ]]
                    return not v29;
                end)
            }), 
            PresenceText = v3.createElement(v4.Text, {
                tag = "auto-xy text-caption-medium text-truncate-end content-muted", 
                Text = if l_FFlagAppChatShowInvitedStatusInParticipantList_0 and v19.statusText then v20.presenceText:map(function(v30) --[[ Line: 136 ]]
                    -- upvalues: v19 (copy)
                    return v30 .. " . " .. v19.statusText;
                end) else v20.presenceText, 
                LayoutOrder = 3, 
                Visible = v20.isLoading:map(function(v31) --[[ Line: 141 ]]
                    return not v31;
                end)
            })
        }), 
        ChildrenContainer = if v19.children then v3.createElement(v4.View, {
            tag = "auto-y row align-x-right align-y-center", 
            LayoutOrder = 3, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = false
            } else nil, 
            stateLayer = {
                affordance = v4.Enums.StateLayerAffordance.None
            }, 
            onActivated = v23
        }, v19.children) else nil
    });
end);