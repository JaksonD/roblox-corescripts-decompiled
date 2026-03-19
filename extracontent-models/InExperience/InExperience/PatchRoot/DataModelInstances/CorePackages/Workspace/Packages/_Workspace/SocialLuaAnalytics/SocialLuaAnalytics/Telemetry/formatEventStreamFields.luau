local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("SocialLuaAnalytics").Parent;
local v2 = require(l_Parent_0.Cryo);
return function(v3) --[[ Line: 6 ]] --[[ Name: formatEventStreamFields ]]
    -- upvalues: v2 (copy), l_HttpService_0 (copy)
    return v2.Dictionary.map(v3, function(v4, v5) --[[ Line: 7 ]]
        -- upvalues: l_HttpService_0 (ref)
        if type(v4) == "table" then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 9 ]]
                -- upvalues: l_HttpService_0 (ref), v4 (copy)
                return l_HttpService_0:JSONEncode(v4);
            end);
            if l_status_0 then
                return l_result_0, v5;
            else
                return "", v5;
            end;
        else
            return tostring(v4), v5;
        end;
    end);
end;