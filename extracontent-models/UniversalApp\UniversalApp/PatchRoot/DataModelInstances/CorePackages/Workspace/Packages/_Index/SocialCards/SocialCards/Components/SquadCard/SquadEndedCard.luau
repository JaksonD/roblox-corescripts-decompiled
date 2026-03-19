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
local l_useCanAccessParty_0 = require(l_Parent_0.Squads).Hooks.useCanAccessParty;
return function(v23) --[[ Line: 39 ]] --[[ Name: SquadEndedCard ]]
    -- upvalues: l_useDispatch_0 (copy), l_useLocalization_0 (copy), l_useNavigation_0 (copy), l_useTokens_0 (copy), l_useCurrentSquadId_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), v2 (copy), l_SquadExternalContractContext_0 (copy), l_FFlagIsSquadEnabledAMP_0 (copy), l_useCanAccessParty_0 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (copy), l_dependencyArray_0 (copy), l_SquadButtonClickIntentionEnum_0 (copy), l_EventNames_0 (copy), l_SquadButtonSourceEnum_0 (copy), v1 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_leaveSquad_0 (copy), l_SquadPromptType_0 (copy)
    local v24 = l_useDispatch_0();
    local v25 = l_useLocalization_0({
        partyEnded = "Feature.Squads.Label.PartyEndedText", 
        tapToStartNewParty = "Feature.Squads.Action.TapToStartNewParty"
    });
    local v26 = l_useNavigation_0();
    local v27 = l_useTokens_0();
    local v28 = l_useCurrentSquadId_0();
    local v29 = l_useCurrentSquadParentChannelId_0();
    local v30 = v2.useContext(l_SquadExternalContractContext_0);
    local v31 = v30.useParentChannelHasGroupUp(v23.conversationId);
    local v32 = if l_FFlagIsSquadEnabledAMP_0 then l_useCanAccessParty_0() else nil;
    local v33 = v30.useParentChannelHasSquadAccess(v23.conversationId);
    local v34 = if l_FFlagIsSquadEnabledAMP_0 then v32 and v33 else v33;
    local v35 = not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v30.useIsChatEnabled();
    local v36 = v2.useMemo(function() --[[ Line: 64 ]]
        -- upvalues: v29 (copy), v23 (copy)
        return v29 == v23.conversationId;
    end, l_dependencyArray_0(v29, v23.conversationId));
    local v37 = v2.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v36 (copy), l_SquadButtonClickIntentionEnum_0 (ref), v31 (copy)
        if v36 then
            return l_SquadButtonClickIntentionEnum_0.View;
        elseif v31 then
            return l_SquadButtonClickIntentionEnum_0.Join;
        else
            return l_SquadButtonClickIntentionEnum_0.Create;
        end;
    end, l_dependencyArray_0(v36, v31));
    local v38 = v2.useCallback(function() --[[ Line: 80 ]]
        -- upvalues: v30 (copy), l_EventNames_0 (ref), v23 (copy), l_SquadButtonSourceEnum_0 (ref), v28 (copy), v37 (copy)
        v30.fireSquadAnalytics(l_EventNames_0.EnterSquadButtonPressed, {
            conversationId = v23.conversationId, 
            squadButtonSource = l_SquadButtonSourceEnum_0.PartyEndedCard, 
            squadId = v28, 
            squadLocation = v23.squadLocation, 
            userIntention = v37
        });
    end, l_dependencyArray_0(v37, v28, v23.conversationId, v23.squadLocation, v30.fireSquadAnalytics));
    return v2.createElement(v1.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        backgroundStyle = v27.Color.Shift.Shift_200, 
        cornerRadius = UDim.new(0, v27.Radius.Large), 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v27.Gap.XSmall), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
            Selectable = true
        } else nil, 
        onActivated = v34 and function() --[[ Line: 114 ]]
            -- upvalues: v38 (copy), v28 (copy), v23 (copy), v29 (copy), v24 (copy), l_leaveSquad_0 (ref), l_SquadPromptType_0 (ref), v30 (copy), v26 (copy), l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 (ref), v35 (copy)
            v38();
            if v28 and v23.conversationId ~= v29 then
                v24(l_leaveSquad_0(l_SquadPromptType_0.JoinAnotherSquad, v30.setSquadPrompt, function() --[[ Line: 122 ]]
                    -- upvalues: v26 (ref), v23 (ref)
                    v26.navigate("SquadLobby", {
                        conversationId = v23.conversationId
                    });
                end, v30.squadLocation, not l_FFlagPartyDevAPIToRespectThirdPartySettingsEnabled_0 or v35));
                return;
            else
                v26.navigate("SquadLobby", {
                    conversationId = v23.conversationId
                });
                return;
            end;
        end or nil, 
        padding = {
            bottom = UDim.new(0, v27.Padding.Medium), 
            left = UDim.new(0, v27.Padding.Large), 
            right = UDim.new(0, v27.Padding.Large), 
            top = UDim.new(0, v27.Padding.Medium)
        }
    }, {
        Title = v2.createElement(v1.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v27.Color.None, 
            fontStyle = v27.Typography.TitleMedium, 
            LayoutOrder = 1, 
            Text = v25.partyEnded, 
            textStyle = v27.Color.Content.Emphasis, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }), 
        Status = if v34 then v2.createElement(v1.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            backgroundStyle = v27.Color.None, 
            fontStyle = v27.Typography.LabelSmall, 
            LayoutOrder = 2, 
            Text = v25.tapToStartNewParty, 
            textStyle = v27.Color.Content.Muted, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }) else nil
    });
end;