local v0 = require(script.Parent.makeActionCreator);
local function v4(v1) --[[ Line: 3 ]] --[[ Name: makeMockRequestObject ]]
    -- upvalues: v0 (copy)
    local v2 = v0(v1);
    local function v3() --[[ Line: 5 ]]

    end;
    v2.API = function() --[[ Line: 6 ]]
        -- upvalues: v2 (copy)
        return v2.Succeeded();
    end;
    v2.Mock = {
        reply = v3, 
        clear = v3, 
        replyWithError = v3
    };
    return v2;
end;
return function() --[[ Line: 19 ]]
    -- upvalues: v4 (copy)
    return {
        GET = v4, 
        POST = v4, 
        PATCH = v4, 
        DELETE = v4
    };
end;