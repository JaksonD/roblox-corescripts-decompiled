local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.UrlBuilder);
local v4 = require(l_Parent_0.t);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local l_UrlBuilder_0 = v3.UrlBuilder;
local l_UrlBase_0 = v3.UrlBase;
local v9 = v4.strictInterface({
    scheduledGroupUpId = v4.number
});
local v10 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "group-up/v1/unsubscribe-from-scheduled-group-up"
})();
return function(v11, v12, v13) --[[ Line: 28 ]]
    -- upvalues: v9 (copy), l_HttpService_0 (copy), v10 (copy), v5 (copy), v6 (copy)
    assert(v9(v11));
    return l_HttpService_0:RequestInternal({
        Body = l_HttpService_0:JSONEncode({
            scheduledGroupUpId = v11.scheduledGroupUpId
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }, 
        Method = "POST", 
        Url = v10
    }):Start(function(_, v15) --[[ Line: 47 ]]
        -- upvalues: v12 (copy), l_HttpService_0 (ref), v5 (ref), v6 (ref), v13 (copy), v11 (copy)
        if v15.StatusCode == 200 then
            local l_Body_0 = v15.Body;
            if v12 then
                v12(l_HttpService_0:JSONDecode(l_Body_0));
            end;
            v5:debug("Response: {}", v6(l_Body_0));
            return v15;
        else
            if v13 then
                v13();
            end;
            v5:error("Error unsubscribing from scheduledSquadId: {}. Status: {}", v11.scheduledGroupUpId, v15.StatusMessage);
            return v15;
        end;
    end);
end;