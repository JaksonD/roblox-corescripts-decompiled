local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v5 = require(l_script_FirstAncestor_0.Components.View);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v7 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v10 = require(l_script_FirstAncestor_0.Utility.useAnimatedHighlight);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(script.Parent.Segment);
local v13 = require(script.Parent.useSegmentedControlVariants);
local v14 = {
    size = v7.Medium, 
    testId = "--foundation-segmented-control", 
    ZIndex = 1
};
return v3.memo(v3.forwardRef(function(v15, v16) --[[ Line: 40 ]] --[[ Name: SegmentedControl ]]
    -- upvalues: v11 (copy), v14 (copy), v8 (copy), v13 (copy), v3 (copy), v10 (copy), v5 (copy), v9 (copy), v2 (copy), v12 (copy)
    local v17 = v11(v15, v14);
    local v18 = v8();
    local v19 = v13(v18, v17.size);
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    local v29 = nil;
    v20 = v3.useRef(nil);
    local v33 = v3.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v17 (copy), v3 (ref)
        local v30 = {};
        for _, v32 in v17.segments do
            v30[v32.id] = v32.ref or v3.createRef();
        end;
        return v30;
    end, {
        v17.segments
    });
    v21 = v10(v17.value, v16 or v20, v33);
    v22 = v21.activeItemHeight;
    v23 = v21.highlightPosition;
    v24 = v21.highlightWidth;
    local v34, v35 = v3.useBinding(Vector2.new(0, 0));
    v25 = v34;
    v26 = v35;
    v27 = v3.useCallback(function(v36) --[[ Line: 69 ]]
        -- upvalues: v26 (ref)
        v26(v36.AbsoluteSize);
    end, {
        v19.container.tag
    });
    v29 = v3.useCallback(function(v37) --[[ Line: 73 ]]
        -- upvalues: v17 (copy), v27 (ref)
        if v17.onAbsoluteSizeChanged then
            v17.onAbsoluteSizeChanged(v37);
        end;
        v27(v37);
    end, {
        v17.onAbsoluteSizeChanged, 
        v27
    });
    v28 = v3.useCallback(function(v38) --[[ Line: 80 ]]
        -- upvalues: v33 (copy), v17 (copy)
        local v39 = 0;
        if v38.current then
            local l_current_0 = v33[v17.value].current;
            if l_current_0 then
                v39 = l_current_0.AbsolutePosition.Y - v38.current.AbsolutePosition.Y;
            end;
        end;
        return v39;
    end, {
        v17.value
    });
    return v3.createElement(v5, {
        Size = v25:map(function(v41) --[[ Line: 94 ]]
            return UDim2.fromOffset(v41.X, v41.Y);
        end), 
        testId = "--foundation-segmented-control-container"
    }, {
        SegmentsContainer = v3.createElement(v5, v11(v9(v17, {
            tag = v19.container.tag, 
            ref = v16 or v20, 
            testId = "--foundation-segmented-control"
        }), {
            onAbsoluteSizeChanged = v29
        }), v2.map(v17.segments, function(v42, v43) --[[ Line: 111 ]]
            -- upvalues: v3 (ref), v12 (ref), v17 (copy), v33 (copy)
            local v44 = (v43 - 1) * 2 + 1;
            return v3.createElement(v3.Fragment, {
                key = tostring(v42.id)
            }, {
                Segment = v3.createElement(v12, {
                    id = v42.id, 
                    size = v17.size, 
                    text = v42.text, 
                    isActive = v42.id == v17.value, 
                    onActivated = v17.onActivated, 
                    LayoutOrder = v44, 
                    testId = ("%*--segment-%*"):format(v17.testId, v42.id), 
                    ref = v33[v42.id]
                })
            });
        end)), 
        Overlay = v3.createElement(v5, {
            backgroundStyle = v18.Color.Shift.Shift_400, 
            tag = v19.segment.tag, 
            Size = v3.joinBindings({
                v24, 
                v22
            }):map(function(v45) --[[ Line: 132 ]]
                return UDim2.fromOffset(v45[1], v45[2]);
            end), 
            Position = v23:map(function(v46) --[[ Line: 135 ]]
                -- upvalues: v28 (ref), v16 (copy), v20 (ref)
                local v47 = v28(v16 or v20);
                return UDim2.fromOffset(v46, v47);
            end), 
            ZIndex = v17.ZIndex + 1, 
            testId = "--foundation-segmented-control--animated-overlay"
        })
    });
end));