local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Components_0 = l_script_FirstAncestor_0.Components;
local _ = require(l_Components_0.Types);
local v5 = require(l_script_FirstAncestor_0.Providers.Preferences.usePreferences);
local l_TextService_0 = require(l_script_FirstAncestor_0.Utility.Wrappers.Services).TextService;
return function(v7, v8, v9) --[[ Line: 14 ]] --[[ Name: useTextSize ]]
    -- upvalues: v2 (copy), v5 (copy), l_TextService_0 (copy)
    local v10, v11 = v2.useState(Vector2.new(0, 0));
    local l_preferredTextSize_0 = v5().preferredTextSize;
    v2.useEffect(function() --[[ Line: 18 ]]
        -- upvalues: v11 (copy), l_TextService_0 (ref), v7 (copy), v8 (copy), v9 (copy)
        v11(l_TextService_0:GetTextSize(v7, v8.FontSize, v8.Font, if v9 then v9 else Vector2.new(1e999, 1e999)));
    end, {
        v7, 
        v8, 
        v9, 
        l_preferredTextSize_0
    });
    return v10;
end;