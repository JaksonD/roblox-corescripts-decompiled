local l_Parent_0 = script:FindFirstAncestor("TenFootUiShell").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.InputHandlers);
local v4 = require(l_Parent_0.TenFootUiCommon);
local v5 = require(l_Parent_0.TenFootUiGlobalNav);
local v6 = require(l_Parent_0.FocusNavigationUtils);
local v7 = require(l_Parent_0.Navigation);
local l_useNavigation_0 = v7.useNavigation;
local v9 = require(l_Parent_0.Dash);
local l_useGlobalNavDisplayOptions_0 = v5.useGlobalNavDisplayOptions;
local l_getActiveChildNavigationOptionsRecursively_0 = v7.getActiveChildNavigationOptionsRecursively;
local l_FocusNavigationEventNameEnum_0 = v6.FocusNavigationEventNameEnum;
local l_TenFootUiContext_0 = v4.TenFootUiContext;
local l_GlobalNavDisplayOption_0 = v4.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_useFocusRegistryEntry_0 = v6.FocusNavigableSurfaceRegistry.useFocusRegistryEntry;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v6.FocusNavigableSurfaceIdentifierEnum;
local l_useDescendantHasFocus_0 = v6.useDescendantHasFocus;
local l_useRegistryEntry_0 = v6.FocusNavigableSurfaceRegistry.useRegistryEntry;
local l_getCurrentTabName_0 = require(l_Parent_0.NavigationRodux).Utils.getCurrentTabName;
local function _(v20, v21) --[[ Line: 29 ]] --[[ Name: forwardRefValue ]]
    if type(v20) == "function" then
        v20(v21);
        return;
    else
        if type(v20) == "table" then
            v20.current = v21;
        end;
        return;
    end;
end;
local function _(v23, v24) --[[ Line: 37 ]] --[[ Name: getNextTabFromRouteName ]]
    for v25, v26 in v24 do
        if v26.page == v23 then
            local v27 = v24[v25 + 1];
            if v27 ~= nil then
                return v27.page;
            end;
        end;
    end;
    return nil;
end;
local function _(v29, v30) --[[ Line: 49 ]] --[[ Name: getPrevTabFromRouteName ]]
    for v31, v32 in v30 do
        if v32.page == v29 then
            local v33 = v30[v31 - 1];
            if v33 ~= nil then
                return v33.page;
            end;
        end;
    end;
    return nil;
end;
local function _(v35) --[[ Line: 61 ]] --[[ Name: createNavigationBindingEventContext ]]
    return (("TenFootUiNavBinding%*"):format(v35));
