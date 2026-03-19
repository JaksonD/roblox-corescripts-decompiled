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
local v17 = l_createContext_0({});
return {
    PageAnalyticsProvider = function(v18) --[[ Line: 53 ]] --[[ Name: PageAnalyticsProvider ]]
        -- upvalues: l_usePageNavigation_0 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v2 (copy), l_EVENT_TYPES_0 (copy), l_dependencyArray_0 (copy), l_useCallback_0 (copy), v7 (copy), l_useMemo_0 (copy), v9 (copy), v17 (copy)
        local v19 = l_usePageNavigation_0();
        local l_currentPage_0 = v19.currentPage;
        local l_currentPageName_0 = v19.currentPageName;
        local l_unmappedViolationKeys_0 = v19.unmappedViolationKeys;
        local v23 = l_useRef_0(DateTime.now().UnixTimestampMillis);
        local v24 = l_useRef_0(l_currentPage_0);
        local v25 = l_useRef_0(l_currentPageName_0);
        local v26 = l_useRef_0(true);
        local function _() --[[ Line: 64 ]] --[[ Name: getTimeOnPageMs ]]
            -- upvalues: v23 (copy)
            return DateTime.now().UnixTimestampMillis - v23.current;
        end;
        l_useEffect_0(function() --[[ Line: 69 ]]
            -- upvalues: l_unmappedViolationKeys_0 (copy), v2 (ref), l_EVENT_TYPES_0 (ref)
            for _, v29 in l_unmappedViolationKeys_0 do
                v2({
                    eventType = l_EVENT_TYPES_0.UnmappedViolationKey, 
                    unmappedViolationKey = v29
                });
            end;
        end, {});
        l_useEffect_0(function() --[[ Line: 79 ]]
            -- upvalues: v26 (copy), v23 (copy), l_currentPage_0 (copy), v24 (copy), l_EVENT_TYPES_0 (ref), v2 (ref), v25 (copy), l_currentPageName_0 (copy)
            if v26.current then
                v26.current = false;
                return;
            else
                local v30 = DateTime.now().UnixTimestampMillis - v23.current;
                local v31 = if l_currentPage_0 > v24.current then l_EVENT_TYPES_0.ContinueClicked else l_EVENT_TYPES_0.BackClicked;
                v2({
                    eventType = v31, 
                    pageName = v25.current, 
                    timeOnPageMs = v30
                });
                v23.current = DateTime.now().UnixTimestampMillis;
                v24.current = l_currentPage_0;
                v25.current = l_currentPageName_0;
                return;
            end;
        end, l_dependencyArray_0(l_currentPage_0, l_currentPageName_0));
        local v36 = l_useCallback_0(function(v32, v33) --[[ Line: 107 ]]
            -- upvalues: v23 (copy), v7 (ref), l_currentPageName_0 (copy), v2 (ref)
            local v34 = DateTime.now().UnixTimestampMillis - v23.current;
            local v35 = v7.Dictionary.join({
                eventType = v32, 
                pageName = l_currentPageName_0, 
                timeOnPageMs = v34
            }, v33 or {});
            v2(v35);
        end, l_dependencyArray_0(l_currentPageName_0));
        local v37 = l_useMemo_0(function() --[[ Line: 119 ]]
            -- upvalues: v36 (copy)
            return {
                sendPageEvent = v36
            };
        end, l_dependencyArray_0(v36));
        return v9.createElement(v17.Provider, {
            value = v37
        }, v18.children);
    end, 
    usePageAnalytics = function() --[[ Line: 130 ]] --[[ Name: usePageAnalytics ]]
        -- upvalues: l_useContext_0 (copy), v17 (copy), v6 (copy)
        local v38 = l_useContext_0(v17);
        v6.assert(v38 and v38.sendPageEvent ~= nil, "usePageAnalytics must be used within PageAnalyticsProvider (which must also be nested inside PageNavigationProvider)");
        return v38;
    end
};