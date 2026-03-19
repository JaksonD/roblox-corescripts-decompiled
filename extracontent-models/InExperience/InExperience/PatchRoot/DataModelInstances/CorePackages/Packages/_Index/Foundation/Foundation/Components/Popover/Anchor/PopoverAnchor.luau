local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(script.Parent.Parent.PopoverContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v4 = require(l_script_FirstAncestor_0.Components.View);
local v5 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local v6 = require(l_Parent_0.React);
return v6.forwardRef(function(v7, v8) --[[ Line: 18 ]] --[[ Name: PopoverAnchor ]]
    -- upvalues: v6 (copy), v2 (copy), v4 (copy), v5 (copy)
    local v9 = v6.useContext(v2);
    local v10 = v6.useRef(nil);
    v6.useImperativeHandle(v8, function() --[[ Line: 23 ]]
        -- upvalues: v10 (copy)
        return v10.current;
    end, {});
    v6.useLayoutEffect(function() --[[ Line: 27 ]]
        -- upvalues: v7 (copy), v9 (copy), v10 (copy)
        if typeof(v7.anchorRef) == "table" and v7.anchorRef.current then
            v9.setAnchor(v7.anchorRef.current);
            return;
        else
            v9.setAnchor(v10.current);
            return;
        end;
    end);
    if v7.anchorRef then
        return nil;
    else
        v7.testId = ("%*--anchor"):format(v9.testId);
        return v6.createElement(v4, v5(v7, {
            tag = "auto-xy", 
            ref = v10
        }), v7.children);
    end;
end);