end;
local v37 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.Search);
local v38 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabForward);
local v39 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabBackward);
local v40 = ("TenFootUiNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.NavigateBack);
useRootFocusNavigationBindings = function(v41) --[[ Line: 75 ]] --[[ Name: useRootFocusNavigationBindings ]]
    -- upvalues: v1 (copy), l_TenFootUiContext_0 (copy), l_useNavigation_0 (copy), l_useFocusRegistryEntry_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_useRegistryEntry_0 (copy), l_useDescendantHasFocus_0 (copy), l_useGlobalNavDisplayOptions_0 (copy), l_getActiveChildNavigationOptionsRecursively_0 (copy), l_GlobalNavDisplayOption_0 (copy), v9 (copy), l_getCurrentTabName_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v2 (copy), v3 (copy), v37 (copy), v38 (copy), v39 (copy), v40 (copy)
    local v42 = false;
    local v43 = false;
    local v46 = v1.useCallback(function(v44) --[[ Line: 76 ]]
        -- upvalues: v41 (copy)
        if v41 then
            local l_v41_0 = v41;
            if type(l_v41_0) == "function" then
                l_v41_0(v44);
                return;
            elseif type(l_v41_0) == "table" then
                l_v41_0.current = v44;
            end;
        end;
    end, {
        v41
    });
    local v47 = v1.useContext(l_TenFootUiContext_0);
    local v48 = l_useNavigation_0();
    local v49 = l_useFocusRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v50 = l_useRegistryEntry_0(l_FocusNavigableSurfaceIdentifierEnum_0.NavBar);
    local v51 = l_useDescendantHasFocus_0(v50);
    local v52 = l_useGlobalNavDisplayOptions_0(v48, l_getActiveChildNavigationOptionsRecursively_0);
    local v53 = true;
    if v52 ~= l_GlobalNavDisplayOption_0.TabGroupOnly then
        v53 = v52 == l_GlobalNavDisplayOption_0.ShowAll;
    end;
    local v54 = v48.state.key or v48.state.routes[v48.state.index].key;
    local v55 = if v47 then v47.globalNavConfig.tabs else {};
    local v56 = if v47 then v47.useRoactService(v47.RoactAnalytics).EventStream else nil;
    local v57 = if v47 then v47.buttonClick else v9.noop;
    local v58 = l_getCurrentTabName_0(v48.state);
    local v59;
    for v60, v61 in v55 do
        if v61.page == v58 then
            local v62 = v55[v60 - 1];
            if v62 ~= nil then
                v59 = v62.page;
                v42 = true;
            end;
        end;
        if v42 then
            break;
        end;
    end;
    if not v42 then
        v59 = nil;
    end;
    v42 = false;
    local v63;
    for v64, v65 in v55 do
        if v65.page == v58 then
            local v66 = v55[v64 + 1];
            if v66 ~= nil then
                v63 = v66.page;
                v43 = true;
            end;
        end;
        if v43 then
            break;
        end;
    end;
    if not v43 then
        v63 = nil;
    end;
    v43 = false;
    local v67 = v1.useMemo(function() --[[ Line: 99 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref)
        return {
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
            [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
            [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward, 
            [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.Search
        };
    end, {});
    local v68 = v2.useEventMap(v67, v46);
    local v74 = v1.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: v53 (copy), l_FocusNavigationEventNameEnum_0 (ref), v3 (ref), v48 (copy), v57 (copy), v56 (copy), v37 (ref), v54 (copy), v63 (copy), v38 (ref), v59 (copy), v39 (ref), v51 (copy), v49 (copy), v40 (ref)
        local v69 = {};
        if v53 then
            v69[l_FocusNavigationEventNameEnum_0.Search] = {
                handler = v3.onRelease(function(_) --[[ Line: 118 ]]
                    -- upvalues: v48 (ref), v57 (ref), v56 (ref), v37 (ref), v54 (ref)
                    v48.navigate("SearchPage");
                    v57(v56, v37, "SearchPage", v54);
                end)
            };
            v69[l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v3.onRelease(function(_) --[[ Line: 124 ]]
                    -- upvalues: v63 (ref), v48 (ref), v57 (ref), v56 (ref), v38 (ref), v54 (ref)
                    if v63 then
                        v48.navigate(v63);
                        v57(v56, v38, v63, v54);
                    end;
                end)
            };
            v69[l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v3.onRelease(function(_) --[[ Line: 132 ]]
                    -- upvalues: v59 (ref), v48 (ref), v57 (ref), v56 (ref), v39 (ref), v54 (ref)
                    if v59 then
                        v48.navigate(v59);
                        v57(v56, v39, v59, v54);
                    end;
                end)
            };
            v69[l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v3.onRelease(function(_) --[[ Line: 140 ]]
                    -- upvalues: v51 (ref), v49 (ref)
                    if not v51 then
                        v49();
                    end;
                end)
            };
            return v69;
        else
            v69[l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v3.onRelease(function() --[[ Line: 148 ]]
                    -- upvalues: v48 (ref), v57 (ref), v56 (ref), v40 (ref), v54 (ref)
                    if v48.pop ~= nil then
                        v48.pop();
                    else
                        v48.goBack();
                    end;
                    v57(v56, v40, "unknown", v54);
                end)
            };
            return v69;
        end;
    end, {
        v48, 
        v56, 
        v57, 
        v63, 
        v59, 
        v54, 
        v49, 
        v51, 
        v53
    });
    return (v2.useEventHandlerMap(v74, v68));
end;
return useRootFocusNavigationBindings;