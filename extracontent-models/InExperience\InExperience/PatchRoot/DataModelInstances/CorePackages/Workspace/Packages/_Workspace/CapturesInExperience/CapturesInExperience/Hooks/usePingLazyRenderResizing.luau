local l_Parent_0 = script.Parent.Parent.Parent;
local l_useEffect_0 = require(l_Parent_0.React).useEffect;
usePingLazyRenderResizing = function(v2, v3) --[[ Line: 6 ]] --[[ Name: usePingLazyRenderResizing ]]
    -- upvalues: l_useEffect_0 (copy)
    l_useEffect_0(function() --[[ Line: 7 ]]
        -- upvalues: v2 (copy)
        if v2.current then
            local _ = v2.current.AbsoluteSize;
        end;
    end, {
        v3
    });
end;
return usePingLazyRenderResizing;