local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.HttpRequest);
local l_FFlagLuaAppDefaultHttpRetry_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppDefaultHttpRetry;
local v7 = v2.config({
    requestFunction = function(v4, v5, v6) --[[ Line: 7 ]] --[[ Name: requestFunction ]]
        -- upvalues: v2 (copy)
        return v2.requestFunctions.HttpRbxApi(v4, v5, v6);
    end, 
    maxRetryCount = if l_FFlagLuaAppDefaultHttpRetry_0 then game:DefineFastInt("WithReferralRewardTooltipInfoHttpRetryCount", 4) else nil
});
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.Http).Url;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v10 = require(l_CorePackages_0.Packages.Cryo);
GetReferralRewardTooltipInfo = function() --[[ Line: 19 ]] --[[ Name: GetReferralRewardTooltipInfo ]]
    -- upvalues: l_Url_0 (copy), v7 (copy)
    local v11 = l_Url_0:makeQueryString({
        UniverseId = game.GameId
    });
    local v12 = string.format("%sreferral-reward-metadata/v1/get-reward-metadata?%s", l_Url_0.APIS_URL, v11);
    return v7(v12, "GET");
end;
withReferralRewardTooltipInfo = function(v13) --[[ Line: 27 ]] --[[ Name: withReferralRewardTooltipInfo ]]
    -- upvalues: v10 (copy), v1 (copy), l_useLocalization_0 (copy)
    return function(v14) --[[ Line: 28 ]]
        -- upvalues: v10 (ref), v1 (ref), l_useLocalization_0 (ref), v13 (copy)
        local v15 = v10.Dictionary.join(v14, {
            referralRewardTooltipText = ""
        });
        local v16, v17 = v1.useState("");
        v1.useEffect(function() --[[ Line: 33 ]]
            -- upvalues: v17 (copy)
            GetReferralRewardTooltipInfo():andThen(function(v18) --[[ Line: 34 ]]
                -- upvalues: v17 (ref)
                if v18 and v18.responseBody and v18.responseBody.name then
                    v17(v18.responseBody.name);
                    task.delay(4, function() --[[ Line: 37 ]]
                        -- upvalues: v17 (ref)
                        v17("");
                    end);
                end;
            end):catch(function(v19) --[[ Line: 41 ]]
                warn(v19);
            end);
        end, {});
        local v20 = l_useLocalization_0({
            referralRewardTooltipText = {
                "CoreScripts.TopBar.RobloxMenuReferralRewardTooltip"; 
                referralRewardName = v16
            }
        });
        if v16 ~= "" then
            v15 = v10.Dictionary.join(v15, {
                referralRewardTooltipText = v20.referralRewardTooltipText
            });
        end;
        return v1.createElement(v13, v15);
    end;
end;
return withReferralRewardTooltipInfo;