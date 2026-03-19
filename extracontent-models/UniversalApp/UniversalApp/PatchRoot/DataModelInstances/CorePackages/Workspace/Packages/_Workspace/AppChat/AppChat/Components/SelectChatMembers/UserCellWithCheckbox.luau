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
local function v14() --[[ Line: 30 ]] --[[ Name: noOp ]]

end;
local v15 = string.rep("W", 20);
return v2.memo(function(v16) --[[ Line: 36 ]]
    -- upvalues: v9 (copy), v3 (copy), v8 (copy), l_useSignalState_0 (copy), v2 (copy), l_Text_0 (copy), v15 (copy), v12 (copy), l_IXPService_0 (copy), v13 (copy), v11 (copy), v14 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v17 = v9(v16.userId);
    local v18 = v3.Hooks.useTokens();
    local v19 = v8(false);
    local v20 = l_useSignalState_0(v19.getIsUserSelected(v16.userId));
    local v21 = v2.useCallback(function() --[[ Line: 43 ]]
        -- upvalues: v19 (copy), v16 (copy)
        v19.toggleUserId(v16.userId);
    end, {
        v16.userId
    });
    local v23 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: l_Text_0 (ref), v15 (ref), v18 (copy)
        local v22 = l_Text_0.GetTextBounds(v15, v18.Typography.TitleLarge.Font, v18.Typography.TitleLarge.FontSize, Vector2.zero);
        return UDim2.fromOffset(v22.X, v22.Y);
    end, {
        v18.Typography.TitleLarge.Font, 
        v18.Typography.TitleLarge.FontSize
    });
    local v25 = v2.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: l_Text_0 (ref), v18 (copy)
        local v24 = l_Text_0.GetTextBounds("Roblox Studio", v18.Typography.CaptionMedium.Font, v18.Typography.CaptionMedium.FontSize, Vector2.zero);
        return UDim2.fromOffset(v24.X, v24.Y);
    end, {
        v18.Typography.CaptionMedium.Font, 
        v18.Typography.CaptionMedium.FontSize
    });
    v2.useEffect(function() --[[ Line: 67 ]]
        -- upvalues: v12 (ref), l_IXPService_0 (ref), v13 (ref)
        if v12 then
            l_IXPService_0:LogFlagLinkedUserLayerExposure(v13);
        end;
    end, {});
    return v2.createElement(v3.View, {
        tag = "row size-full-0 auto-y stroke-muted stroke-thin gap-medium padding-x-medium padding-y-small align-y-center", 
        onActivated = v21
    }, {
        Avatar = v2.createElement(v3.Avatar, {
            userId = v17.id, 
            userPresence = if v11 then v17.presence else nil, 
            size = v3.Enums.InputSize.Medium, 
            backgroundStyle = v18.Color.Shift.Shift_300, 
            LayoutOrder = 1
        }), 
        UserInfo = v2.createElement(v3.View, {
            tag = "col fill auto-y clip", 
            LayoutOrder = 2
        }, {
            UserDataSkeleton = v2.createElement(v3.Skeleton, {
                Size = UDim2.new(v23.X, v23.Y + v25.Y), 
                Visible = v17.isLoading, 
                LayoutOrder = 1
            }), 
            DisplayName = v2.createElement(v3.Text, {
                tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                Text = v17.combinedName, 
                LayoutOrder = 1, 
                Visible = v17.isLoading:map(function(v26) --[[ Line: 98 ]]
                    return not v26;
                end)
            }), 
            PresenceText = v2.createElement(v3.Text, {
                tag = "auto-xy text-caption-medium text-truncate-end content-muted", 
                Text = v17.presenceText, 
                LayoutOrder = 3, 
                Visible = v17.isLoading:map(function(v27) --[[ Line: 106 ]]
                    return not v27;
                end)
            })
        }), 
        CheckboxContainer = v2.createElement(v3.View, {
            tag = "auto-xy padding-x-medium", 
            onActivated = v14, 
            isDisabled = true, 
            LayoutOrder = 3, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = false
            } else nil
        }, {
            checkbox = v2.createElement(v3.Checkbox, {
                label = "", 
                isChecked = v20, 
                size = v3.Enums.InputSize.XSmall, 
                onActivated = v14, 
                Selectable = not l_FFlagEnableAppChatFocusableFixes_0 and nil
            })
        })
    });
end);