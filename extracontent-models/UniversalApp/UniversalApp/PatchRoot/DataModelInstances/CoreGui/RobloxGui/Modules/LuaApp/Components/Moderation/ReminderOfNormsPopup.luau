local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_InteractiveAlert_0 = v3.App.Dialog.Alert.InteractiveAlert;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v11 = require(l_Modules_0.LuaApp.Thunks.Moderation.CloseReminderOfNormsPopup);
local v12 = require(l_Modules_0.LuaApp.Components.Moderation.ReminderOfNormsAnalytics);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_EventIngest_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventIngest;
local v15 = {
    LocalizationKeyPrefix = "Feature.Home"
};
getReminderVariantBodyKey = function(v16) --[[ Line: 24 ]] --[[ Name: getReminderVariantBodyKey ]]
    local v17 = "";
    if v16 == "positive" then
        return "Feature.Home.Experiment.Reminders.BodyPositiveVariant";
    else
        if v16 == "warning" then
            v17 = "Feature.Home.Experiment.Reminders.BodyWarningVariant";
        end;
        return v17;
    end;
end;
return function(v18) --[[ Line: 43 ]] --[[ Name: ReminderOfNormsPopup ]]
    -- upvalues: l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useStyle_0 (copy), v2 (copy), l_useSelector_0 (copy), v11 (copy), l_EventIngest_0 (copy), l_EventIngestService_0 (copy), v12 (copy), l_useLocalization_0 (copy), v15 (copy), l_InteractiveAlert_0 (copy), l_ButtonType_0 (copy)
    local v19 = l_useDispatch_0();
    local v20 = l_useScreenSize_0();
    local l_Theme_0 = l_useStyle_0().Theme;
    local v22 = v2.useRef(DateTime.now().UnixTimestampMillis);
    local v24 = l_useSelector_0(function(v23) --[[ Line: 50 ]]
        return v23.LocalUserId;
    end);
    local v25 = v2.useCallback(function() --[[ Line: 54 ]]
        -- upvalues: v19 (copy), v11 (ref)
        v19(v11());
    end, {
        v19
    });
    local v26 = v18.eventIngest or l_EventIngest_0.new(l_EventIngestService_0);
    local v29 = v2.useCallback(function(v27) --[[ Line: 59 ]]
        -- upvalues: v24 (copy), v18 (copy), v22 (copy)
        local l_UnixTimestampMillis_0 = DateTime.now().UnixTimestampMillis;
        return {
            user_id = v24, 
            source_intervention_id = v18.interventionId, 
            reminder_number = v18.reminderNumber, 
            experiment_variant = v18.experimentVariant, 
            timestamp_milliseconds = l_UnixTimestampMillis_0, 
            time_to_interact_seconds = (l_UnixTimestampMillis_0 - v22.current) / 1000, 
            interaction = v27
        };
    end, {
        v24, 
        v18.interventionId, 
        v18.reminderNumber, 
        v18.experimentVariant
    });
    local v31 = v2.useCallback(function() --[[ Line: 72 ]]
        -- upvalues: v29 (copy), v12 (ref), v26 (copy), v25 (copy)
        local v30 = v29(v12.Constants.EventTypes.Dimissed);
        v12.sendEvent(v26, v30);
        v25();
    end, {
        v29
    });
    local v33 = v2.useCallback(function() --[[ Line: 78 ]]
        -- upvalues: v29 (copy), v12 (ref), v26 (copy), v25 (copy)
        local v32 = v29(v12.Constants.EventTypes.CtaClicked);
        v12.sendEvent(v26, v32);
        v25();
    end, {
        v29
    });
    local v34 = l_useLocalization_0({
        policyViolation = ("%*.%*"):format(v15.LocalizationKeyPrefix, v18.policyViolation)
    });
    local v35 = l_useLocalization_0({
        sharedBody = {
            "Feature.Home.Experiment.Reminders.BodyShared"; 
            policy_violation = v34.policyViolation
        }, 
        variantBody = getReminderVariantBodyKey(v18.contentVariant), 
        reminderTitle = "Feature.Home.Experiment.Reminders.Title", 
        buttonText = "Feature.Home.Experiment.Reminders.Button"
    });
    return v2.createElement("TextButton", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundTransparency = 1, 
        BackgroundColor = l_Theme_0.BackgroundTransparency, 
        [v2.Event.Activated] = v31
    }, {
        Popup = v2.createElement(l_InteractiveAlert_0, {
            title = v35.reminderTitle, 
            bodyText = ("%* \n\n %*"):format(v35.sharedBody, v35.variantBody), 
            buttonStackInfo = {
                buttons = {
                    {
                        buttonType = l_ButtonType_0.PrimarySystem, 
                        props = {
                            onActivated = v33, 
                            text = v35.buttonText
                        }
                    }
                }
            }, 
            position = UDim2.fromScale(0.5, 0.5), 
            screenSize = v20
        })
    });
end;