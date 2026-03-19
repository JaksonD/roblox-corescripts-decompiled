local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_1.React);
local v6 = require(l_Parent_1.Otter);
local v7 = require(script.Parent.ScenesReducer);
local v8 = require(l_Parent_0.utils.invariant);
local v9 = {
    frequency = 4
};
local function v20(v10, v11) --[[ Line: 17 ]] --[[ Name: buildTransitionProps ]]
    -- upvalues: v8 (copy)
    local l_navigation_0 = v10.navigation;
    local l_options_0 = v10.options;
    local l_layout_0 = v11.layout;
    local l_position_0 = v11.position;
    local l_scenes_0 = v11.scenes;
    local v17 = nil;
    for _, v19 in l_scenes_0 do
        if v19.isActive then
            v17 = v19;
            break;
        end;
    end;
    v8(v17, "Could not find active scene");
    return {
        layout = l_layout_0, 
        navigation = l_navigation_0, 
        position = l_position_0, 
        scenes = l_scenes_0, 
        scene = v17, 
        options = l_options_0, 
        index = v17.index
    };
end;
local function _(v21) --[[ Line: 46 ]] --[[ Name: filterStale ]]
    -- upvalues: l_Array_0 (copy)
    local v23 = l_Array_0.filter(v21, function(v22) --[[ Line: 47 ]]
        return not v22.isStale;
    end);
    if #v23 == #v21 then
        return v21;
    else
        return v23;
    end;
end;
local v25 = v5.Component:extend("Transitioner");
v25.init = function(v26) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v6 (copy), v7 (copy), v20 (copy)
    local l_state_0 = v26.props.navigation.state;
    local l_descriptors_0 = v26.props.descriptors;
    v26._ref = v5.createRef();
    v26.state = {
        layout = {
            initWidth = 0, 
            initHeight = 0, 
            isMeasured = false
        }, 
        position = v6.createSingleMotor(l_state_0.index), 
        scenes = v7({}, l_state_0, nil, l_descriptors_0)
    };
    v26._doOnAbsoluteSizeChanged = function(...) --[[ Line: 78 ]]
        -- upvalues: v26 (copy)
        return v26:_onAbsoluteSizeChanged(...);
    end;
    v26._positionLastValue = l_state_0.index;
    v26._prevTransitionProps = nil;
    v26._transitionProps = v20(v26.props, v26.state);
    v26._isMounted = false;
    v26._isTransitionRunning = false;
    v26._transitionQueue = {};
    v26._completeSignalDisconnector = v26.state.position:onComplete(function() --[[ Line: 91 ]]
        -- upvalues: v26 (copy)
        if v26._isMounted then
            v26:_onTransitionEnd();
        end;
    end);
    v26._stepSignalDisconnector = v26.state.position:onStep(function(v29) --[[ Line: 97 ]]
        -- upvalues: v26 (copy)
        if v26._isMounted then
            v26:_onPositionStep(v29);
        end;
    end);
end;
v25.didMount = function(v30) --[[ Line: 104 ]] --[[ Name: didMount ]]
    v30._isMounted = true;
end;
v25.willUnmount = function(v31) --[[ Line: 108 ]] --[[ Name: willUnmount ]]
    v31._isMounted = false;
    if v31._completeSignalDisconnector then
        v31._completeSignalDisconnector();
        v31._completeSignalDisconnector = nil;
    end;
    if v31._stepSignalDisconnector then
        v31._stepSignalDisconnector();
        v31._stepSignalDisconnector = nil;
    end;
