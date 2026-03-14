local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.Types.ContactTypes);
local v4 = require(script.Parent.ActionDomain);
return v2.makeActionCreator(v4 .. script.Name, function(v5) --[[ Line: 7 ]]
    return {
        payload = v5
    };
end);