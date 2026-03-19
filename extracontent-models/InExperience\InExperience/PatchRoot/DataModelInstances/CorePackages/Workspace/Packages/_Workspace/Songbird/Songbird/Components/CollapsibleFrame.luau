local l_script_FirstAncestor_0 = script:FindFirstAncestor("Songbird");
local v1 = require(l_script_FirstAncestor_0.Parent.Foundation);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Parent.ReactOtter);
local l_useBinding_0 = v2.useBinding;
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_usePrevious_0 = v3.usePrevious;
local l_useAnimatedBinding_0 = v4.useAnimatedBinding;
local v10 = {
    stiffness = 300, 
    damping = 30, 
    mass = 1
};
local _ = {
    isCollapsed = false
};
return function(v12) --[[ Line: 31 ]] --[[ Name: CollapsibleFrame ]]
    -- upvalues: l_usePrevious_0 (copy), l_useBinding_0 (copy), l_useAnimatedBinding_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), v4 (copy), v10 (copy), v2 (copy), v1 (copy)
    local v13 = l_usePrevious_0(v12.isCollapsed);
    local v14, v15 = l_useBinding_0(Vector2.new(1e999, 1e999));
    local v16, v17 = l_useAnimatedBinding_0(v12.isCollapsed and 0 or 1);
    local v19 = l_useCallback_0(function(v18) --[[ Line: 36 ]]
        -- upvalues: v15 (copy)
        v15(v18.AbsoluteCanvasSize);
    end, {});
    l_useEffect_0(function() --[[ Line: 40 ]]
        -- upvalues: v13 (copy), v12 (copy), v17 (copy), v4 (ref), v10 (ref)
        if v13 ~= nil then
            if not v12.isCollapsed and v13 then
                v17(v4.spring(1, v10));
                return;
            elseif v12.isCollapsed and not v13 then
                v17(v4.spring(0, v10));
            end;
        end;
    end, {
        v12.isCollapsed, 
        v13
    });
    local v22 = v2.joinBindings({
        maxSize = v14, 
        alpha = v16
    }):map(function(v20) --[[ Line: 53 ]]
        local v21 = math.max(v20.maxSize.Y * v20.alpha, 0);
        return Vector2.new(1e999, v21);
    end);
    return v2.createElement(v1.View, {
        tag = "size-full clip", 
        sizeConstraint = {
            MaxSize = v22
        }
    }, {
        ScrollingFrame = v2.createElement("ScrollingFrame", {
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            CanvasSize = UDim2.fromScale(0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ClipsDescendants = true, 
            ScrollingEnabled = false, 
            HorizontalScrollBarInset = Enum.ScrollBarInset.None, 
            ScrollBarImageTransparency = 1, 
            Selectable = false, 
            [v2.Change.AbsoluteCanvasSize] = v19
        }, {
            Container = v2.createElement(v1.View, {
                tag = "auto-y size-full-0"
            }, v12.children)
        })
    });
end;