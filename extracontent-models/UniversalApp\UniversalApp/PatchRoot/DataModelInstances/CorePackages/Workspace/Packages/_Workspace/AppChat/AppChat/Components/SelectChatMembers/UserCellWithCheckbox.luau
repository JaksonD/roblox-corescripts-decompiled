local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.SignalsReact);
local l_Text_0 = require(l_Parent_0.AppCommonLib).Text;
local l_IXPService_0 = game:GetService("IXPService");
local l_useSignalState_0 = v4.useSignalState;
local v8 = require(l_script_FirstAncestor_0.Stores.GetSelectedUsersStore);
local v9 = require(l_script_FirstAncestor_0.Hooks.useUserData);
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local v11 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatEnableAvatarPresence);
local v12 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatAvatarPresenceIxpEnabled);
local v13 = require(l_script_FirstAncestor_0.Flags.FStringAppChatAvatarPresenceIxpLayer);
local l_FFlagEnableBlackbirdCheckDev_0 = require(l_Parent_0.SharedFlags).FFlagEnableBlackbirdCheckDev;
local l_useIsRobloxSubscriber_0 = require(l_Parent_0.UserProfiles).Hooks.useIsRobloxSubscriber;
local function v16() --[[ Line: 33 ]] --[[ Name: noOp ]]

end;
local v17 = string.rep("W", 20);
return v2.memo(function(v18) --[[ Line: 39 ]]
    -- upvalues: v9 (copy), v3 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v8 (copy), l_useSignalState_0 (copy), v2 (copy), l_Text_0 (copy), v17 (copy), v12 (copy), l_IXPService_0 (copy), v13 (copy), v11 (copy), v16 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v19 = v9(v18.userId);
    local v20 = v3.Hooks.useTokens();
    local v21 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 then v18.userId else nil);
    local v22 = v8(false);
    local v23 = l_useSignalState_0(v22.getIsUserSelected(v18.userId));
    local v24 = v2.useCallback(function() --[[ Line: 48 ]]
        -- upvalues: v22 (copy), v18 (copy)
        v22.toggleUserId(v18.userId);
    end, {
        v18.userId
    });
    local v26 = v2.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: l_Text_0 (ref), v17 (ref), v20 (copy)
        local v25 = l_Text_0.GetTextBounds(v17, v20.Typography.TitleLarge.Font, v20.Typography.TitleLarge.FontSize, Vector2.zero);
        return UDim2.fromOffset(v25.X, v25.Y);
    end, {
        v20.Typography.TitleLarge.Font, 
        v20.Typography.TitleLarge.FontSize
    });
    local v28 = v2.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: l_Text_0 (ref), v20 (copy)
        local v27 = l_Text_0.GetTextBounds("Roblox Studio", v20.Typography.CaptionMedium.Font, v20.Typography.CaptionMedium.FontSize, Vector2.zero);
        return UDim2.fromOffset(v27.X, v27.Y);
    end, {
        v20.Typography.CaptionMedium.Font, 
        v20.Typography.CaptionMedium.FontSize
    });
    v2.useEffect(function() --[[ Line: 72 ]]
        -- upvalues: v12 (ref), l_IXPService_0 (ref), v13 (ref)
        if v12 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v13);
        end;
    end, {});
    return v2.createElement(v3.View, {
        tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center", 
        onActivated = v24
    }, {
        Avatar = v2.createElement(v3.Avatar, {
            userId = v19.id, 
            userPresence = if v11 then v19.presence else nil, 
            size = v3.Enums.InputSize.Medium, 
            backgroundStyle = v20.Color.Shift.Shift_300, 
            LayoutOrder = 1
        }), 
        UserInfo = v2.createElement(v3.View, {
            tag = "col fill auto-y clip", 
            LayoutOrder = 2
        }, {
            UserDataSkeleton = v2.createElement(v3.Skeleton, {
                Size = UDim2.new(v26.X, v26.Y + v28.Y), 
                Visible = v19.isLoading, 
                LayoutOrder = 1
            }), 
            DisplayNameRow = if l_FFlagEnableBlackbirdCheckDev_0 then v2.createElement(v3.View, {
                tag = "row auto-xy align-y-center gap-xsmall", 
                LayoutOrder = 1, 
                Visible = v19.isLoading:map(function(v29) --[[ Line: 103 ]]
                    return not v29;
                end)
            }, {
                DisplayName = v2.createElement(v3.Text, {
                    tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                    Text = v19.combinedName, 
                    LayoutOrder = 1
                }), 
                SubscriptionBadge = if v21 then v2.createElement(v3.Icon, {
                    LayoutOrder = 2, 
                    name = v3.Enums.IconName.PaperAirplane, 
                    size = v3.Enums.IconSize.Small, 
                    style = v20.Color.Content.Emphasis
                }) else nil
            }) else nil, 
            DisplayName = if not l_FFlagEnableBlackbirdCheckDev_0 then v2.createElement(v3.Text, {
                tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                Text = v19.combinedName, 
                LayoutOrder = 1, 
                Visible = v19.isLoading:map(function(v30) --[[ Line: 127 ]]
                    return not v30;
                end)
            }) else nil, 
            PresenceText = v2.createElement(v3.Text, {
                tag = "auto-xy text-caption-medium text-truncate-end content-muted", 
                Text = v19.presenceText, 
                LayoutOrder = 3, 
                Visible = v19.isLoading:map(function(v31) --[[ Line: 136 ]]
                    return not v31;
                end)
            })
        }), 
        CheckboxContainer = v2.createElement(v3.View, {
            tag = "auto-xy padding-x-medium", 
            onActivated = v16, 
            isDisabled = true, 
            LayoutOrder = 3, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = false
            } else nil
        }, {
            checkbox = v2.createElement(v3.Checkbox, {
                label = "", 
                isChecked = v23, 
                size = v3.Enums.InputSize.XSmall, 
                onActivated = v16, 
                Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
            })
        })
    });
end);