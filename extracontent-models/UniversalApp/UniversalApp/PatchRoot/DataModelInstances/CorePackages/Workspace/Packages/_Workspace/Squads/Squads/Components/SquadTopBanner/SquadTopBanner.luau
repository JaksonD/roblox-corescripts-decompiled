local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.UserProfiles);
local v6 = require(l_script_FirstAncestor_0.Common.HorizontalFacepileGroup);
local v7 = require(l_script_FirstAncestor_0.dependencies);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagIntroduceTopBannerPartyStates);
local _ = require(l_script_FirstAncestor_0.Enums.SquadActivityEnum);
local l_dependencyArray_0 = v7.Hooks.dependencyArray;
local l_Foundation_0 = v7.Foundation;
local l_React_0 = v7.React;
local l_SharedFlags_0 = v7.SharedFlags;
local l_SquadCoordinationUIChangesExperimentation_0 = v7.SocialExperiments.SquadCoordinationUIChangesExperimentation;
local l_SquadsCore_0 = v7.SquadsCore;
local l_useLocalization_0 = v7.Hooks.useLocalization;
local l_Constants_0 = l_SquadsCore_0.Common.Constants;
local l_SquadExternalContractContext_0 = l_SquadsCore_0.SquadExternalContractProvider.SquadExternalContractContext;
local l_useCurrentSquadParentChannelId_0 = l_SquadsCore_0.Hooks.useCurrentSquadParentChannelId;
local l_useTokens_0 = l_Foundation_0.Hooks.useTokens;
local l_View_0 = l_Foundation_0.View;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local _ = nil;
local v24 = nil;
if l_GetFFlagEnableCrossExpVoice_0() then
    v24 = require(l_Parent_0.CrossExperienceVoice).Hooks.useLastActiveParticipant;
