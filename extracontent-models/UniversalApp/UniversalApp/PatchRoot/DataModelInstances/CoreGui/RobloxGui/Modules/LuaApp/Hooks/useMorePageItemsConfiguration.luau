local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useUserExperiment_0 = require(l_CorePackages_0.Packages.RoactAppExperiment).useUserExperiment;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v7 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v9 = require(l_Modules_0.LuaApp.Components.More.Config.MorePageSettings);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagForceEnableReportLogsButton);
local l_GetFFlagPlatformEventEnabled_0 = v3.GetFFlagPlatformEventEnabled;
local l_GetFStringPlatformEventUrl_0 = v3.GetFStringPlatformEventUrl;
local l_FFlagEnableRMOnMorePageIXP_0 = v3.FFlagEnableRMOnMorePageIXP;
local l_FFlagEnableRMOnMorePageForAll_0 = v3.FFlagEnableRMOnMorePageForAll;
local l_FStringRMDefinition_0 = v3.FStringRMDefinition;
local v17 = require(l_Modules_0.LuaApp.Flags.FFlagAddRMTile);
local l_FFlagEnableBlackbird_0 = v3.FFlagEnableBlackbird;
local l_FFlagEnableBlackbirdOnMorePage_0 = v3.FFlagEnableBlackbirdOnMorePage;
local v20 = {
    Navigation = {
        "About_Terms"
    }, 
    Action = {
        "LogOut"
    }
};
local function v31(v21, v22, v23, v24, v25, v26, v27, v28) --[[ Line: 34 ]] --[[ Name: shouldAddToMorePageItem ]]
    -- upvalues: v9 (copy), l_GetFFlagPlatformEventEnabled_0 (copy), l_GetFStringPlatformEventUrl_0 (copy), v11 (copy), v17 (copy), l_FFlagEnableRMOnMorePageForAll_0 (copy), l_FFlagEnableRMOnMorePageIXP_0 (copy)
    local v29 = v9.ItemType[v21];
    if v29 == nil then
        return nil;
    else
        local v30 = v9.ItemInfo[v29];
        if v30 == nil then
            return nil;
        elseif v30.itemType == v9.ItemType.BuildersClub and v28 then
            return nil;
        elseif v30.itemType == v9.ItemType.Trades and v22 == false then
            return nil;
        elseif v30.itemType == v9.ItemType.TheHunt and not (l_GetFFlagPlatformEventEnabled_0() and #l_GetFStringPlatformEventUrl_0() > 0) then
            return nil;
        elseif v30.itemType == v9.ItemType.ReportLogs and not (v11() or v23) then
            return nil;
        elseif v30.itemType == v9.ItemType.VRFTUX and not v24 then
            return nil;
        elseif v30.itemType == v9.ItemType.AdjustScreen and not v25 then
            return nil;
        elseif v17 and v30.itemType == v9.ItemType.RM and not (l_FFlagEnableRMOnMorePageForAll_0 or l_FFlagEnableRMOnMorePageIXP_0 and v26) then
            return nil;
        elseif v30.itemType == v9.ItemType.Redeem and not v27 then
            return nil;
        elseif v30.itemType == v9.ItemType.Blackbird and not v28 then
            return nil;
        else
            return v30;
        end;
    end;
end;
local function v35(v32, v33) --[[ Line: 115 ]] --[[ Name: updateMoreItemBadgeCount ]]
    -- upvalues: v9 (copy)
    local v34 = 0;
    if v32.itemType == v9.ItemType.Friends then
        v34 = v33.MorePageFriends;
    elseif v32.itemType == v9.ItemType.Messages then
        v34 = v33.MorePageMessages;
    elseif v32.itemType == v9.ItemType.Settings or v32.itemType == v9.ItemType.Settings_AccountInfo then
        v34 = v33.MorePageSettings;
    elseif v32.itemType == v9.ItemType.TencentNoticeCenter then
        v34 = v33.MorePageTencentUnreadNotice;
    end;
    if v32.badgeCount ~= v34 then
        v32.badgeCount = v34;
    end;
end;
return function() --[[ Line: 134 ]]
    -- upvalues: v7 (copy), v20 (copy), l_useSelector_0 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v17 (copy), l_FStringRMDefinition_0 (copy), l_useIsSpatial_0 (copy), l_FFlagEnableBlackbird_0 (copy), l_FFlagEnableBlackbirdOnMorePage_0 (copy), v1 (copy), v2 (copy), v31 (copy), v35 (copy)
    local v37 = v7(function(v36) --[[ Line: 135 ]]
        return v36.getMorePageContent();
    end) or v20;
    local v39 = v7(function(v38) --[[ Line: 139 ]]
        return v38.getSupportsOverscan();
    end);
    local v41 = l_useSelector_0(function(v40) --[[ Line: 143 ]]
        return v40.NotificationBadgeCounts;
    end);
    local v44 = l_useSelector_0(function(v42) --[[ Line: 147 ]]
        local v43 = v42.Users[v42.LocalUserId];
        if v43 then
            return v43.membership == Enum.MembershipType.Premium;
        else
            return false;
        end;
    end);
    local v46 = l_useUserExperiment_0({
        l_AppUserLayers_0.AppHealthReportLogs
    }, function(v45) --[[ Line: 156 ]]
        -- upvalues: l_AppUserLayers_0 (ref)
        return (v45[l_AppUserLayers_0.AppHealthReportLogs] or {}).ReportLogsButtonEnabled or nil;
    end);
    local v48 = if v17 then l_useUserExperiment_0({
        l_AppUserLayers_0.RMLayer
    }, function(v47) --[[ Line: 162 ]]
        -- upvalues: l_AppUserLayers_0 (ref), l_FStringRMDefinition_0 (ref)
        return (v47[l_AppUserLayers_0.RMLayer] or {})[l_FStringRMDefinition_0] or nil;
    end) else nil;
    local v49 = l_useIsSpatial_0();
    local v51 = v7(function(v50) --[[ Line: 170 ]]
        return v50.getRedeemTileEnabled();
    end);
    local v52 = l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnMorePage_0;
    return v1.useMemo(function() --[[ Line: 177 ]]
        -- upvalues: v2 (ref), v37 (copy), v31 (ref), v44 (copy), v46 (copy), v49 (copy), v39 (copy), v48 (copy), v51 (copy), v52 (copy), v35 (ref), v41 (copy)
        return v2.Dictionary.values(v2.Dictionary.map(v37, function(v53, v54) --[[ Line: 178 ]]
            -- upvalues: v2 (ref), v31 (ref), v44 (ref), v46 (ref), v49 (ref), v39 (ref), v48 (ref), v51 (ref), v52 (ref), v35 (ref), v41 (ref)
            return {
                contents = v2.Dictionary.values(v2.Dictionary.map(v53, function(v55) --[[ Line: 179 ]]
                    -- upvalues: v31 (ref), v44 (ref), v46 (ref), v49 (ref), v39 (ref), v48 (ref), v51 (ref), v52 (ref), v35 (ref), v41 (ref)
                    local v56 = v31(v55, v44, v46, v49, v39, v48, v51, v52);
                    if v56 then
                        v35(v56, v41);
                    end;
                    return v56;
                end)), 
                type = v54
            };
        end));
    end, {
        v37, 
        v41, 
        v44, 
        v49, 
        v46, 
        v52
    });
end;