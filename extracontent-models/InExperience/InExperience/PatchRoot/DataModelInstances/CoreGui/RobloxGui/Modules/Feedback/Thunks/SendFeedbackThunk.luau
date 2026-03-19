local l_CorePackages_0 = game:GetService("CorePackages");
local l_Promise_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Promise;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Network.PostFeedback);
local v5 = require(l_Parent_0.Actions.IncrementFeedbackSubmissionAttempts);
return function(v6, v7, v8, v9, v10, v11, v12) --[[ Line: 17 ]]
    -- upvalues: l_PerformFetch_0 (copy), v4 (copy), v5 (copy), l_Promise_0 (copy)
    return l_PerformFetch_0.Single("PostFeedbackRequest", function(v13) --[[ Line: 27 ]]
        -- upvalues: v4 (ref), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v5 (ref), v12 (copy), l_Promise_0 (ref)
        return v4(v6, v7, v8, v9, v10, v11):andThen(function(v14) --[[ Line: 35 ]]
            -- upvalues: v13 (copy), v5 (ref), v12 (ref), l_Promise_0 (ref)
            v13:dispatch(v5(v12));
            return l_Promise_0.resolve(v14);
        end, function(v15) --[[ Line: 38 ]]
            -- upvalues: l_Promise_0 (ref)
            return l_Promise_0.reject(v15);
        end);
    end);
end;