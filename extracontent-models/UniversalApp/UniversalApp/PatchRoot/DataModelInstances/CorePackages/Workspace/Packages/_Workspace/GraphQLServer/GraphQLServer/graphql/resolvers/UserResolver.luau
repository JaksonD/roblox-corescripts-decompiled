local v0 = {};
local v1 = require(script.Parent.Parent.connectors.UserConnector);
local l_findUserById_0 = v1.findUserById;
local l_findMe_0 = v1.findMe;
v0.default = {
    User = {
        __resolveType = function() --[[ Line: 8 ]] --[[ Name: __resolveType ]]
            return "Player";
        end
    }, 
    Query = {
        me = function(_, _, v6) --[[ Line: 14 ]] --[[ Name: me ]]
            -- upvalues: l_findMe_0 (copy)
            return l_findMe_0(v6.fetchImpl);
        end, 
        user = function(_, v8, v9) --[[ Line: 17 ]] --[[ Name: user ]]
            -- upvalues: l_findUserById_0 (copy)
            local l_id_0 = v8.id;
            return l_findUserById_0(l_id_0, v9.fetchImpl);
        end
    }
};
return v0;