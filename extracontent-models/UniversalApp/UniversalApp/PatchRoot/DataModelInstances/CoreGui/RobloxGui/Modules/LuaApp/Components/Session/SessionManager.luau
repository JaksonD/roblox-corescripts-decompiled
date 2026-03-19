local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_AppLogging_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLogging;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v9 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux);
local l_selectCurrentLegacyRoute_0 = v9.Selectors.selectCurrentLegacyRoute;
local l_selectCurrentLegacyPage_0 = v9.Selectors.selectCurrentLegacyPage;
local l_hasPageInCurrentRoute_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryRouting).hasPageInCurrentRoute;
local l_reportWarning_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics).Points.reportWarning;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v15 = require(l_Modules_0.LuaApp.FlagSettings);
local v16 = require(l_Modules_0.LuaApp.Flags.FFlagEnableL1SessionStateEngineOwned);
local function v27(v17) --[[ Line: 25 ]] --[[ Name: computeLevel2SessionsFromRoute ]]
    -- upvalues: l_SessionType_0 (copy)
    local l_Level2a_0 = l_SessionType_0.StructuralIdentifier.Level2a;
    local l_Level2b_0 = l_SessionType_0.StructuralIdentifier.Level2b;
    local v20 = {};
    local v21 = false;
    for v22 = #v17, 1, -1 do
        local l_name_0 = v17[v22].name;
        local v24 = nil;
        local v25 = nil;
        v24 = l_SessionType_0.Tag.Level2a[l_name_0];
        v25 = l_SessionType_0.Tag.Level2b[l_name_0];
        if v24 then
            v20[l_Level2a_0] = v17[v22];
            break;
        elseif not v21 and v25 then
            v20[l_Level2b_0] = v17[v22];
            v21 = true;
        end;
    end;
    local v26 = {
        name = l_SessionType_0.Tag.Level2a.Unknown, 
        detail = nil
    };
    v20[l_Level2a_0] = v20[l_Level2a_0] or v26;
    return v20;
end;
local function _(v28) --[[ Line: 60 ]]
    if not v28 then
        return "No currentRoute!";
    else
        local v29 = "";
        for v30 = 1, #v28 do
            v29 = ("%*;%*"):format(v28[v30].name, v29);
        end;
        return v29;
    end;
end;
local v32 = v1.Component:extend("SessionManager");
v32.init = function(v33) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: l_mutedError_0 (copy), l_hasPageInCurrentRoute_0 (copy), l_AppPage_0 (copy), l_SessionType_0 (copy), l_reportWarning_0 (copy), v16 (copy), v15 (copy), v27 (copy)
    v33.updateGameSearchSession = function() --[[ Line: 76 ]]
        -- upvalues: v33 (copy), l_mutedError_0 (ref), l_hasPageInCurrentRoute_0 (ref), l_AppPage_0 (ref), l_SessionType_0 (ref)
        local l_sessionService_0 = v33.props.sessionService;
        local l_currentRoute_0 = v33.props.currentRoute;
        if l_sessionService_0 == nil then
            l_mutedError_0("SessionManager requires valid SessionService.");
            return;
        else
            if not l_hasPageInCurrentRoute_0(l_currentRoute_0, l_AppPage_0.SearchPage, nil) then
                l_sessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                l_sessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.OmniSearch);
            end;
            return;
        end;
    end;
    v33.updateGameDetailSourceSession = function() --[[ Line: 92 ]]
        -- upvalues: v33 (copy), l_hasPageInCurrentRoute_0 (ref), l_AppPage_0 (ref), l_SessionType_0 (ref), l_reportWarning_0 (ref)
        local l_sessionService_1 = v33.props.sessionService;
        local l_currentRoute_1 = v33.props.currentRoute;
        local l_loggingProtocol_0 = v33.props.loggingProtocol;
        if l_hasPageInCurrentRoute_0(l_currentRoute_1, l_AppPage_0.GameDetail, nil) or l_hasPageInCurrentRoute_0(l_currentRoute_1, l_AppPage_0.ExperienceDetail, nil) then
            if not l_sessionService_1:SessionExists(l_SessionType_0.StructuralIdentifier.GameDetailSource) then
                local l_l_reportWarning_0_0 = l_reportWarning_0;
                local l_l_loggingProtocol_0_0 = l_loggingProtocol_0;
                local v41 = "Session";
                local v42 = "No GameDetailSource session for Game Details page. Pages: %*";
                local v43;
                if not l_currentRoute_1 then
                    v43 = "No currentRoute!";
                else
                    local v44 = "";
                    for v45 = 1, #l_currentRoute_1 do
                        v44 = ("%*;%*"):format(l_currentRoute_1[v45].name, v44);
                    end;
                    v43 = v44;
                end;
                l_l_reportWarning_0_0(l_l_loggingProtocol_0_0, v41, (v42:format(v43)));
                return;
            end;
        else
            if l_sessionService_1:SessionExists(l_SessionType_0.StructuralIdentifier.GameDetailSource) then
                local l_l_reportWarning_0_1 = l_reportWarning_0;
                local l_l_loggingProtocol_0_1 = l_loggingProtocol_0;
                local v48 = "Session";
                local v49 = "GameDetailSource session exists but no Game Details page open. Pages: %*";
                local v50;
                if not l_currentRoute_1 then
                    v50 = "No currentRoute!";
                else
                    local v51 = "";
                    for v52 = 1, #l_currentRoute_1 do
                        v51 = ("%*;%*"):format(l_currentRoute_1[v52].name, v51);
                    end;
                    v50 = v51;
                end;
                l_l_reportWarning_0_1(l_l_loggingProtocol_0_1, v48, (v49:format(v50)));
            end;
            l_sessionService_1:RemoveSession(l_SessionType_0.StructuralIdentifier.GameDetailSource);
        end;
    end;
    v33.updateSessionService = function(v53, v54, v55, v56) --[[ Line: 122 ]]
        -- upvalues: v33 (copy), l_SessionType_0 (ref), v16 (ref)
        local l_sessionService_2 = v33.props.sessionService;
        local l_Level1_0 = l_SessionType_0.StructuralIdentifier.Level1;
        local l_Level2a_1 = l_SessionType_0.StructuralIdentifier.Level2a;
        local l_Level2b_1 = l_SessionType_0.StructuralIdentifier.Level2b;
        v55 = v55 or {
            name = l_SessionType_0.Tag.Level2a.Unknown
        };
        v56 = v56 or {};
        v53 = v53 or {};
        v54 = v54 or {};
        if not v16 and not l_sessionService_2:SessionExists(l_Level1_0) then
            l_sessionService_2:SetSession(l_sessionService_2:GetRootSID(), l_Level1_0, l_SessionType_0.Tag.Level1.Default);
            l_sessionService_2:SetMetadata(l_Level1_0, l_SessionType_0.Metadata.User.UserId, "Unknown");
        end;
        if v55.name ~= v53.name or v56.name ~= v54.name then
            l_sessionService_2:RemoveSessionsWithMetadataKey(l_SessionType_0.Metadata.GamePlay.DeleteOnGameLeave);
        end;
        if v55.detail ~= v53.detail or v55.name ~= v53.name then
            if l_sessionService_2:SessionExists(l_Level2a_1) then
                l_sessionService_2:ReplaceSession(l_Level2a_1, v55.name);
            else
                l_sessionService_2:SetSession(l_Level1_0, l_Level2a_1, v55.name);
            end;
            if v56.name == nil and v54.name == nil then
                l_sessionService_2:SetSession(l_Level2a_1, l_Level2b_1, v55.name .. "Page");
            end;
        end;
        if v56.detail ~= v54.detail or v56.name ~= v54.name then
            if l_sessionService_2:SessionExists(l_Level2b_1) then
                l_sessionService_2:ReplaceSession(l_Level2b_1, v56.name or v55.name .. "Page");
                return;
            else
                l_sessionService_2:SetSession(l_Level2a_1, l_Level2b_1, v56.name or v55.name .. "Page");
            end;
        end;
    end;
    v33:setState({
        RNLevel2a = {
            name = v15.GetDefaultAppPage()
        }, 
        RNLevel2b = {}
    });
    v33._processRouteSignal = function(v61) --[[ Line: 188 ]]
        -- upvalues: v27 (ref), v33 (copy), l_SessionType_0 (ref)
        local v62 = v27(v61) or {};
        v33:setState({
            RNLevel2a = v62[l_SessionType_0.StructuralIdentifier.Level2a], 
            RNLevel2b = v62[l_SessionType_0.StructuralIdentifier.Level2b] or {}
        });
    end;
