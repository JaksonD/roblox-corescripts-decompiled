local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Components.HelpPageContainer);
local v4 = require(l_Parent_0.Context.KeybindContextProvider);
return function() --[[ Line: 10 ]] --[[ Name: _createPageView ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.createElement(v4, nil, {
        HelpPageContainer = v2.createElement(v3)
    });
end;