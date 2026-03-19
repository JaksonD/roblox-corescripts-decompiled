local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Rodux);
local _ = require(l_Parent_0.roduxFriendsTypes);
return v2.makeActionCreator(script.Name, function(v4) --[[ Line: 9 ]]
    return {
        payload = v4
    };
end);