local l_Parent_0 = script:FindFirstAncestor("Localization").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(script.Parent.LocalizationConsumer);
return function(v4) --[[ Line: 7 ]] --[[ Name: withLocalization ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy)
    v2.isType(v4, "table", "stringsToBeLocalized passed to withLocalization()");
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (ref), v4 (copy)
        v2.isType(v5, "function", "render passed to withLocalization()");
        return v1.createElement(v3, {
            render = v5, 
            stringsToBeLocalized = v4
        });
    end;
end;