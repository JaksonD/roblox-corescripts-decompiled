local l_Parent_0 = script:FindFirstAncestor("BumperNavigation").Parent;
local l_FFlagUseNavigationSelectors_0 = require(l_Parent_0.SharedFlags).FFlagUseNavigationSelectors;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v4 = require(l_Parent_0.InputHandlers);
local v5 = require(l_Parent_0.FocusNavigationUtils);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_Selectors_0 = require(l_Parent_0.NavigationRodux).Selectors;
local l_FocusNavigationEventNameEnum_0 = v5.FocusNavigationEventNameEnum;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v12 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v12.usePreferredInput;
local l_Input_0 = v12.Input;
local l_useIsSpatial_0 = v12.useIsSpatial;
local v16 = require(l_Parent_0.AppNavBar);
local l_useNavBarPlacement_0 = v16.useNavBarPlacement;
local l_Placement_0 = v16.Placement;
local function v22(v19) --[[ Line: 26 ]] --[[ Name: selectTopLevelRouteName ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy)
    local v20 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectLegacyHistory(v19) else v19.Navigation.history;
    local v21 = v20[#v20][1];
    return v21 and v21.name or "None";
end;
local function _(v23, v24) --[[ Line: 35 ]] --[[ Name: getNextTabFromRouteName ]]
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
local function _(v29, v30) --[[ Line: 47 ]] --[[ Name: getPrevTabFromRouteName ]]
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
local function v40(v35, v36, v37, v38) --[[ Line: 59 ]] --[[ Name: buttonClick ]]
    assert(type(v36) == "string", "Expected eventContext to be a string");
    assert(type(v37) == "string", "Expected buttonName to be a string");
    local v39 = {
        btn = v37
    };
    if v38 ~= nil then
        assert(type(v38) == "string", "Expected extraData to be a string");
        v39.cstm = v38;
    end;
    v35:setRBXEventStream(v36, "buttonClick", v39);
end;
local function _(v41) --[[ Line: 76 ]] --[[ Name: createNavigationBindingEventContext ]]
    return (("GamepadBumperNavBinding%*"):format(v41));
end;
local v43 = ("GamepadBumperNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabForward);
local v44 = ("GamepadBumperNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabBackward);
local v45 = {};
useGamepadBumperNavigationBindings = function(v46) --[[ Line: 83 ]] --[[ Name: useGamepadBumperNavigationBindings ]]
    -- upvalues: l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_useSelector_0 (copy), v22 (copy), l_usePreferredInput_0 (copy), l_Input_0 (copy), l_useNavBarPlacement_0 (copy), l_Placement_0 (copy), l_useIsSpatial_0 (copy), v2 (copy), l_FocusNavigationEventNameEnum_0 (copy), v4 (copy), v40 (copy), v43 (copy), v44 (copy), v45 (copy)
    local v47 = false;
    local v48 = false;
    local v49 = l_useNavigation_0();
    local v50 = v49.state.key or v49.state.routes[v49.state.index].key;
    local l_EventStream_0 = l_useRoactService_0(l_RoactAnalytics_0).EventStream;
    local v52 = l_useSelector_0(v22);
    local v53;
    for v54, v55 in v46 do
        if v55.page == v52 then
            local v56 = v46[v54 - 1];
            if v56 ~= nil then
                v53 = v56.page;
                v47 = true;
            end;
        end;
        if v47 then
            break;
        end;
    end;
    if not v47 then
        v53 = nil;
    end;
    v47 = false;
    local v57;
    for v58, v59 in v46 do
        if v59.page == v52 then
            local v60 = v46[v58 + 1];
            if v60 ~= nil then
                v57 = v60.page;
                v48 = true;
            end;
        end;
        if v48 then
            break;
        end;
    end;
    if not v48 then
        v57 = nil;
    end;
    v48 = false;
    local v62 = l_useSelector_0(function(v61) --[[ Line: 90 ]]
        return v61.TabBarVisible;
    end);
    local v63 = l_usePreferredInput_0() == l_Input_0.Directional;
    local v64 = l_useNavBarPlacement_0() == l_Placement_0.Left;
    local v65 = l_useIsSpatial_0();
    local v66 = v62 and v63 and v64 and not v65;
    local v67 = v2.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref)
        return {
            [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
            [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward
        };
    end, {});
    local v70 = v2.useMemo(function() --[[ Line: 107 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v4 (ref), v57 (copy), v49 (copy), v40 (ref), l_EventStream_0 (copy), v43 (ref), v50 (copy), v53 (copy), v44 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v4.onRelease(function(_) --[[ Line: 111 ]]
                    -- upvalues: v57 (ref), v49 (ref), v40 (ref), l_EventStream_0 (ref), v43 (ref), v50 (ref)
                    if v57 then
                        v49.navigate(v57);
                        v40(l_EventStream_0, v43, v57, v50);
                    end;
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v4.onRelease(function(_) --[[ Line: 119 ]]
                    -- upvalues: v53 (ref), v49 (ref), v40 (ref), l_EventStream_0 (ref), v44 (ref), v50 (ref)
                    if v53 then
                        v49.navigate(v53);
                        v40(l_EventStream_0, v44, v53, v50);
                    end;
                end)
            }
        };
    end, {
        v49, 
        l_EventStream_0, 
        v57, 
        v53, 
        v50
    });
    local v71 = if v66 then v67 else v45;
    local v72 = if v66 then v70 else v45;
    return {
        isBumperNavigationEnabled = v66, 
        eventMap = v71, 
        eventHandlerMap = v72
    };
end;
return useGamepadBumperNavigationBindings;