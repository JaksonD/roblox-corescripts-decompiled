local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local _ = require(l_script_FirstAncestor_0.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.tokenize);
local v5 = require(script.Parent.buildTree);
local v6 = require(script.Parent.DefaultParserOptions);
return function(v7, v8) --[[ Line: 10 ]] --[[ Name: parseXml ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v6 (copy)
    return pcall(function() --[[ Line: 11 ]]
        -- upvalues: v4 (ref), v7 (copy), v5 (ref), v3 (ref), v6 (ref), v8 (copy)
        local v9 = v4(v7);
        return v5(v9, {
            TagConfigurations = v3.Dictionary.join(v6.TagConfigurations, v8 and v8.TagConfigurations or {}), 
            TagAliases = v3.Dictionary.join(v6.TagAliases, v8 and v8.TagAliases or {})
        });
    end);
end;