local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local l_Object_0 = require(l_Parent_2.LuauPolyfill).Object;
local v4 = require(l_Parent_2.React);
local v5 = require(l_Parent_0.StackPresentationStyle);
local v6 = require(l_Parent_0.StackViewTransitionConfigs);
local v7 = require(l_Parent_0.StackViewOverlayFrame);
local v8 = require(l_Parent_0.StackViewCard);
local v9 = require(l_Parent_1.SceneView);
local v13 = {
    absorbInput = true, 
    absorbInputSelectable = true, 
    overlayEnabled = false, 
    overlayColor3 = Color3.new(0, 0, 0), 
    overlayTransparency = 0.7, 
    renderOverlay = function(v10, v11, v12) --[[ Line: 22 ]] --[[ Name: renderOverlay ]]
        -- upvalues: v4 (copy), v7 (copy)
        return v4.createElement(v7, {
            navigationOptions = v10, 
            initialTransitionValue = v11, 
            transitionChangedSignal = v12
        });
    end, 
    transparent = false
};
local function _(v14, v15) --[[ Line: 34 ]] --[[ Name: calculateTransitionValue ]]
    return (math.max(math.min(1 + v15 - v14, 1), 0));
end;
local v17 = v4.Component:extend("StackViewLayout");
v17.init = function(v18) --[[ Line: 40 ]] --[[ Name: init ]]
    v18:setState({});
    local l_index_0 = v18.props.transitionProps.navigation.state.index;
    v18._isMounted = false;
    v18._positionLastValue = l_index_0;
    v18._renderScene = function(v20) --[[ Line: 47 ]]
        -- upvalues: v18 (copy)
        return v18:_renderInnerScene(v20);
    end;
    v18._subscribeToOverlayUpdates = function(v21) --[[ Line: 51 ]]
        -- upvalues: v18 (copy)
        local l_position_0 = v18.props.transitionProps.position;
        local l_index_1 = v18.props.transitionProps.scene.index;
        return l_position_0:onStep(function(v24) --[[ Line: 55 ]]
            -- upvalues: v21 (copy), l_index_1 (copy)
            local l_v21_0 = v21;
            local l_l_index_1_0 = l_index_1;
            l_v21_0((math.max(math.min(1 + v24 - l_l_index_1_0, 1), 0)));
        end);
    end;
end;
v17._renderCard = function(v27, v28, v29) --[[ Line: 61 ]] --[[ Name: _renderCard ]]
    -- upvalues: l_Object_0 (copy), v4 (copy), v8 (copy)
    local l_transitionProps_0 = v27.props.transitionProps;
    local l_lastTransitionProps_0 = v27.props.lastTransitionProps;
    local l_transitionConfig_0 = v27.state.transitionConfig;
    local l_cardColor3_0 = v29.cardColor3;
    local l_overlayEnabled_0 = v29.overlayEnabled;
    local l_transparent_0 = v29.transparent;
    local l_index_2 = l_transitionProps_0.scene.index;
    if l_lastTransitionProps_0 then
        l_index_2 = l_lastTransitionProps_0.scene.index;
    end;
    local v37 = {};
    local l_screenInterpolator_0 = l_transitionConfig_0.screenInterpolator;
    if l_screenInterpolator_0 then
        v37 = l_screenInterpolator_0(l_Object_0.assign(table.clone(l_transitionProps_0), {
            initialPositionValue = l_index_2, 
            scene = v28
        }));
    end;
    return v4.createElement(v8, l_Object_0.assign(table.clone(l_transitionProps_0), v37, {
        key = "card_" .. tostring(v28.key), 
        scene = v28, 
        renderScene = v27._renderScene, 
        cardColor3 = if not not l_overlayEnabled_0 or l_transparent_0 then nil else l_cardColor3_0
    }));
end;
v17._renderInnerScene = function(v39, v40) --[[ Line: 96 ]] --[[ Name: _renderInnerScene ]]
    -- upvalues: v4 (copy), v9 (copy)
    local l_navigation_0 = v40.descriptor.navigation;
    local v42 = v40.descriptor.getComponent();
    local l_screenProps_0 = v39.props.screenProps;
    return v4.createElement(v9, {
        screenProps = l_screenProps_0, 
        navigation = l_navigation_0, 
        component = v42
    });
