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
local v15 = require(script.Parent.DeclarativeBaseMenuContent);
local v16 = {
    size = v13.Medium
};
local v17 = {
    [v11.Small] = "radius-small", 
    [v11.Medium] = "radius-medium"
};
local function v19(v18) --[[ Line: 66 ]] --[[ Name: computeAutomaticSize ]]
    if v18.autoSize then
        if v18.isOverMaxHeight then
            return Enum.AutomaticSize.X;
        else
            return Enum.AutomaticSize.XY;
        end;
    elseif v18.isOverMaxHeight then
        return Enum.AutomaticSize.None;
    else
        return Enum.AutomaticSize.Y;
    end;
end;
local function v22(v20) --[[ Line: 72 ]] --[[ Name: computeSize ]]
    local v21 = if v20.isOverMaxHeight and v20.maxHeight then UDim.new(0, v20.maxHeight) else UDim.new();
    if v20.autoSize then
        return (UDim2.new(UDim.new(), v21));
    else
        return (UDim2.new(v20.width or UDim.new(), v21));
    end;
end;
return v2.memo(v2.forwardRef(function(v23, v24) --[[ Line: 82 ]] --[[ Name: BaseMenu ]]
    -- upvalues: v6 (copy), v2 (copy), v16 (copy), v9 (copy), v7 (copy), v5 (copy), v15 (copy), v17 (copy), v19 (copy), v3 (copy), v8 (copy), v22 (copy), v4 (copy), v14 (copy)
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    if v6.FoundationBaseMenuDelayVisible then
        local v28, v29 = v2.useBinding(false);
        v25 = v28;
        v26 = v29;
        v27 = table.clone(v16);
        v27.Visible = v25;
    end;
    local v30 = v9(v23, if v6.FoundationBaseMenuDelayVisible then v27 else v16);
    local v31 = v7(v30.width);
    local v32 = v7(v30.maxHeight);
    local v33 = v5(260);
    local v34 = v5(320);
    local v35, v36 = v2.useState(false);
    local v37, v38 = v2.useBinding(UDim2.fromScale(0, 1));
    if v6.FoundationBaseMenuDelayVisible then
        v2.useEffect(function() --[[ Line: 101 ]]
            -- upvalues: v26 (ref)
            task.delay(0, function() --[[ Line: 102 ]]
                -- upvalues: v26 (ref)
                v26(true);
            end);
        end, {});
    end;
    local v39 = v2.useCallback(function() --[[ Line: 108 ]]
        -- upvalues: v36 (copy)
        v36(true);
    end, {});
    local v41 = v2.useMemo(function() --[[ Line: 113 ]]
        -- upvalues: v31 (copy), v33 (copy)
        return v31:map(function(v40) --[[ Line: 114 ]]
            -- upvalues: v33 (ref)
            if v40 then
                return v40.Offset;
            else
                return v33;
            end;
        end);
    end, {
        v31, 
        v33
    });
    local v43 = v2.useMemo(function() --[[ Line: 120 ]]
        -- upvalues: v31 (copy), v30 (copy), v34 (copy)
        return v31:map(function(v42) --[[ Line: 121 ]]
            -- upvalues: v30 (ref), v34 (ref)
            return not v42 or v30.couldGrow and v42.Offset < v34;
        end);
    end, {
        v31, 
        v34, 
        v30.couldGrow
    });
    local v48 = v2.useMemo(function() --[[ Line: 126 ]]
        -- upvalues: v2 (ref), v43 (copy), v41 (copy), v34 (copy)
        return {
            MinSize = v2.joinBindings({
                v43, 
                v41
            }):map(function(v44) --[[ Line: 128 ]]
                local v45 = v44[1];
                local v46 = v44[2];
                if v45 then
                    return (Vector2.new(v46, 0));
                else
                    return nil;
                end;
            end), 
            MaxSize = v43:map(function(v47) --[[ Line: 133 ]]
                -- upvalues: v34 (ref)
                if v47 then
                    return (Vector2.new(v34, 1e999));
                else
                    return nil;
                end;
            end)
        };
    end, {
        v43, 
        v41, 
        v34
    });
    local v51 = v2.useMemo(function() --[[ Line: 139 ]]
        -- upvalues: v2 (ref), v37 (copy), v32 (copy)
        return v2.joinBindings({
            canvasSize = v37, 
            maxHeight = v32
        }):map(function(v49) --[[ Line: 141 ]]
            local v50 = false;
            if v49.maxHeight ~= nil then
                v50 = v49.canvasSize.Y.Offset > v49.maxHeight;
            end;
            return v50;
        end);
    end, {
        v32
    });
    local v53 = v2.useCallback(function(v52) --[[ Line: 146 ]]
        -- upvalues: v38 (copy)
        return v38(UDim2.fromOffset(v52.AbsoluteSize.X, v52.AbsoluteSize.Y));
    end, {
        v38
    });
    local v54 = v30.children or v30.items and v2.createElement(v15, {
        items = v30.items, 
        size = v30.size
    });
    local v55 = if v30.radius ~= nil then v17[v30.radius] else "";
    if v30.maxHeight then
        local v56 = v2.joinBindings({
            autoSize = v43, 
            isOverMaxHeight = v51
        }):map(v19);
        return v2.createElement(v3, v8(v30, {
            ref = v24, 
            scroll = {
                AutomaticSize = v56, 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                CanvasSize = v37
            }, 
            AutomaticSize = v56, 
            Size = v2.joinBindings({
                autoSize = v43, 
                width = v31, 
                isOverMaxHeight = v51, 
                maxHeight = v32
            }):map(v22), 
            sizeConstraint = v48, 
            tag = ("stroke-standard stroke-default %*"):format(v55)
        }), v2.createElement(v4, {
            tag = "col size-full", 
            onAbsoluteSizeChanged = v53
        }, v2.createElement(v14.Provider, {
            value = {
                onActivated = v30.onActivated, 
                size = v30.size, 
                hasLeading = v35, 
                setHasLeading = v39
            }
        }, v54)));
    else
        return v2.createElement(v4, v8(v30, {
            tag = ("col stroke-standard stroke-default %*"):format(v55), 
            AutomaticSize = v43:map(function(v57) --[[ Line: 205 ]]
                if v57 then
                    return Enum.AutomaticSize.XY;
                else
                    return Enum.AutomaticSize.Y;
                end;
            end), 
            Size = v2.joinBindings({
                v43, 
                v31
            }):map(function(v58) --[[ Line: 208 ]]
                local v59 = v58[1];
                local v60 = v58[2];
                if v59 then
                    return nil;
                else
                    return (UDim2.new(v60, UDim.new()));
                end;
            end), 
            ref = v24, 
            sizeConstraint = v48
        }), v2.createElement(v14.Provider, {
            value = {
                onActivated = v30.onActivated, 
                size = v30.size, 
                hasLeading = v35, 
                setHasLeading = v39
            }
        }, v54));
    end;
end));