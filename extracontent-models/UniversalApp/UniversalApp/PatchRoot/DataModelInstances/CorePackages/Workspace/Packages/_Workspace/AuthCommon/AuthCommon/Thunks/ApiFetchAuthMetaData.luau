local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.GetAuthMetaData);
return function(v4) --[[ Line: 6 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return v3(v4):andThen(function(v5) --[[ Line: 7 ]]
        -- upvalues: v2 (ref)
        if v5 and v5.responseBody then
            return v2.resolve(v5.responseBody);
        else
            return v2.reject();
        end;
    end, function(v6) --[[ Line: 13 ]]
        -- upvalues: v2 (ref)
        return v2.reject({
            v6.StatusCode
        });
    end);
end;