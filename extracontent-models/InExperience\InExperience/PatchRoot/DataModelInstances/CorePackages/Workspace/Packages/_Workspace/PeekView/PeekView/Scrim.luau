local l_Parent_0 = script:FindFirstAncestor("PeekView").Parent;
local v1 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local v3 = require(l_Parent_0.ReactOtter);
local v4 = game:DefineFastFlag("RemovePeekViewScrimBorder", false);
return (v1.forwardRef(function(v5, v6) --[[ Line: 16 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v1 (copy), v3 (copy), v4 (copy)
    local v7 = l_useDesignTokens_0();
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    local v11 = nil;
    local v12, v13 = v1.useState(true);
    v8 = v12;
    v9 = v13;
    v12, v13 = v3.useAnimatedBinding(1);
    v10 = v12;
    v11 = v13;
    v1.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v11 (ref), v3 (ref), v8 (ref)
        v11(v3.spring(v8 and 0.35 or 1));
    end, {
        v8
    });
    return v1.createElement("TextButton", {
        ref = v6, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v10, 
        BackgroundColor3 = v7.Semantic.Color.Common.Overlay.Color3, 
        ClipsDescendants = false, 
        Text = "", 
        AutoButtonColor = false, 
        [v1.Event.Activated] = function() --[[ Line: 34 ]]
            -- upvalues: v5 (copy), v9 (ref), v8 (ref)
            if v5.onActivated then
                v5.onActivated();
            end;
            v9(not v8);
        end, 
        [v1.Change.AbsoluteSize] = v5.onSizeChanged, 
        BorderSizePixel = v4 and 0 or nil
    }, v5.children);
end));