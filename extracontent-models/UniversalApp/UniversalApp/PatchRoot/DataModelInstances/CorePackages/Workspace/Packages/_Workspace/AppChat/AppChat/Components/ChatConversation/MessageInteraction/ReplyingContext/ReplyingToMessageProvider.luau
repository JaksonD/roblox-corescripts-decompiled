local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.ReplyingToMessageContext);
local v3 = require(script.Parent.ReplyingToMessageDispatchContext);
return function(v4) --[[ Line: 13 ]] --[[ Name: ReplyingToMessageProvider ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v5, v6 = v1.useState(nil);
    return v1.createElement(v2.Provider, {
        value = v5
    }, {
        ReplyingToMessageDispatch = v1.createElement(v3.Provider, {
            value = v6
        }, v4.children)
    });
end;