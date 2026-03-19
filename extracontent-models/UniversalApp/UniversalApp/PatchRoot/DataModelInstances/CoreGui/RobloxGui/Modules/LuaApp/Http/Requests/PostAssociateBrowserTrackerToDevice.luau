local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v4 = require(l_Modules_0.LuaApp.Promise);
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_DeviceIdService_0 = game:GetService("DeviceIdService");
return function(v8) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy), l_DeviceIdService_0 (copy), v4 (copy), l_HttpService_0 (copy)
    local v9 = v3.fromString("apis:original-users/v1/associateBrowserTrackerToDevice");
    local v10 = tonumber(l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId));
    local l_l_DeviceIdService_0_DeviceId_0 = l_DeviceIdService_0:GetDeviceId();
    if v10 == nil or v10 <= 0 or l_l_DeviceIdService_0_DeviceId_0 == nil or l_l_DeviceIdService_0_DeviceId_0 == "" or l_l_DeviceIdService_0_DeviceId_0 == "00000000-0000-0000-0000-000000000000" then
        return v4.reject();
    else
        local v12 = l_HttpService_0:JSONEncode({
            browser_tracker_id = v10, 
            device_id = l_l_DeviceIdService_0_DeviceId_0
        });
        v8(v9(), "POST", {
            postBody = v12
        }):catch(function() --[[ Line: 37 ]]

        end);
        return v4.resolve();
    end;
end;