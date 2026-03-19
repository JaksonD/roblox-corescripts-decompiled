local l_Parent_0 = script:FindFirstAncestor("InterventionShared").Parent;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_Parent_0.Promise);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v5) --[[ Line: 18 ]] --[[ Name: PostDismissIntervention ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy), v3 (copy), l_HttpRbxApiService_0 (copy)
    local v6 = l_UrlBuilder_0.usermoderation.dismissIntervention();
    local v7 = l_HttpService_0:JSONEncode({
        intervention_id = v5
    });
    return v3.new(function(v8, v9) --[[ Line: 24 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v6 (copy), v7 (copy), l_HttpService_0 (ref)
        task.defer(function() --[[ Line: 25 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v6 (ref), v7 (ref), l_HttpService_0 (ref), v8 (copy), v9 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
                -- upvalues: l_HttpRbxApiService_0 (ref), v6 (ref), v7 (ref)
                return l_HttpRbxApiService_0:PostAsyncFullUrl(v6, v7, Enum.ThrottlingPriority.Default);
            end);
            if l_status_0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 31 ]]
                    -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if l_status_1 then
                    v8(l_result_1);
                    return;
                else
                    v9({
                        error = "Failed to parse JSON response", 
                        details = l_result_1
                    });
                    return;
                end;
            else
                v9({
                    error = "HTTP request failed", 
                    details = l_result_0
                });
                return;
            end;
        end);
    end);
end;