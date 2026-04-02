local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v7 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v8 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local v9 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local l_VOICE_JOIN_PROGRESS_0 = v6.VOICE_JOIN_PROGRESS;
local v11 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_observeCurrentContextId_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Utils.observeCurrentContextId;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore).Constants;
local l_GetIcon_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Utils.GetIcon;
local l_CONTEXT_ID_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
local v16 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local l_GetFFlagIntegratePhoneUpsellJoinVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice;
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagEnableVoiceUxUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v21 = game:DefineFastFlag("CheckShouldShowJoinVoiceInEvent", false);
local v22 = game:DefineFastFlag("ReplaceJoinVoiceIconToMuted", false);
local v23 = game:DefineFastInt("JoinVoiceFtuxShowDelayMs", 1000);
local v24 = game:DefineFastInt("JoinVoiceFtuxDismissDelayMs", 5000);
local v25 = game:DefineFastInt("UnibarJoinVoiceTooltipPriority", 1000);
local v26 = game:DefineFastFlag("EnableChromeJoinVoiceTooltip", false);
local v27 = require(l_script_FirstAncestor_0.Service);
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local v29 = false;
local v30 = false;
local l_Unavailable_0 = v27.AvailabilitySignal.Unavailable;
getShouldShowJoinVoiceTooltip = function() --[[ Line: 46 ]] --[[ Name: getShouldShowJoinVoiceTooltip ]]
    -- upvalues: l_default_0 (copy), l_Constants_0 (copy), v30 (ref)
    local v32 = l_default_0:HasSeamlessVoiceFeature(l_Constants_0.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved);
    local v33 = l_default_0:FetchAgeVerificationOverlay();
    local v34 = not v30 and v32 and v33 and v33.showJoinVoiceUpsellTooltip;
    v30 = true;
    return v34;
end;
local v35 = nil;
v35 = v27:register({
    initialAvailability = v27.AvailabilitySignal.Unavailable, 
    id = "join_voice", 
    label = "CoreScripts.TopBar.JoinVoice", 
    activated = function() --[[ Line: 64 ]] --[[ Name: activated ]]
        -- upvalues: l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_RobloxGui_0 (copy), l_default_0 (copy)
        local v36 = if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then require(l_RobloxGui_0.Modules.Settings.SettingsHub) else nil;
        l_default_0:JoinVoice(v36);
    end, 
    components = {
        Icon = function() --[[ Line: 71 ]] --[[ Name: Icon ]]
            -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v9 (copy), v22 (copy), l_GetIcon_0 (copy), v26 (copy), v3 (copy), v4 (copy), v7 (copy), v8 (copy), v25 (copy), v23 (copy), v24 (copy), l_default_0 (copy), v6 (copy)
            local _ = nil;
            local v38 = nil;
            v38 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_SIZE else v9.ICON_SIZE;
            local v39 = "icons/controls/publicAudioJoin";
            if v22 then
                v39 = l_GetIcon_0("Muted", "MicLight");
            end;
            if v26 then
                local v40 = getShouldShowJoinVoiceTooltip();
                return v3.createElement(v4.View, {
                    Size = UDim2.new(0, v38, 0, v38)
                }, {
                    Icon = v7(v39), 
                    Tooltip = v8({
                        id = "JOIN_VOICE", 
                        priority = v25, 
                        isIconVisible = v40, 
                        dismissOnOutsideInput = true, 
                        headerKey = "CoreScripts.FTUX.Heading.JoinVoice", 
                        bodyKey = "CoreScripts.FTUX.Label.JoinVoiceDescription", 
                        showDelay = v23, 
                        dismissDelay = v24, 
                        onDismissed = function() --[[ Line: 99 ]] --[[ Name: onDismissed ]]
                            -- upvalues: l_default_0 (ref), v6 (ref)
                            pcall(function() --[[ Line: 100 ]]
                                -- upvalues: l_default_0 (ref), v6 (ref)
                                l_default_0:RecordUserSeenModal(v6.MODAL_IDS.IN_EXP_JOIN_VOICE_UPSELL);
                            end);
                        end
                    })
                });
            else
                return (v7(v39));
            end;
        end
    }
});
if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
    return v35;
