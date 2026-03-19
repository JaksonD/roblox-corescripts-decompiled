local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppComposition");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.React);
local l_useStyleSheet_0 = v2.Hooks.useStyleSheet;
local l_useTokens_0 = v2.Hooks.useTokens;
local v6 = require(l_script_FirstAncestor_0.setupCompositionStyleRules);
return function() --[[ Line: 18 ]] --[[ Name: CompositionStyleSheet ]]
    -- upvalues: v3 (copy), l_useStyleSheet_0 (copy), l_useTokens_0 (copy), v6 (copy)
    local v7 = v3.useRef(nil);
    local v8 = l_useStyleSheet_0();
    local v9 = l_useTokens_0();
    v3.useLayoutEffect(function() --[[ Line: 23 ]]
        -- upvalues: v7 (copy), v8 (copy), v6 (ref), v9 (copy)
        if v7.current and v8 then
            v7.current:SetDerives({
                v8
            });
            return v6(v7.current, v9);
        else
            return function() --[[ Line: 28 ]]

            end;
        end;
    end, {
        v7, 
        v8, 
        v9
    });
    return v3.createElement(v3.Fragment, nil, {
        CompositionStyleSheet = v3.createElement("StyleSheet", {
            ref = v7
        }), 
        CompositionStyleLink = v3.createElement("StyleLink", {
            StyleSheet = v7.current
        })
    });
end;