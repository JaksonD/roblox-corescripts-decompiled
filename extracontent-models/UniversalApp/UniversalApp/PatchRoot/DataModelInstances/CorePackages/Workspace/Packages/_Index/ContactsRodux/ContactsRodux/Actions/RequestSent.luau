local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.ActionDomain);
return v1.makeActionCreator(v2 .. script.Name, function(v3) --[[ Line: 6 ]]
    return {
        payload = v3
    };
end);