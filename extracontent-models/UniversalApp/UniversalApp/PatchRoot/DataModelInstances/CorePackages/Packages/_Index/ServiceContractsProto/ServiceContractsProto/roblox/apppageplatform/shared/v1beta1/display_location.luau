local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
return {
    DisplayLocation = ({
        DisplayLocation = {
            fromNumber = function(v2) --[[ Line: 31 ]] --[[ Name: fromNumber ]]
                if v2 == 0 then
                    return "DISPLAY_LOCATION_INVALID";
                elseif v2 == 1 then
                    return "DISPLAY_LOCATION_GLOBAL";
                elseif v2 == 2 then
                    return "DISPLAY_LOCATION_BADGE_SEE_ALL";
                elseif v2 == 3 then
                    return "DISPLAY_LOCATION_BADGE_DETAILS";
                elseif v2 == 4 then
                    return "DISPLAY_LOCATION_PROMPTS";
                elseif v2 == 5 then
                    return "DISPLAY_LOCATION_EXPERIENCE_DETAILS";
                elseif v2 == 6 then
                    return "DISPLAY_LOCATION_DEV_STORE_SEE_ALL";
                elseif v2 == 7 then
                    return "DISPLAY_LOCATION_CHARTS";
                elseif v2 == 8 then
                    return "DISPLAY_LOCATION_EVENT_DETAILS";
                elseif v2 == 9 then
                    return "DISPLAY_LOCATION_MARKETPLACE_LANDING";
                elseif v2 == 10 then
                    return "DISPLAY_LOCATION_SEARCH_RESULTS";
                elseif v2 == 11 then
                    return "DISPLAY_LOCATION_SEARCH_LANDING";
                else
                    return nil;
                end;
            end, 
            toNumber = function(v3) --[[ Line: 61 ]] --[[ Name: toNumber ]]
                if v3 == "DISPLAY_LOCATION_INVALID" then
                    return 0;
                elseif v3 == "DISPLAY_LOCATION_GLOBAL" then
                    return 1;
                elseif v3 == "DISPLAY_LOCATION_BADGE_SEE_ALL" then
                    return 2;
                elseif v3 == "DISPLAY_LOCATION_BADGE_DETAILS" then
                    return 3;
                elseif v3 == "DISPLAY_LOCATION_PROMPTS" then
                    return 4;
                elseif v3 == "DISPLAY_LOCATION_EXPERIENCE_DETAILS" then
                    return 5;
                elseif v3 == "DISPLAY_LOCATION_DEV_STORE_SEE_ALL" then
                    return 6;
                elseif v3 == "DISPLAY_LOCATION_CHARTS" then
                    return 7;
                elseif v3 == "DISPLAY_LOCATION_EVENT_DETAILS" then
                    return 8;
                elseif v3 == "DISPLAY_LOCATION_MARKETPLACE_LANDING" then
                    return 9;
                elseif v3 == "DISPLAY_LOCATION_SEARCH_RESULTS" then
                    return 10;
                elseif v3 == "DISPLAY_LOCATION_SEARCH_LANDING" then
                    return 11;
                else
                    return v3;
                end;
            end, 
            fromName = function(v4) --[[ Line: 91 ]] --[[ Name: fromName ]]
                if v4 == "DISPLAY_LOCATION_INVALID" then
                    return "DISPLAY_LOCATION_INVALID";
                elseif v4 == "DISPLAY_LOCATION_GLOBAL" then
                    return "DISPLAY_LOCATION_GLOBAL";
                elseif v4 == "DISPLAY_LOCATION_BADGE_SEE_ALL" then
                    return "DISPLAY_LOCATION_BADGE_SEE_ALL";
                elseif v4 == "DISPLAY_LOCATION_BADGE_DETAILS" then
                    return "DISPLAY_LOCATION_BADGE_DETAILS";
                elseif v4 == "DISPLAY_LOCATION_PROMPTS" then
                    return "DISPLAY_LOCATION_PROMPTS";
                elseif v4 == "DISPLAY_LOCATION_EXPERIENCE_DETAILS" then
                    return "DISPLAY_LOCATION_EXPERIENCE_DETAILS";
                elseif v4 == "DISPLAY_LOCATION_DEV_STORE_SEE_ALL" then
                    return "DISPLAY_LOCATION_DEV_STORE_SEE_ALL";
                elseif v4 == "DISPLAY_LOCATION_CHARTS" then
                    return "DISPLAY_LOCATION_CHARTS";
                elseif v4 == "DISPLAY_LOCATION_EVENT_DETAILS" then
                    return "DISPLAY_LOCATION_EVENT_DETAILS";
                elseif v4 == "DISPLAY_LOCATION_MARKETPLACE_LANDING" then
                    return "DISPLAY_LOCATION_MARKETPLACE_LANDING";
                elseif v4 == "DISPLAY_LOCATION_SEARCH_RESULTS" then
                    return "DISPLAY_LOCATION_SEARCH_RESULTS";
                elseif v4 == "DISPLAY_LOCATION_SEARCH_LANDING" then
                    return "DISPLAY_LOCATION_SEARCH_LANDING";
                else
                    return nil;
                end;
            end
        }
    }).DisplayLocation
};