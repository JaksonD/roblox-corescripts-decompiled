local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.TagsContext);
local v5 = require(l_script_FirstAncestor_0.Utility.getFormattedTags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v7) --[[ Line: 12 ]] --[[ Name: useStyleTags ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy)
    local v8 = v5(v7);
    local v9 = v3.useContext(v4);
    v3.useLayoutEffect(function() --[[ Line: 16 ]]
        -- upvalues: v8 (copy), v9 (copy)
        if v8 ~= nil then
            v9(v8);
        end;
    end, {
        v8
    });
    return v8;
end;