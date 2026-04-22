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
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local l_FFlagStreamNotificationBellEntryPoint_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagStreamNotificationBellEntryPoint;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local v16 = v4.PureComponent:extend("NotificationsButton");
v16.validateProps = v3.strictInterface({
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
local function _(v17) --[[ Line: 54 ]] --[[ Name: isVisible ]]
    return v17.enableNotifications and not v17.isSearching;
end;
v16.updateVisibility = function(v19, v20) --[[ Line: 58 ]] --[[ Name: updateVisibility ]]
    local l_props_0 = v19.props;
    local v22 = l_props_0.enableNotifications and not l_props_0.isSearching;
    if v22 ~= v20 then
        v19.props.setVisible(v22);
    end;
end;
v16.reportCTAIfNecessary = function(v23, v24) --[[ Line: 65 ]] --[[ Name: reportCTAIfNecessary ]]
    -- upvalues: v11 (copy)
    if v11() then
        local v25 = tonumber(v23.props.numberOfNotifications);
        local v26 = v24 and tonumber(v24.numberOfNotifications) or 0;
        if v25 > 0 and v26 == 0 then
            v23.props.analytics.reportNSOpenCTAShown(v25);
        end;
    end;
end;
v16.didMount = function(v27) --[[ Line: 76 ]] --[[ Name: didMount ]]
    v27:updateVisibility(nil);
end;
v16.didUpdate = function(v28, v29, _) --[[ Line: 80 ]] --[[ Name: didUpdate ]]
    v28:updateVisibility(v29.enableNotifications and not v29.isSearching);
    v28:reportCTAIfNecessary(v29);
end;
v16.render = function(v31) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), l_StreamNotificationsBellIcon_0 (copy), l_FormFactor_0 (copy), l_FFlagStreamNotificationBellEntryPoint_0 (copy)
    return l_withStyle_0(function(_) --[[ Line: 86 ]]
        -- upvalues: v31 (copy), v4 (ref), l_StreamNotificationsBellIcon_0 (ref), l_FormFactor_0 (ref), l_FFlagStreamNotificationBellEntryPoint_0 (ref)
        local l_numberOfNotifications_0 = v31.props.numberOfNotifications;
        return v4.createElement(l_StreamNotificationsBellIcon_0, {
            notificationCount = l_numberOfNotifications_0 and tonumber(l_numberOfNotifications_0), 
            compactWidth = v31.props.formFactor == l_FormFactor_0.COMPACT, 
            buttonRef = v31.props.buttonRef, 
            entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v31.props.entryPoint else nil
        });
    end);
end;
v16 = v5.connect(function(v34, _) --[[ Line: 98 ]]
    -- upvalues: l_FFlagStreamNotificationBellEntryPoint_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v36 = nil;
    if l_FFlagStreamNotificationBellEntryPoint_0 then
        local v37 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v34) else v34.Navigation.history[#v34.Navigation.history];
        if v37 then
            local v38 = {};
            for _, v40 in ipairs(v37) do
                if v40.name then
                    table.insert(v38, v40.name);
                end;
            end;
            v36 = table.concat(v38, "/");
        end;
    end;
    return {
        numberOfNotifications = v34.NotificationBadgeCounts.TopBarNotificationIcon or 0, 
        entryPoint = if l_FFlagStreamNotificationBellEntryPoint_0 then v36 else nil
    };
end)(v16);
v16 = l_RoactServices_0.connect({
    analytics = v9
})(v16);
return (l_RoactAppPolicy_0.connect(function(v41, _) --[[ Line: 124 ]]
    return {
        enableNotifications = v41.getNotifications()
    };
end)(v16));