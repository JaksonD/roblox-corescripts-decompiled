local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: l_UrlBuilder_0 (copy)
    return v2(l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}")({
        id = v3
    }), "GET"):andThen(function(v4) --[[ Line: 8 ]]
        return v4.responseBody and v4.responseBody.thumbnails or {};
    end, function() --[[ Line: 10 ]]
        return {};
    end);
end;