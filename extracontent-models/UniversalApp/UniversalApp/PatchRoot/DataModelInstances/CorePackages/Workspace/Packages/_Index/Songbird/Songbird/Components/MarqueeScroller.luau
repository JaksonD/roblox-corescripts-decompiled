local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local v5 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local l_useCallback_0 = v4.useCallback;
local l_useBinding_0 = v4.useBinding;
local l_useState_0 = v4.useState;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_useEventConnection_0 = v5.useEventConnection;
local v11 = {
    speed = 20, 
    direction = Enum.TextDirection.LeftToRight
};
local function _(v12, v13) --[[ Line: 31 ]] --[[ Name: calculateInstances ]]
    if v12 == 0 then
        return 2;
    else
        local v14 = math.max(math.ceil(v13 / v12) + 1, 2);
        if v14 ~= v14 then
            return 2;
        else
            return v14;
        end;
    end;
end;
return function(v16) --[[ Line: 45 ]] --[[ Name: MarqueeScroller ]]
    -- upvalues: v2 (copy), v11 (copy), l_useTokens_0 (copy), l_useBinding_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), v4 (copy), v3 (copy), l_useEventConnection_0 (copy), l_RunService_0 (copy)
    local v17 = v2.Dictionary.join(v11, v16);
    local v18 = l_useTokens_0();
    local v19 = if v17.padding then v17.padding else v18.Margin.Large;
    local v20 = v17.direction == Enum.TextDirection.LeftToRight;
    local v21, v22 = l_useBinding_0(0);
    local v23, v24 = l_useState_0(Vector2.new(1e999, 1e999));
    local v25, v26 = l_useState_0(Vector2.new(1e999, 1e999));
    local v27 = v23.X + v19;
    local v29 = l_useCallback_0(function(v28) --[[ Line: 57 ]]
        -- upvalues: v24 (copy)
        v24(v28.AbsoluteSize);
    end, {});
    local v31 = l_useCallback_0(function(v30) --[[ Line: 61 ]]
        -- upvalues: v26 (copy)
        v26(v30.AbsoluteSize);
    end, {});
    local v32 = {};
    local l_X_0 = v23.X;
    local l_X_1 = v25.X;
    local v35;
    if l_X_0 == 0 then
        v35 = 2;
    else
        local v36 = math.max(math.ceil(l_X_1 / l_X_0) + 1, 2);
        v35 = v36 ~= v36 and 2 or v36;
    end;
    for v37 = 1, v35 do
        v32[("Content%*"):format(v37)] = v4.createElement(v3.View, {
            tag = "auto-xy", 
            onAbsoluteSizeChanged = if v37 == 1 then v29 else nil, 
            LayoutOrder = v37
        }, v17.children);
    end;
    l_useEventConnection_0(l_RunService_0.Heartbeat, function(v38) --[[ Line: 76 ]]
        -- upvalues: v17 (copy), v21 (copy), v27 (copy), v22 (copy)
        if v17.speed > 0 then
            local v39 = v21:getValue() + v17.speed * v38;
            if v27 <= v39 then
                v39 = v39 - v27;
            end;
            v22(v39);
        end;
    end, {
        v17.speed, 
        v27
    });
    return v4.createElement(v3.View, {
        tag = "size-full auto-y clip", 
        onAbsoluteSizeChanged = v31, 
        LayoutOrder = v17.LayoutOrder
    }, {
        Scroller = v4.createElement(v3.View, {
            tag = "auto-xy row data-testid=scroller", 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v19)
            }, 
            Position = v21:map(function(v40) --[[ Line: 97 ]]
                -- upvalues: v20 (copy)
                if v20 then
                    return UDim2.new(0, v40 * -1, 0, 0);
                else
                    return UDim2.new(-1, v40, 0, 0);
                end;
            end)
        }, v32)
    });
end;