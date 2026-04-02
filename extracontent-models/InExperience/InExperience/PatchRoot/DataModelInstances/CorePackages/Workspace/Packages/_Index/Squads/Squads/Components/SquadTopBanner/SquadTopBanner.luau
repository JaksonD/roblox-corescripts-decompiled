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
local l_FFlagDebugAppChatEnableDomLocators_0 = l_SharedFlags_0.FFlagDebugAppChatEnableDomLocators;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local _ = nil;
local v25 = nil;
if l_GetFFlagEnableCrossExpVoice_0() then
    v25 = require(l_Parent_0.CrossExperienceVoice).Hooks.useLastActiveParticipant;
end;
local v26 = require(l_script_FirstAncestor_0.Flags.FFlagIntroduceNameToOneToOneWaitingState);
local l_FFlagRemoveDependencyArrayAntipattern_0 = v7.SharedFlags.FFlagRemoveDependencyArrayAntipattern;
SquadTopBanner = function(v28) --[[ Line: 57 ]] --[[ Name: SquadTopBanner ]]
    -- upvalues: l_React_0 (copy), l_SquadCoordinationUIChangesExperimentation_0 (copy), v8 (copy), l_GetFFlagEnableCrossExpVoice_0 (copy), v25 (ref), l_useTokens_0 (copy), l_useCurrentSquadParentChannelId_0 (copy), l_SquadExternalContractContext_0 (copy), l_useLocalUserId_0 (copy), v26 (copy), l_Constants_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v5 (copy), l_useLocalization_0 (copy), v4 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Foundation_0 (copy), l_FFlagDebugAppChatEnableDomLocators_0 (copy), l_View_0 (copy), v6 (copy)
    l_React_0.useEffect(function() --[[ Line: 58 ]]
        -- upvalues: l_SquadCoordinationUIChangesExperimentation_0 (ref)
        if l_SquadCoordinationUIChangesExperimentation_0.isLogExposureEnabled then
            l_SquadCoordinationUIChangesExperimentation_0.logExposure();
        end;
    end, {});
    local v29 = if v8 and l_GetFFlagEnableCrossExpVoice_0() then v25() else nil;
    local v30 = v29 and v29.userId or nil;
    local v31 = l_useTokens_0();
    local v32 = if v8 then nil else l_useCurrentSquadParentChannelId_0();
    local v33 = if v8 then nil else l_React_0.useContext(l_SquadExternalContractContext_0);
    local v34 = v8 and "" or v33.useParentChannelTitleSelector(v32 or "") or "";
    local v35 = l_useLocalUserId_0();
    local v36 = nil;
    local v37 = false;
    if v26 then
        local v40 = l_React_0.useMemo(function() --[[ Line: 87 ]]
            -- upvalues: v28 (copy), l_Constants_0 (ref), v35 (copy)
            if v28.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and v28.parentChannelParticipants then
                for _, v39 in ipairs(v28.parentChannelParticipants) do
                    if v39 ~= v35 then
                        return v39;
                    end;
                end;
            end;
            return "";
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v28.parentChannelParticipants, 
            v28.parentChannelType, 
            v35
        } else l_dependencyArray_0(v28.parentChannelParticipants, v28.parentChannelType, v35));
        local v41 = v5.Hooks.useUserProfilesFetch({
            userIds = v40 ~= "" and {
                v40
            } or {}, 
            query = v5.Queries.userProfilesCombinedNameByUserIds
        });
        if v41.data then
            v36 = v5.Selectors.getCombinedNameFromId(v41.data, v40 or "") or "";
        end;
        v37 = not v28.parentChannelType or v28.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and v40 ~= "" and not v36;
    end;
    local v42 = nil;
    local v43 = nil;
    if v8 then
        local v44 = l_useLocalization_0({
            waitingForOthers = "Feature.Squads.Label.WaitingForOthers", 
            numberInTheParty = "Feature.Squads.Label.PartyCountStatus", 
            loading = "Feature.Squads.Label.Loading", 
            waitingForCombinedName = "Feature.Squads.Label.WaitingForCombinedName"
        });
        v42 = l_React_0.useMemo(function() --[[ Line: 135 ]]
            -- upvalues: v26 (ref), v37 (ref), v44 (copy), v28 (copy), l_Constants_0 (ref), v36 (ref)
            if v26 and v37 then
                return v44.loading;
            elseif v26 and v28.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_ONE_TO_ONE_TYPE and v36 and #v28.squadMemberList < 2 then
                return v44.waitingForCombinedName:gsub("{(.-)}", {
                    combinedName = v36
                });
            elseif (not v26 or v28.parentChannelType == l_Constants_0.CONVERSATION_CHANNEL_GROUP_TYPE) and #v28.squadMemberList < 2 then
                return v44.waitingForOthers;
            else
                return v44.numberInTheParty:gsub("{(.-)}", {
                    partyCount = tostring(#v28.squadMemberList)
                });
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            if v26 then v37 else nil, 
            v44, 
            if v26 then v36 else nil, 
            if v26 then v28.parentChannelType else nil, 
            v28.squadMemberList
        } else l_dependencyArray_0(if v26 then v37 else nil, v44, if v26 then v36 else nil, if v26 then v28.parentChannelType else nil, v28.squadMemberList));
        local v48 = l_React_0.useCallback(function() --[[ Line: 178 ]]
            -- upvalues: v35 (copy), v28 (copy)
            local v45 = {};
            if v35 == "-1" or not v28.squadMemberList then
                return v45;
            else
                for _, v47 in ipairs(v28.squadMemberList) do
                    if tostring(v47) ~= v35 then
                        table.insert(v45, (tostring(v47)));
                    end;
                end;
                table.insert(v45, v35);
                return v45;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v28.squadMemberList
        } else l_dependencyArray_0(v28.squadMemberList));
        v43 = l_React_0.useMemo(function() --[[ Line: 200 ]]
            -- upvalues: v48 (copy), v4 (ref), l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
            local v49 = v48();
            return v4.List.map(v49, function(v50) --[[ Line: 203 ]]
                -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref)
                return l_getStandardSizeAvatarHeadShotRbxthumb_0(v50);
            end);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v48
        } else l_dependencyArray_0(v48));
    end;
    return l_React_0.createElement(l_Foundation_0.View, {
        Size = UDim2.new(1, 0, 1, 0), 
        backgroundStyle = v31.Color.None, 
        testId = if l_FFlagDebugAppChatEnableDomLocators_0 then l_Constants_0.SQUAD_TOP_BANNER_TEST_ID else nil, 
        layout = {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Padding = UDim.new(0, v31.Gap.Small), 
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
                style = v31.Color.Extended.Gray.Gray_100
            })
        }) else nil, 
        HorizontalFacepileGroup = if v8 then l_React_0.createElement(l_View_0, {
            tag = "auto-xy", 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            l_React_0.createElement(v6, {
                avatarSize = v31.Size.Size_600, 
                images = v43
            })
        }) else nil, 
        Title = l_React_0.createElement(l_Foundation_0.Text, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            textStyle = v31.Color.Extended.Gray.Gray_100, 
            fontStyle = v31.Typography.TitleMedium, 
            backgroundStyle = v31.Color.None, 
            LayoutOrder = 2, 
            Text = if v8 then v42 else v34, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            UIFlexItem = l_React_0.createElement("UIFlexItem", {
                FlexMode = Enum.UIFlexMode.Fill
            })
        }), 
        Avatar = if not v8 and v30 then l_React_0.createElement(l_Foundation_0.Image, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(24, 24), 
            backgroundStyle = v31.Color.Extended.Gray.Gray_700, 
            cornerRadius = UDim.new(0, v31.Radius.Circle), 
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v30)))
        }) else nil
    });
end;
return l_React_0.memo(SquadTopBanner);