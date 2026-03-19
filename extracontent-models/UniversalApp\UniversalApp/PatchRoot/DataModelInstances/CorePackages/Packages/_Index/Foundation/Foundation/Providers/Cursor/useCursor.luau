local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v5 = require(script.Parent.CursorContext);
local v6 = require(l_script_FirstAncestor_0.Utility.Flags);
local v7 = require(script.Parent.KeyUtilities);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.PresentationContext);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v10 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local l_usePresentationContext_0 = v8.usePresentationContext;
return function(v12) --[[ Line: 18 ]] --[[ Name: useCursor ]]
    -- upvalues: v10 (copy), v6 (copy), l_usePresentationContext_0 (copy), v4 (copy), v3 (copy), v5 (copy), v7 (copy), v2 (copy)
    local v13 = v10();
    local v14 = if v6.FoundationSupportPresentationContextInSelectionCursor then l_usePresentationContext_0() else nil;
    local v15 = if v6.FoundationSupportPresentationContextInSelectionCursor then if v14.colorMode then v14.colorMode else v4.Color else nil;
    local v16 = v3.useContext(v5);
    local l_refCache_0 = v16.refCache;
    local l_setMountedCursors_0 = v16.setMountedCursors;
    local v19 = v3.useMemo(function() --[[ Line: 31 ]]
        -- upvalues: v12 (copy), v7 (ref), v13 (copy), v15 (copy), v6 (ref)
        if typeof(v12) == "table" then
            return v7.encodeKey(v13, v12.radius, v12.offset, v12.borderWidth, v15);
        elseif v12 == nil then
            return v7.encodeKey(v13, nil, nil, nil, v15);
        elseif v6.FoundationSupportPresentationContextInSelectionCursor then
            return (v7.encodeCursorTypeKey(v12, v15));
        else
            return v12;
        end;
    end, {
        v12, 
        v13, 
        v15
    });
    v3.useEffect(function() --[[ Line: 48 ]]
        -- upvalues: l_setMountedCursors_0 (copy), v19 (copy), v2 (ref)
        l_setMountedCursors_0(function(v20) --[[ Line: 49 ]]
            -- upvalues: v19 (ref), v2 (ref)
            if v20[v19] == nil then
                return v2.join(v20, {
                    [v19] = true
                });
            else
                return v20;
            end;
        end);
    end, {
        v19
    });
    return l_refCache_0[v19];
end;