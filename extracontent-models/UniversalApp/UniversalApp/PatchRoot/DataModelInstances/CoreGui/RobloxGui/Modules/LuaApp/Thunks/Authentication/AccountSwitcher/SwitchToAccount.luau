local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Http.Requests.AccountSwitcher.SwitchAccount);
local v3 = require(script.Parent.Parent.ClearApp);
local v4 = require(script.Parent.Parent.AppStorageUtilities);
local v5 = require(script.Parent.Parent.User);
local v6 = require(l_CorePackages_0.Packages.Promise);
local v7 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_ExperimentCacheManager_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentCacheManager).ExperimentCacheManager;
local v9 = require(l_Modules_0.LuaApp.Flags.GetFFlagDebugResetSurveyStorage);
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v11 = require(l_Modules_0.LuaApp.Components.OnPlatformSurveys.CsatSurveyConstants);
local v12 = require(l_Modules_0.LuaApp.Enum.LaunchContext);
local v13 = require(l_Modules_0.LuaApp.Constants);
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v15 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local v16 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local v17 = require(script.Parent.Parent.OpenAccountSwitchingErrorOverlay);
local l_GuiService_0 = game:GetService("GuiService");
local v19 = require(script.Parent.Parent.Parent.CloseCentralOverlay);
local v20 = require(l_Modules_0.LuaApp.Thunks.Authentication.ResetAppState);
local v21 = require(l_Modules_0.LuaApp.Thunks.Authentication.LaunchApp);
local v22 = require(l_Modules_0.LuaApp.Flags.FFlagLuaEnableDidSwitchAccount);
local v23 = game:DefineFastFlag("UseResetAppStateForSwitchToAccount2", false);
local l_GetFFlagEnableAccountSwitcherFoundationDesign_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign;
return function(v25, v26, v27, v28, v29) --[[ Line: 30 ]]
    -- upvalues: v4 (copy), v5 (copy), v19 (copy), v17 (copy), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (copy), v13 (copy), v2 (copy), v6 (copy), v23 (copy), v20 (copy), v3 (copy), l_ExperimentCacheManager_0 (copy), v9 (copy), l_AppStorageService_0 (copy), v11 (copy), l_MemStorageService_0 (copy), v16 (copy), v15 (copy), v22 (copy), l_GuiService_0 (copy), v7 (copy), v21 (copy), v12 (copy)
    return function(v30) --[[ Line: 31 ]]
        -- upvalues: v4 (ref), v5 (ref), v19 (ref), v17 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v13 (ref), v2 (ref), v25 (copy), v26 (copy), v6 (ref), v23 (ref), v20 (ref), v3 (ref), l_ExperimentCacheManager_0 (ref), v9 (ref), l_AppStorageService_0 (ref), v11 (ref), l_MemStorageService_0 (ref), v16 (ref), v15 (ref), v22 (ref), l_GuiService_0 (ref), v7 (ref), v21 (ref), v28 (copy), v29 (copy), v27 (copy), v12 (ref)
        local v31 = v4.getAccountBlob();
        local v32 = tostring(v5.fromLocalStorage().userId);
        local function v33() --[[ Line: 35 ]]
            -- upvalues: v30 (copy), v19 (ref)
            v30:dispatch(v19());
        end;
        local function _() --[[ Line: 39 ]]
            -- upvalues: v30 (copy), v17 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v33 (copy), v13 (ref)
            v30:dispatch(v17(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" or "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v33, nil, v13.Auth.AccountSwitcherSwitchError));
        end;
        return v2(v25, v26, v31, v32):andThen(function(v35) --[[ Line: 55 ]]
            -- upvalues: v6 (ref), v4 (ref), v30 (copy), v17 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v33 (copy), v13 (ref), v23 (ref), v20 (ref), v3 (ref), v5 (ref), l_ExperimentCacheManager_0 (ref), v9 (ref), l_AppStorageService_0 (ref), v11 (ref), l_MemStorageService_0 (ref), v16 (ref), v15 (ref)
            if v35 == nil or v35.responseBody == nil or v35.responseBody.encrypted_users_data_blob == nil then
                return v6.reject(false);
            else
                local l_encrypted_users_data_blob_0 = v35.responseBody.encrypted_users_data_blob;
                v4.setAccountBlob(l_encrypted_users_data_blob_0);
                v4.flush();
                if v35.responseBody.errors ~= nil and #v35.responseBody.errors > 0 then
                    v30:dispatch(v17(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" or "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v33, nil, v13.Auth.AccountSwitcherSwitchError));
                    return v6.reject(false);
                elseif l_encrypted_users_data_blob_0 ~= nil then
                    if v23 then
                        v30:dispatch(v20());
                    else
                        v30:dispatch(v3());
                        v5.clearLocalStorage();
                        l_ExperimentCacheManager_0.default:clearCache();
                        if v9() then
                            l_AppStorageService_0:SetItem(v11.LOCAL_STORAGE_KEY_CSAT_SURVEY_COMPLETED_IDS, "{}");
                        end;
                        v4.setRobloxLocaleId("");
                        v4.setDiscoveryClientFallbackCache("");
                        l_MemStorageService_0:Fire(v16.ThemeUpdate, "dark");
                        l_MemStorageService_0:SetItem(v16.RobuxBalance, "0");
                        l_MemStorageService_0:SetItem(v16.RobuxBalanceLocalized, "--");
                        v15.clearUserLayers();
                    end;
                    v4.setAccountSwitchStatus(v13.Auth.AccountSwitcherSwitchedStatus);
                    return v6.resolve(true);
                else
                    return v6.reject(false);
                end;
            end;
        end, function(_) --[[ Line: 93 ]]
            -- upvalues: v30 (copy), v17 (ref), l_GetFFlagEnableAccountSwitcherFoundationDesign_0 (ref), v33 (copy), v13 (ref), v6 (ref)
            v30:dispatch(v17(l_GetFFlagEnableAccountSwitcherFoundationDesign_0() and "Authentication.AccountSwitch.Header.CantSwitchAccountsSentenceCase" or "Authentication.AccountSwitch.Header.CantSwitchAccounts", "Authentication.AccountSwitch.Description.TryLoggingInDirectly.2", "CommonUI.Messages.Action.OK", "", v33, nil, v13.Auth.AccountSwitcherSwitchError));
            return v6.reject(false);
        end):andThen(function(v38) --[[ Line: 97 ]]
            -- upvalues: v32 (copy), v22 (ref), l_GuiService_0 (ref), v7 (ref), v30 (copy), v21 (ref), v25 (ref), v28 (ref), v29 (ref), v27 (ref), v12 (ref)
            if v38 then
                if v32 and v32 ~= "-1" and v32 ~= "" then
                    if v22 then
                        l_GuiService_0:BroadcastNotification("", v7.DID_SWITCH_ACCOUNT);
                        return;
                    else
                        l_GuiService_0:BroadcastNotification("", v7.DID_LOG_OUT);
                        return;
                    end;
                else
                    v30:dispatch(v21(v25, v28, v29, v27, v12.Login));
                end;
            end;
        end, function(_) --[[ Line: 113 ]]
            -- upvalues: v6 (ref)
            return v6.reject(false);
        end);
    end;
end;