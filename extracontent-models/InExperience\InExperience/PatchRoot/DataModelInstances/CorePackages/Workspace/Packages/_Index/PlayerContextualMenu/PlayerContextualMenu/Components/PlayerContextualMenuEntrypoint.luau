local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(script.Parent.HttpRequest.HttpRequestContext);
local v4 = require(script.Parent.HttpRequest.DefaultHttpRequestInstance);
local v5 = require(l_script_FirstAncestor_0.Components.PlayerContextualMenuContainer);
return function(v6) --[[ Line: 17 ]] --[[ Name: PlayerContextualMenuEntrypoint ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy), v5 (copy)
    return v2.createElement(v3.Provider, {
        value = v6.httpRequest or v4
    }, {
        app = v2.createElement(v5, v6)
    });
end;