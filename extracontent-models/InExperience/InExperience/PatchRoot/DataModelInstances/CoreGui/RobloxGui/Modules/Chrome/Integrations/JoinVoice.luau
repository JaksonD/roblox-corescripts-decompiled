local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v6 = require(l_RobloxGui_0.Modules.VoiceChat.Constants);
local v7 = require(l_script_FirstAncestor_0.Integrations.CommonIcon);
local v8 = require(l_script_FirstAncestor_0.Flags.FFlagEnableUnibarTooltipQueue)();
local v9 = require(l_script_FirstAncestor_0.Integrations.CommonFtuxTooltip);
local v10 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local l_VOICE_JOIN_PROGRESS_0 = v6.VOICE_JOIN_PROGRESS;
local v12 = require(l_RobloxGui_0.Modules.VoiceChatPrompt.PromptType);
local l_observeCurrentContextId_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Utils.observeCurrentContextId;
local l_Constants_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChatCore).Constants;
local l_GetIcon_0 = require(l_CorePackages_0.Workspace.Packages.VoiceChat).Utils.GetIcon;
local l_CONTEXT_ID_0 = require(l_CorePackages_0.Workspace.Packages.CrossExperience).Constants.AUDIO_FOCUS_MANAGEMENT.CEV.CONTEXT_ID;
local v17 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableConnectDisconnectInSettingsAndChrome);
local l_GetFFlagIntegratePhoneUpsellJoinVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIntegratePhoneUpsellJoinVoice;
local l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice;
local l_GetFFlagEnableVoiceUxUpdates_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableVoiceUxUpdates;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v22 = game:DefineFastFlag("JoinVoiceHideWhenPartyVoiceFocused", false);
local v23 = game:DefineFastFlag("CheckShouldShowJoinVoiceInEvent", false);
local v24 = game:DefineFastFlag("ReplaceJoinVoiceIconToMuted", false);
local v25 = game:DefineFastInt("JoinVoiceFtuxShowDelayMs", 1000);
local v26 = game:DefineFastInt("JoinVoiceFtuxDismissDelayMs", 5000);
local v27 = game:DefineFastInt("UnibarJoinVoiceTooltipPriority", 1000);
local v28 = game:DefineFastFlag("EnableChromeJoinVoiceTooltip", false);
local v29 = require(l_script_FirstAncestor_0.Service);
local v30 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.UnibarStyle);
local v31 = false;
local v32 = false;
local l_Unavailable_0 = v29.AvailabilitySignal.Unavailable;
getShouldShowJoinVoiceTooltip = function() --[[ Line: 49 ]] --[[ Name: getShouldShowJoinVoiceTooltip ]]
    -- upvalues: l_default_0 (copy), l_Constants_0 (copy), v32 (ref)
    local v34 = l_default_0:HasSeamlessVoiceFeature(l_Constants_0.SeamlessVoiceFeatures.LikelySpeakingBubblesRemoved);
    local v35 = l_default_0:FetchAgeVerificationOverlay();
    local v36 = not v32 and v34 and v35 and v35.showJoinVoiceUpsellTooltip;
    v32 = true;
    return v36;
