local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
return {
    HydrationContentType = ({
        HydrationContentType = {
            fromNumber = function(v2) --[[ Line: 23 ]] --[[ Name: fromNumber ]]
                if v2 == 0 then
                    return "HYDRATION_CONTENT_TYPE_INVALID";
                elseif v2 == 1 then
                    return "HYDRATION_CONTENT_TYPE_BADGE";
                elseif v2 == 2 then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE";
                elseif v2 == 3 then
                    return "HYDRATION_CONTENT_TYPE_CREATOR";
                else
                    return nil;
                end;
            end, 
            toNumber = function(v3) --[[ Line: 37 ]] --[[ Name: toNumber ]]
                if v3 == "HYDRATION_CONTENT_TYPE_INVALID" then
                    return 0;
                elseif v3 == "HYDRATION_CONTENT_TYPE_BADGE" then
                    return 1;
                elseif v3 == "HYDRATION_CONTENT_TYPE_UNIVERSE" then
                    return 2;
                elseif v3 == "HYDRATION_CONTENT_TYPE_CREATOR" then
                    return 3;
                else
                    return v3;
                end;
            end, 
            fromName = function(v4) --[[ Line: 51 ]] --[[ Name: fromName ]]
                if v4 == "HYDRATION_CONTENT_TYPE_INVALID" then
                    return "HYDRATION_CONTENT_TYPE_INVALID";
                elseif v4 == "HYDRATION_CONTENT_TYPE_BADGE" then
                    return "HYDRATION_CONTENT_TYPE_BADGE";
                elseif v4 == "HYDRATION_CONTENT_TYPE_UNIVERSE" then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE";
                elseif v4 == "HYDRATION_CONTENT_TYPE_CREATOR" then
                    return "HYDRATION_CONTENT_TYPE_CREATOR";
                else
                    return nil;
                end;
            end
        }
    }).HydrationContentType
};