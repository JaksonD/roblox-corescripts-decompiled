local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.UrlBuilder);
local v4 = require(l_script_FirstAncestor_0.Logger);
local v5 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local _ = require(l_script_FirstAncestor_0.Types);
local l_UrlBuilder_0 = v3.UrlBuilder;
local l_UrlBase_0 = v3.UrlBase;
return function(v9, v10, v11) --[[ Line: 17 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_UrlBase_0 (copy), l_HttpService_0 (copy), v4 (copy), v5 (copy)
    local v12 = l_UrlBuilder_0.new({
        base = l_UrlBase_0.APIS, 
        path = "group-up/v1/get-scheduled-group-up-status", 
        query = {
            scheduledGroupUpId = v9
        }
    })();
    return l_HttpService_0:RequestInternal({
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }, 
        Method = "GET", 
        Url = v12
    }):Start(function(_, v14) --[[ Line: 38 ]]
        -- upvalues: v10 (copy), l_HttpService_0 (ref), v4 (ref), v5 (ref), v11 (copy)
        if v14.StatusCode == 200 then
            local l_Body_0 = v14.Body;
            if v10 then
                v10(l_HttpService_0:JSONDecode(l_Body_0).scheduledGroupUp);
            end;
            v4:debug("Response: {}", v5(l_Body_0));
            return v14;
        else
            if v11 then
                v11();
            end;
            v4:error("Error getting scheduled squad status: {}", v14.StatusMessage);
            return v14;
        end;
    end);
end;