else
    local function _(v41) --[[ Line: 118 ]] --[[ Name: setAvailability ]]
        -- upvalues: l_Unavailable_0 (ref), v29 (ref), v27 (copy), v35 (ref)
        l_Unavailable_0 = v41;
        if not v29 then
            if v41 == v27.AvailabilitySignal.Available then
                v35.availability:available();
                return;
            elseif v41 == v27.AvailabilitySignal.Unavailable then
                v35.availability:unavailable();
            end;
        end;
    end;
    local function v46(v43) --[[ Line: 129 ]] --[[ Name: HideOrShowJoinVoiceButton ]]
        -- upvalues: l_VOICE_JOIN_PROGRESS_0 (copy), v21 (copy), l_default_0 (copy), v27 (copy), l_Unavailable_0 (ref), v29 (ref), v35 (ref), v6 (copy), v11 (copy)
        if v43 == l_VOICE_JOIN_PROGRESS_0.Suspended and (not v21 or l_default_0:ShouldShowJoinVoice()) then
            local l_Available_0 = v27.AvailabilitySignal.Available;
            l_Unavailable_0 = l_Available_0;
            if not v29 then
                if l_Available_0 == v27.AvailabilitySignal.Available then
                    v35.availability:available();
                    return;
                elseif l_Available_0 == v27.AvailabilitySignal.Unavailable then
                    v35.availability:unavailable();
                    return;
                end;
            end;
        elseif v43 == l_VOICE_JOIN_PROGRESS_0.Joined then
            local l_Unavailable_1 = v27.AvailabilitySignal.Unavailable;
            l_Unavailable_0 = l_Unavailable_1;
            if not v29 then
                if l_Unavailable_1 == v27.AvailabilitySignal.Available then
                    v35.availability:available();
                elseif l_Unavailable_1 == v27.AvailabilitySignal.Unavailable then
                    v35.availability:unavailable();
                end;
            end;
            if l_default_0.inExpUpsellEntrypoint == v6.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                l_default_0:ToggleMic();
                l_default_0:showPrompt(v11.VoiceConsentAcceptedToast);
            end;
        end;
    end;
    l_observeCurrentContextId_0(function(v47) --[[ Line: 144 ]]
        -- upvalues: l_CONTEXT_ID_0 (copy), v29 (ref), l_Unavailable_0 (ref), v35 (ref), v27 (copy)
        local v48 = v47 == l_CONTEXT_ID_0;
        if v29 ~= v48 then
            v29 = v48;
            if v29 then
                l_Unavailable_0 = v35.availability:get();
                v35.availability:unavailable();
                return;
            else
                local l_l_Unavailable_0_0 = l_Unavailable_0;
                l_Unavailable_0 = l_l_Unavailable_0_0;
                if not v29 then
                    if l_l_Unavailable_0_0 == v27.AvailabilitySignal.Available then
                        v35.availability:available();
                        return;
                    elseif l_l_Unavailable_0_0 == v27.AvailabilitySignal.Unavailable then
                        v35.availability:unavailable();
                    end;
                end;
            end;
        end;
    end);
    if game:GetEngineFeature("VoiceChatSupported") then
        if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then
            task.spawn(function() --[[ Line: 159 ]]
                -- upvalues: l_default_0 (copy), v27 (copy), l_Unavailable_0 (ref), v29 (ref), v35 (ref), v46 (copy)
                if l_default_0:ShouldShowJoinVoice() then
                    local l_Available_1 = v27.AvailabilitySignal.Available;
                    l_Unavailable_0 = l_Available_1;
                    if not v29 then
                        if l_Available_1 == v27.AvailabilitySignal.Available then
                            v35.availability:available();
                        elseif l_Available_1 == v27.AvailabilitySignal.Unavailable then
                            v35.availability:unavailable();
                        end;
                    end;
                end;
                l_default_0.VoiceJoinProgressChanged.Event:Connect(v46);
            end);
        else
            if l_default_0:ShouldShowJoinVoice() then
                local l_Available_2 = v27.AvailabilitySignal.Available;
                l_Unavailable_0 = l_Available_2;
                if not v29 then
                    if l_Available_2 == v27.AvailabilitySignal.Available then
                        v35.availability:available();
                    elseif l_Available_2 == v27.AvailabilitySignal.Unavailable then
                        v35.availability:unavailable();
                    end;
                end;
            end;
            l_default_0.VoiceJoinProgressChanged.Event:Connect(v46);
        end;
        if v16() then
            if not l_GetFFlagEnableVoiceUxUpdates_0() then
                l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 175 ]]
                    -- upvalues: v27 (copy), l_Unavailable_0 (ref), v29 (ref), v35 (ref)
                    local l_Unavailable_2 = v27.AvailabilitySignal.Unavailable;
                    l_Unavailable_0 = l_Unavailable_2;
                    if not v29 then
                        if l_Unavailable_2 == v27.AvailabilitySignal.Available then
                            v35.availability:available();
                            return;
                        elseif l_Unavailable_2 == v27.AvailabilitySignal.Unavailable then
                            v35.availability:unavailable();
                        end;
                    end;
                end);
                l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 178 ]]
                    -- upvalues: v27 (copy), l_Unavailable_0 (ref), v29 (ref), v35 (ref)
                    local l_Available_3 = v27.AvailabilitySignal.Available;
                    l_Unavailable_0 = l_Available_3;
                    if not v29 then
                        if l_Available_3 == v27.AvailabilitySignal.Available then
                            v35.availability:available();
                            return;
                        elseif l_Available_3 == v27.AvailabilitySignal.Unavailable then
                            v35.availability:unavailable();
                        end;
                    end;
                end);
            end;
        else
            l_default_0.VoiceJoinProgressChanged.Event:Connect(v46);
        end;
    end;
    return v35;
end;