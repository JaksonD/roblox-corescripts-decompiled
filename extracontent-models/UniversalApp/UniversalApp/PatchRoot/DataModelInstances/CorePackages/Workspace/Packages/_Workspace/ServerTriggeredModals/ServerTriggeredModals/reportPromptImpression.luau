local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_script_FirstAncestor_0.logResponseStatus);
local v6 = require(l_script_FirstAncestor_0.logResponseLatency);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v9 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "modals-api/v1/prompts/impression"
});
return function(v10, v11) --[[ Line: 21 ]]
    -- upvalues: v9 (copy), l_HttpService_0 (copy), v3 (copy), v5 (copy), v4 (copy), v6 (copy)
    local v12 = v9();
    local v13 = l_HttpService_0:JSONEncode({
        promptType = v10, 
        promptId = v11
    });
    local v14 = l_HttpService_0:RequestInternal({
        Url = v12, 
        Method = "POST", 
        Headers = {
            ["Content-Type"] = "application/json"
        }, 
        Body = v13
    });
    return v3.new(function(v15, v16) --[[ Line: 32 ]]
        -- upvalues: v14 (copy), v5 (ref), v4 (ref), v6 (ref)
        v14:Start(function(v17, v18) --[[ Line: 33 ]]
            -- upvalues: v5 (ref), v4 (ref), v16 (copy), v6 (ref), v15 (copy)
            local v19 = v18 and v18.StatusCode;
            if not v17 or v19 ~= 200 then
                v5("modals-api/v1/prompts/impression", v19);
                v4:error((("Report Prompt Impression request error with status code: %*"):format(v19)));
                v16();
                return;
            else
                local v20 = v18 and v18.Stats and v18.Stats.RoundTripTime;
                local v21 = v20 and v20 * 1000;
                if v21 then
                    v6("modals-api/v1/prompts/impression", v21, v19);
                end;
                v15();
                return;
            end;
        end);
    end);
end;