local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppComposition");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.SignalsReact);
local _ = require(l_script_FirstAncestor_0.AppCompositionTypes);
local v6 = require(l_script_FirstAncestor_0.CompositionConfig);
local v7 = require(l_script_FirstAncestor_0.getGlobalViewportBreakpoint);
local l_useTokens_0 = v2.Hooks.useTokens;
return function() --[[ Line: 16 ]] --[[ Name: useCompositionLayout ]]
    -- upvalues: l_useTokens_0 (copy), v4 (copy), v7 (copy), v3 (copy), v6 (copy)
    local v9 = l_useTokens_0();
    local v10 = v4.useSignalState(v7);
    return v3.useMemo(function() --[[ Line: 20 ]]
        -- upvalues: v6 (ref), v10 (copy), v9 (copy)
        return v6.getBaseConfig(v10, v9);
    end, {
        v10, 
        v9
    });
end;