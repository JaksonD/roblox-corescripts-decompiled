local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(string.format("%suniverses/v1/places/%d/universe", l_Url_0.APIS_URL, v3), "GET"):andThen(function(v4) --[[ Line: 8 ]]
        -- upvalues: v3 (copy)
        if v4 and v4.responseBody and v4.responseBody.universeId then
            return v4.responseBody.universeId;
        else
            error("Failed to get universeId from placeId: " .. tostring(v3));
            return;
        end;
    end);
end;