end;
local v37 = nil;
v37 = v29:register({
    initialAvailability = v29.AvailabilitySignal.Unavailable, 
    id = "join_voice", 
    label = "CoreScripts.TopBar.JoinVoice", 
    activated = function() --[[ Line: 67 ]] --[[ Name: activated ]]
        -- upvalues: l_GetFFlagIntegratePhoneUpsellJoinVoice_0 (copy), l_RobloxGui_0 (copy), l_default_0 (copy)
        local v38 = if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then require(l_RobloxGui_0.Modules.Settings.SettingsHub) else nil;
        l_default_0:JoinVoice(v38);
    end, 
    components = {
        Icon = function() --[[ Line: 74 ]] --[[ Name: Icon ]]
            -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), v30 (copy), v10 (copy), v24 (copy), l_GetIcon_0 (copy), v28 (copy), v3 (copy), v4 (copy), v7 (copy), v9 (copy), v8 (copy), v27 (copy), v25 (copy), v26 (copy), l_default_0 (copy), v6 (copy)
            local _ = nil;
            local v40 = nil;
            v40 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then v30.use().ICON_SIZE else v10.ICON_SIZE;
            local v41 = "icons/controls/publicAudioJoin";
            if v24 then
                v41 = l_GetIcon_0("Muted", "MicLight");
            end;
            if v28 then
                local v42 = getShouldShowJoinVoiceTooltip();
                return v3.createElement(v4.View, {
                    Size = UDim2.new(0, v40, 0, v40)
                }, {
                    Icon = v7(v41), 
                    Tooltip = v9({
                        id = v8 and "JOIN_VOICE" or nil, 
                        priority = if v8 then v27 else nil, 
                        isIconVisible = v42, 
                        dismissOnOutsideInput = true, 
                        headerKey = "CoreScripts.FTUX.Heading.JoinVoice", 
                        bodyKey = "CoreScripts.FTUX.Label.JoinVoiceDescription", 
                        showDelay = v25, 
                        dismissDelay = v26, 
                        onDismissed = function() --[[ Line: 102 ]] --[[ Name: onDismissed ]]
                            -- upvalues: l_default_0 (ref), v6 (ref)
                            pcall(function() --[[ Line: 103 ]]
                                -- upvalues: l_default_0 (ref), v6 (ref)
                                l_default_0:RecordUserSeenModal(v6.MODAL_IDS.IN_EXP_JOIN_VOICE_UPSELL);
                            end);
                        end
                    })
                });
            else
                return (v7(v41));
            end;
        end
    }
});
if l_GetFFlagFixSeamlessVoiceIntegrationWithPrivateVoice_0() then
    return v37;
