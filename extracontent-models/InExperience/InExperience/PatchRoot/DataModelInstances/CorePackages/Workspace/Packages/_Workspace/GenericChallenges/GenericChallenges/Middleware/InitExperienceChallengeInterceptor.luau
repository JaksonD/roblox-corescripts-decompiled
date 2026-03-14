local v0 = require(script.Parent.RenderChallenge);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v2 = require(l_script_FirstAncestor_0.Types.ChallengeType);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Base64_0 = require(l_Parent_0.AuthCommon).Utils.Base64;
local l_HttpService_0 = game:GetService("HttpService");
local l_GenericChallengeService_0 = game:GetService("GenericChallengeService");
local v7 = game:DefineFastFlag("FFlagEnableMutexOnGenericChallengeInterceptorMount", false);
local v8 = false;
challengeRequiredEventHandler = function(v9, v10, v11) --[[ Line: 15 ]] --[[ Name: challengeRequiredEventHandler ]]
    -- upvalues: v0 (copy), v2 (copy), l_GenericChallengeService_0 (copy), l_Base64_0 (copy), l_HttpService_0 (copy)
    v0({
        challengeType = v2.Generic, 
        challengeParameters = {
            genericChallengeId = v9, 
            genericChallengeType = v10, 
            genericChallengeMetadata = v11
        }, 
        callbacks = {
            OnChallengeLoadFailed = function(_) --[[ Line: 24 ]] --[[ Name: OnChallengeLoadFailed ]]
                -- upvalues: l_GenericChallengeService_0 (ref), v9 (copy)
                l_GenericChallengeService_0:SignalChallengeLoaded(v9, false);
            end, 
            OnChallengeCompleted = function(v13) --[[ Line: 29 ]] --[[ Name: OnChallengeCompleted ]]
                -- upvalues: l_Base64_0 (ref), l_HttpService_0 (ref), l_GenericChallengeService_0 (ref), v9 (copy), v10 (copy)
                if v13.data.metadata ~= nil then
                    local v14 = l_Base64_0.Encode(l_HttpService_0:JSONEncode(v13.data.metadata));
                    l_GenericChallengeService_0:SignalChallengeCompleted(v9, v10, v14);
                end;
            end, 
            OnChallengeInvalidated = function(_) --[[ Line: 35 ]] --[[ Name: OnChallengeInvalidated ]]
                -- upvalues: l_GenericChallengeService_0 (ref), v9 (copy)
                l_GenericChallengeService_0:SignalChallengeInvalidated(v9);
            end, 
            OnChallengeAbandoned = function() --[[ Line: 38 ]] --[[ Name: OnChallengeAbandoned ]]
                -- upvalues: l_GenericChallengeService_0 (ref), v9 (copy)
                l_GenericChallengeService_0:SignalChallengeAbandoned(v9);
            end
        }, 
        renderWebViewInModal = true, 
        onWebViewOpen = function() --[[ Line: 43 ]] --[[ Name: onWebViewOpen ]]
            -- upvalues: l_GenericChallengeService_0 (ref), v9 (copy)
            l_GenericChallengeService_0:SignalChallengeLoaded(v9, true);
        end
    });
end;
return function() --[[ Line: 49 ]]
    -- upvalues: v7 (copy), v8 (ref), l_GenericChallengeService_0 (copy)
    if v7 then
        if not v8 then
            v8 = true;
            l_GenericChallengeService_0.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler);
            return;
        end;
    else
        l_GenericChallengeService_0.ChallengeRequiredEvent:Connect(challengeRequiredEventHandler);
    end;
end;