local l_RobloxGui_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local l_EventStream_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).AnalyticsReporters.EventStream;
local l_userInteractions_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Events.userInteractions;
local l_pageHeartbeat_0 = require(l_CorePackages_0.Workspace.Packages.Analytics).Events.pageHeartbeat;
local l_contentHistory_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("contentHistory"));
local v7 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v8 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v9 = nil;
pcall(function() --[[ Line: 22 ]]
    -- upvalues: v9 (ref)
    v9 = game:GetService("RbxAnalyticsService");
end);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v12 = l_EventStream_0.new(v9);
local v13 = {};
local v14 = {
    TenFoot = "tenFoot", 
    Classic = "classic"
};
local function _() --[[ Line: 35 ]] --[[ Name: getNavigationVersion ]]
    -- upvalues: v7 (copy), v14 (copy)
    if v7.isUserEnrolled() then
        return v14.TenFoot;
    else
        return v14.Classic;
    end;
end;
local _ = function(v16, v17) --[[ Line: 44 ]] --[[ Name: setRBXEvent ]]
    -- upvalues: l_UserInputService_0 (copy), l_EventIngestService_0 (copy)
    local v18 = nil;
    local v19 = nil;
    local l_status_0, _ = pcall(function() --[[ Line: 46 ]]
        -- upvalues: l_UserInputService_0 (ref), v18 (ref), v19 (ref), v16 (ref), v17 (ref), l_EventIngestService_0 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v18 = "console";
            v19 = "XboxOne";
            v16 = v16 or "";
            v17 = v17 or {};
            l_EventIngestService_0:SetRBXEvent(v18, v19, v16, v17);
        end;
    end);
    return l_status_0;
end;
local _ = function(v23, v24) --[[ Line: 59 ]] --[[ Name: setRBXEventStream ]]
    -- upvalues: l_UserInputService_0 (copy), l_EventIngestService_0 (copy)
    local v25 = nil;
    local v26 = nil;
    local l_status_1, _ = pcall(function() --[[ Line: 61 ]]
        -- upvalues: l_UserInputService_0 (ref), v25 (ref), v26 (ref), v23 (ref), v24 (ref), l_EventIngestService_0 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v25 = "console";
            v26 = "XboxOne";
            v23 = v23 or "";
            v24 = v24 or {};
            l_EventIngestService_0:SetRBXEventStream(v25, v26, v23, v24);
        end;
    end);
    return l_status_1;
end;
local _ = function(_) --[[ Line: 74 ]] --[[ Name: releaseRBXEventStream ]]
    -- upvalues: l_UserInputService_0 (copy), v9 (ref)
    local v31 = nil;
    local l_status_2, _ = pcall(function() --[[ Line: 76 ]]
        -- upvalues: l_UserInputService_0 (ref), v31 (ref), v9 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v31 = "console";
            v9:ReleaseRBXEventStream(v31);
        end;
    end);
    return l_status_2;
end;
local _ = function(v35) --[[ Line: 86 ]] --[[ Name: updateHeartbeatObject ]]
    -- upvalues: v9 (ref)
    local l_status_3, _ = pcall(function() --[[ Line: 87 ]]
        -- upvalues: v9 (ref), v35 (copy)
        v9:UpdateHeartbeatObject(v35);
    end);
    return l_status_3;
