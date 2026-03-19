local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Flags.OffPlatformFriendRequestsIXP);
local l_useSelector_0 = v1.useSelector;
local v5 = require(script.Parent.getContactImporterParams);
local l_useUiModeInfo_0 = require(l_Parent_1.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_1.RobloxAppEnums).UiMode;
local l_FFlagContactImporterIXPCleanup_0 = require(l_Parent_1.SharedFlags).FFlagContactImporterIXPCleanup;
return function(v9) --[[ Line: 13 ]]
    -- upvalues: l_useSelector_0 (copy), v5 (copy), l_FFlagContactImporterIXPCleanup_0 (copy), v3 (copy), l_useUiModeInfo_0 (copy), l_UiMode_0 (copy)
    local v11 = l_useSelector_0(function(v10) --[[ Line: 14 ]]
        return v10.IsLocalUserSoothsayer;
    end);
    local v12 = l_useSelector_0(v5);
    local v13 = if l_FFlagContactImporterIXPCleanup_0 then nil else v3.useOffPlatformFriendRequestsEnabled();
    local v14 = not (l_useUiModeInfo_0().uiMode == l_UiMode_0.TenFoot) and v11;
    local v15 = if l_FFlagContactImporterIXPCleanup_0 then nil else v13;
    local v16 = nil;
    local v17 = nil;
    if v14 then
        v17 = true;
        v16 = true;
    else
        v17 = if l_FFlagContactImporterIXPCleanup_0 then v9.policyIsEnabled else v15 and v9.policyIsEnabled;
        v16 = v12.shouldShowContactImporterFeature;
    end;
    local v18 = v17 and v16;
    local v19 = v18 and v12.shouldShowContactImporterUpsellModal;
    return {
        shouldFetchContactImporterData = v17 or false, 
        shouldShowContactImporter = v18 or false, 
        shouldShowContactImporterModal = v19 or false
    };
end;