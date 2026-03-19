local l_Parent_0 = script:FindFirstAncestor("ServerDrivenUi").Parent;
local v1 = require(l_Parent_0.React);
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v6 = require(l_Parent_0.Foundation);
local l_useCursor_0 = v6.Hooks.useCursor;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v9 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v9.AppEventIngestService;
local l_AppSessionService_0 = v9.AppSessionService;
local l_RoactAnalyticsCommonGameEvents_0 = v9.RoactAnalyticsCommonGameEvents;
local l_RoactAnalytics_0 = v9.RoactAnalytics;
local l_RoactNetworking_0 = v9.RoactNetworking;
local l_SduiLogger_0 = require(l_Parent_0.SduiCoreSystem).SduiLogger;
return function(v16) --[[ Line: 27 ]] --[[ Name: useSduiDependencies ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), v1 (copy), l_RoactNetworking_0 (copy), l_LocalizationRoactContext_0 (copy), l_useCursor_0 (copy), v6 (copy), l_LinkingProtocol_0 (copy), l_SduiLogger_0 (copy)
    local v17 = l_useDispatch_0();
    local v18 = l_useNavigation_0();
    local v19 = l_useRoactService_0(l_RoactAnalytics_0);
    local v20 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v21 = l_useRoactService_0(l_AppEventIngestService_0);
    local v22 = l_useRoactService_0(l_AppSessionService_0);
    local v23 = v1.useRef(v18);
    v23.current = v18;
    local v24 = v1.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: v23 (copy)
        return v23.current;
    end, {
        v23
    });
    local v25 = l_useRoactService_0(l_RoactNetworking_0);
    local v26 = v1.useContext(l_LocalizationRoactContext_0);
    local v27 = l_useCursor_0(v6.Enums.CursorType.RoundedRect);
    local v28 = v1.useMemo(function() --[[ Line: 45 ]]
        -- upvalues: v27 (copy)
        return {
            tileCursor = v27
        };
    end, {
        v27
    });
    return (v1.useMemo(function() --[[ Line: 52 ]]
        -- upvalues: v17 (copy), v24 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), l_LinkingProtocol_0 (ref), l_SduiLogger_0 (ref), v28 (copy), v16 (copy), v26 (copy), v25 (copy)
        return {
            dispatch = v17, 
            getNavigation = v24, 
            appAnalytics = v19, 
            gameAnalytics = v20, 
            eventIngest = v21, 
            sessionService = v22, 
            linkingProtocol = l_LinkingProtocol_0.default, 
            logger = l_SduiLogger_0, 
            cursors = v28, 
            instrumentation = v16, 
            localization = v26, 
            networking = v25
        };
    end, {
        v17, 
        v24, 
        v19, 
        v20, 
        v21, 
        v16, 
        v22, 
        v26, 
        v25, 
        v28
    }));
end;