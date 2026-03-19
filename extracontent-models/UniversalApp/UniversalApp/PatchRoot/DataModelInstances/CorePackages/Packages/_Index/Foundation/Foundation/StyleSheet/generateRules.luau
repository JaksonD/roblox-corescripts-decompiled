local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(script.Parent.Rules.Types);
local v5 = require(script.Parent.formatTokens);
return function(v6, v7) --[[ Line: 11 ]] --[[ Name: generateRules ]]
    -- upvalues: v5 (copy), v2 (copy)
    local v8, v9, v10 = v7(v6, (v5(v6)));
    return v2.joinArrays(v8, v9, v10), v8, v9, v10;
end;