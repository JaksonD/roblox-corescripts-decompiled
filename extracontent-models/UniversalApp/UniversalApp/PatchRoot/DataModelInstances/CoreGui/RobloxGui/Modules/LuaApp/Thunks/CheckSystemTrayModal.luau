local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableSystemTray");
local l_FFlagEnableSystemTrayModals_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSystemTrayModals;
local l_FFlagDebugAlwaysShowSystemTrayModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagDebugAlwaysShowSystemTrayModal;
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local v7 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v8 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function() --[[ Line: 13 ]]
    -- upvalues: l_FFlagEnableSystemTrayModals_0 (copy), l_game_EngineFeature_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_FFlagDebugAlwaysShowSystemTrayModal_0 (copy), v8 (copy), v7 (copy)
    return function(v9) --[[ Line: 14 ]]
        -- upvalues: l_FFlagEnableSystemTrayModals_0 (ref), l_game_EngineFeature_0 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_FFlagDebugAlwaysShowSystemTrayModal_0 (ref), v8 (ref), v7 (ref)
        if not l_FFlagEnableSystemTrayModals_0 then
            return false;
        elseif not l_game_EngineFeature_0 then
            return false;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
                -- upvalues: l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref)
                l_AppStorageService_0:GetItem(l_LocalStorageKey_0.MinimizeToTray);
            end);
            if not l_status_0 or l_result_0 == "false" then
                return false;
            else
                if l_FFlagDebugAlwaysShowSystemTrayModal_0 then
                    l_AppStorageService_0:SetItem("SystemTrayModalShown", "false");
                    l_AppStorageService_0:Flush();
                end;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 44 ]]
                    -- upvalues: l_AppStorageService_0 (ref)
                    return l_AppStorageService_0:GetItem("SystemTrayModalShown");
                end);
                if not if l_status_1 then l_result_1 == "true" else false then
                    pcall(function() --[[ Line: 51 ]]
                        -- upvalues: l_AppStorageService_0 (ref)
                        l_AppStorageService_0:SetItem("SystemTrayModalShown", "true");
                        l_AppStorageService_0:Flush();
                    end);
                    v9:dispatch(v8(v7.SystemTrayModal, {}));
                    return true;
                else
                    return false;
                end;
            end;
        end;
    end;
end;