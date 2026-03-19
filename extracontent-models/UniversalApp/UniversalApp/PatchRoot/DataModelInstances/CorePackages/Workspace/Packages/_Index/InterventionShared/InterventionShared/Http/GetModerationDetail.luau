local l_script_FirstAncestor_0 = script:FindFirstAncestor("InterventionShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v5 = require(l_Parent_0.Promise);
local v6 = require(l_script_FirstAncestor_0.Utils.buildQueryString);
return function(v7) --[[ Line: 20 ]] --[[ Name: GetModerationDetail ]]
    -- upvalues: l_UrlBuilder_0 (copy), v6 (copy), v5 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    local v8 = l_UrlBuilder_0.usermoderation.moderationDetail() .. v6(v7);
    return v5.new(function(v9, v10) --[[ Line: 24 ]]
        -- upvalues: l_HttpRbxApiService_0 (ref), v8 (copy), l_HttpService_0 (ref)
        task.defer(function() --[[ Line: 25 ]]
            -- upvalues: l_HttpRbxApiService_0 (ref), v8 (ref), l_HttpService_0 (ref), v9 (copy), v10 (copy)
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 26 ]]
                -- upvalues: l_HttpRbxApiService_0 (ref), v8 (ref)
                return l_HttpRbxApiService_0:GetAsyncFullUrl(v8, Enum.ThrottlingPriority.Default);
            end);
            if l_status_0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 31 ]]
                    -- upvalues: l_HttpService_0 (ref), l_result_0 (copy)
                    return l_HttpService_0:JSONDecode(l_result_0);
                end);
                if l_status_1 then
                    v9(l_result_1);
                    return;
                else
                    v10({
                        error = "Failed to parse JSON response", 
                        details = l_result_1
                    });
                    return;
                end;
            else
                v10({
                    error = "HTTP request failed", 
                    details = l_result_0
                });
                return;
            end;
        end);
    end);
end;