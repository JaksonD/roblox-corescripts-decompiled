local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local v3 = require(l_Parent_0.Actions.CapturesRetrieved);
local _ = require(l_Parent_0.Types);
return v2.createReducer({}, {
    [v3.name] = function(_, v6) --[[ Line: 14 ]]
        return v6.captures;
    end
});