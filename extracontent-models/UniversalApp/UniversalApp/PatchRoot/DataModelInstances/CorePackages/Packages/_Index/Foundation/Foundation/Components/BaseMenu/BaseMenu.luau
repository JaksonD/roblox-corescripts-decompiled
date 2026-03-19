local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.ScrollView);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Utility.useScaledValue);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local v7 = require(l_script_FirstAncestor_0.Utility.useBindable);
local v8 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v9 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local _ = require(l_script_FirstAncestor_0.Enums.ControlState);
local v11 = require(l_script_FirstAncestor_0.Enums.Radius);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v13 = require(l_script_FirstAncestor_0.Enums.InputSize);
local v14 = require(script.Parent.BaseMenuContext);
local v15 = require(script.Parent.useSubmenuHover);
local v16 = require(script.Parent.DeclarativeBaseMenuContent);
local v17 = {
    size = v13.Medium
};
local v18 = {
    [v11.Small] = "radius-small", 
    [v11.Medium] = "radius-medium"
};
local function v20(v19) --[[ Line: 66 ]] --[[ Name: computeAutomaticSize ]]
    if v19.autoSize then
        if v19.isOverMaxHeight then
            return Enum.AutomaticSize.X;
        else
            return Enum.AutomaticSize.XY;
        end;
    elseif v19.isOverMaxHeight then
        return Enum.AutomaticSize.None;
    else
        return Enum.AutomaticSize.Y;
    end;
end;
local function v23(v21) --[[ Line: 72 ]] --[[ Name: computeSize ]]
    local v22 = if v21.isOverMaxHeight and v21.maxHeight then UDim.new(0, v21.maxHeight) else UDim.new();
    if v21.autoSize then
        return (UDim2.new(UDim.new(), v22));
    else
        return (UDim2.new(v21.width or UDim.new(), v22));
    end;
