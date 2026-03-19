local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.Context);
return function(v4) --[[ Line: 19 ]] --[[ Name: ChatPagePaddingProvider ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    return v2.createElement(v3.Provider, {
        value = v1.Dictionary.join({
            top = 0, 
            right = 12, 
            bottom = 0, 
            left = 12
        }, v4.value)
    }, v4.children);
end;