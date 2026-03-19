local l_Parent_0 = script:FindFirstAncestor("Squads").Parent;
local v1 = require(l_Parent_0.Foundation);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SquadsCore);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local l_Sheet_0 = v1.Sheet;
local l_Text_0 = v1.Text;
local l_View_0 = v1.View;
local l_createScheduledSquad_0 = v3.Thunks.createScheduledSquad;
local l_EventNames_0 = v3.Analytics.EventNames;
local l_SquadPromptResponse_0 = v3.Enums.SquadPromptResponse;
local l_SquadPromptType_0 = v3.Enums.SquadPromptType;
local l_SquadExternalContractContext_0 = v3.SquadExternalContractProvider.SquadExternalContractContext;
local l_updateScheduledSquad_0 = v3.NetworkRequests.updateScheduledSquad;
return function(v17) --[[ Line: 35 ]]
    -- upvalues: v2 (copy), l_SquadExternalContractContext_0 (copy), l_useDispatch_0 (copy), l_useLocalUserId_0 (copy), l_useStore_0 (copy), l_useLocalization_0 (copy), l_SquadPromptType_0 (copy), l_updateScheduledSquad_0 (copy), l_EventNames_0 (copy), l_SquadPromptResponse_0 (copy), l_createScheduledSquad_0 (copy), l_Sheet_0 (copy), l_Text_0 (copy), v1 (copy), l_View_0 (copy)
    local v18 = v2.useContext(l_SquadExternalContractContext_0);
    local v19 = l_useDispatch_0();
    local v20 = l_useLocalUserId_0();
    local v21 = l_useStore_0();
    local v22 = l_useLocalization_0({
        cancelText = "CommonUI.Controls.Action.Cancel", 
        deleteText = "Feature.Chat.Action.Delete", 
        fieldIsRequiredText = "Feature.Squads.Label.ThisFieldIsRequired", 
        saveText = "Feature.Chat.Action.Save", 
        scheduledPartyText = "Feature.Squads.Label.ScheduledParty", 
        scheduleAPartyText = "Feature.Squads.Action.ScheduleAParty", 
        startTimeText = "Feature.Squads.Label.StartTime", 
        titleText = "Feature.Squads.Description.Title"
    });
    local v23, v24 = v2.useState(if v17.scheduledSquad and v17.scheduledSquad.startTime then v17.scheduledSquad.startTime else nil);
    local v25, v26 = v2.useState(false);
    local v27, v28 = v2.useState(if v17.scheduledSquad then v17.scheduledSquad.title else "");
    local v29, v30 = v2.useState(false);
    local _ = if v29 then v22.fieldIsRequiredText else "";
    v2.useEffect(function() --[[ Line: 61 ]]
        -- upvalues: v24 (copy), v17 (copy), v26 (copy), v30 (copy)
        v24(if v17.scheduledSquad and v17.scheduledSquad.startTime then v17.scheduledSquad.startTime else nil);
        v26(false);
        v30(false);
    end, {
        v17.isOpen, 
        v17.scheduledSquad and v17.scheduledSquad.startTime
    });
    local v32 = v17.scheduledSquad and tostring(v17.scheduledSquad.initiatorId) == tostring(v20);
    local v33 = DateTime.now();
    local v34 = v33:ToLocalTime();
    local v35 = v2.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v17 (copy), v18 (copy), v21 (copy), l_SquadPromptType_0 (ref)
        v17.onClose();
        v18.setSquadPrompt(v21, {
            hideCancelButton = true, 
            promptType = l_SquadPromptType_0.Error
        });
    end, {
        v17.onClose, 
        v18.setSquadPrompt, 
        v21
    });
    local _ = v2.useCallback(function(v36) --[[ Line: 85 ]]
        -- upvalues: v29 (copy), v30 (copy), v28 (copy)
        if v29 then
            v30(false);
        end;
        v28(v36);
    end, {
        v29, 
        v30, 
        v28
    });
    local v41 = v2.useCallback(function(v38, v39) --[[ Line: 93 ]]
        local v40 = {
            31, 
            28, 
            31, 
            30, 
            31, 
            30, 
            31, 
            31, 
            30, 
            31, 
            30, 
            31
        };
        if v38 == 2 and (v39 % 4 == 0 and v39 % 100 ~= 0 or v39 % 400 == 0) then
            return 29;
        else
            return v40[v38];
        end;
    end, {});
    local v44 = v2.useCallback(function(v42, _) --[[ Line: 106 ]]
        -- upvalues: v25 (copy), v26 (copy), v24 (copy)
        if v42 and v25 then
            v26(false);
        end;
        v24(if v42 then v42:ToIsoDate() else nil);
    end, {
        v26, 
        v24, 
        v25
    });
    local v46 = v2.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v23 (copy), v26 (copy), v32 (copy), v17 (copy), l_updateScheduledSquad_0 (ref), v27 (copy), v35 (copy), v18 (copy), l_EventNames_0 (ref), l_SquadPromptType_0 (ref), l_SquadPromptResponse_0 (ref), v19 (copy), l_createScheduledSquad_0 (ref)
        local v45 = false;
        if not v23 then
            v26(true);
            v45 = true;
        end;
        if not v45 then
            if v32 and v17.scheduledSquad then
                l_updateScheduledSquad_0({
                    scheduledGroupUpId = v17.scheduledSquad and v17.scheduledSquad.scheduledGroupUpId, 
                    title = v27, 
                    startTime = v23
                }, v17.onClose, v35);
                v18.fireSquadAnalytics(l_EventNames_0.SquadPromptResponded, {
                    promptType = l_SquadPromptType_0.ScheduleSquad, 
                    scheduledSquadId = v17.scheduledSquad and v17.scheduledSquad.scheduledGroupUpId, 
                    squadLocation = v18.squadLocation, 
                    responseType = l_SquadPromptResponse_0.Update
                });
                return;
            else
                v17.onClose();
                v19(l_createScheduledSquad_0({
                    parentChannelId = v17.conversationId or "", 
                    title = v27, 
                    startTime = v23
                }, v18.setSquadPrompt));
                v18.fireSquadAnalytics(l_EventNames_0.SquadPromptResponded, {
                    promptType = l_SquadPromptType_0.ScheduleSquad, 
                    squadLocation = v18.squadLocation, 
                    responseType = l_SquadPromptResponse_0.Create
                });
            end;
        end;
    end, {
        v35, 
        false, 
        v32, 
        v17.conversationId, 
        v17.scheduledSquad, 
        v17.onClose, 
        v23, 
        v26, 
        v30, 
        v29, 
        v27, 
        v18.setSquadPrompt, 
        v18.fireSquadAnalytics, 
        v18.squadLocation
    });
    local v51 = v2.useCallback(function() --[[ Line: 180 ]]
        -- upvalues: v34 (copy), v41 (copy)
        local l_Day_0 = v34.Day;
        local v48 = if v34.Month + 6 > 12 then (v34.Month + 6) % 12 else v34.Month + 6;
        local v49 = if v34.Month + 6 > 12 then v34.Year + 1 else v34.Year;
        local v50 = v41(v48, v49);
        if v50 < l_Day_0 then
            return DateTime.fromLocalTime(v49, v48, v50);
        else
            return DateTime.fromLocalTime(v49, v48, l_Day_0);
        end;
    end, {
        v34, 
        v41
    });
    local v52 = v2.useCallback(function() --[[ Line: 197 ]]
        -- upvalues: v17 (copy), v18 (copy), l_EventNames_0 (ref), l_SquadPromptType_0 (ref), l_SquadPromptResponse_0 (ref)
        v17.onClose();
        v18.fireSquadAnalytics(l_EventNames_0.SquadPromptResponded, {
            promptType = l_SquadPromptType_0.ScheduleSquad, 
            scheduledSquadId = v17.scheduledSquad and v17.scheduledSquad.scheduledGroupUpId, 
            squadLocation = v18.squadLocation, 
            responseType = l_SquadPromptResponse_0.Cancel
        });
    end, {
        v17.scheduledSquad and v17.scheduledSquad.scheduledGroupUpId, 
        v18.fireSquadAnalytics, 
        v17.onClose, 
        v18.squadLocation
    });
    return v2.createElement(l_Sheet_0.Root, {
        onClose = v17.onClose, 
        isOpen = v17.isOpen, 
        preferCenterSheet = true, 
        snapPoints = {
            0.4, 
            0.7
        }
    }, {
        Header = v2.createElement(l_Sheet_0.Header, {}, {
            Title = v2.createElement(l_Text_0, {
                LayoutOrder = 1, 
                Text = v22.scheduleAPartyText, 
                tag = "size-full-0 auto-y text-wrap text-heading-medium text-align-x-left"
            })
        }), 
        Content = v2.createElement(l_Sheet_0.Content, {}, {
            TitleInput = nil, 
            DateTimePicker = v2.createElement(v1.DateTimePicker, {
                defaultDates = if v32 and v17.scheduledSquad then DateTime.fromIsoDate(v17.scheduledSquad.startTime) else nil, 
                hasError = v25, 
                LayoutOrder = 2, 
                isRequired = true, 
                label = v22.startTimeText, 
                onChanged = v44, 
                selectableDateRange = {
                    endDate = v51(), 
                    startDate = v33
                }, 
                variant = v1.Enums.DateTimePickerVariant.SingleWithTime, 
                width = UDim.new(1, 0)
            })
        }), 
        Action = v2.createElement(l_Sheet_0.Actions, {}, {
            ActionList = v2.createElement(l_View_0, {
                tag = "col auto-y gap-small size-full-0"
            }, {
                ConfirmButton = v2.createElement(v1.Button, {
                    LayoutOrder = 1, 
                    isDisabled = if v32 and v17.scheduledSquad then v17.scheduledSquad.startTime == v23 and v17.scheduledSquad.title == v27 else false, 
                    onActivated = v46, 
                    text = v22.saveText, 
                    variant = v1.Enums.ButtonVariant.Emphasis, 
                    width = UDim.new(1, 0)
                }), 
                CancelButton = v2.createElement(v1.Button, {
                    LayoutOrder = 2, 
                    onActivated = v52, 
                    text = v22.cancelText, 
                    variant = v1.Enums.ButtonVariant.Standard, 
                    width = UDim.new(1, 0)
                })
            })
        })
    });
end;