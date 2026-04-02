local l_Parent_0 = script.Parent.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: l_Url_0 (copy)
    return v2(("%*enhanced-video-experience-service/v1/serve-enhanced-video?universeId=%*"):format(l_Url_0.APIS_URL, v3), "GET");
end;