end;
return v2.memo(v2.forwardRef(function(v24, v25) --[[ Line: 82 ]] --[[ Name: BaseMenu ]]
    -- upvalues: v6 (copy), v2 (copy), v17 (copy), v9 (copy), v7 (copy), v5 (copy), v15 (copy), v16 (copy), v18 (copy), v20 (copy), v3 (copy), v8 (copy), v23 (copy), v4 (copy), v14 (copy)
    local v26 = nil;
    local v27 = nil;
    local v28 = nil;
    if v6.FoundationBaseMenuDelayVisible then
        local v29, v30 = v2.useBinding(false);
        v26 = v29;
        v27 = v30;
        v28 = table.clone(v17);
        v28.Visible = v26;
    end;
    local v31 = v9(v24, if v6.FoundationBaseMenuDelayVisible then v28 else v17);
    local v32 = v7(v31.width);
    local v33 = v7(v31.maxHeight);
    local v34 = v5(260);
    local v35 = v5(320);
    local v36, v37 = v2.useState(false);
    local v38, v39 = v2.useBinding(UDim2.fromScale(0, 1));
    local v40 = v15();
    if v6.FoundationBaseMenuDelayVisible then
        v2.useEffect(function() --[[ Line: 102 ]]
            -- upvalues: v27 (ref)
            task.delay(0, function() --[[ Line: 103 ]]
                -- upvalues: v27 (ref)
                v27(true);
            end);
        end, {});
    end;
    local v41 = v2.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v37 (copy)
        v37(true);
    end, {});
    local v43 = v2.useMemo(function() --[[ Line: 114 ]]
        -- upvalues: v32 (copy), v34 (copy)
        return v32:map(function(v42) --[[ Line: 115 ]]
            -- upvalues: v34 (ref)
            if v42 then
                return v42.Offset;
            else
                return v34;
            end;
        end);
    end, {
        v32, 
        v34
    });
    local v45 = v2.useMemo(function() --[[ Line: 121 ]]
        -- upvalues: v32 (copy), v31 (copy), v35 (copy)
        return v32:map(function(v44) --[[ Line: 122 ]]
            -- upvalues: v31 (ref), v35 (ref)
            return not v44 or v31.couldGrow and v44.Offset < v35;
        end);
    end, {
        v32, 
        v35, 
        v31.couldGrow
    });
    local v50 = v2.useMemo(function() --[[ Line: 127 ]]
        -- upvalues: v2 (ref), v45 (copy), v43 (copy), v35 (copy)
        return {
            MinSize = v2.joinBindings({
                v45, 
                v43
            }):map(function(v46) --[[ Line: 129 ]]
                local v47 = v46[1];
                local v48 = v46[2];
                if v47 then
                    return (Vector2.new(v48, 0));
                else
                    return nil;
                end;
            end), 
            MaxSize = v45:map(function(v49) --[[ Line: 134 ]]
                -- upvalues: v35 (ref)
                if v49 then
                    return (Vector2.new(v35, 1e999));
                else
                    return nil;
                end;
            end)
        };
    end, {
        v45, 
        v43, 
        v35
    });
    local v53 = v2.useMemo(function() --[[ Line: 140 ]]
        -- upvalues: v2 (ref), v38 (copy), v33 (copy)
        return v2.joinBindings({
            canvasSize = v38, 
            maxHeight = v33
        }):map(function(v51) --[[ Line: 142 ]]
            local v52 = false;
            if v51.maxHeight ~= nil then
                v52 = v51.canvasSize.Y.Offset > v51.maxHeight;
            end;
            return v52;
        end);
    end, {
        v33
    });
    local v55 = v2.useCallback(function(v54) --[[ Line: 147 ]]
        -- upvalues: v39 (copy)
        return v39(UDim2.fromOffset(v54.AbsoluteSize.X, v54.AbsoluteSize.Y));
    end, {
        v39
    });
    local v56 = v31.children or v31.items and v2.createElement(v16, {
        items = v31.items, 
        size = v31.size
    });
    local v57 = if v31.radius ~= nil then v18[v31.radius] else "";
    if v31.maxHeight then
        local v58 = v2.joinBindings({
            autoSize = v45, 
            isOverMaxHeight = v53
        }):map(v20);
        return v2.createElement(v3, v8(v31, {
            ref = v25, 
            scroll = {
                AutomaticSize = v58, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                CanvasSize = v38
            }, 
            AutomaticSize = v58, 
            Size = v2.joinBindings({
                autoSize = v45, 
                width = v32, 
                isOverMaxHeight = v53, 
                maxHeight = v33
            }):map(v23), 
            sizeConstraint = v50, 
            tag = ("stroke-standard stroke-default %*"):format(v57)
        }), v2.createElement(v4, {
            tag = "col size-full", 
            onAbsoluteSizeChanged = v55
        }, v2.createElement(v14.Provider, {
            value = {
                onActivated = v31.onActivated, 
                size = v31.size, 
                hasLeading = v36, 
                setHasLeading = v41, 
                hoverOpenPath = v40.openPath, 
                hoverOpenAtDepth = v40.openAtDepth, 
                hoverCloseAtDepth = v40.closeAtDepth, 
                hoverReset = v40.reset, 
                depth = 1
            }
        }, v56)));
    else
        return v2.createElement(v4, v8(v31, {
            tag = ("col stroke-standard stroke-default %*"):format(v57), 
            AutomaticSize = v45:map(function(v59) --[[ Line: 211 ]]
                if v59 then
                    return Enum.AutomaticSize.XY;
                else
                    return Enum.AutomaticSize.Y;
                end;
            end), 
            Size = v2.joinBindings({
                v45, 
                v32
            }):map(function(v60) --[[ Line: 214 ]]
                local v61 = v60[1];
                local v62 = v60[2];
                if v61 then
                    return nil;
                else
                    return (UDim2.new(v62, UDim.new()));
                end;
            end), 
            ref = v25, 
            sizeConstraint = v50
        }), v2.createElement(v14.Provider, {
            value = {
                onActivated = v31.onActivated, 
                size = v31.size, 
                hasLeading = v36, 
                setHasLeading = v41, 
                hoverOpenPath = v40.openPath, 
                hoverOpenAtDepth = v40.openAtDepth, 
                hoverCloseAtDepth = v40.closeAtDepth, 
                hoverReset = v40.reset, 
                depth = 1
            }
        }, v56));
    end;
end));