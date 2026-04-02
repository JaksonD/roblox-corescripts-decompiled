local l_script_FirstAncestor_0 = script:FindFirstAncestor("NotApprovedPage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utils.sendNotApprovedPageEvent);
local l_usePageNavigation_0 = require(l_script_FirstAncestor_0.Contexts.PageNavigationContext).usePageNavigation;
local l_EVENT_TYPES_0 = require(l_Parent_0.NotApprovedPageState).Constants.EVENT_TYPES;
local _ = require(l_script_FirstAncestor_0.Components.pageItemConfigs.PageItemConfigUtils);
local v6 = require(l_Parent_0.ArgCheck);
local v7 = require(l_Parent_0.Cryo);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local v9 = require(l_Parent_0.React);
local l_createContext_0 = v9.createContext;
local l_useCallback_0 = v9.useCallback;
local l_useContext_0 = v9.useContext;
local l_useEffect_0 = v9.useEffect;
local l_useMemo_0 = v9.useMemo;
local l_useRef_0 = v9.useRef;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_Parent_0.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local v18 = l_createContext_0({});
return {
    PageAnalyticsProvider = function(v19) --[[ Line: 55 ]] --[[ Name: PageAnalyticsProvider ]]
        -- upvalues: l_usePageNavigation_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), l_useCallback_0 (copy), v7 (copy), l_useMemo_0 (copy), v9 (copy), v18 (copy)
        local v20 = l_usePageNavigation_0();
        local l_currentPage_0 = v20.currentPage;
        local l_currentPageName_0 = v20.currentPageName;
        local l_unmappedViolationKeys_0 = v20.unmappedViolationKeys;
        local v24 = l_useRef_0(DateTime.now().UnixTimestampMillis);
        local v25 = l_useRef_0(l_currentPage_0);
        local v26 = l_useRef_0(l_currentPageName_0);
        local v27 = l_useRef_0(true);
        local function _() --[[ Line: 66 ]] --[[ Name: getTimeOnPageMs ]]
            -- upvalues: v24 (copy)
            return DateTime.now().UnixTimestampMillis - v24.current;
        end;
        l_useEffect_0(function() --[[ Line: 71 ]]
            -- upvalues: l_unmappedViolationKeys_0 (copy), v2 (ref), l_EVENT_TYPES_0 (ref)
            for _, v30 in l_unmappedViolationKeys_0 do
                v2({
                    eventType = l_EVENT_TYPES_0.UnmappedViolationKey, 
                    unmappedViolationKey = v30
                });
            end;
        end, {});
        l_useEffect_0(function() --[[ Line: 82 ]]
            -- upvalues: v27 (copy), v24 (copy), l_currentPage_0 (copy), v25 (copy), l_EVENT_TYPES_0 (ref), v2 (ref), v26 (copy), l_currentPageName_0 (copy)
            if v27.current then
                v27.current = false;
                return;
            else
                local v31 = DateTime.now().UnixTimestampMillis - v24.current;
                local v32 = if l_currentPage_0 > v25.current then l_EVENT_TYPES_0.ContinueClicked else l_EVENT_TYPES_0.BackClicked;
                v2({
                    eventType = v32, 
                    pageName = v26.current, 
                    timeOnPageMs = v31
                });
                v24.current = DateTime.now().UnixTimestampMillis;
                v25.current = l_currentPage_0;
                v26.current = l_currentPageName_0;
                return;
            end;
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            l_currentPage_0, 
            l_currentPageName_0
        } else l_dependencyArray_0(l_currentPage_0, l_currentPageName_0));
        local v37 = l_useCallback_0(function(v33, v34) --[[ Line: 114 ]]
            -- upvalues: v24 (copy), v7 (ref), l_currentPageName_0 (copy), v2 (ref)
            local v35 = DateTime.now().UnixTimestampMillis - v24.current;
            local v36 = v7.Dictionary.join({
                eventType = v33, 
                pageName = l_currentPageName_0, 
                timeOnPageMs = v35
            }, v34 or {});
            v2(v36);
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            l_currentPageName_0
        } else l_dependencyArray_0(l_currentPageName_0));
        local v38 = l_useMemo_0(function() --[[ Line: 126 ]]
            -- upvalues: v37 (copy)
            return {
                sendPageEvent = v37
            };
        end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
            v37
        } else l_dependencyArray_0(v37));
        return v9.createElement(v18.Provider, {
            value = v38
        }, v19.children);
    end, 
    usePageAnalytics = function() --[[ Line: 137 ]] --[[ Name: usePageAnalytics ]]
        -- upvalues: l_useContext_0 (copy), v18 (copy), v6 (copy)
        local v39 = l_useContext_0(v18);
        v6.assert(v39 and v39.sendPageEvent ~= nil, "usePageAnalytics must be used within PageAnalyticsProvider (which must also be nested inside PageNavigationProvider)");
        return v39;
    end
};