end;
v32.render = function(_) --[[ Line: 198 ]] --[[ Name: render ]]

end;
v32.didMount = function(v64) --[[ Line: 200 ]] --[[ Name: didMount ]]
    -- upvalues: l_mutedError_0 (copy)
    v64.updateGameSearchSession();
    v64.updateGameDetailSourceSession();
    v64.updateSessionService(nil, nil, v64.state.RNLevel2a, v64.state.RNLevel2b);
    if v64.props.connectRouteSignal then
        v64._routeChangedConnection = v64.props.connectRouteSignal(v64._processRouteSignal);
        return;
    else
        l_mutedError_0("Did not find a listener function in props, Session will not update");
        return;
    end;
end;
v32.didUpdate = function(v65, v66, v67) --[[ Line: 216 ]] --[[ Name: didUpdate ]]
    if (if v65.props.currentPage then v65.props.currentPage.name else "") ~= if v66 and v66.currentPage then v66.currentPage.name else "" then
        v65.updateGameSearchSession();
        v65.updateGameDetailSourceSession();
    end;
    v65.updateSessionService(v67.RNLevel2a, v67.RNLevel2b, v65.state.RNLevel2a, v65.state.RNLevel2b);
    if v66.connectRouteSignal ~= v65.props.connectRouteSignal then
        if v65._routeChangedConnection ~= nil then
            v65._routeChangedConnection:disconnect();
            v65._routeChangedConnection = nil;
        end;
        if v65.props.connectRouteSignal then
            v65._routeChangedConnection = v65.props.connectRouteSignal(v65._processRouteSignal);
        end;
    end;
end;
v32.willUnmount = function(v68) --[[ Line: 241 ]] --[[ Name: willUnmount ]]
    if v68._routeChangedConnection ~= nil then
        v68._routeChangedConnection:disconnect();
        v68._routeChangedConnection = nil;
    end;
end;
v32 = v2.connect(function(v69, _) --[[ Line: 249 ]]
    -- upvalues: l_selectCurrentLegacyPage_0 (copy), l_selectCurrentLegacyRoute_0 (copy)
    return {
        currentPage = l_selectCurrentLegacyPage_0(v69), 
        currentRoute = l_selectCurrentLegacyRoute_0(v69)
    };
end)(v32);
return l_RoactServices_0.connect({
    sessionService = l_AppSessionService_0, 
    loggingProtocol = l_AppLogging_0
})(v32);