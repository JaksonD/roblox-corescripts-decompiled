local l_Parent_0 = script:FindFirstAncestor("RoduxAliases").Parent;
local v1 = require(l_Parent_0.Rodux);
local v2 = require(script.Parent.ActionDomain);
return v1.makeActionCreator(v2 .. script.Name, function(v3) --[[ Line: 6 ]]
    return {
        payload = {
            showUserAlias = v3
        }
    };
end);