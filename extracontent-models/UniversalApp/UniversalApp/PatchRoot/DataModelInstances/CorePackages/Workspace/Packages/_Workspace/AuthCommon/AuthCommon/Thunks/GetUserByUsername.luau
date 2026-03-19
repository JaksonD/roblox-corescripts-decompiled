local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Http.Requests.PostGetUserByUsername);
return function(v4, v5) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return function() --[[ Line: 8 ]]
        -- upvalues: v3 (ref), v4 (copy), v5 (copy), v2 (ref)
        return v3(v4, v5):andThen(function(v6) --[[ Line: 9 ]]
            -- upvalues: v2 (ref)
            if v6 and v6.responseBody then
                local l_data_0 = v6.responseBody.data;
                if l_data_0 == nil or #l_data_0 == 0 then
                    return v2.reject();
                else
                    local v8 = l_data_0[1];
                    return v2.resolve(v8);
                end;
            else
                return v2.reject();
            end;
        end);
    end;
end;