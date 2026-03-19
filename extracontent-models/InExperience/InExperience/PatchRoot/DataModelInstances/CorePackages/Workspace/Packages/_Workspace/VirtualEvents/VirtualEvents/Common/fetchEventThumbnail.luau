local l_Parent_0 = script:FindFirstAncestor("VirtualEvents").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
return function(v2, v3, v4) --[[ Line: 5 ]]
    -- upvalues: l_UrlBuilder_0 (copy)
    return v2(l_UrlBuilder_0.fromString("apis:virtual-events/v1/virtual-events/{id}")({
        id = v3
    }), "GET"):andThen(function(v5) --[[ Line: 8 ]]
        -- upvalues: v4 (copy)
        local v6 = v5.responseBody and v5.responseBody.thumbnails and v5.responseBody.thumbnails[1] and v5.responseBody.thumbnails[1].mediaId or nil;
        if v6 then
            return "rbxassetid://" .. v6;
        else
            return v4;
        end;
    end, function() --[[ Line: 20 ]]
        -- upvalues: v4 (copy)
        return v4;
    end);
end;