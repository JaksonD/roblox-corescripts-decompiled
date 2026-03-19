local v0 = {};
local v1 = require(script.Parent.Parent.connectors.UserConnector);
local l_findUserById_0 = v1.findUserById;
local l_findMe_0 = v1.findMe;
v0.default = {
    findUserById = function(_, v5) --[[ Line: 7 ]] --[[ Name: findUserById ]]
        -- upvalues: l_findUserById_0 (copy)
        return l_findUserById_0(v5);
    end, 
    findMe = function(_) --[[ Line: 10 ]] --[[ Name: findMe ]]
        -- upvalues: l_findMe_0 (copy)
        return l_findMe_0();
    end
};
return v0;