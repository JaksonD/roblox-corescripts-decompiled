local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalStorageKey_0 = require(l_CorePackages_0.Workspace.Packages.LocalStorage).Enums.LocalStorageKey;
local function _() --[[ Line: 32 ]] --[[ Name: getAppId ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    local l_l_AppStorageService_0_Item_0 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.AppInstallationId);
    if l_l_AppStorageService_0_Item_0 and l_l_AppStorageService_0_Item_0 ~= "" then
        return l_l_AppStorageService_0_Item_0;
    else
        return "unknown";
    end;
end;
local function _() --[[ Line: 40 ]] --[[ Name: getBtid ]]
    -- upvalues: l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    local l_l_AppStorageService_0_Item_1 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
    if l_l_AppStorageService_0_Item_1 and l_l_AppStorageService_0_Item_1 ~= "" then
        return l_l_AppStorageService_0_Item_1;
    else
        return "0";
    end;
end;
return function(v8) --[[ Line: 48 ]] --[[ Name: buildRobloxWebNavQueryParams ]]
    -- upvalues: l_RunService_0 (copy), l_AppStorageService_0 (copy), l_LocalStorageKey_0 (copy)
    local v9 = {
        utm_content = v8.utm_content, 
        utm_source = v8.utm_source or "UAP", 
        utm_app_version = v8.utm_app_version or l_RunService_0:GetRobloxVersion()
    };
    local l_utm_app_id_0 = v8.utm_app_id;
    if not l_utm_app_id_0 then
        local l_l_AppStorageService_0_Item_2 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.AppInstallationId);
        l_utm_app_id_0 = if l_l_AppStorageService_0_Item_2 and l_l_AppStorageService_0_Item_2 ~= "" then l_l_AppStorageService_0_Item_2 else "unknown";
    end;
    v9.utm_app_id = l_utm_app_id_0;
    l_utm_app_id_0 = v8.utm_btid;
    if not l_utm_app_id_0 then
        local l_l_AppStorageService_0_Item_3 = l_AppStorageService_0:GetItem(l_LocalStorageKey_0.BrowserTrackerId);
        l_utm_app_id_0 = if l_l_AppStorageService_0_Item_3 and l_l_AppStorageService_0_Item_3 ~= "" then l_l_AppStorageService_0_Item_3 else "0";
    end;
    v9.utm_btid = l_utm_app_id_0;
    return v9;
end;