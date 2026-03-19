local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script:FindFirstAncestor("SocialCards").Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Squads);
local v6 = require(l_Parent_0.SquadsCore);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_UserProfileStore_0 = require(l_Parent_0.UserProfiles).Stores.UserProfileStore;
local l_AvatarGroup_0 = v3.AvatarGroup;
local l_AvatarGroupType_0 = v3.Enums.AvatarGroupType;
local l_InputSize_0 = v3.Enums.InputSize;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_ScheduledSquadActionEnum_0 = v5.Enums.ScheduledSquadActionEnum;
local l_ScheduledSquadActionSourceEnum_0 = v5.Enums.ScheduledSquadActionSourceEnum;
local l_ScheduledSquadsMoreInfoSheet_0 = v5.ScheduledSquadsMoreInfoSheet;
local l_getScheduledSquadStatus_0 = v6.NetworkRequests.getScheduledSquadStatus;
local l_SquadExternalContractContext_0 = v6.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v6.Analytics.EventNames;
local l_useCurrentSquadId_0 = v6.Hooks.useCurrentSquadId;
return function(v20) --[[ Line: 33 ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), v2 (copy), l_getScheduledSquadStatus_0 (copy), l_UserProfileStore_0 (copy), l_useLocalization_0 (copy), l_LocalizationService_0 (copy), l_EventNames_0 (copy), l_ScheduledSquadActionEnum_0 (copy), l_ScheduledSquadActionSourceEnum_0 (copy), v3 (copy), l_AvatarGroup_0 (copy), l_InputSize_0 (copy), l_AvatarGroupType_0 (copy), l_ScheduledSquadsMoreInfoSheet_0 (copy)
    local v21 = l_useTokens_0();
    local v22 = v4.useContext(l_SquadExternalContractContext_0);
    local v23 = l_useCurrentSquadId_0();
    local v24 = v20.startTime == nil;
    local v25, v26 = v4.useState(false);
    local v27, v28 = v4.useState(true);
    local v29, v30 = v4.useState(true);
    local v31, v32 = v4.useState("");
    local v33, v34 = v4.useState(nil);
    local v35 = v27 or v29;
    local v36 = v4.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: v20 (copy)
        if v20.startTime then
            return (DateTime.fromIsoDate(v20.startTime));
        else
            return nil;
        end;
    end, {
        v20.startTime
    });
    local v37 = v36 and v36.UnixTimestamp < DateTime.now().UnixTimestamp;
    local v39 = v4.useMemo(function() --[[ Line: 57 ]]
        -- upvalues: v2 (ref), v33 (copy), v20 (copy)
        return v2.List.map(if v33 then v33.subscribers else v20.subscribers, function(v38) --[[ Line: 60 ]]
            return v38.userId;
        end);
    end, {
        v20 and v20.subscribers, 
        v33 and v33.subscribers
    });
    local v41 = v4.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v30 (copy), l_getScheduledSquadStatus_0 (ref), v20 (copy), v34 (copy)
        v30(true);
        l_getScheduledSquadStatus_0(v20.scheduledGroupUpId, function(v40) --[[ Line: 70 ]]
            -- upvalues: v34 (ref), v30 (ref)
            v34(v40);
            v30(false);
        end, function() --[[ Line: 73 ]]
            -- upvalues: v30 (ref)
            v30(false);
        end);
    end, {
        l_getScheduledSquadStatus_0, 
        v20.scheduledGroupUpId
    });
    v4.useEffect(function() --[[ Line: 81 ]]
        -- upvalues: v24 (copy), v37 (copy), v41 (copy), v30 (copy)
        if not v24 and not v37 then
            v41();
            return;
        else
            v30(false);
            return;
        end;
    end, {
        v41, 
        v20 and v20.scheduledGroupUpId, 
        v20.scheduledGroupUpId
    });
    v4.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: v24 (copy), v37 (copy), v28 (copy), l_UserProfileStore_0 (ref), v33 (copy), v20 (copy), v32 (copy)
        if v24 or v37 then
            v28(false);
            return;
        else
            l_UserProfileStore_0.get().fetchNamesByUserIds({
                (tostring(if v33 then v33.initiatorId else v20.initiatorId))
            }, function(v42) --[[ Line: 102 ]]
                -- upvalues: v32 (ref), v28 (ref)
                local l_status_0 = v42.status;
                local l_data_0 = v42.data;
                if l_status_0 == "success" then
                    v32(l_data_0[1].names.getDisplayName(false));
                    v28(false);
                    return;
                else
                    if l_status_0 == "failed" then
                        v28(false);
                    end;
                    return;
                end;
            end);
            return;
        end;
    end, {
        v20 and v20.initiatorId, 
        v24, 
        v37, 
        v33 and v33.initiatorId
    });
    local v45 = l_useLocalization_0({
        deletedScheduledPartyText = "Feature.Squads.Label.DeletedScheduledParty", 
        goingText = "Feature.Squads.Description.Going", 
        partyText = "Feature.Squads.Label.Party", 
        scheduledPartyText = "Feature.Squads.Label.ScheduledParty", 
        usersPartyText = {
            "Feature.Squads.Label.UsersParty"; 
            displayName = v31
        }
    });
    local v46 = if v36 then v36:FormatLocalTime("llll", l_LocalizationService_0.RobloxLocaleId) else "";
    local v47 = v4.useCallback(function() --[[ Line: 134 ]]
        -- upvalues: v26 (copy), v22 (copy), l_EventNames_0 (ref), l_ScheduledSquadActionEnum_0 (ref), v20 (copy), v33 (copy), v20 (copy), l_ScheduledSquadActionSourceEnum_0 (ref), v23 (copy)
        v26(true);
        v22.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = l_ScheduledSquadActionEnum_0.SeeMoreDetails, 
            conversationId = v20.parentChannelId, 
            scheduledSquadId = if v33 then v33.scheduledGroupUpId else v20.scheduledGroupUpId, 
            source = l_ScheduledSquadActionSourceEnum_0.ScheduledSquadCard, 
            squadId = v23, 
            squadLocation = v22.squadLocation
        });
    end, {
        v23, 
        v20 and v20.scheduledGroupUpId, 
        v20.parentChannelId, 
        v33 and v33.scheduledGroupUpId, 
        v26, 
        v22.fireSquadAnalytics, 
        v22.squadLocation
    });
    local v48 = v4.useCallback(function() --[[ Line: 159 ]]
        -- upvalues: v41 (copy), v26 (copy)
        v41();
        v26(false);
    end, {
        v41, 
        v26
    });
    if v35 then
        return v4.createElement(v3.View, {
            tag = "size-full-800"
        }, {
            Skeleton = v4.createElement(v3.Skeleton, {
                Size = UDim2.new(0, 280, 0, v21.Size.Size_2500), 
                radius = v3.Enums.Radius.Large
            })
        });
    else
        return v4.createElement(v3.View, {
            onActivated = v47, 
            Size = UDim2.new(0, 280, 0, 0), 
            tag = "auto-y bg-shift-200 radius-large col padding-y-medium padding-x-large align-x-center gap-medium flex-fill"
        }, {
            TextContainer = v4.createElement(v3.View, {
                LayoutOrder = 1, 
                tag = "auto-y size-full-0 col gap-xsmall"
            }, {
                Title = v4.createElement(v3.Text, {
                    LayoutOrder = 1, 
                    tag = "auto-y size-full-0 text-title-large text-align-x-left content-emphasis text-wrap", 
                    Text = if v24 then v45.deletedScheduledPartyText else if v37 then v45.partyText else v45.usersPartyText
                }), 
                Date = if not v24 then v4.createElement(v3.Text, {
                    LayoutOrder = 2, 
                    tag = "auto-y size-full-0 text-body-medium text-align-x-left content-default text-wrap", 
                    Text = v46
                }) else nil
            }), 
            Interested = if not v24 then v4.createElement(v3.View, {
                LayoutOrder = 2, 
                tag = "row size-full-0 auto-y gap-small align-x-left align-y-center"
            }, {
                AvatarGroup = v4.createElement(l_AvatarGroup_0, {
                    avatars = v39, 
                    backplateStyle = {
                        Color3 = v21.Color.Shift.Shift_200.Color3, 
                        Transparency = v21.Color.Shift.Shift_200.Transparency
                    }, 
                    LayoutOrder = 1, 
                    max = 4, 
                    size = l_InputSize_0.XSmall, 
                    type = l_AvatarGroupType_0.Stacked
                }), 
                InterestedCount = v4.createElement(v3.Text, {
                    LayoutOrder = 2, 
                    tag = "auto-xy text-body-medium content-default", 
                    Text = ("%*"):format(v45.goingText)
                })
            }) else nil, 
            Sheet = if not v24 then v4.createElement(l_ScheduledSquadsMoreInfoSheet_0, {
                isOpen = v25, 
                onClose = v48, 
                scheduledSquad = v33 or v20
            }) else nil
        });
    end;
end;