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
    local v30 = nil;
    v20 = v3.useRef(nil);
    v21 = v10(v17.value, v16 or v20);
    v22 = v21.activeItemHeight;
    v23 = v21.itemRefs;
    v24 = v21.highlightPosition;
    v25 = v21.highlightWidth;
    local v31, v32 = v3.useBinding(Vector2.new(0, 0));
    v26 = v31;
    v27 = v32;
    v28 = v3.useCallback(function(v33) --[[ Line: 59 ]]
        -- upvalues: v27 (ref)
        v27(v33.AbsoluteSize);
    end, {
        v19.container.tag
    });
    v30 = v3.useCallback(function(v34) --[[ Line: 63 ]]
        -- upvalues: v17 (copy), v28 (ref)
        if v17.onAbsoluteSizeChanged then
            v17.onAbsoluteSizeChanged(v34);
        end;
        v28(v34);
    end, {
        v17.onAbsoluteSizeChanged, 
        v28
    });
    v29 = v3.useCallback(function(v35) --[[ Line: 70 ]]
        -- upvalues: v23 (ref), v17 (copy)
        local v36 = 0;
        if v35.current then
            local l_current_0 = v23[v17.value].current;
            if l_current_0 then
                v36 = l_current_0.AbsolutePosition.Y - v35.current.AbsolutePosition.Y;
            end;
        end;
        return v36;
    end, {
        v17.value
    });
    return v3.createElement(v5, {
        Size = v26:map(function(v38) --[[ Line: 84 ]]
            return UDim2.fromOffset(v38.X, v38.Y);
        end), 
        testId = "--foundation-segmented-control-container"
    }, {
        SegmentsContainer = v3.createElement(v5, v11(v9(v17, {
            tag = v19.container.tag, 
            ref = v16 or v20, 
            testId = "--foundation-segmented-control"
        }), {
            onAbsoluteSizeChanged = v30
        }), v2.map(v17.segments, function(v39, v40) --[[ Line: 101 ]]
            -- upvalues: v3 (ref), v12 (ref), v17 (copy), v23 (ref)
            local v41 = (v40 - 1) * 2 + 1;
            return v3.createElement(v3.Fragment, {
                key = tostring(v39.id)
            }, {
                Segment = v3.createElement(v12, {
                    id = v39.id, 
                    size = v17.size, 
                    text = v39.text, 
                    isActive = v39.id == v17.value, 
                    onActivated = v17.onActivated, 
                    LayoutOrder = v41, 
                    testId = ("%*--segment-%*"):format(v17.testId, v39.id), 
                    ref = v23[v39.id]
                })
            });
        end)), 
        Overlay = v3.createElement(v5, {
            backgroundStyle = v18.Color.Shift.Shift_400, 
            tag = v19.segment.tag, 
            Size = v3.joinBindings({
                v25, 
                v22
            }):map(function(v42) --[[ Line: 122 ]]
                return UDim2.fromOffset(v42[1], v42[2]);
            end), 
            Position = v24:map(function(v43) --[[ Line: 125 ]]
                -- upvalues: v29 (ref), v16 (copy), v20 (ref)
                local v44 = v29(v16 or v20);
                return UDim2.fromOffset(v43, v44);
            end), 
            ZIndex = v17.ZIndex + 1, 
            testId = "--foundation-segmented-control--animated-overlay"
        })
    });
end));