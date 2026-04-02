local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Players_0 = game:GetService("Players");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v5 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
local v7 = require(l_RobloxGui_0.Modules.VoiceChat.Components.VoiceIndicatorFunc);
local v8 = require(l_RobloxGui_0.Modules.Settings.Analytics.VoiceAnalytics);
local v9 = require(l_RobloxGui_0.Modules.Flags.GetFFlagEnableVoiceMuteAnalytics);
local l_game_EngineFeature_0 = game:GetEngineFeature("AudioFocusManagement");
local v11 = game:DefineFastFlag("EnableChromeAudioFocusManagement", false);
local v12 = l_game_EngineFeature_0 and v11;
local l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 = require(l_script_FirstAncestor_0.ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider;
local v14 = require(l_script_FirstAncestor_0.Service);
local v15 = require(l_script_FirstAncestor_0.Integrations.RedVoiceDot);
local l_UnibarStyle_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).UnibarStyle;
local v17 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local v18 = require(l_RobloxGui_0.Modules.SelfView.Analytics).new();
local v19 = nil;
if v9() then
    v19 = v8.new(l_RbxAnalyticsService_0, "Chrome.Integrations.ToggleMic");
end;
local v20 = nil;
local function v22(_) --[[ Line: 35 ]]
    -- upvalues: l_default_0 (copy), v18 (copy), v19 (ref)
    l_default_0:ToggleMic("ChromeIntegrationsToggleMic");
    v18:setLastCtx("SelfView");
    if v19 then
        v19:onToggleMuteSelf(not l_default_0.localMuted);
    end;
end;
local function v24(_) --[[ Line: 43 ]]
    -- upvalues: l_default_0 (copy)
    l_default_0:RejoinPreviousChannel();
end;
local function v26(_) --[[ Line: 47 ]]
    -- upvalues: l_default_0 (copy)
    l_default_0:ShowVoiceChatLoadingMessage();
end;
v20 = v14:register({
    id = "toggle_mic_mute", 
    label = "CoreScripts.TopBar.ToggleMic", 
    activated = v22, 
    components = {
        Icon = function(_) --[[ Line: 57 ]] --[[ Name: Icon ]]
            -- upvalues: l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 (copy), l_UnibarStyle_0 (copy), v17 (copy), v5 (copy), v7 (copy), l_Players_0 (copy), v15 (copy)
            local _ = nil;
            local v29 = nil;
            v29 = if l_FFlagTokenizeUnibarConstantsWithStyleProvider_0 then l_UnibarStyle_0.use().ICON_SIZE else v17.ICON_SIZE;
            return v5.createElement("Frame", {
                Size = UDim2.new(0, v29, 0, v29), 
                BackgroundTransparency = 1
            }, {
                v5.createElement(v7, {
                    userId = tostring(l_Players_0.LocalPlayer.UserId), 
                    hideOnError = false, 
                    iconStyle = "MicLight", 
                    selectable = false, 
                    size = UDim2.new(0, v29, 0, v29), 
                    showConnectingShimmer = true
                }), 
                (v5.createElement(v15, {
                    position = UDim2.new(1, -7, 1, -7)
                }))
            });
        end
    }
});
local function v30() --[[ Line: 86 ]] --[[ Name: applyVoiceUIVisibility ]]
    -- upvalues: l_default_0 (copy), v20 (ref)
    if l_default_0.voiceUIVisible then
        v20.availability:pinned();
        return;
    else
        v20.availability:unavailable();
        return;
    end;
end;
local function v35(_, v32) --[[ Line: 94 ]] --[[ Name: updateVoiceState ]]
    -- upvalues: v12 (copy), l_default_0 (copy), v20 (ref), v24 (copy), v26 (copy), v22 (copy)
    if v32 ~= Enum.VoiceChatState.Ended then
        if v12 then
            if l_default_0.voiceUIVisible then
                v20.availability:pinned();
            else
                v20.availability:unavailable();
            end;
        else
            v20.availability:pinned();
        end;
    else
        v20.availability:unavailable();
    end;
    local v33 = v32 == Enum.VoiceChatState.Failed;
    local v34 = true;
    if v32 ~= Enum.VoiceChatState.Joining then
        v34 = v32 == Enum.VoiceChatState.JoiningRetry;
    end;
    if v33 then
        v20.activated = v24;
        return;
    elseif v34 then
        v20.activated = v26;
        return;
    else
        v20.activated = v22;
        return;
    end;
end;
if game:GetEngineFeature("VoiceChatSupported") then
    task.spawn(function() --[[ Line: 120 ]]
        -- upvalues: l_default_0 (copy), v35 (copy), v12 (copy), v30 (copy), v20 (ref)
        l_default_0:asyncInit():andThen(function() --[[ Line: 122 ]]
            -- upvalues: l_default_0 (ref), v35 (ref), v12 (ref), v30 (ref), v20 (ref)
            local v36 = l_default_0:getService();
            if v36 then
                v36.StateChanged:Connect(v35);
                l_default_0:SetupParticipantListeners();
                if v12 then
                    l_default_0.showVoiceUI.Event:Connect(v30);
                    l_default_0.hideVoiceUI.Event:Connect(v30);
                    if l_default_0.voiceUIVisible then
                        v20.availability:pinned();
                        return;
                    else
                        v20.availability:unavailable();
                        return;
                    end;
                else
                    v20.availability:pinned();
                end;
            end;
        end):catch(function() --[[ Line: 136 ]]

        end);
    end);
end;
return v20;