else
    local function _(v43) --[[ Line: 121 ]] --[[ Name: setAvailability ]]
        -- upvalues: l_Unavailable_0 (ref), v31 (ref), v29 (copy), v37 (ref)
        l_Unavailable_0 = v43;
        if not v31 then
            if v43 == v29.AvailabilitySignal.Available then
                v37.availability:available();
                return;
            elseif v43 == v29.AvailabilitySignal.Unavailable then
                v37.availability:unavailable();
            end;
        end;
    end;
    local function v48(v45) --[[ Line: 132 ]] --[[ Name: HideOrShowJoinVoiceButton ]]
        -- upvalues: l_VOICE_JOIN_PROGRESS_0 (copy), v23 (copy), l_default_0 (copy), v22 (copy), v29 (copy), l_Unavailable_0 (ref), v31 (ref), v37 (ref), v6 (copy), v12 (copy)
        if v45 == l_VOICE_JOIN_PROGRESS_0.Suspended and (not v23 or l_default_0:ShouldShowJoinVoice()) then
            if v22 then
                local l_Available_0 = v29.AvailabilitySignal.Available;
                l_Unavailable_0 = l_Available_0;
                if not v31 then
                    if l_Available_0 == v29.AvailabilitySignal.Available then
                        v37.availability:available();
                        return;
                    elseif l_Available_0 == v29.AvailabilitySignal.Unavailable then
                        v37.availability:unavailable();
                        return;
                    end;
                end;
            else
                v37.availability:available();
                return;
            end;
        elseif v45 == l_VOICE_JOIN_PROGRESS_0.Joined then
            if v22 then
                local l_Unavailable_1 = v29.AvailabilitySignal.Unavailable;
                l_Unavailable_0 = l_Unavailable_1;
                if not v31 then
                    if l_Unavailable_1 == v29.AvailabilitySignal.Available then
                        v37.availability:available();
                    elseif l_Unavailable_1 == v29.AvailabilitySignal.Unavailable then
                        v37.availability:unavailable();
                    end;
                end;
            else
                v37.availability:unavailable();
            end;
            if l_default_0.inExpUpsellEntrypoint == v6.IN_EXP_UPSELL_ENTRYPOINTS.JOIN_VOICE then
                l_default_0:ToggleMic();
                l_default_0:showPrompt(v12.VoiceConsentAcceptedToast);
            end;
        end;
    end;
    if v22 then
        l_observeCurrentContextId_0(function(v49) --[[ Line: 157 ]]
            -- upvalues: l_CONTEXT_ID_0 (copy), v31 (ref), l_Unavailable_0 (ref), v37 (ref), v29 (copy)
            local v50 = v49 == l_CONTEXT_ID_0;
            if v31 ~= v50 then
                v31 = v50;
                if v31 then
                    l_Unavailable_0 = v37.availability:get();
                    v37.availability:unavailable();
                    return;
                else
                    local l_l_Unavailable_0_0 = l_Unavailable_0;
                    l_Unavailable_0 = l_l_Unavailable_0_0;
                    if not v31 then
                        if l_l_Unavailable_0_0 == v29.AvailabilitySignal.Available then
                            v37.availability:available();
                            return;
                        elseif l_l_Unavailable_0_0 == v29.AvailabilitySignal.Unavailable then
                            v37.availability:unavailable();
                        end;
                    end;
                end;
            end;
        end);
    end;
    if game:GetEngineFeature("VoiceChatSupported") then
        if l_GetFFlagIntegratePhoneUpsellJoinVoice_0() then
            task.spawn(function() --[[ Line: 173 ]]
                -- upvalues: l_default_0 (copy), v22 (copy), v29 (copy), l_Unavailable_0 (ref), v31 (ref), v37 (ref), v48 (copy)
                if l_default_0:ShouldShowJoinVoice() then
                    if v22 then
                        local l_Available_1 = v29.AvailabilitySignal.Available;
                        l_Unavailable_0 = l_Available_1;
                        if not v31 then
                            if l_Available_1 == v29.AvailabilitySignal.Available then
                                v37.availability:available();
                            elseif l_Available_1 == v29.AvailabilitySignal.Unavailable then
                                v37.availability:unavailable();
                            end;
                        end;
                    else
                        v37.availability:available();
                    end;
                end;
                l_default_0.VoiceJoinProgressChanged.Event:Connect(v48);
            end);
        else
            if l_default_0:ShouldShowJoinVoice() then
                if v22 then
                    local l_Available_2 = v29.AvailabilitySignal.Available;
                    l_Unavailable_0 = l_Available_2;
                    if not v31 then
                        if l_Available_2 == v29.AvailabilitySignal.Available then
                            v37.availability:available();
                        elseif l_Available_2 == v29.AvailabilitySignal.Unavailable then
                            v37.availability:unavailable();
                        end;
                    end;
                else
                    v37.availability:available();
                end;
            end;
            l_default_0.VoiceJoinProgressChanged.Event:Connect(v48);
        end;
        if v17() then
            if not l_GetFFlagEnableVoiceUxUpdates_0() then
                l_default_0.showVoiceUI.Event:Connect(function() --[[ Line: 199 ]]
                    -- upvalues: v22 (copy), v29 (copy), l_Unavailable_0 (ref), v31 (ref), v37 (ref)
                    if v22 then
                        local l_Unavailable_2 = v29.AvailabilitySignal.Unavailable;
                        l_Unavailable_0 = l_Unavailable_2;
                        if not v31 then
                            if l_Unavailable_2 == v29.AvailabilitySignal.Available then
                                v37.availability:available();
                                return;
                            elseif l_Unavailable_2 == v29.AvailabilitySignal.Unavailable then
                                v37.availability:unavailable();
                                return;
                            end;
                        end;
                    else
                        v37.availability:unavailable();
                    end;
                end);
                l_default_0.hideVoiceUI.Event:Connect(function() --[[ Line: 206 ]]
                    -- upvalues: v22 (copy), v29 (copy), l_Unavailable_0 (ref), v31 (ref), v37 (ref)
                    if v22 then
                        local l_Available_3 = v29.AvailabilitySignal.Available;
                        l_Unavailable_0 = l_Available_3;
                        if not v31 then
                            if l_Available_3 == v29.AvailabilitySignal.Available then
                                v37.availability:available();
                                return;
                            elseif l_Available_3 == v29.AvailabilitySignal.Unavailable then
                                v37.availability:unavailable();
                                return;
                            end;
                        end;
                    else
                        v37.availability:available();
                    end;
                end);
            end;
        else
            l_default_0.VoiceJoinProgressChanged.Event:Connect(v48);
        end;
    end;
    return v37;
end;