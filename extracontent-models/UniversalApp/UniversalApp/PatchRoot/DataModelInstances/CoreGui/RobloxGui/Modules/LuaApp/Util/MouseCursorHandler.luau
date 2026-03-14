local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.handleMouseCursor);
return function() --[[ Line: 6 ]] --[[ Name: MouseCursorHandler ]]
    -- upvalues: v1 (copy), v2 (copy)
    v1.useEffect(function() --[[ Line: 7 ]]
        -- upvalues: v2 (ref)
        return v2();
    end, {});
    return nil;
end;