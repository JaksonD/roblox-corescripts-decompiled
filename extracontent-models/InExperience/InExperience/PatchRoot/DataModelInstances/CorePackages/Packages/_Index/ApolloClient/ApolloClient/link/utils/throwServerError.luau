local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Error_0 = require(l_Parent_1.LuauPolyfill).Error;
local _ = require(l_Parent_0.luaUtils.Response);
return {
    throwServerError = function(v4, v5, v6) --[[ Line: 31 ]] --[[ Name: throwServerError ]]
        -- upvalues: l_Error_0 (copy)
        local v7 = l_Error_0.new(v6);
        v7.name = "ServerError";
        v7.response = v4;
        v7.statusCode = v4.status;
        v7.result = v5;
        error(v7);
    end
};