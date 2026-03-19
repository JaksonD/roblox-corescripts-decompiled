local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_StackActions_0 = require(l_Parent_0.RoactNavigation).StackActions;
local l_FFlagLuaAppDerivedStackAndSwitchState_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDerivedStackAndSwitchState;
local v7 = require(script.Parent.ViewState);
local _ = require(script.Parent.types);
local v9 = {
    SetCurrent = "SetCurrent", 
    SetOpening = "SetOpening", 
    SetOpened = "SetOpened", 
    SetClosing = "SetClosing", 
    SetClosed = "SetClosed"
};
local function v10(v11, v12) --[[ Line: 73 ]] --[[ Name: RouteViewStatesReducer ]]
    -- upvalues: l_Array_0 (copy), v9 (copy), v10 (copy), v7 (copy), l_Object_0 (copy)
    local v14 = l_Array_0.findIndex(v11, function(v13) --[[ Line: 74 ]]
        -- upvalues: v12 (copy)
        return v13.descriptor.key == v12.key;
    end);
    if v12.type == v9.SetCurrent then
        for _, v16 in v12.navigationState.routes do
            v11 = v10(v11, {
                type = v9.SetOpening, 
                key = v16.key, 
                descriptor = v12.descriptors[v16.key]
            });
        end;
        for _, v18 in v11 do
            if not (v12.descriptors[v18.descriptor.key] ~= nil) then
                v11 = v10(v11, {
                    type = v9.SetClosing, 
                    key = v18.descriptor.key
                });
            end;
        end;
        return v11;
    else
        if v12.type == v9.SetOpening then
            if v14 == -1 then
                v11 = table.clone(v11);
                table.insert(v11, {
                    viewState = v7.Opening, 
                    descriptor = v12.descriptor
                });
                return v11;
            elseif v11[v14].viewState == v7.Closing then
                v11 = table.clone(v11);
                v11[v14] = l_Object_0.assign({}, v11[v14], {
                    viewState = v7.Opening, 
                    descriptor = v12.descriptor
                });
                return v11;
            elseif v11[v14].descriptor ~= v12.descriptor then
                v11 = table.clone(v11);
                v11[v14] = l_Object_0.assign({}, v11[v14], {
                    descriptor = v12.descriptor
                });
                return v11;
            end;
        elseif v12.type == v9.SetOpened then
            if v14 ~= -1 and v11[v14].viewState == v7.Opening then
                v11 = table.clone(v11);
                v11[v14] = l_Object_0.assign({}, v11[v14], {
                    viewState = v7.Opened
                });
                return v11;
            end;
        elseif v12.type == v9.SetClosing then
            if v14 ~= -1 and v11[v14].viewState ~= v7.Closing then
                v11 = table.clone(v11);
                v11[v14] = l_Object_0.assign({}, v11[v14], {
                    viewState = v7.Closing
                });
                return v11;
            end;
        elseif v12.type == v9.SetClosed and v14 ~= -1 and v11[v14].viewState == v7.Closing then
            v11 = table.clone(v11);
            table.remove(v11, v14);
        end;
        return v11;
    end;
end;
return function(v19) --[[ Line: 147 ]] --[[ Name: useStackScreens ]]
    -- upvalues: v1 (copy), v10 (copy), l_FFlagLuaAppDerivedStackAndSwitchState_0 (copy), v9 (copy), l_StackActions_0 (copy), l_Array_0 (copy), l_Object_0 (copy)
    local l_navigation_0 = v19.navigation;
    local l_state_0 = l_navigation_0.state;
    local l_descriptors_0 = v19.descriptors;
    local v23, v24 = v1.useReducer(v10, {});
    if l_FFlagLuaAppDerivedStackAndSwitchState_0 then
        v1.useMemo(function() --[[ Line: 158 ]]
            -- upvalues: v24 (copy), v9 (ref), l_state_0 (copy), l_descriptors_0 (copy)
            v24({
                type = v9.SetCurrent, 
                navigationState = l_state_0, 
                descriptors = l_descriptors_0
            });
        end, {
            l_state_0, 
            l_descriptors_0
        });
    else
        v1.useLayoutEffect(function() --[[ Line: 166 ]]
            -- upvalues: v24 (copy), v9 (ref), l_state_0 (copy), l_descriptors_0 (copy)
            v24({
                type = v9.SetCurrent, 
                navigationState = l_state_0, 
                descriptors = l_descriptors_0
            });
        end, {
            l_state_0, 
            l_descriptors_0
        });
    end;
    local v26 = v1.useCallback(function(v25) --[[ Line: 175 ]]
        -- upvalues: l_navigation_0 (copy), l_StackActions_0 (ref)
        if l_navigation_0.state.isTransitioning then
            l_navigation_0.dispatch(l_StackActions_0.completeTransition({
                key = l_navigation_0.state.key, 
                toChildKey = v25
            }));
        end;
    end, {
        l_navigation_0
    });
    local v28 = v1.useCallback(function(v27) --[[ Line: 184 ]]
        -- upvalues: v24 (copy), v9 (ref), v26 (copy)
        v24({
            type = v9.SetOpened, 
            key = v27.descriptor.key
        });
        v26(v27.descriptor.key);
    end, {
        v26
    });
    local v30 = v1.useCallback(function(v29) --[[ Line: 192 ]]
        -- upvalues: v24 (copy), v9 (ref)
        v24({
            type = v9.SetClosed, 
            key = v29.descriptor.key
        });
    end, {});
    return (v1.useMemo(function() --[[ Line: 199 ]]
        -- upvalues: l_Array_0 (ref), v23 (copy), l_Object_0 (ref), v28 (copy), v30 (copy)
        return l_Array_0.map(v23, function(v31) --[[ Line: 200 ]]
            -- upvalues: l_Object_0 (ref), v28 (ref), v30 (ref)
            return l_Object_0.assign({}, v31, {
                setOpened = function() --[[ Line: 202 ]] --[[ Name: setOpened ]]
                    -- upvalues: v28 (ref), v31 (copy)
                    v28(v31);
                end, 
                setClosed = function() --[[ Line: 205 ]] --[[ Name: setClosed ]]
                    -- upvalues: v30 (ref), v31 (copy)
                    v30(v31);
                end
            });
        end);
    end, {
        v23, 
        v28, 
        v30
    }));
end;