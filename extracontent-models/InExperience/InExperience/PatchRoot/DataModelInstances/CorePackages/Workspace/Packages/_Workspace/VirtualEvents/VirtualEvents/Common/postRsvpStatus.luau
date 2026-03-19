local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v4, v5, v6) --[[ Line: 8 ]]
    -- upvalues: l_UrlBuilder_0 (copy), l_HttpService_0 (copy)
    local v7 = l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}/rsvps");
    local v8 = l_HttpService_0:JSONEncode({
        rsvpStatus = v6
    });
    return v4(v7({
        id = v5
    }), "POST", {
        postBody = v8
    }):andThen(function(v9) --[[ Line: 17 ]]
        return v9.responseBody;
    end);
end;