end;
local v25 = require(l_script_FirstAncestor_0.Flags.FFlagIntroduceNameToOneToOneWaitingState);
SquadTopBanner = function(v26) --[[ Line: 54 ]] --[[ Name: SquadTopBanner ]]
    -- upvalues: l_React_0 (copy), l_SquadCoordinationUIChangesExperimentation_0 (copy), v8 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v24 (ref), l_useTokens_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_SquadExternalContractContext_0 (copy), l_useLocalUserId_0 (copy), v25 (copy), l_Constants_0 (copy), l_dependencyArray_0 (copy), v5 (copy), l_useLocalization_0 (copy), v4 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Foundation_0 (copy), l_View_0 (copy), v6 (copy)
    l_React_0.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: l_SquadCoordinationUIChangesExperimentation_0 (ref)
        if l_SquadCoordinationUIChangesExperimentation_0.isLogExposureEnabled then
            l_SquadCoordinationUIChangesExperimentation_0.logExposure();
        end;
    end, {});
    local v27 = if v8 and l_GetFFlagEnableCrossExpVoice_0() then v24() else nil;
    local v28 = v27 and v27.userId or nil;
    local v29 = l_useTokens_0();
    local v30 = if v8 then nil else l_useCurrentSquadParentChannelId_0();
    local v31 = if v8 then nil else l_React_0.useContext(l_SquadExternalContractContext_0);
    local v32 = v8 and "" or v31.useParentChannelTitleSelector(v30 or "") or "";
    local v33 = l_useLocalUserId_0();
    local v34 = nil;
    local v35 = false;
    if v25 then
        local v38 = l_React_0.useMemo(function() --[[ Line: 83 ]]
            -- upvalues: v26 (copy), l_Constants_0 (ref), v33 (copy)
            if v26.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and v26.parentChannelParticipants then
                for _, v37 in ipairs(v26.parentChannelParticipants) do
                    if v37 ~= v33 then
                        return v37;
                    end;
                end;
            end;
            return "";
        end, l_dependencyArray_0(v26.parentChannelParticipants, v26.parentChannelType, v33));
        local v39 = v5.Hooks.useUserProfilesFetch({
            userIds = v38 ~= "" and {
                v38
            } or {}, 
            query = v5.Queries.userProfilesCombinedNameByUserIds
        });
        if v39.data then
            v34 = v5.Selectors.getCombinedNameFromId(v39.data, v38 or "") or "";
        end;
        v35 = not v26.parentChannelType or v26.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and v38 ~= "" and not v34;
    end;
    local v40 = nil;
    local v41 = nil;
    if v8 then
        local v42 = l_useLocalization_0({
            waitingForOthers = "Feature.Squads.Label.WaitingForOthers", 
            numberInTheParty = "Feature.Squads.Label.PartyCountStatus", 
            loading = "Feature.Squads.Label.Loading", 
            waitingForCombinedName = "Feature.Squads.Label.WaitingForCombinedName"
        });
        v40 = l_React_0.useMemo(function() --[[ Line: 127 ]]
            -- upvalues: v25 (ref), v35 (ref), v42 (copy), v26 (copy), l_Constants_0 (ref), v34 (ref)
            if v25 and v35 then
                return v42.loading;
            elseif v25 and v26.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and v34 and #v26.squadMemberList < 2 then
                return v42.waitingForCombinedName:gsub("{(.-)}", {
                    combinedName = v34
                });
            elseif (not v25 or v26.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE) and #v26.squadMemberList < 2 then
                return v42.waitingForOthers;
            else
                return v42.numberInTheParty:gsub("{(.-)}", {
                    partyCount = tostring(#v26.squadMemberList)
                });
            end;
        end, l_dependencyArray_0(if v25 then v35 else nil, v42, if v25 then v34 else nil, if v25 then v26.parentChannelType else nil, v26.squadMemberList));
        local v46 = l_React_0.useCallback(function() --[[ Line: 161 ]]
            -- upvalues: v33 (copy), v26 (copy)
            local v43 = {};
            if v33 == "-1" or not v26.squadMemberList then
                return v43;
            else
                for _, v45 in ipairs(v26.squadMemberList) do
                    if tostring(v45) ~= v33 then
                        table.insert(v43, (tostring(v45)));
                    end;
                end;
                table.insert(v43, v33);
                return v43;
            end;
        end, l_dependencyArray_0(v26.squadMemberList));
        v41 = l_React_0.useMemo(function() --[[ Line: 179 ]]
            -- upvalues: v46 (copy), v4 (ref), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
            local v47 = v46();
            return v4.List.map(v47, function(v48) --[[ Line: 182 ]]
                -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
                return l_getStandardSizeAvatarHeadShotRbxthumb_0(v48);
            end);
        end, l_dependencyArray_0(v46));
    end;
    return l_React_0.createElement(l_Foundation_0.View, {
        Size = UDim2.new(1, 0, 1, 0), 
        backgroundStyle = v29.Color.None, 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v29.Gap.Small), 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }
    }, {
        Icon = if not v8 then l_React_0.createElement("Frame", {
            Size = UDim2.fromOffset(20, 20), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            l_React_0.createElement(l_Foundation_0.Icon, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                size = 28, 
                name = "three-people", 
                style = v29.Color.Extended.Gray.Gray_100
            })
        }) else nil, 
        HorizontalFacepileGroup = if v8 then l_React_0.createElement(l_View_0, {
            tag = "auto-xy", 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            l_React_0.createElement(v6, {
                avatarSize = v29.Size.Size_600, 
                images = v41
            })
        }) else nil, 
        Title = l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            textStyle = v29.Color.Extended.Gray.Gray_100, 
            fontStyle = v29.Typography.TitleMedium, 
            backgroundStyle = v29.Color.None, 
            LayoutOrder = 2, 
            Text = if v8 then v40 else v32, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            UIFlexItem = l_React_0.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        }), 
        Avatar = if not v8 and v28 then l_React_0.createElement(l_Foundation_0.Image, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(24, 24), 
            backgroundStyle = v29.Color.Extended.Gray.Gray_700, 
            cornerRadius = UDim.new(0, v29.Radius.Circle), 
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v28)))
        }) else nil
    });
end;
return l_React_0.memo(SquadTopBanner);