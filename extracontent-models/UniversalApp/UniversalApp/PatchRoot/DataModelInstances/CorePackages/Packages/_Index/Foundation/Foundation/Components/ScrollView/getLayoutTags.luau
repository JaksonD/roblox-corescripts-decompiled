local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.StyleSheet.Rules.staticRules);
local v2 = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v3 = require(l_script_FirstAncestor_0.StyleSheet.formatTokens);
return function() --[[ Line: 8 ]] --[[ Name: getLayoutTags ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    local v4 = {};
    local v5 = v3(v2.defaultTokens);
    for _, v7 in {
        v1.rules.ListLayoutRules(), 
        (v1.rules.ListLayoutSpacingRules(v5.gaps, v5.gutters))
    } do
        for _, v9 in v7 do
            if v9.pseudo == "UIListLayout" and v9.tag then
                v4[v9.tag] = true;
            end;
        end;
    end;
    return v4;
end;