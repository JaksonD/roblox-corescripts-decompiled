local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericChallenges");
local v1 = require(l_script_FirstAncestor_0.Types.JavascriptHybrid);
local l_HttpService_0 = game:GetService("HttpService");
return function(v3) --[[ Line: 29 ]]
    -- upvalues: l_HttpService_0 (copy), v1 (copy)
    return function(v4) --[[ Line: 30 ]]
        -- upvalues: l_HttpService_0 (ref), v1 (ref), v3 (copy)
        local v5 = l_HttpService_0:JSONDecode(v4);
        if v5.moduleID ~= v1.Module.Navigation or v5.functionName ~= v1.Function.navigateToFeature or not v5.params or not v5.params.params then
            return;
        else
            local l_params_0 = v5.params.params;
            if l_params_0.feature == v1.Feature.ChallengeParsed and l_params_0.data.parsed == false then
                v3.OnChallengeLoadFailed(l_params_0);
                return;
            elseif l_params_0.feature == v1.Feature.ChallengeInitialized and l_params_0.data.initialized == false then
                v3.OnChallengeLoadFailed(l_params_0);
                return;
            else
                if v3.Hooks ~= nil then
                    for _, v8 in v3.Hooks do
                        if v8(l_params_0) then
                            return;
                        end;
                    end;
                end;
                if l_params_0.feature == v1.Feature.ChallengeCompleted then
                    if l_params_0.data ~= nil then
                        v3.OnChallengeCompleted(l_params_0);
                        return;
                    elseif v3.OnChallengeAbandoned ~= nil then
                        v3.OnChallengeAbandoned();
                        return;
                    else
                        v3.OnChallengeLoadFailed(l_params_0);
                        return;
                    end;
                elseif l_params_0.feature == v1.Feature.ChallengeInvalidated then
                    v3.OnChallengeInvalidated(l_params_0);
                    return;
                else
                    if v5.params.params.feature == v1.Feature.ChallengeDisplayed and v3.OnChallengeDisplayed ~= nil then
                        v3.OnChallengeDisplayed(l_params_0);
                    end;
                    return;
                end;
            end;
        end;
    end;
end;