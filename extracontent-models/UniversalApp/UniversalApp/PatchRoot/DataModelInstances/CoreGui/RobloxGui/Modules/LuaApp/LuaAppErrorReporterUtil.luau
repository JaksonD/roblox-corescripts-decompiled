local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_HttpService_0 = game:GetService("HttpService");
local l_RunService_0 = game:GetService("RunService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_DataModelPatchService_0 = game:GetService("DataModelPatchService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v9 = require(l_Modules_0.LuaApp.Util.safeCall);
local l_SystemInfoProtocol_0 = require(l_CorePackages_0.Workspace.Packages.SystemInfoProtocol).SystemInfoProtocol;
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local l_OtaPatchName_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).OtaPatchName;
local l_OtaPackagesStatus_0 = require(l_CorePackages_0.Workspace.Packages.OtaPatchPackagesStatus).OtaPackagesStatus;
local v14 = {};
local v15 = nil;
v14.getAppStaticAttributes = function() --[[ Line: 25 ]] --[[ Name: getAppStaticAttributes ]]
    -- upvalues: v9 (copy), l_RunService_0 (copy), l_HttpService_0 (copy), l_ContentProvider_0 (copy), l_MemStorageService_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_SystemInfoProtocol_0 (copy)
    return v9(function() --[[ Line: 26 ]]
        -- upvalues: l_RunService_0 (ref), l_HttpService_0 (ref), l_ContentProvider_0 (ref), l_MemStorageService_0 (ref), l_AppStorageService_0 (ref), l_LocalStorageKey_0 (ref), l_SystemInfoProtocol_0 (ref)
        local v16 = {
            AppVersion = l_RunService_0:GetRobloxVersion(), 
            UserAgent = l_HttpService_0:GetUserAgent(), 
            BaseUrl = l_ContentProvider_0.BaseUrl, 
            WindowsLaunchType = l_MemStorageService_0:GetItem("Backtrace.WindowsLaunchType"), 
            CoreScriptVersion = l_RunService_0:GetCoreScriptVersion(), 
            AppInstallationId = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.AppInstallationId), 
            RobloxChannel = l_RunService_0:GetRobloxClientChannel()
        };
        local l_l_RunService_0_ControlAndVariantRolloutFlags_0, v18 = l_RunService_0:GetControlAndVariantRolloutFlags();
        if l_l_RunService_0_ControlAndVariantRolloutFlags_0 ~= nil and l_l_RunService_0_ControlAndVariantRolloutFlags_0 ~= "" then
            v16.RolloutFlagsInControl = l_l_RunService_0_ControlAndVariantRolloutFlags_0;
        end;
        if v18 ~= nil and v18 ~= "" then
            v16.RolloutFlagsInVariant = v18;
        end;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 45 ]]
            -- upvalues: l_SystemInfoProtocol_0 (ref)
            return l_SystemInfoProtocol_0.default:getSystemInfo(l_SystemInfoProtocol_0.ALL_INFO_NAMES);
        end);
        if l_status_0 and typeof(l_result_0) == "table" then
            for v21, v22 in pairs(l_result_0) do
                v16[v21] = v22;
            end;
        end;
        return v16;
    end, {});
end;
v14.processReport = function(v23) --[[ Line: 58 ]] --[[ Name: processReport ]]
    -- upvalues: v15 (ref), v14 (copy), l_OtaPatchName_0 (copy), l_DataModelPatchService_0 (copy), l_OtaPackagesStatus_0 (copy)
    if not v15 then
        v15 = v14.getAppStaticAttributes();
    end;
    v23:addAttributes({
        AppRunningTime = string.format("%.02f", elapsedTime())
    });
    v23:addAttributes(v15);
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 68 ]]
        -- upvalues: l_OtaPatchName_0 (ref), l_DataModelPatchService_0 (ref)
        local l_DiscoveryOta_0 = l_OtaPatchName_0.DiscoveryOta;
        return l_DataModelPatchService_0:GetLuaVersion(l_DiscoveryOta_0);
    end);
    if l_status_1 and l_result_1 then
        v23:addAttributes({
            DiscoveryScriptVersion = l_result_1
        });
    end;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 77 ]]
        -- upvalues: l_OtaPatchName_0 (ref), l_OtaPackagesStatus_0 (ref)
        local l_DiscoveryOta_1 = l_OtaPatchName_0.DiscoveryOta;
        return l_OtaPackagesStatus_0.AllPatchPackagesLoaded(l_DiscoveryOta_1);
    end);
    if l_status_2 and l_result_2 then
        v23:addAttributes({
            DiscoveryScriptLoaded = l_result_2
        });
    end;
    return v23;
end;
return v14;