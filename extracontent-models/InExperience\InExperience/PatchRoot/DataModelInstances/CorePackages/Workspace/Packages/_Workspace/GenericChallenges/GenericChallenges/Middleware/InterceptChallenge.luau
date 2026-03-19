local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(script.Parent.RenderChallenge);
local _ = require(script.Parent.InitializeHybridCallback);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Promise);
local _ = require(l_Parent_0.LuauPolyfill);
return function(v6) --[[ Line: 21 ]]
    -- upvalues: v4 (copy), v1 (copy)
    return v4.new(function(v7, v8) --[[ Line: 22 ]]
        -- upvalues: v1 (ref), v6 (copy)
        v1({
            title = v6.title, 
            rawResponseHeaders = v6.rawResponseHeaders, 
            retryRequestCallback = v6.retryRequestCallback, 
            challengeErrorCallback = v6.challengeErrorCallback, 
            resolve = v7, 
            reject = v8
        });
    end);
end;