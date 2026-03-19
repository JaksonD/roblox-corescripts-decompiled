local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Cryo);
local v3 = require(l_Parent_1.Foundation);
local v4 = require(l_Parent_1.React);
local _ = require(l_Parent_0.Enums.NavigationType);
local _ = require(l_Parent_0.Signal);
local l_View_0 = v3.View;
local l_useCallback_0 = v4.useCallback;
local l_useEffect_0 = v4.useEffect;
local v10 = require(l_Parent_0.Hooks.useSnapScrollController);
local l_useState_0 = v4.useState;
return function(v12) --[[ Line: 33 ]]
    -- upvalues: l_useState_0 (copy), v10 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), v4 (copy), v2 (copy), l_View_0 (copy)
    local v13, v14 = l_useState_0(Vector2.new(0, 0));
    local v15 = v12.active == nil or v12.active;
    local v16 = v12.initialIndex or 1;
    local v17 = v12.itemAbsoluteSize or v13;
    local v18 = v12.windowSize or 3;
    local v19, v20, v21, v22, v23 = v10(v15, v16, v17, #v12.contents);
    local v25 = l_useCallback_0(function(v24) --[[ Line: 44 ]]
        -- upvalues: v14 (copy)
        v14(v24.AbsoluteSize);
    end, {});
    l_useEffect_0(function() --[[ Line: 48 ]]
        -- upvalues: v12 (copy), v19 (copy)
        if v12.onIndexChanged then
            v12.onIndexChanged(v19);
        end;
    end, {
        v19, 
        v12.onIndexChanged
    });
    local v28 = v4.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v2 (ref), v12 (copy), v19 (copy), v18 (copy), v4 (ref), l_View_0 (ref), v17 (copy)
        return v2.List.map(v12.contents, function(v26, v27) --[[ Line: 55 ]]
            -- upvalues: v19 (ref), v18 (ref), v4 (ref), l_View_0 (ref), v17 (ref), v12 (ref)
            if v27 < v19 - v18 or v19 + v18 < v27 then
                return v4.createElement(l_View_0, {
                    key = ("PLACEHOLDER-%*"):format(v27), 
                    LayoutOrder = v27, 
                    Size = UDim2.fromOffset(v17.X, v17.Y), 
                    tag = "anchor-top-center bg-action-subtle position-top-center"
                });
            else
                return v12.renderContent(v26, v27);
            end;
        end);
    end, {
        v19, 
        v17, 
        v12.contents, 
        v12.renderContent, 
        v18
    });
    l_useEffect_0(function() --[[ Line: 68 ]]
        -- upvalues: v12 (copy), v22 (copy)
        if not v12.scrollToIndexSignal then
            return;
        else
            local v29 = v12.scrollToIndexSignal:connect(v22);
            return function() --[[ Line: 74 ]]
                -- upvalues: v29 (copy)
                v29:disconnect();
            end;
        end;
    end, {
        v12.scrollToIndexSignal, 
        v22
    });
    l_useEffect_0(function() --[[ Line: 79 ]]
        -- upvalues: v12 (copy), v23 (copy)
        if not v12.triggerNavigationSignal then
            return;
        else
            local v30 = v12.triggerNavigationSignal:connect(v23);
            return function() --[[ Line: 85 ]]
                -- upvalues: v30 (copy)
                v30:disconnect();
            end;
        end;
    end, {
        v12.triggerNavigationSignal, 
        v23
    });
    return v4.createElement(l_View_0, {
        onAbsoluteSizeChanged = v25, 
        ref = v20, 
        tag = "anchor-top-center bg-action-subtle position-top-center size-full"
    }, {
        MotionView = v4.createElement(l_View_0, {
            LayoutOrder = 1, 
            ref = v21, 
            Size = UDim2.fromScale(1, #v12.contents), 
            tag = "align-x-center anchor-top-center bg-action-subtle col no-clip position-top-center"
        }, v28)
    });
end;