end;
local _ = function(v39, v40) --[[ Line: 94 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_UserInputService_0 (copy), v9 (ref)
    local l_status_4, _ = pcall(function() --[[ Line: 95 ]]
        -- upvalues: l_UserInputService_0 (ref), v39 (ref), v40 (ref), v9 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v39 = v39 or "";
            v39 = "Xbox-" .. tostring(v39);
            v40 = v40 or 1;
            v9:ReportCounter(v39, v40);
        end;
    end);
    return l_status_4;
end;
v13.SetRBXEvent = function(v44, v45) --[[ Line: 108 ]] --[[ Name: SetRBXEvent ]]
    -- upvalues: l_UserInputService_0 (copy), l_EventIngestService_0 (copy)
    local l_v44_0 = v44;
    local l_v45_0 = v45;
    local v48 = nil;
    local v49 = nil;
    local _, _ = pcall(function() --[[ Line: 46 ]]
        -- upvalues: l_UserInputService_0 (ref), v48 (ref), v49 (ref), l_v44_0 (ref), l_v45_0 (ref), l_EventIngestService_0 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v48 = "console";
            v49 = "XboxOne";
            l_v44_0 = l_v44_0 or "";
            l_v45_0 = l_v45_0 or {};
            l_EventIngestService_0:SetRBXEvent(v48, v49, l_v44_0, l_v45_0);
        end;
    end);
end;
v13.SetRBXEventStream = function(v52, v53) --[[ Line: 113 ]] --[[ Name: SetRBXEventStream ]]
    -- upvalues: l_UserInputService_0 (copy), l_EventIngestService_0 (copy)
    local l_v52_0 = v52;
    local l_v53_0 = v53;
    local v56 = nil;
    local v57 = nil;
    local _, _ = pcall(function() --[[ Line: 61 ]]
        -- upvalues: l_UserInputService_0 (ref), v56 (ref), v57 (ref), l_v52_0 (ref), l_v53_0 (ref), l_EventIngestService_0 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            v56 = "console";
            v57 = "XboxOne";
            l_v52_0 = l_v52_0 or "";
            l_v53_0 = l_v53_0 or {};
            l_EventIngestService_0:SetRBXEventStream(v56, v57, l_v52_0, l_v53_0);
        end;
    end);
end;
v13.UpdateHeartbeatObject = function(v60) --[[ Line: 117 ]] --[[ Name: UpdateHeartbeatObject ]]
    -- upvalues: v9 (ref)
    local _, _ = pcall(function() --[[ Line: 87 ]]
        -- upvalues: v9 (ref), v60 (copy)
        v9:UpdateHeartbeatObject(v60);
    end);
end;
v13.ReportCounter = function(v63, v64) --[[ Line: 122 ]] --[[ Name: ReportCounter ]]
    -- upvalues: l_UserInputService_0 (copy), v9 (ref)
    local l_v63_0 = v63;
    local l_v64_0 = v64;
    local _, _ = pcall(function() --[[ Line: 95 ]]
        -- upvalues: l_UserInputService_0 (ref), l_v63_0 (ref), l_v64_0 (ref), v9 (ref)
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            l_v63_0 = l_v63_0 or "";
            l_v63_0 = "Xbox-" .. tostring(l_v63_0);
            l_v64_0 = l_v64_0 or 1;
            v9:ReportCounter(l_v63_0, l_v64_0);
        end;
    end);
end;
v13.reportPageChanged = function() --[[ Line: 126 ]] --[[ Name: reportPageChanged ]]
    -- upvalues: l_userInteractions_0 (copy), v12 (copy)
    l_userInteractions_0(v12, "luaPage");
end;
v13.reportPageHeartbeat = function(v69, v70) --[[ Line: 131 ]] --[[ Name: reportPageHeartbeat ]]
    -- upvalues: l_pageHeartbeat_0 (copy), v12 (copy)
    l_pageHeartbeat_0(v12, v69, v70);
end;
v13.reportNavigation = function(v71, v72, v73) --[[ Line: 135 ]] --[[ Name: reportNavigation ]]
    -- upvalues: l_contentHistory_0 (copy), v7 (copy), v14 (copy), l_UserInputService_0 (copy), l_EventIngestService_0 (copy), v8 (copy)
    local v74 = l_contentHistory_0:getLastContentName();
    if v72 ~= v74 then
        local v75 = "Navigation";
        local v76 = {
            activationType = v71, 
            toContent = v72, 
            fromContent = v74, 
            contentType = v73, 
            navigationVersion = if v7.isUserEnrolled() then v14.TenFoot else v14.Classic
        };
        local v77 = nil;
        local v78 = nil;
        do
            local l_v75_0, l_v76_0, l_v77_0, l_v78_0 = v75, v76, v77, v78;
            local _, _ = pcall(function() --[[ Line: 61 ]]
                -- upvalues: l_UserInputService_0 (ref), l_v77_0 (ref), l_v78_0 (ref), l_v75_0 (ref), l_v76_0 (ref), l_EventIngestService_0 (ref)
                if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                    l_v77_0 = "console";
                    l_v78_0 = "XboxOne";
                    l_v75_0 = l_v75_0 or "";
                    l_v76_0 = l_v76_0 or {};
                    l_EventIngestService_0:SetRBXEventStream(l_v77_0, l_v78_0, l_v75_0, l_v76_0);
                end;
            end);
        end;
        if v8() > 1 then
            print("[ANALYTICS] Navigation", "ActivationType:", v71, "| ContentName:", v72, "| ContentType:", v73, "| PrevContentName:", v74, "| NavigationVersion:", if v7.isUserEnrolled() then v14.TenFoot else v14.Classic);
        end;
    end;
end;
local function v97(v85) --[[ Line: 153 ]] --[[ Name: reportNavigationLoaded ]]
    -- upvalues: l_contentHistory_0 (copy), v7 (copy), v14 (copy), l_UserInputService_0 (copy), l_EventIngestService_0 (copy), v8 (copy)
    local v86 = l_contentHistory_0:getLastContentName();
    if v85 ~= v86 then
        local v87 = "NavigationLoaded";
        local v88 = {
            toContent = v85, 
            fromContent = v86, 
            navigationVersion = if v7.isUserEnrolled() then v14.TenFoot else v14.Classic
        };
        local v89 = nil;
        local v90 = nil;
        do
            local l_v87_0, l_v88_0, l_v89_0, l_v90_0 = v87, v88, v89, v90;
            local _, _ = pcall(function() --[[ Line: 61 ]]
                -- upvalues: l_UserInputService_0 (ref), l_v89_0 (ref), l_v90_0 (ref), l_v87_0 (ref), l_v88_0 (ref), l_EventIngestService_0 (ref)
                if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                    l_v89_0 = "console";
                    l_v90_0 = "XboxOne";
                    l_v87_0 = l_v87_0 or "";
                    l_v88_0 = l_v88_0 or {};
                    l_EventIngestService_0:SetRBXEventStream(l_v89_0, l_v90_0, l_v87_0, l_v88_0);
                end;
            end);
        end;
        if v8() > 1 then
            print("[ANALYTICS] NavigationLoaded ContentName:", v85, "| PrevContentName:", v86, "| NavigationVersion:", if v7.isUserEnrolled() then v14.TenFoot else v14.Classic);
        end;
    end;
end;
v13.reportNavigationLoaded = function(v98) --[[ Line: 174 ]] --[[ Name: reportNavigationLoaded ]]
    -- upvalues: v7 (copy), v97 (copy)
    if v7.isUserEnrolled() then
        v97(v98);
        return;
    else
        spawn(function() --[[ Line: 178 ]]
            -- upvalues: v97 (ref), v98 (copy)
            v97(v98);
        end);
        return;
    end;
end;
v13.reportBackNavigation = function(v99) --[[ Line: 182 ]] --[[ Name: reportBackNavigation ]]
    -- upvalues: l_contentHistory_0 (copy), v7 (copy), v14 (copy), l_UserInputService_0 (copy), l_EventIngestService_0 (copy), v8 (copy)
    local v100 = l_contentHistory_0:getLastContentName();
    local v101 = "NavigationBack";
    local v102 = {
        fromContent = v99, 
        toContent = v100, 
        navigationVersion = if v7.isUserEnrolled() then v14.TenFoot else v14.Classic
    };
    local v103 = nil;
    local v104 = nil;
    do
        local l_v101_0, l_v102_0, l_v103_0, l_v104_0 = v101, v102, v103, v104;
        local _, _ = pcall(function() --[[ Line: 61 ]]
            -- upvalues: l_UserInputService_0 (ref), l_v103_0 (ref), l_v104_0 (ref), l_v101_0 (ref), l_v102_0 (ref), l_EventIngestService_0 (ref)
            if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
                l_v103_0 = "console";
                l_v104_0 = "XboxOne";
                l_v101_0 = l_v101_0 or "";
                l_v102_0 = l_v102_0 or {};
                l_EventIngestService_0:SetRBXEventStream(l_v103_0, l_v104_0, l_v101_0, l_v102_0);
            end;
        end);
    end;
    if v8() > 1 then
        print("[ANALYTICS] NavigationBack FromContent:", v99, "| ToContent:", v100, "| NavigationVersion:", if v7.isUserEnrolled() then v14.TenFoot else v14.Classic);
    end;
end;
local v111 = {
    WidgetId = "WidgetName", 
    AppHubId = "AppHub", 
    AvatarEditorScreenId = "AvatarEditorScreen", 
    AvatarPaneId = "AvatarPane", 
    AvatarTileId = "AvatarTile", 
    BadgeOverlayId = "BadgeOverlay", 
    BaseCarouselScreenId = "BaseCarouselScreen", 
    BaseOverlayId = "BaseOverlay", 
    BaseTileId = "BaseTile", 
    ConfirmPromptId = "ConfirmPrompt", 
    DisableCrossplayOverlayId = "DisableCrossplayOverlay", 
    EnableCrossplayOverlayId = "EnableCrossplayOverlay", 
    EngagementScreenId = "EngagementScreen", 
    ErrorOverlayId = "ErrorOverlay", 
    GameDetailId = "GameDetail", 
    GameGenreScreenId = "GameGenreScreen", 
    GamesPaneId = "GamesPane", 
    GameSearchScreenId = "GameSearchScreen", 
    HomePaneId = "HomePane", 
    ImageOverlayId = "ImageOverlay", 
    LinkAccountScreenId = "LinkAccountScreen", 
    NoActionOverlayId = "NoActionOverlay", 
    OutfitTileId = "OutfitTile", 
    OverscanScreenId = "OverscanScreen", 
    PurchasePackagePromptId = "PurchasePackagePrompt", 
    ReportOverlayId = "ReportOverlay", 
    RobuxBalanceOverlayId = "RobuxBalanceOverlay", 
    SetAccountCredentialsScreenId = "SetAccountCredentialsScreen", 
    SettingsScreenId = "SettingsScreen", 
    SideBarId = "SideBar", 
    SignInScreenId = "SignInScreen", 
    SocialPaneId = "SocialPane", 
    StorePaneId = "StorePane", 
    TabDockId = "TabDock", 
    UnlinkAccountOverlayId = "UnlinkAccountOverlay", 
    UnlinkAccountScreenId = "UnlinkAccountScreen", 
    TwoFactorScreen = "TwoFactorScreen", 
    CrossDeviceLoginScreen = "CrossDeviceLoginScreen", 
    StoreScreenId = "StoreScreen", 
    SearchScreenId = "SearchScreen", 
    PartyUiId = "PartyUi"
};
local v112 = {
    HomeId = "HomeTab", 
    AvatarId = "AvatarTab", 
    DiscoverId = "DiscoverTab", 
    FriendsId = "FriendsTab", 
    StoreId = "StoreTab", 
    SearchId = "SearchTab", 
    SettingsId = "SettingsTab"
};
v13.WidgetNames = function(v113) --[[ Line: 251 ]] --[[ Name: WidgetNames ]]
    -- upvalues: v111 (copy)
    return v111 and v111[v113] or v113;
end;
v13.TabNames = function(v114) --[[ Line: 259 ]] --[[ Name: TabNames ]]
    -- upvalues: v112 (copy)
    return v112 and v112[v114] or v114;
end;
return v13;