end;
v25.didUpdate = function(v32, v33) --[[ Line: 122 ]] --[[ Name: didUpdate ]]
    if not v32.state.layout.isMeasured and v32._ref.current then
        v32:_onAbsoluteSizeChanged(v32._ref.current);
    end;
    if v32.props ~= v33 then
        if v32._isTransitionRunning then
            if (v32._transitionQueue[#v32._transitionQueue] or {}).prevProps ~= v33 then
                table.insert(v32._transitionQueue, {
                    prevProps = v33
                });
            end;
            return;
        else
            v32:_startTransition(v33, v32.props);
        end;
    end;
end;
v25.render = function(v34) --[[ Line: 147 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy)
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = false, 
        [v5.Change.AbsoluteSize] = v34._doOnAbsoluteSizeChanged, 
        ref = v34._ref
    }, {
        TransitionerScenes = v34.props.render(v34._transitionProps, v34._prevTransitionProps, v34)
    });
end;
v25._onAbsoluteSizeChanged = function(v35, v36) --[[ Line: 165 ]] --[[ Name: _onAbsoluteSizeChanged ]]
    -- upvalues: l_Object_0 (copy), v20 (copy)
    if not v35._isMounted then
        return;
    else
        local l_X_0 = v36.AbsoluteSize.X;
        local l_Y_0 = v36.AbsoluteSize.Y;
        if l_X_0 == v35.state.layout.initWidth and l_Y_0 == v35.state.layout.initHeight then
            return;
        else
            local v39 = l_Object_0.assign(table.clone(v35.state.layout), {
                initWidth = l_X_0, 
                initHeight = l_Y_0, 
                isMeasured = true
            });
            local v40 = l_Object_0.assign(table.clone(v35.state), {
                layout = v39
            });
            v35._transitionProps = v20(v35.props, v40);
            v35:setState({
                layout = v39
            });
            return;
        end;
    end;
end;
v25._computeScenes = function(v41, v42, v43) --[[ Line: 194 ]] --[[ Name: _computeScenes ]]
    -- upvalues: v7 (copy), l_Array_0 (copy)
    local v44 = v7(v41.state.scenes, v43.navigation.state, v42.navigation.state, v43.descriptors);
    if not v43.navigation.state.isTransitioning then
        local l_v44_0 = v44;
        local v47 = l_Array_0.filter(l_v44_0, function(v46) --[[ Line: 47 ]]
            return not v46.isStale;
        end);
        v44 = if #v47 == #l_v44_0 then l_v44_0 else v47;
    end;
    if v43.screenProps ~= v41.props.screenProps then
        v41:setState({
            scenes = v44
        });
    end;
    if v44 == v41.state.scenes then
        return nil;
    else
        return v44;
    end;
end;
v25._startTransition = function(v48, v49, v50) --[[ Line: 213 ]] --[[ Name: _startTransition ]]
    -- upvalues: l_Object_0 (copy), v20 (copy), v9 (copy), v6 (copy)
    local v51 = v49.navigation.state.index ~= v50.navigation.state.index;
    local v52 = v48:_computeScenes(v49, v50);
    if not v52 then
        v48._prevTransitionProps = v48._transitionProps;
        if v48._isTransitionRunning then
            v48:_onTransitionEnd();
        end;
        return;
    else
        local v53 = l_Object_0.assign(table.clone(v48.state), {
            scenes = v52
        });
        local l_position_1 = v53.position;
        local l_index_0 = v50.navigation.state.index;
        v48._prevTransitionProps = v48._transitionProps;
        v48._transitionProps = v20(v50, v53);
        local l_isTransitioning_0 = v48._transitionProps.navigation.state.isTransitioning;
        if l_isTransitioning_0 and v51 then
            v48._isTransitionRunning = true;
        end;
        v48:setState(v53, function() --[[ Line: 245 ]]
            -- upvalues: l_isTransitioning_0 (copy), v51 (copy), v50 (copy), v48 (copy), l_index_0 (copy), l_Object_0 (ref), v9 (ref), l_position_1 (copy), v6 (ref)
            if l_isTransitioning_0 and v51 then
                if v50.onTransitionStart then
                    v50.onTransitionStart(v48._transitionProps, v48._prevTransitionProps);
                end;
                if v48._positionLastValue ~= l_index_0 then
                    local v57 = {};
                    if v50.configureTransition then
                        v57 = v50.configureTransition(v48._transitionProps, v48._prevTransitionProps) or {};
                    end;
                    local v58 = l_Object_0.assign(table.clone(v9), v57);
                    l_position_1:setGoal(v6.spring(v50.navigation.state.index, v58));
                    return;
                else
                    l_position_1:setGoal(v6.instant(v50.navigation.state.index));
                    return;
                end;
            else
                if v50.onTransitionStart then
                    v50.onTransitionStart(v48._transitionProps, v48._prevTransitionProps);
                end;
                l_position_1:setGoal(v6.instant(l_index_0));
                return;
            end;
        end);
        return;
    end;
end;
v25._onTransitionEnd = function(v59) --[[ Line: 284 ]] --[[ Name: _onTransitionEnd ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v20 (copy)
    local l__prevTransitionProps_0 = v59._prevTransitionProps;
    v59._prevTransitionProps = nil;
    local l_scenes_1 = v59.state.scenes;
    local v63 = l_Array_0.filter(l_scenes_1, function(v62) --[[ Line: 47 ]]
        return not v62.isStale;
    end);
    local v64 = if #v63 == #l_scenes_1 then l_scenes_1 else v63;
    l_scenes_1 = l_Object_0.assign(table.clone(v59.state), {
        scenes = v64
    });
    v59._transitionProps = v20(v59.props, l_scenes_1);
    v59:setState(l_scenes_1, function() --[[ Line: 296 ]]
        -- upvalues: v59 (copy), l__prevTransitionProps_0 (copy)
        if v59.props.onTransitionEnd then
            v59.props.onTransitionEnd(v59._transitionProps, l__prevTransitionProps_0);
        end;
        local v65 = v59._transitionQueue[1];
        if v65 then
            local l_prevProps_0 = v65.prevProps;
            v59._transitionQueue = table.clone(v59._transitionQueue);
            table.remove(v59._transitionQueue, 1);
            v59:_startTransition(l_prevProps_0, v59.props);
            return;
        else
            v59._isTransitionRunning = false;
            return;
        end;
    end);
end;
v25._onPositionStep = function(v67, v68) --[[ Line: 315 ]] --[[ Name: _onPositionStep ]]
    v67._positionLastValue = v68;
    local l_index_1 = v67._transitionProps.index;
    local l_l_index_1_0 = l_index_1;
    if v67._prevTransitionProps then
        l_l_index_1_0 = v67._prevTransitionProps.index;
    end;
    if v67.props.onTransitionStep and l_l_index_1_0 ~= l_index_1 then
        local v71 = (v68 - l_l_index_1_0) / (l_index_1 - l_l_index_1_0);
        v67.props.onTransitionStep(v67._transitionProps, v67._prevTransitionProps, v71);
    end;
end;
return v25;