end;
v17.render = function(v44) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: l_Object_0 (copy), v13 (copy), v4 (copy)
    local l_transitionProps_1 = v44.props.transitionProps;
    local l_topMostOpaqueSceneIndex_0 = v44.state.topMostOpaqueSceneIndex;
    local l_scenes_0 = l_transitionProps_1.scenes;
    local v48 = {};
    for _, v50 in l_scenes_0 do
        local v51 = false;
        if v50.index < l_topMostOpaqueSceneIndex_0 then
            v51 = not v50.isActive;
        end;
        local v52 = if v50.descriptor.options then l_Object_0.assign(table.clone(v13), v50.descriptor.options) else table.clone(v13);
        local l_overlayEnabled_1 = v52.overlayEnabled;
        local l_absorbInput_0 = v52.absorbInput;
        local l_absorbInputSelectable_0 = v52.absorbInputSelectable;
        local l_renderOverlay_0 = v52.renderOverlay;
        local v57 = nil;
        if l_overlayEnabled_1 then
            local l_createElement_0 = v4.createElement;
            local v59 = "Frame";
            local v60 = {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                ZIndex = 1
            };
            local v61 = {};
            local l_l_renderOverlay_0_0 = l_renderOverlay_0;
            local l_v52_0 = v52;
            local l_index_3 = v50.index;
            v61.Overlay = l_l_renderOverlay_0_0(l_v52_0, math.max(math.min(1 + v44._positionLastValue - l_index_3, 1), 0), v44._subscribeToOverlayUpdates);
            v57 = l_createElement_0(v59, v60, v61);
        end;
        local v65 = nil;
        if not v51 and l_absorbInput_0 then
            v65 = v4.createElement("TextButton", {
                Active = true, 
                Selectable = l_absorbInputSelectable_0, 
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = " ", 
                ZIndex = 2 * v50.index - 1
            });
        end;
        local v66 = v4.createElement(v4.Fragment, {}, {
            AbsorbInput = v65, 
            [tostring(v50.index)] = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = false, 
                ZIndex = 2 * v50.index, 
                Visible = not v51
            }, {
                StationaryContent = v57, 
                DynamicContent = v4.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = false, 
                    BorderSizePixel = 0, 
                    ZIndex = 2
                }, {
                    ["card_" .. v50.key] = v44:_renderCard(v50, v52)
                })
            })
        });
        v48[tostring(v50.key)] = v66;
    end;
    return v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        BorderSizePixel = 0
    }, v48);
end;
v17.getDerivedStateFromProps = function(v67, _) --[[ Line: 204 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v5 (copy), l_Object_0 (copy), v13 (copy), v6 (copy)
    local l_transitionProps_2 = v67.transitionProps;
    local l_scenes_1 = l_transitionProps_2.scenes;
    local l_isTransitioning_0 = l_transitionProps_2.navigation.state.isTransitioning;
    local v72 = #l_scenes_1;
    local v73 = true;
    if v67.mode ~= v5.Modal then
        v73 = v67.mode == v5.Overlay;
    end;
    local v74 = 0;
    for v75 = v72, 1, -1 do
        local v76 = l_scenes_1[v75];
        local v77 = if v76.descriptor.options then l_Object_0.assign(table.clone(v13), v76.descriptor.options) else table.clone(v13);
        if not (v77.transparent or v73 and v77.overlayEnabled) and (not l_isTransitioning_0 or v75 ~= v72) then
            v74 = v75;
            break;
        end;
    end;
    return {
        topMostOpaqueSceneIndex = v74, 
        transitionConfig = v6.getTransitionConfig(v67.transitionConfig, v67.transitionProps, v67.lastTransitionProps, v67.mode)
    };
end;
v17.didMount = function(v78) --[[ Line: 243 ]] --[[ Name: didMount ]]
    v78._isMounted = true;
    v78._positionDisconnector = v78.props.transitionProps.position:onStep(function(...) --[[ Line: 246 ]]
        -- upvalues: v78 (copy)
        v78:_onPositionStep(...);
    end);
end;
v17.willUnmount = function(v79) --[[ Line: 251 ]] --[[ Name: willUnmount ]]
    v79._isMounted = false;
    if v79._positionDisconnector then
        v79._positionDisconnector();
        v79._positionDisconnector = nil;
    end;
end;
v17.didUpdate = function(v80, v81) --[[ Line: 260 ]] --[[ Name: didUpdate ]]
    local l_position_1 = v80.props.transitionProps.position;
    if l_position_1 ~= v81.transitionProps.position then
        v80._positionDisconnector();
        v80._positionDisconnector = l_position_1:onStep(function(...) --[[ Line: 265 ]]
            -- upvalues: v80 (copy)
            v80:_onPositionStep(...);
        end);
    end;
end;
v17._onPositionStep = function(v83, v84) --[[ Line: 271 ]] --[[ Name: _onPositionStep ]]
    if v83._isMounted then
        v83._positionLastValue = v84;
    end;
end;
return v17;