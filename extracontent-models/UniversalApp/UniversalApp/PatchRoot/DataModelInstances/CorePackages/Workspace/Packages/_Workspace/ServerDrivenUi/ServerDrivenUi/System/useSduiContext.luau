local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerDrivenUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_LinkingProtocol_0 = require(l_Parent_0.LinkingProtocol).LinkingProtocol;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_LocalizationRoactContext_0 = require(l_Parent_0.Localization).LocalizationRoactContext;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local v7 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v7.Hooks.useTokens;
local l_useCursor_0 = v7.Hooks.useCursor;
local l_CollectionItemSize_0 = require(l_Parent_0.CollectionViews).CollectionViewTypes.CollectionItemSize;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local v12 = require(l_Parent_0.RoactServiceTags);
local l_AppEventIngestService_0 = v12.AppEventIngestService;
local l_AppSessionService_0 = v12.AppSessionService;
local l_RoactAnalyticsCommonGameEvents_0 = v12.RoactAnalyticsCommonGameEvents;
local l_RoactAnalytics_0 = v12.RoactAnalytics;
local l_RoactNetworking_0 = v12.RoactNetworking;
local v18 = require(l_Parent_0.Signals);
local v19 = require(l_Parent_0.SduiCoreSystem);
local v20 = require(l_script_FirstAncestor_0.System.SduiActionHandlerRegistry);
local v21 = require(l_script_FirstAncestor_0.System.SduiComponentDefinitions);
local l_SduiInstrumentation_0 = v19.SduiInstrumentation;
local l_SduiLogger_0 = v19.SduiLogger;
local l_SduiTemplateRegistry_0 = v19.SduiTemplateRegistry;
local v25 = require(l_script_FirstAncestor_0.DataStore.useSduiDataStore);
local l_SduiErrors_0 = v19.SduiErrors;
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagSduiActionHandlerSharedRegistry_0 = require(l_Parent_0.SharedFlags).FFlagSduiActionHandlerSharedRegistry;
local v29 = {
    numColumns = 3, 
    fractionalItemAmount = 0, 
    columnGap = 24, 
    sideMargin = 24, 
    verticalPadding = 16
};
local v30 = nil;
v30 = if l_FFlagSduiActionHandlerSharedRegistry_0 then require(l_script_FirstAncestor_0.System.useSduiDependencies) else function(v31) --[[ Line: 61 ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactAnalyticsCommonGameEvents_0 (copy), l_AppEventIngestService_0 (copy), l_AppSessionService_0 (copy), l_useTokens_0 (copy), v2 (copy), l_RoactNetworking_0 (copy), l_LocalizationRoactContext_0 (copy), l_useCursor_0 (copy), v7 (copy), l_LinkingProtocol_0 (copy), l_SduiLogger_0 (copy)
    local v32 = l_useDispatch_0();
    local v33 = l_useNavigation_0();
    local v34 = l_useRoactService_0(l_RoactAnalytics_0);
    local v35 = l_useRoactService_0(l_RoactAnalyticsCommonGameEvents_0);
    local v36 = l_useRoactService_0(l_AppEventIngestService_0);
    local v37 = l_useRoactService_0(l_AppSessionService_0);
    local v38 = l_useTokens_0();
    local v39 = v2.useRef(v33);
    v39.current = v33;
    local v40 = v2.useCallback(function() --[[ Line: 73 ]]
        -- upvalues: v39 (copy)
        return v39.current;
    end, {
        v39
    });
    local v41 = l_useRoactService_0(l_RoactNetworking_0);
    local v42 = v2.useContext(l_LocalizationRoactContext_0);
    local v43 = l_useCursor_0(v7.Enums.CursorType.RoundedRect);
    local v44 = v2.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: v43 (copy)
        return {
            tileCursor = v43
        };
    end, {
        v43
    });
    return (v2.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v32 (copy), v40 (copy), v34 (copy), v35 (copy), v36 (copy), v37 (copy), l_LinkingProtocol_0 (ref), l_SduiLogger_0 (ref), v38 (copy), v44 (copy), v31 (copy), v42 (copy), v41 (copy)
        return {
            dispatch = v32, 
            getNavigation = v40, 
            appAnalytics = v34, 
            gameAnalytics = v35, 
            eventIngest = v36, 
            sessionService = v37, 
            linkingProtocol = l_LinkingProtocol_0.default, 
            logger = l_SduiLogger_0, 
            tokens = v38, 
            cursors = v44, 
            instrumentation = v31, 
            localization = v42, 
            networking = v41
        };
    end, {
        v32, 
        v40, 
        v34, 
        v35, 
        v36, 
        v38, 
        v31, 
        v37, 
        v42, 
        v41, 
        v44
    }));
