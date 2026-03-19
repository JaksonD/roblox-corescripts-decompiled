local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthSignup");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Requests.PostUsernameSuggestions);
local v3 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
return {
    suggestUsernames = function(v5, v6, v7, _) --[[ Line: 10 ]] --[[ Name: suggestUsernames ]]
        -- upvalues: v2 (copy), v3 (copy), l_StatusCodes_0 (copy)
        return v2(v5, v6, v7):andThen(function(v9) --[[ Line: 11 ]]
            -- upvalues: v3 (ref)
            if v9 == nil or v9.responseBody == nil then
                return v3.reject();
            else
                local l_didGenerateNewUsername_0 = v9.responseBody.didGenerateNewUsername;
                local l_suggestedUsernames_0 = v9.responseBody.suggestedUsernames;
                return v3.resolve({
                    shouldUpdateState = true, 
                    didGenerate = l_didGenerateNewUsername_0, 
                    suggestions = l_suggestedUsernames_0
                });
            end;
        end, function(v12) --[[ Line: 22 ]]
            -- upvalues: v3 (ref), l_StatusCodes_0 (ref)
            local l_StatusCode_0 = v12.StatusCode;
            return v3.resolve({
                shouldUpdateState = l_StatusCode_0 ~= l_StatusCodes_0.TOO_MANY_REQUESTS, 
                didGenerate = false, 
                suggestions = {}
            });
        end);
    end
};