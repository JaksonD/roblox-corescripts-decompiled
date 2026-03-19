local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.UrlBuilder);
local v4 = require(l_Parent_0.t);
local v5 = require(l_script_FirstAncestor_0.Logger);
local v6 = require(l_script_FirstAncestor_0.Models.ScheduledSquadModel);
local v7 = require(l_script_FirstAncestor_0.Utils.serializeTable);
local _ = require(l_script_FirstAncestor_0.Types);
local l_UrlBuilder_0 = v3.UrlBuilder;
local l_UrlBase_0 = v3.UrlBase;
local v11 = v4.strictInterface({
    scheduledGroupUpId = v4.number, 
    title = v4.string, 
    startTime = v4.string
});
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "group-up/v1/update-scheduled-group-up"
})();
return function(v13, v14, v15) --[[ Line: 36 ]]
    -- upvalues: v11 (copy), l_HttpService_0 (copy), v12 (copy), v6 (copy), v5 (copy), v7 (copy)
    assert(v11(v13));
    return l_HttpService_0:RequestInternal({
        Body = l_HttpService_0:JSONEncode({
            scheduledGroupUpId = v13.scheduledGroupUpId, 
            title = v13.title, 
            startTime = v13.startTime
        }), 
        Headers = {
            ["Content-Type"] = "application/json", 
            Accept = "application/json"
        }, 
        Method = "POST", 
        Url = v12
    }):Start(function(_, v17) --[[ Line: 57 ]]
        -- upvalues: v14 (copy), v6 (ref), l_HttpService_0 (ref), v5 (ref), v7 (ref), v15 (copy)
        if v17.StatusCode == 200 then
            local l_Body_0 = v17.Body;
            if v14 then
                v14(v6.format(l_HttpService_0:JSONDecode(l_Body_0)));
            end;
            v5:debug("Response: {}", v7(l_Body_0));
            return v17;
        else
            if v15 then
                v15();
            end;
            v5:error("Error updating scheduled squad: {}", v17.StatusMessage);
            return v17;
        end;
    end);
end;