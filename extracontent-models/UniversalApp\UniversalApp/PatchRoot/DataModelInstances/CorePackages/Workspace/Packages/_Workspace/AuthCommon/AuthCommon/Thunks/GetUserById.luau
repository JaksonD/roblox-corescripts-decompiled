local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.GetUserByIdRequest);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3(v4, v5):andThen(function(v6) --[[ Line: 8 ]]
        -- upvalues: v2 (ref)
        if v6 and v6.responseBody then
            local l_responseBody_0 = v6.responseBody;
            if l_responseBody_0 == nil then
                return v2.reject();
            else
                return v2.resolve(l_responseBody_0);
            end;
        else
            return v2.reject();
        end;
    end);
end;