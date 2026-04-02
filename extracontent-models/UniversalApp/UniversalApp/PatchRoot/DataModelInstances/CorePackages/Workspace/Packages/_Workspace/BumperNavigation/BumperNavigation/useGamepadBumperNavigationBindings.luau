local l_Parent_0 = script:FindFirstAncestor("BumperNavigation").Parent;
local v1 = require(l_Parent_0.React);
local _ = require(l_Parent_0.ReactFocusNavigation);
local v3 = require(l_Parent_0.InputHandlers);
local v4 = require(l_Parent_0.FocusNavigationUtils);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_FocusNavigationEventNameEnum_0 = v4.FocusNavigationEventNameEnum;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactAnalytics_0 = require(l_Parent_0.RoactServiceTags).RoactAnalytics;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v10 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v10.usePreferredInput;
local l_Input_0 = v10.Input;
local v13 = require(l_Parent_0.AppNavBar);
local l_useNavBarPlacement_0 = v13.useNavBarPlacement;
local l_Placement_0 = v13.Placement;
local function v19(v16) --[[ Line: 23 ]] --[[ Name: selectTopLevelRouteName ]]
    local l_history_0 = v16.Navigation.history;
    local v18 = l_history_0[#l_history_0][1];
    return v18 and v18.name or "None";
end;
local function _(v20, v21) --[[ Line: 30 ]] --[[ Name: getNextTabFromRouteName ]]
    for v22, v23 in v21 do
        if v23.page == v20 then
            local v24 = v21[v22 + 1];
            if v24 ~= nil then
                return v24.page;
            end;
        end;
    end;
    return nil;
end;
local function _(v26, v27) --[[ Line: 42 ]] --[[ Name: getPrevTabFromRouteName ]]
    for v28, v29 in v27 do
        if v29.page == v26 then
            local v30 = v27[v28 - 1];
            if v30 ~= nil then
                return v30.page;
            end;
        end;
    end;
    return nil;
end;
local function v37(v32, v33, v34, v35) --[[ Line: 54 ]] --[[ Name: buttonClick ]]
    assert(type(v33) == "string", "Expected eventContext to be a string");
    assert(type(v34) == "string", "Expected buttonName to be a string");
    local v36 = {
        btn = v34
    };
    if v35 ~= nil then
        assert(type(v35) == "string", "Expected extraData to be a string");
        v36.cstm = v35;
    end;
    v32:setRBXEventStream(v33, "buttonClick", v36);
end;
local function _(v38) --[[ Line: 71 ]] --[[ Name: createNavigationBindingEventContext ]]
    return (("GamepadBumperNavBinding%*"):format(v38));
end;
local v40 = ("GamepadBumperNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabForward);
local v41 = ("GamepadBumperNavBinding%*"):format(l_FocusNavigationEventNameEnum_0.TabBackward);
local v42 = {};
useGamepadBumperNavigationBindings = function(v43) --[[ Line: 78 ]] --[[ Name: useGamepadBumperNavigationBindings ]]
    -- upvalues: l_useNavigation_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_useSelector_0 (copy), v19 (copy), l_usePreferredInput_0 (copy), l_Input_0 (copy), l_useNavBarPlacement_0 (copy), l_Placement_0 (copy), v1 (copy), l_FocusNavigationEventNameEnum_0 (copy), v3 (copy), v37 (copy), v40 (copy), v41 (copy), v42 (copy)
    local v44 = false;
    local v45 = false;
    local v46 = l_useNavigation_0();
    local v47 = v46.state.key or v46.state.routes[v46.state.index].key;
    local l_EventStream_0 = l_useRoactService_0(l_RoactAnalytics_0).EventStream;
    local v49 = l_useSelector_0(v19);
    local v50;
    for v51, v52 in v43 do
        if v52.page == v49 then
            local v53 = v43[v51 - 1];
            if v53 ~= nil then
                v50 = v53.page;
                v44 = true;
            end;
        end;
        if v44 then
            break;
        end;
    end;
    if not v44 then
        v50 = nil;
    end;
    v44 = false;
    local v54;
    for v55, v56 in v43 do
        if v56.page == v49 then
            local v57 = v43[v55 + 1];
            if v57 ~= nil then
                v54 = v57.page;
                v45 = true;
            end;
        end;
        if v45 then
            break;
        end;
    end;
    if not v45 then
        v54 = nil;
    end;
    v45 = false;
    local v59 = l_useSelector_0(function(v58) --[[ Line: 85 ]]
        return v58.TabBarVisible;
    end);
    local v60 = l_usePreferredInput_0() == l_Input_0.Directional;
    local v61 = l_useNavBarPlacement_0() == l_Placement_0.Left;
    local v62 = v59 and v60 and v61;
    local v63 = v1.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref)
        return {
            [Enum.KeyCode.ButtonR1] = l_FocusNavigationEventNameEnum_0.TabForward, 
            [Enum.KeyCode.ButtonL1] = l_FocusNavigationEventNameEnum_0.TabBackward
        };
    end, {});
    local v66 = v1.useMemo(function() --[[ Line: 101 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v3 (ref), v54 (copy), v46 (copy), v37 (ref), l_EventStream_0 (copy), v40 (ref), v47 (copy), v50 (copy), v41 (ref)
        return {
            [l_FocusNavigationEventNameEnum_0.TabForward] = {
                handler = v3.onRelease(function(_) --[[ Line: 105 ]]
                    -- upvalues: v54 (ref), v46 (ref), v37 (ref), l_EventStream_0 (ref), v40 (ref), v47 (ref)
                    if v54 then
                        v46.navigate(v54);
                        v37(l_EventStream_0, v40, v54, v47);
                    end;
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.TabBackward] = {
                handler = v3.onRelease(function(_) --[[ Line: 113 ]]
                    -- upvalues: v50 (ref), v46 (ref), v37 (ref), l_EventStream_0 (ref), v41 (ref), v47 (ref)
                    if v50 then
                        v46.navigate(v50);
                        v37(l_EventStream_0, v41, v50, v47);
                    end;
                end)
            }
        };
    end, {
        v46, 
        l_EventStream_0, 
        v54, 
        v50, 
        v47
    });
    local v67 = if v62 then v63 else v42;
    local v68 = if v62 then v66 else v42;
    return {
        eventMap = v67, 
        eventHandlerMap = v68
    };
end;
return useGamepadBumperNavigationBindings;