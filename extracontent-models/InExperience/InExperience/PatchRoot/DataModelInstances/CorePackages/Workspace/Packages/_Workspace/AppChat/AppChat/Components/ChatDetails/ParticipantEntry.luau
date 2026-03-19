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
local v15 = string.rep("W", 20);
local v16 = {
    showDivider = true
};
return v3.memo(function(v17) --[[ Line: 39 ]] --[[ Name: ParticipantEntry ]]
    -- upvalues: v2 (copy), v16 (copy), v7 (copy), l_useTokens_0 (copy), v3 (copy), l_Text_0 (copy), v15 (copy), v11 (copy), l_IXPService_0 (copy), v12 (copy), v4 (copy), v13 (copy), v10 (copy), l_FFlagAppChatShowInvitedStatusInParticipantList_0 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy)
    local v18 = v2.Dictionary.union(v16, v17);
    local v19 = v7(v18.userId);
    local v20 = l_useTokens_0();
    local v21 = v3.useCallback(function() --[[ Line: 44 ]]
        -- upvalues: v18 (copy)
        if v18.onActivated then
            v18.onActivated();
        end;
    end);
    local v23 = v3.useMemo(function() --[[ Line: 50 ]]
        -- upvalues: l_Text_0 (ref), v15 (ref), v20 (copy)
        local v22 = l_Text_0.GetTextBounds(v15, v20.Typography.TitleLarge.Font, v20.Typography.TitleLarge.FontSize, Vector2.zero);
        return UDim2.fromOffset(v22.X, v22.Y);
    end, {
        v20.Typography.TitleLarge.Font, 
        v20.Typography.TitleLarge.FontSize
    });
    local v25 = v3.useMemo(function() --[[ Line: 60 ]]
        -- upvalues: l_Text_0 (ref), v20 (copy)
        local v24 = l_Text_0.GetTextBounds("Roblox Studio", v20.Typography.CaptionMedium.Font, v20.Typography.CaptionMedium.FontSize, Vector2.zero);
        return UDim2.fromOffset(v24.X, v24.Y);
    end, {
        v20.Typography.CaptionMedium.Font, 
        v20.Typography.CaptionMedium.FontSize
    });
    v3.useEffect(function() --[[ Line: 70 ]]
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
            ["stroke-muted stroke-thin"] = v18.showDivider
        }, 
        onActivated = v21
    }, {
        Avatar = v3.createElement(v4.Avatar, {
            userId = v19.id, 
            userPresence = if v10 then v19.presence else nil, 
            size = v4.Enums.InputSize.Medium, 
            backgroundStyle = v20.Color.Shift.Shift_300, 
            LayoutOrder = 1
        }), 
        UserInfo = v3.createElement(v4.View, {
            tag = "col fill auto-y clip", 
            LayoutOrder = 2
        }, {
            UserDataSkeleton = v3.createElement(v4.Skeleton, {
                Size = UDim2.new(v23.X, v23.Y + v25.Y), 
                Visible = v19.isLoading, 
                LayoutOrder = 1
            }), 
            DisplayName = v3.createElement(v4.Text, {
                tag = "auto-xy text-title-large text-truncate-end content-emphasis", 
                Text = v19.combinedName, 
                LayoutOrder = 1, 
                Visible = v19.isLoading:map(function(v26) --[[ Line: 107 ]]
                    return not v26;
                end)
            }), 
            PresenceText = v3.createElement(v4.Text, {
                tag = "auto-xy text-caption-medium text-truncate-end content-muted", 
                Text = if l_FFlagAppChatShowInvitedStatusInParticipantList_0 and v18.statusText then v19.presenceText:map(function(v27) --[[ Line: 115 ]]
                    -- upvalues: v18 (copy)
                    return v27 .. " . " .. v18.statusText;
                end) else v19.presenceText, 
                LayoutOrder = 3, 
                Visible = v19.isLoading:map(function(v28) --[[ Line: 120 ]]
                    return not v28;
                end)
            })
        }), 
        ChildrenContainer = if v18.children then v3.createElement(v4.View, {
            tag = "auto-y row align-x-right align-y-center", 
            LayoutOrder = 3, 
            selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
                Selectable = false
            } else nil, 
            stateLayer = {
                affordance = v4.Enums.StateLayerAffordance.None
            }, 
            onActivated = v21
        }, v18.children) else nil
    });
end);