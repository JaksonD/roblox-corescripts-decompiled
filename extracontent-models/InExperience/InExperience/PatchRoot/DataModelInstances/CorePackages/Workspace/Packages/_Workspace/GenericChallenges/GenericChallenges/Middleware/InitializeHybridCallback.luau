local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(script.Parent.BuildHybridCallback);
local _ = require(script.Parent.ChallengeWebView);
local v3 = require(script.Parent.ChallengeError);
local v4 = require(l_script_FirstAncestor_0.Utils.completionDataToRawHeaders);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v7 = require(l_script_FirstAncestor_0.Types.ErrorKind);
local v8 = require(script.Parent.Hooks.BuildCredentialsProtocolHook);
return function(v9, v10, v11, v12, v13, v14, v15) --[[ Line: 25 ]]
    -- upvalues: v1 (copy), v8 (copy), v3 (copy), v7 (copy), v4 (copy)
    return v1({
        Hooks = {
            v8()
        }, 
        OnChallengeLoadFailed = function(_) --[[ Line: 37 ]] --[[ Name: OnChallengeLoadFailed ]]
            -- upvalues: v13 (copy), v15 (copy), v3 (ref), v7 (ref), v10 (copy), v11 (copy)
            if v13 ~= nil then
                v13();
            end;
            v15(v3.new(v7.LoadFailed, {
                challengeType = v10
            }));
            v11:close();
        end, 
        OnChallengeInvalidated = function(v17) --[[ Line: 46 ]] --[[ Name: OnChallengeInvalidated ]]
            -- upvalues: v13 (copy), v15 (copy), v3 (ref), v7 (ref), v11 (copy)
            if v13 ~= nil and v17.data ~= nil then
                v13(v17.data);
            end;
            v15(v3.new(v7.Invalidated, v17.data));
            v11:close();
        end, 
        OnChallengeCompleted = function(v18) --[[ Line: 53 ]] --[[ Name: OnChallengeCompleted ]]
            -- upvalues: v14 (copy), v12 (copy), v4 (ref), v9 (copy), v11 (copy)
            if v18.data ~= nil and v18.data.challengeType ~= nil and v18.data.metadata ~= nil then
                v14(v12(v4({
                    challengeId = v9, 
                    challengeType = v18.data.challengeType, 
                    metadata = v18.data.metadata
                })));
            end;
            v11:close();
        end
    });
end;