end;
return function(v45) --[[ Line: 140 ]] --[[ Name: useSduiContext ]]
    -- upvalues: v2 (copy), l_SduiInstrumentation_0 (copy), v30 (ref), l_FFlagSduiActionHandlerSharedRegistry_0 (copy), v20 (copy), v21 (copy), l_SduiTemplateRegistry_0 (copy), v25 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v18 (copy), v29 (copy), l_CollectionItemSize_0 (copy), l_SduiLogger_0 (copy), l_SduiErrors_0 (copy)
    local v46 = v2.useMemo(function() --[[ Line: 141 ]]
        -- upvalues: l_SduiInstrumentation_0 (ref)
        return l_SduiInstrumentation_0.new();
    end, {});
    v46:startTimerFlow("useSduiContext");
    local v47 = v30(v46);
    local v48 = nil;
    if not l_FFlagSduiActionHandlerSharedRegistry_0 then
        v48 = v2.useMemo(function() --[[ Line: 152 ]]
            -- upvalues: v45 (copy), v20 (ref)
            return v45.actionHandlerRegistry or v20.new();
        end, {
            v45.actionHandlerRegistry
        });
    end;
    local v49 = v2.useMemo(function() --[[ Line: 158 ]]
        -- upvalues: v45 (copy), v21 (ref)
        return v45.componentDefinitions or v21.new();
    end, {
        v45.componentDefinitions
    });
    local v50 = v2.useMemo(function() --[[ Line: 162 ]]
        -- upvalues: l_SduiTemplateRegistry_0 (ref), v45 (copy)
        return l_SduiTemplateRegistry_0.new(v45.templates);
    end, {
        v45.templates
    });
    local v51 = v25();
    local v52 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v53 = v2.useMemo(function() --[[ Line: 170 ]]
            -- upvalues: v18 (ref), v29 (ref)
            return v18.createSignal(v29);
        end, {});
        local l_v53_0 = v53 --[[ copy: 8 -> 9 ]];
        v52 = v2.useCallback(function(v55) --[[ Line: 174 ]]
            -- upvalues: v18 (ref), v45 (copy), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_v53_0 (copy)
            return v18.createComputed(function(v56) --[[ Line: 175 ]]
                -- upvalues: v45 (ref), v55 (copy), l_CollectionItemSize_0 (ref), l_SduiLogger_0 (ref), l_SduiErrors_0 (ref), l_v53_0 (ref)
                if v45.pageLayoutConfig then
                    return (v45.pageLayoutConfig[v55] or v45.pageLayoutConfig[l_CollectionItemSize_0.Small])(v56);
                else
                    l_SduiLogger_0.reportError(l_SduiErrors_0.SduiErrorType.NoPageLayoutConfig, {
                        message = ("No page layout config available for %*, returning default config"):format(v45.appPage)
                    }, v45.appPage);
                    return (l_v53_0(v56));
                end;
            end);
        end, {
            v45.pageLayoutConfig
        });
    end;
    local v58 = v2.useMemo(function() --[[ Line: 192 ]]
        -- upvalues: v47 (copy), v45 (copy), v49 (copy), l_FFlagSduiActionHandlerSharedRegistry_0 (ref), v48 (ref), v50 (copy), v51 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v52 (ref)
        local v57 = {
            dependencies = v47, 
            appPage = v45.appPage, 
            dataUpdatedTimestamp = v45.dataUpdatedTimestamp, 
            componentDefinitions = v49, 
            actionHandlerRegistry = if l_FFlagSduiActionHandlerSharedRegistry_0 then nil else v48, 
            templateRegistry = v50, 
            dataStore = v51, 
            getPageLayoutConfig = if l_FFlagLuaAppLayoutParamsInContext_0 then v52 else nil
        };
        setmetatable(v57, {
            __tostring = function() --[[ Line: 205 ]] --[[ Name: __tostring ]]
                return "SduiContext";
            end
        });
        return v57;
    end, {
        v47, 
        v45.appPage, 
        v45.dataUpdatedTimestamp, 
        v49, 
        if l_FFlagSduiActionHandlerSharedRegistry_0 then nil else v48, 
        v50, 
        v51, 
        if l_FFlagLuaAppLayoutParamsInContext_0 then v52 else nil
    });
    v46:stopTimerFlow("useSduiContext", v58);
    return v58;
end;