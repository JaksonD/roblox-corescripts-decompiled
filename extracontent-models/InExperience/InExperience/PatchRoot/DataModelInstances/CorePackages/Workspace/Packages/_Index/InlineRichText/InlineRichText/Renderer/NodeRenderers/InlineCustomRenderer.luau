local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local _ = require(l_script_FirstAncestor_0.Types);
local v4 = require(l_Parent_0.Cryo);
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v7 = v6.inlineCustomRenderers[v5.name];
    if not v7 or typeof(v7) ~= "function" then
        v2:warning((("Node %*: No custom renderer found. For custom tags, you must provide a renderer function in the renderers prop"):format(v5.name)));
        return {};
    else
        return v7(v5, v4.Dictionary.join(v6, {
            nodeProps = v6.nodeProps[v5.name] or {}
        }));
    end;
end;