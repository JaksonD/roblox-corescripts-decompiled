local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Requests.PostSetGender);
local v3 = require(l_Parent_0.Promise);
return {
    setGender = function(v4, v5) --[[ Line: 8 ]] --[[ Name: setGender ]]
        -- upvalues: v2 (copy), v3 (copy)
        return v2(v4, v5):andThen(function(v6) --[[ Line: 9 ]]
            -- upvalues: v3 (ref)
            if v6 == nil or v6.responseBody == nil then
                return v3.reject();
            else
                return v3.resolve();
            end;
        end):catch(function(_) --[[ Line: 15 ]]
            -- upvalues: v3 (ref)
            return v3.reject();
        end);
    end
};