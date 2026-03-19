local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_SocialService_0 = game:GetService("SocialService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Modules_0 = l_CoreGui_0:WaitForChild("RobloxGui").Modules;
local l_Settings_0 = l_Modules_0.Settings;
local l_ShareGame_0 = l_Settings_0.Pages.ShareGame;
local v8 = require(l_Modules_0.Flags.GetFFlagFixSettingshubImportOrder);
local v9 = nil;
if not v8() then
    v9 = require(l_Settings_0.SettingsHub);
end;
local v10 = require(l_Modules_0.Flags.GetFFlagEnableNewInviteMenuCustomization);
local v11 = require(l_Modules_0.Flags.GetFFlagEnableInvitePromptLoadingState);
local v12 = require(l_Modules_0.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification);
local v13 = game:DefineFastFlag("LuaEnableGameInviteModalInvitePromptV2", false);
local l_IXPServiceWrapper_0 = require(l_CorePackages_0.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper;
local l_Diag_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.Diag;
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local l_GameInviteAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.GameInvite).GameInviteAnalytics;
local l_GetFStringGameInviteMenuLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
if v12() then
    v19 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
    v20 = v19.GameInviteModalManager;
    v21 = v19.GameInviteInviteExperimentVariant;
    v22 = v19.GetCustomizedInvitePromptTrigger;
    v23 = v19.GameInviteConstants;
    v24 = v19.GameInviteAnalyticsManager;
end;
local v25 = l_GameInviteAnalytics_0.new():withEventStream((l_EventStream_0.new(l_RbxAnalyticsService_0))):withDiag(l_Diag_0.new(l_RbxAnalyticsService_0)):withButtonName(l_GameInviteAnalytics_0.ButtonName.ModalPrompt);
local v26 = require(l_ShareGame_0.InviteToGamePrompt).new(l_CoreGui_0):withSocialServiceAndLocalPlayer(l_SocialService_0, l_Players_0.LocalPlayer):withAnalytics(v25);
local v27 = require(l_ShareGame_0.Thunks.ApiGetCanSendAndCanCustomizeInvites);
local v28 = require(l_ShareGame_0.getCustomizedInvitePromptParams);
local function _(v29) --[[ Line: 57 ]] --[[ Name: canSendGameInviteAsync ]]
    -- upvalues: l_SocialService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 58 ]]
        -- upvalues: l_SocialService_0 (ref), v29 (copy)
        return l_SocialService_0:CanSendGameInviteAsync(v29);
    end);
    return l_status_0 and l_result_0;
end;
l_SocialService_0.PromptInviteRequested:Connect(function(v33, v34) --[[ Line: 64 ]]
    -- upvalues: l_GetFStringGameInviteMenuLayer_0 (copy), v12 (copy), v13 (copy), l_IXPServiceWrapper_0 (copy), v21 (ref), l_Players_0 (copy), v8 (copy), v9 (ref), l_Settings_0 (copy), l_SocialService_0 (copy), v20 (ref), v22 (ref), v23 (ref), v24 (ref), v10 (copy), v11 (copy), v26 (copy), v28 (copy), v27 (copy)
    local v35 = false;
    local v36 = false;
    local v37 = l_GetFStringGameInviteMenuLayer_0();
    if v12() and v13 then
        local l_l_IXPServiceWrapper_0_LayerData_0 = l_IXPServiceWrapper_0:GetLayerData(v37);
        l_IXPServiceWrapper_0:LogUserLayerExposure(v37);
        v36 = (l_l_IXPServiceWrapper_0_LayerData_0 and (l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v21.UxRefresh or l_l_IXPServiceWrapper_0_LayerData_0.inExperienceGameInviteUXRefresh2023 == v21.InviteLimit)) == true;
    end;
    if v36 then
        if v33 ~= l_Players_0.LocalPlayer then
            return;
        else
            if v8() then
                v9 = require(l_Settings_0.SettingsHub);
            end;
            if v9:GetVisibility() then
                if l_Players_0 and l_Players_0.LocalPlayer then
                    l_SocialService_0:InvokeGameInvitePromptClosed(l_Players_0.LocalPlayer, {});
                end;
                return;
            else
                local v39 = v34 or nil;
                if v20 then
                    local v40 = v22(v39);
                    if v40 == v23.Triggers.DeveloperMultiple then
                        v24:withButtonName(v24.ButtonName.ModalPrompt);
                        v24:inputShareGameEntryPoint();
                        v20:openModal({
                            trigger = v40
                        }, v39);
                        return;
                    end;
                end;
            end;
        end;
    end;
    if v10() then
        if v33 ~= l_Players_0.LocalPlayer then
            return;
        else
            local v41 = v11();
            if v41 then
                v26:show({
                    isLoading = true
                });
            end;
            local v42 = v34 or nil;
            local v43 = v28(v42, v27);
            if v43 then
                v26:show(v43);
                return;
            elseif v41 then
                v26:hide();
                return;
            end;
        end;
    else
        if v33 == l_Players_0.LocalPlayer then
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 58 ]]
                -- upvalues: l_SocialService_0 (ref), v33 (copy)
                return l_SocialService_0:CanSendGameInviteAsync(v33);
            end);
            if l_status_1 and l_result_1 then
                v26:show();
                v35 = true;
            end;
        end;
        if not v35 then
            return;
        end;
    end;
    v35 = false;
end);