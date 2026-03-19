local l_Parent_0 = script:FindFirstAncestor("GenericChallenges").Parent;
local v1 = require(l_Parent_0.Promise);
local l_game_EngineFeature_0 = game:GetEngineFeature("FacialAgeEstimationServiceAvailable");
local v3 = if l_game_EngineFeature_0 then game:GetService("FacialAgeEstimationService") else nil;
return {
    isAvailable = function() --[[ Line: 13 ]] --[[ Name: isAvailable ]]
        -- upvalues: l_game_EngineFeature_0 (copy), v3 (copy)
        return l_game_EngineFeature_0 and v3:IsAvailable();
    end, 
    startFlow = function(v4, v5) --[[ Line: 16 ]] --[[ Name: startFlow ]]
        -- upvalues: v1 (copy), v3 (copy)
        return v1.new(function(v6, v7) --[[ Line: 17 ]]
            -- upvalues: v3 (ref), v4 (copy), v5 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
                -- upvalues: v3 (ref), v4 (ref), v5 (ref)
                return v3:InquiryAsync({
                    inquiryId = v4, 
                    sessionToken = v5
                });
            end);
            if not l_status_0 then
                v7(l_result_0);
                return;
            else
                local l_resultType_0 = l_result_0.resultType;
                if l_resultType_0 == Enum.FacialAgeEstimationResultType.Complete then
                    v6(v4);
                    return;
                elseif l_resultType_0 == Enum.FacialAgeEstimationResultType.Cancel then
                    v7({
                        resultType = l_resultType_0
                    });
                    return;
                else
                    if l_resultType_0 == Enum.FacialAgeEstimationResultType.Error then
                        v7({
                            resultType = l_resultType_0
                        });
                    end;
                    return;
                end;
            end;
        end);
    end
};