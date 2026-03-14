local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v11 = require(l_Modules_0.LuaApp.Flags.GetFFlagReportNotificationStreamCTA);
local l_StreamNotificationsBellIcon_0 = require(l_CorePackages_0.Workspace.Packages.StreamNotifications).StreamNotificationsBellIcon;
local l_FFlagStreamNotificationBellEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagStreamNotificationBellEntryPoint;
local v14 = v4.PureComponent:extend("NotificationsButton");
v14.validateProps = v3.strictInterface({
    formFactor = v3.string, 
    isCompactView = v3.boolean, 
    isSearching = v3.boolean, 
    isSecondary = v3.optional(v3.boolean), 
    setVisible = v2.isCallable, 
    cancelSearch = v2.isCallable, 
    activateSearch = v2.isCallable, 
    buttonRef = v3.optional(v3.table), 
    numberOfNotifications = v3.integer, 
    entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v3.optional(v3.string) else nil, 
    analytics = v3.table, 
    enableNotifications = v3.boolean
});
local function _(v15) --[[ Line: 52 ]] --[[ Name: isVisible ]]
    return v15.enableNotifications and not v15.isSearching;
end;
v14.updateVisibility = function(v17, v18) --[[ Line: 56 ]] --[[ Name: updateVisibility ]]
    local l_props_0 = v17.props;
    local v20 = l_props_0.enableNotifications and not l_props_0.isSearching;
    if v20 ~= v18 then
        v17.props.setVisible(v20);
    end;
end;
v14.reportCTAIfNecessary = function(v21, v22) --[[ Line: 63 ]] --[[ Name: reportCTAIfNecessary ]]
    -- upvalues: v11 (copy)
    if v11() then
        local v23 = tonumber(v21.props.numberOfNotifications);
        local v24 = v22 and tonumber(v22.numberOfNotifications) or 0;
        if v23 > 0 and v24 == 0 then
            v21.props.analytics.reportNSOpenCTAShown(v23);
        end;
    end;
end;
v14.didMount = function(v25) --[[ Line: 74 ]] --[[ Name: didMount ]]
    v25:updateVisibility(nil);
end;
v14.didUpdate = function(v26, v27, _) --[[ Line: 78 ]] --[[ Name: didUpdate ]]
    v26:updateVisibility(v27.enableNotifications and not v27.isSearching);
    v26:reportCTAIfNecessary(v27);
end;
v14.render = function(v29) --[[ Line: 83 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), l_StreamNotificationsBellIcon_0 (copy), l_FormFactor_0 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 84 ]]
        -- upvalues: v29 (copy), v4 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FormFactor_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref)
        local l_numberOfNotifications_0 = v29.props.numberOfNotifications;
        return v4.createElement(l_StreamNotificationsBellIcon_0, {
            notificationCount = l_numberOfNotifications_0 and tonumber(l_numberOfNotifications_0), 
            compactWidth = v29.props.formFactor == l_FormFactor_0.COMPACT, 
            buttonRef = v29.props.buttonRef, 
            entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v29.props.entryPoint else nil
        });
    end);
end;
v14 = v5.connect(function(v32, _) --[[ Line: 96 ]]
    -- upvalues: l_FFlagStreamNotificationBellEntryPoint_0 (copy)
    local v34 = nil;
    if l_FFlagStreamNotificationBellEntryPoint_0 then
        local v35 = v32.Navigation.history[#v32.Navigation.history];
        if v35 then
            local v36 = {};
            for _, v38 in ipairs(v35) do
                if v38.name then
                    table.insert(v36, v38.name);
                end;
            end;
            v34 = table.concat(v36, "/");
        end;
    end;
    return {
        numberOfNotifications = v32.NotificationBadgeCounts.TopBarNotificationIcon or 0, 
        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v34 else nil
    };
end)(v14);
v14 = l_RoactServices_0.connect({
    analytics = v9
})(v14);
return (l_RoactAppPolicy_0.connect(function(v39, _) --[[ Line: 120 ]]
    return {
        enableNotifications = v39.getNotifications()
    };
end)(v14));