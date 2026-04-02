local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v5 = require(script.Parent.CursorContext);
local v6 = require(script.Parent.KeyUtilities);
local v7 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v9 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = v7.usePresentationContext;
return function(v11) --[[ Line: 17 ]] --[[ Name: useCursor ]]
    -- upvalues: v9 (copy), l_usePresentationContext_0 (copy), v4 (copy), v3 (copy), v5 (copy), v6 (copy), v2 (copy)
    local v12 = v9();
    local v13 = l_usePresentationContext_0();
    local v14 = if v13.colorMode then v13.colorMode else v4.Color;
    local v15 = v3.useContext(v5);
    local l_refCache_0 = v15.refCache;
    local l_setMountedCursors_0 = v15.setMountedCursors;
    local v18 = v3.useMemo(function() --[[ Line: 26 ]]
        -- upvalues: v11 (copy), v6 (ref), v12 (copy), v14 (copy)
        if typeof(v11) == "table" then
            return v6.encodeKey(v12, v11.radius, v11.offset, v11.borderWidth, v14);
        elseif v11 == nil then
            return v6.encodeKey(v12, nil, nil, nil, v14);
        else
            return v6.encodeCursorTypeKey(v11, v14);
        end;
    end, {
        v11, 
        v12, 
        v14
    });
    v3.useEffect(function() --[[ Line: 41 ]]
        -- upvalues: l_setMountedCursors_0 (copy), v18 (copy), v2 (ref)
        l_setMountedCursors_0(function(v19) --[[ Line: 42 ]]
            -- upvalues: v18 (ref), v2 (ref)
            if v19[v18] == nil then
                return v2.join(v19, {
                    [v18] = true
                });
            else
                return v19;
            end;
        end);
    end, {
        v18
    });
    return l_refCache_0[v18];
end;