local l_script_FirstAncestor_0 = script:FindFirstAncestor("InlineRichText");
local _ = require(l_script_FirstAncestor_0.Types);
return function(v2, _) --[[ Line: 5 ]]
    return {
        {
            text = v2.text, 
            engineTags = {}
        }
    };
end;