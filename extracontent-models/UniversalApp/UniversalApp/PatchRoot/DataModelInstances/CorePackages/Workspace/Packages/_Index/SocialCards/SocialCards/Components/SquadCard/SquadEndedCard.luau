local l_Parent_0 = script:FindFirstAncestor("SocialCards").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Squads);
local v4 = require(l_Parent_0.SquadsCore);
local v5 = require(l_Parent_0.SharedFlags);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local l_useCurrentSquadId_0 = v4.Hooks.useCurrentSquadId;
local l_useCurrentSquadParentChannelId_0 = v4.Hooks.useCurrentSquadParentChannelId;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_leaveSquad_0 = v4.Thunks.leaveSquad;
local l_SquadButtonClickIntentionEnum_0 = v3.Enums.SquadButtonClickIntentionEnum;
local l_SquadButtonSourceEnum_0 = v3.Enums.SquadButtonSourceEnum;
local l_EventNames_0 = v4.Analytics.EventNames;
local l_SquadExternalContractContext_0 = v4.SquadExternalContractProvider.SquadExternalContractContext;
local l_SquadPromptType_0 = v4.Enums.SquadPromptType;
local l_useTokens_0 = v1.Hooks.useTokens;
local l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 = v5.FFlagPartyDevAPIToRespectThirdPartySettingsEnabled;
local l_FFlagEnableAppChatFocusableFixes_0 = v5.FFlagEnableAppChatFocusableFixes;
local l_FFlagIsSquadEnabledAMP_0 = v5.FFlagIsSquadEnabledAMP;
local l_FFlagRemoveDependencyArrayAntipattern_0 = v5.FFlagRemoveDependencyArrayAntipattern;
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
return function(v24) --[[ Line: 41 ]] --[[ Name: SquadEndedCard ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useNavigation_0 (copy), l_useTokens_0 (copy), l_useCurrentSquadId_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v2 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_SquadButtonClickIntentionEnum_0 (copy), l_EventNames_0 (copy), l_SquadButtonSourceEnum_0 (copy), v1 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy)
    local v25 = l_useDispatch_0();
    local v26 = l_useLocalization_0({
        partyEnded = "Feature.Squads.Label.PartyEndedText", 
        tapToStartNewParty = "Feature.Squads.Action.TapToStartNewParty"
    });
    local v27 = l_useNavigation_0();
    local v28 = l_useTokens_0();
    local v29 = l_useCurrentSquadId_0();
    local v30 = l_useCurrentSquadParentChannelId_0();
    local v31 = v2.useContext(l_SquadExternalContractContext_0);
    local v32 = v31.useParentChannelHasGroupUp(v24.conversationId);
    local v33 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v34 = v31.useParentChannelHasSquadAccess(v24.conversationId);
    local v35 = if l_FFlagIsSquadEnabledAMP_0 then v33 and v34 else v34;
    local v36 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v31.useIsChatEnabled();
    local v37 = v2.useMemo(function() --[[ Line: 67 ]]
        -- upvalues: v30 (copy), v24 (copy)
        return v30 == v24.conversationId;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v30, 
        v24.conversationId
    } else l_dependencyArray_0(v30, v24.conversationId));
    local v38 = v2.useMemo(function() --[[ Line: 76 ]]
        -- upvalues: v37 (copy), l_SquadButtonClickIntentionEnum_0 (ref), v32 (copy)
        if v37 then
            return l_SquadButtonClickIntentionEnum_0.View;
        elseif v32 then
            return l_SquadButtonClickIntentionEnum_0.Join;
        else
            return l_SquadButtonClickIntentionEnum_0.Create;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v37, 
        v32
    } else l_dependencyArray_0(v37, v32));
    local v39 = v2.useCallback(function() --[[ Line: 92 ]]
        -- upvalues: v31 (copy), l_EventNames_0 (ref), v24 (copy), l_SquadButtonSourceEnum_0 (ref), v29 (copy), v38 (copy)
        v31.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v24.conversationId, 
            squadButtonSource = l_SquadButtonSourceEnum_0.PartyEndedCard, 
            squadId = v29, 
            squadLocation = v24.squadLocation, 
            userIntention = v38
        });
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v38, 
        v29, 
        v24.conversationId, 
        v24.squadLocation, 
        v31.fireSquadAnalytics
    } else l_dependencyArray_0(v38, v29, v24.conversationId, v24.squadLocation, v31.fireSquadAnalytics));
    return v2.createElement(v1.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        backgroundStyle = v28.Color.Shift.Shift_200, 
        cornerRadius = UDim.new(0, v28.Radius.Large), 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v28.Gap.XSmall), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
            Selectable = true
        } else nil, 
        onActivated = v35 and function() --[[ Line: 134 ]]
            -- upvalues: v39 (copy), v29 (copy), v24 (copy), v30 (copy), v25 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v31 (copy), v27 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v36 (copy)
            v39();
            if v29 and v24.conversationId ~= v30 then
                v25(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v31.setSquadPrompt, function() --[[ Line: 142 ]]
                    -- upvalues: v27 (ref), v24 (ref)
                    v27.navigate("SquadLobby", {
                        conversationId = v24.conversationId
                    });
                end, v31.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v36));
                return;
            else
                v27.navigate("SquadLobby", {
                    conversationId = v24.conversationId
                });
                return;
            end;
        end or nil, 
        padding = {
            bottom = UDim.new(0, v28.Padding.Medium), 
            left = UDim.new(0, v28.Padding.Large), 
            right = UDim.new(0, v28.Padding.Large), 
            top = UDim.new(0, v28.Padding.Medium)
        }
    }, {
        Title = v2.createElement(v1.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v28.Color.None, 
            fontStyle = v28.Typography.TitleMedium, 
            LayoutOrder = 1, 
            Text = v26.partyEnded, 
            textStyle = v28.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Status = if v35 then v2.createElement(v1.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v28.Color.None, 
            fontStyle = v28.Typography.LabelSmall, 
            LayoutOrder = 2, 
            Text = v26.tapToStartNewParty, 
            textStyle = v28.Color.Content.Muted, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }) else nil
    });
end;