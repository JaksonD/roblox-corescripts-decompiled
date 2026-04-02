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
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatEnableDomLocators);
local v17 = require(l_script_FirstAncestor_0.Utils.DomLocators);
local function v18() --[[ Line: 35 ]] --[[ Name: noOp ]]

end;
local v19 = string.rep("W", 20);
return v2.memo(function(v20) --[[ Line: 41 ]]
    -- upvalues: v9 (copy), v3 (copy), l_useIsRobloxSubscriber_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v8 (copy), l_useSignalState_0 (copy), v2 (copy), l_Text_0 (copy), v19 (copy), v12 (copy), l_IXPService_0 (copy), v13 (copy), v16 (copy), v17 (copy), v11 (copy), v18 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v21 = v9(v20.userId);
    local v22 = v3.Hooks.useTokens();
    local v23 = l_useIsRobloxSubscriber_0(if l_FFlagEnableBlackbirdCheckDev_0 then v20.userId else nil);
    local v24 = v8(false);
    local v25 = l_useSignalState_0(v24.getIsUserSelected(v20.userId));
    local v26 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v24 (copy), v20 (copy)
        v24.toggleUserId(v20.userId);
    end, {
        v20.userId
    });
    local v28 = v2.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: l_Text_0 (ref), v19 (ref), v22 (copy)
        local v27 = l_Text_0.GetTextBounds(v19, v22.Typography.TitleLarge.Font, v22.Typography.TitleLarge.FontSize, Vector2.zero);
        return UDim2.fromOffset(v27.X, v27.Y);
    end, {
        v22.Typography.TitleLarge.Font, 
        v22.Typography.TitleLarge.FontSize
    });
    local v30 = v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: l_Text_0 (ref), v22 (copy)
        local v29 = l_Text_0.GetTextBounds("Roblox Studio", v22.Typography.CaptionMedium.Font, v22.Typography.CaptionMedium.FontSize, Vector2.zero);
        return UDim2.fromOffset(v29.X, v29.Y);
    end, {
        v22.Typography.CaptionMedium.Font, 
        v22.Typography.CaptionMedium.FontSize
    });
    v2.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v12 (ref), l_IXPService_0 (ref), v13 (ref)
        if v12 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v13);
        end;
    end, {});
    local v31 = nil;
    local v32 = nil;
    if v16 then
        local v33, v34 = v2.useState("");
        v31 = v33;
        v32 = v34;
        v2.__subscribeToBinding(v21.username, function(v35) --[[ Line: 82 ]]
            -- upvalues: v32 (ref)
            v32(v35);
        end);
    end;
    return v2.createElement(v3.View, {
        tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center", 
        onActivated = v26, 
        testId = if v16 then v17.selectChatMembersUserCellWithCheckbox(v31, v25) else nil
    }, {
        Avatar = v2.createElement(v3.Avatar, {
            userId = v21.id, 
            userPresence = if v11 then v21.presence else nil, 
            size = v3.Enums.InputSize.Medium, 
            backgroundStyle = v22.Color.Shift.Shift_300, 
            LayoutOrder = 1
        }), 
        UserInfo = v2.createElement(v3.View, {
            tag = "col fill auto-y clip", 
            LayoutOrder = 2
        }, {
            UserDataSkeleton = v2.createElement(v3.Skeleton, {
                Size = UDim2.new(v28.X, v28.Y + v30.Y), 
                Visible = v21.isLoading, 
                LayoutOrder = 1
            }), 
            DisplayNameRow = if l_FFlagEnableBlackbirdCheckDev_0 then v2.createElement(v3.View, {
                tag = "row auto-xy align-y-center gap-xsmall", 
                LayoutOrder = 1, 
                Visible = v21.isLoading:map(function(v36) --[[ Line: 115 ]]
                    return not v36;
                end)
            }, {
                DisplayName = v2.createElement(v3.Text, {
                    tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                    Text = v21.combinedName, 
                    LayoutOrder = 1
                }), 
                SubscriptionBadge = if v23 then v2.createElement(v3.Icon, {
                    LayoutOrder = 2, 
                    name = v3.Enums.IconName.PaperAirplane, 
                    size = v3.Enums.IconSize.Small, 
                    style = v22.Color.Content.Emphasis
                }) else nil
            }) else nil, 
            DisplayName = if not l_FFlagEnableBlackbirdCheckDev_0 then v2.createElement(v3.Text, {
                tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                Text = v21.combinedName, 
                LayoutOrder = 1, 
                Visible = v21.isLoading:map(function(v37) --[[ Line: 139 ]]
                    return not v37;
                end)
            }) else nil, 
            PresenceText = v2.createElement(v3.Text, {
                tag = "auto-xy text-caption-medium text-truncate-end content-muted", 
                Text = v21.presenceText, 
                LayoutOrder = 3, 
                Visible = v21.isLoading:map(function(v38) --[[ Line: 148 ]]
                    return not v38;
                end)
            })
        }), 
        CheckboxContainer = v2.createElement(v3.View, {
            tag = "auto-xy padding-x-medium", 
            onActivated = v18, 
            isDisabled = true, 
            LayoutOrder = 3, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = false
            } else nil
        }, {
            checkbox = v2.createElement(v3.Checkbox, {
                label = "", 
                isChecked = v25, 
                size = v3.Enums.InputSize.XSmall, 
                onActivated = v18, 
                Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
            })
        })
    });
end);