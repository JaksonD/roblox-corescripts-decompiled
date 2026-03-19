local l_Parent_0 = script:FindFirstAncestor("PreHomePage").Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local v3 = require(l_Parent_0.Promise);
local l_FFlagDebugAlwaysShowSystemTrayModal_0 = require(l_Parent_0.SharedFlags).FFlagDebugAlwaysShowSystemTrayModal;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableSystemTray");
local l_Players_0 = game:GetService("Players");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
return function(_, v11, _) --[[ Line: 26 ]] --[[ Name: handleNotificationsPermissions ]]
    -- upvalues: l_LinkingProtocol_0 (copy), l_Logger_0 (copy), v3 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy), l_FFlagDebugAlwaysShowSystemTrayModal_0 (copy), l_AppStorageService_0 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    local v13 = false;
    if l_LinkingProtocol_0:getLastLuaURL() ~= nil then
        v13 = l_LinkingProtocol_0:getLastLuaURL() ~= "";
    end;
    if v13 then
        l_Logger_0:info("Skipping notifications upsell due to deep link");
        return v3.resolve(false);
    elseif not l_game_EngineFeature_0 then
        return v3.resolve(false);
    else
        local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
        if not l_LocalPlayer_0 or not l_LocalPlayer_0:GetUnder13() then
            return v3.resolve(false);
        else
            if l_FFlagDebugAlwaysShowSystemTrayModal_0 then
                l_AppStorageService_0:SetItem("DesktopNotificationsModalShown", "false");
                l_AppStorageService_0:Flush();
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 57 ]]
                -- upvalues: l_AppStorageService_0 (ref)
                return l_AppStorageService_0:GetItem("DesktopNotificationsModalShown");
            end);
            if not if l_status_0 then l_result_0 == "true" else false then
                pcall(function() --[[ Line: 64 ]]
                    -- upvalues: l_AppStorageService_0 (ref)
                    l_AppStorageService_0:SetItem("DesktopNotificationsModalShown", "true");
                    l_AppStorageService_0:Flush();
                end);
                v11:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.NotificationsModal, {}));
                return v3.resolve(false);
            else
                return v3.resolve(false);
            end;
        end;
    end;
end;