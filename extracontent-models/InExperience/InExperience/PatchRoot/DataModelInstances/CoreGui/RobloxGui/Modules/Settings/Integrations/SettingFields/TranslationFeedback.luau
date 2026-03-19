local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Settings");
local l_ExperienceStateCaptureService_0 = game:GetService("ExperienceStateCaptureService");
local l_SafetyService_0 = game:GetService("SafetyService");
local v6 = require(l_script_FirstAncestor_0.Integrations.Constants);
local v7 = require(l_CorePackages_0.Workspace.Packages.SettingsService);
local l_ValueChangedSignal_0 = v7.ValueChangedSignal;
local l_AvailabilitySignal_0 = v7.AvailabilitySignal;
local l_SettingEnum_0 = v7.SettingEnum;
local v11 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_LAYOUT_ORDER_0 = v6.GAMESETTINGS.LAYOUT_ORDER;
local function _() --[[ Line: 24 ]] --[[ Name: TranslationFeedbackValue ]]
    -- upvalues: l_ValueChangedSignal_0 (copy), l_ExperienceStateCaptureService_0 (copy), l_SafetyService_0 (copy)
    local v13 = l_ValueChangedSignal_0.new();
    v13:connect(function() --[[ Line: 27 ]]
        -- upvalues: l_ExperienceStateCaptureService_0 (ref), l_SafetyService_0 (ref)
        if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_ExperienceStateCaptureService_0:CanEnterCaptureMode() then
            return;
        else
            local v14 = require(script.Parent.Parent.Parent.SettingsHub);
            if v14 then
                v14:SetVisibility(false);
            end;
            if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
                l_SafetyService_0.IsCaptureModeForReport = false;
            end;
            if game:GetEngineFeature("CaptureModeEnabled") then
                l_ExperienceStateCaptureService_0:ToggleCaptureMode();
            end;
            return;
        end;
    end);
    return v13;
end;
local function _() --[[ Line: 53 ]] --[[ Name: TranslationFeedbackAvailability ]]
    -- upvalues: l_AvailabilitySignal_0 (copy), l_RunService_0 (copy), v11 (copy)
    local v16 = l_AvailabilitySignal_0.new(true);
    if l_RunService_0:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or v11 then
        v16:set(false);
    end;
    return v16;
end;
local v18 = l_ValueChangedSignal_0.new();
v18:connect(function() --[[ Line: 27 ]]
    -- upvalues: l_ExperienceStateCaptureService_0 (copy), l_SafetyService_0 (copy)
    if game:GetEngineFeature("ExperienceStateCaptureMinMemEnabled") and not l_ExperienceStateCaptureService_0:CanEnterCaptureMode() then
        return;
    else
        local v19 = require(script.Parent.Parent.Parent.SettingsHub);
        if v19 then
            v19:SetVisibility(false);
        end;
        if game:GetEngineFeature("SafetyServiceCaptureModeReportProp") then
            l_SafetyService_0.IsCaptureModeForReport = false;
        end;
        if game:GetEngineFeature("CaptureModeEnabled") then
            l_ExperienceStateCaptureService_0:ToggleCaptureMode();
        end;
        return;
    end;
end);
local l_v18_0 = v18;
local v21 = l_AvailabilitySignal_0.new(true);
if l_RunService_0:IsStudio() or game:GetEngineFeature("CaptureModeEnabled") == false or v11 then
    v21:set(false);
end;
return {
    field_type = l_SettingEnum_0.TextButton, 
    id = "translation-feedback", 
    onActivated = l_v18_0, 
    label = "CoreScripts.InGameMenu.GameSettings.GiveTranslationFeedback", 
    text = "CoreScripts.InGameMenu.GameSettings.GiveFeedback", 
    layoutOrder = l_LAYOUT_ORDER_0.FeedbackModeButton, 
    alreadyLocalized = false, 
    availability = v21
};