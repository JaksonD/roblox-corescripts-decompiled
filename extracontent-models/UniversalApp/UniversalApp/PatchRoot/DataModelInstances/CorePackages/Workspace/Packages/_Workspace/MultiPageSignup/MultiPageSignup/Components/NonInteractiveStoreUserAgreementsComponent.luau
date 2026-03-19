local l_script_FirstAncestor_0 = script:FindFirstAncestor("MultiPageSignup");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.RoactServiceTags);
local l_RoactNetworking_0 = v3.RoactNetworking;
local l_RoactAnalytics_0 = v3.RoactAnalytics;
local v6 = require(l_Parent_0.Cryo);
local v7 = require(l_Parent_0.React);
local v8 = require(l_Parent_0.UserActivationFramework);
local l_NonInteractiveActivationFrameworkWrapper_0 = v8.Components.NonInteractiveActivationFrameworkWrapper;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_FetchSignupUserAgreements_0 = require(l_Parent_0.UserAgreements).FetchSignupUserAgreements;
local l_PayloadKey_0 = v8.Enums.PayloadKey;
return function(v13) --[[ Line: 26 ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_RoactNetworking_0 (copy), l_FetchSignupUserAgreements_0 (copy), v6 (copy), l_HttpService_0 (copy), l_PayloadKey_0 (copy), v7 (copy), l_NonInteractiveActivationFrameworkWrapper_0 (copy)
    local v14 = l_useRoactService_0(l_RoactAnalytics_0);
    local v15 = l_useRoactService_0(l_RoactNetworking_0);
    local v21 = {
        onNonInteractiveStepExecution = function() --[[ Line: 30 ]] --[[ Name: onNonInteractiveStepExecution ]]
            -- upvalues: l_FetchSignupUserAgreements_0 (ref), v15 (copy), v14 (copy), v6 (ref), l_HttpService_0 (ref), l_PayloadKey_0 (ref)
            local v18, v19 = l_FetchSignupUserAgreements_0(v15, v14):andThen(function(v16) --[[ Line: 32 ]]
                -- upvalues: v6 (ref)
                return (v6.List.map(v16, function(v17) --[[ Line: 33 ]]
                    return v17.id;
                end));
            end):await();
            if v18 then
                local v20 = l_HttpService_0:JSONEncode(v19);
                return {
                    successPayloadAddendum = {
                        [l_PayloadKey_0.SignupAgreedUserAgreements] = v20
                    }, 
                    errorOutput = nil
                };
            else
                return {
                    successPayloadAddendum = nil, 
                    errorOutput = {}
                };
            end;
        end
    };
    return v7.createElement(l_NonInteractiveActivationFrameworkWrapper_0, {
        step = v21, 
        navigation = v13.navigation
    });
end;