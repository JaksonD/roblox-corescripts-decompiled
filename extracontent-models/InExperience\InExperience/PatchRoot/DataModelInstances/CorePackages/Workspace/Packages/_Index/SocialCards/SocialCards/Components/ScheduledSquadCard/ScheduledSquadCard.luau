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
local l_SquadExternalContractContext_0 = v6.SquadExternalContractProvider.SquadExternalContractContext;
local l_EventNames_0 = v6.Analytics.EventNames;
local l_useCurrentSquadId_0 = v6.Hooks.useCurrentSquadId;
return function(v19) --[[ Line: 32 ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), l_SquadExternalContractContext_0 (copy), l_useCurrentSquadId_0 (copy), v2 (copy), l_UserProfileStore_0 (copy), l_useLocalization_0 (copy), l_LocalizationService_0 (copy), l_EventNames_0 (copy), l_ScheduledSquadActionEnum_0 (copy), l_ScheduledSquadActionSourceEnum_0 (copy), v3 (copy), l_AvatarGroup_0 (copy), l_InputSize_0 (copy), l_AvatarGroupType_0 (copy), l_ScheduledSquadsMoreInfoSheet_0 (copy)
    local v20 = l_useTokens_0();
    local v21 = v4.useContext(l_SquadExternalContractContext_0);
    local v22 = l_useCurrentSquadId_0();
    local v23 = v19.startTime == nil;
    local v24, v25 = v4.useState(false);
    local v26, v27 = v4.useState(true);
    local v28, v29 = v4.useState("");
    local v30 = v4.useMemo(function() --[[ Line: 42 ]]
        -- upvalues: v19 (copy)
        if v19.startTime then
            return (DateTime.fromIsoDate(v19.startTime));
        else
            return nil;
        end;
    end, {
        v19.startTime
    });
    local v31 = v30 and v30.UnixTimestamp < DateTime.now().UnixTimestamp;
    local v33 = v4.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v2 (ref), v19 (copy)
        return v2.List.map(v19.subscribers, function(v32) --[[ Line: 48 ]]
            return v32.userId;
        end);
    end, {
        v19.subscribers
    });
    v4.useEffect(function() --[[ Line: 53 ]]
        -- upvalues: v23 (copy), v31 (copy), v27 (copy), l_UserProfileStore_0 (ref), v19 (copy), v29 (copy)
        if v23 or v31 then
            v27(false);
            return;
        else
            l_UserProfileStore_0.get().fetchNamesByUserIds({
                (tostring(v19.initiatorId))
            }, function(v34) --[[ Line: 57 ]]
                -- upvalues: v29 (ref), v27 (ref)
                local l_status_0 = v34.status;
                local l_data_0 = v34.data;
                if l_status_0 == "success" then
                    v29(l_data_0[1].names.getDisplayName(false));
                    v27(false);
                    return;
                else
                    if l_status_0 == "failed" then
                        v27(false);
                    end;
                    return;
                end;
            end);
            return;
        end;
    end, {
        v23, 
        v31, 
        v19.initiatorId
    });
    local v37 = l_useLocalization_0({
        deletedScheduledPartyText = "Feature.Squads.Label.DeletedScheduledParty", 
        goingText = "Feature.Squads.Description.Going", 
        partyText = "Feature.Squads.Label.Party", 
        scheduledPartyText = "Feature.Squads.Label.ScheduledParty", 
        usersPartyText = {
            "Feature.Squads.Label.UsersParty"; 
            displayName = v28
        }
    });
    local v38 = if v30 then v30:FormatLocalTime("llll", l_LocalizationService_0.RobloxLocaleId) else "";
    local v39 = v4.useCallback(function() --[[ Line: 82 ]]
        -- upvalues: v25 (copy), v21 (copy), l_EventNames_0 (ref), l_ScheduledSquadActionEnum_0 (ref), v19 (copy), l_ScheduledSquadActionSourceEnum_0 (ref), v22 (copy)
        v25(true);
        v21.fireSquadAnalytics(l_EventNames_0.ScheduledSquadAction, {
            actionType = l_ScheduledSquadActionEnum_0.SeeMoreDetails, 
            conversationId = v19.parentChannelId, 
            scheduledSquadId = v19.scheduledGroupUpId, 
            source = l_ScheduledSquadActionSourceEnum_0.ScheduledSquadCard, 
            squadId = v22, 
            squadLocation = v21.squadLocation
        });
    end, {
        v22, 
        v19.parentChannelId, 
        v19.scheduledGroupUpId, 
        v25, 
        v21.fireSquadAnalytics, 
        v21.squadLocation
    });
    local v40 = v4.useCallback(function() --[[ Line: 104 ]]
        -- upvalues: v25 (copy)
        v25(false);
    end, {
        v25
    });
    if v26 then
        return v4.createElement(v3.View, {
            tag = "size-full-800"
        }, {
            Skeleton = v4.createElement(v3.Skeleton, {
                Size = UDim2.new(0, 280, 0, v20.Size.Size_2500), 
                radius = v3.Enums.Radius.Large
            })
        });
    else
        return v4.createElement(v3.View, {
            onActivated = v39, 
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
                    Text = if v23 then v37.deletedScheduledPartyText else if v31 then v37.partyText else v37.usersPartyText
                }), 
                Date = if not v23 then v4.createElement(v3.Text, {
                    LayoutOrder = 2, 
                    tag = "auto-y size-full-0 text-body-medium text-align-x-left content-default text-wrap", 
                    Text = v38
                }) else nil
            }), 
            Interested = if not v23 then v4.createElement(v3.View, {
                LayoutOrder = 2, 
                tag = "row size-full-0 auto-y gap-small align-x-left align-y-center"
            }, {
                AvatarGroup = v4.createElement(l_AvatarGroup_0, {
                    avatars = v33, 
                    backplateStyle = {
                        Color3 = v20.Color.Shift.Shift_200.Color3, 
                        Transparency = v20.Color.Shift.Shift_200.Transparency
                    }, 
                    LayoutOrder = 1, 
                    max = 4, 
                    size = l_InputSize_0.XSmall, 
                    type = l_AvatarGroupType_0.Stacked
                }), 
                InterestedCount = v4.createElement(v3.Text, {
                    LayoutOrder = 2, 
                    tag = "auto-xy text-body-medium content-default", 
                    Text = ("%*"):format(v37.goingText)
                })
            }) else nil, 
            Sheet = if not v23 then v4.createElement(l_ScheduledSquadsMoreInfoSheet_0, {
                isOpen = v24, 
                onClose = v40, 
                scheduledSquad = v19
            }) else nil
        });
    end;
end;