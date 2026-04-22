local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto);
local _ = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry);
return {
    HydrationContentType = ({
        HydrationContentType = {
            fromNumber = function(v2) --[[ Line: 40 ]] --[[ Name: fromNumber ]]
                if v2 == 0 then
                    return "HYDRATION_CONTENT_TYPE_INVALID";
                elseif v2 == 1 then
                    return "HYDRATION_CONTENT_TYPE_BADGE";
                elseif v2 == 2 then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE";
                elseif v2 == 3 then
                    return "HYDRATION_CONTENT_TYPE_CREATOR";
                elseif v2 == 4 then
                    return "HYDRATION_CONTENT_TYPE_EVENT";
                elseif v2 == 5 then
                    return "HYDRATION_CONTENT_TYPE_SONG";
                elseif v2 == 6 then
                    return "HYDRATION_CONTENT_TYPE_GAME_PASS";
                elseif v2 == 7 then
                    return "HYDRATION_CONTENT_TYPE_MEDIA_ASSET";
                elseif v2 == 8 then
                    return "HYDRATION_CONTENT_TYPE_SOCIAL_LINK";
                elseif v2 == 9 then
                    return "HYDRATION_CONTENT_TYPE_GAME_DEVELOPER_PRODUCT";
                elseif v2 == 10 then
                    return "HYDRATION_CONTENT_TYPE_GAME_SUBSCRIPTION";
                elseif v2 == 11 then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_ASSET";
                elseif v2 == 12 then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_BUNDLE";
                elseif v2 == 13 then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_LOOK";
                elseif v2 == 14 then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_CATEGORY";
                elseif v2 == 15 then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_SORT";
                elseif v2 == 16 then
                    return "HYDRATION_CONTENT_TYPE_AGE_RECOMMENDATION";
                elseif v2 == 17 then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FOLLOW";
                elseif v2 == 18 then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_VOTE";
                elseif v2 == 19 then
                    return "HYDRATION_CONTENT_TYPE_USER";
                elseif v2 == 20 then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FAVORITE";
                else
                    return nil;
                end;
            end, 
            toNumber = function(v3) --[[ Line: 88 ]] --[[ Name: toNumber ]]
                if v3 == "HYDRATION_CONTENT_TYPE_INVALID" then
                    return 0;
                elseif v3 == "HYDRATION_CONTENT_TYPE_BADGE" then
                    return 1;
                elseif v3 == "HYDRATION_CONTENT_TYPE_UNIVERSE" then
                    return 2;
                elseif v3 == "HYDRATION_CONTENT_TYPE_CREATOR" then
                    return 3;
                elseif v3 == "HYDRATION_CONTENT_TYPE_EVENT" then
                    return 4;
                elseif v3 == "HYDRATION_CONTENT_TYPE_SONG" then
                    return 5;
                elseif v3 == "HYDRATION_CONTENT_TYPE_GAME_PASS" then
                    return 6;
                elseif v3 == "HYDRATION_CONTENT_TYPE_MEDIA_ASSET" then
                    return 7;
                elseif v3 == "HYDRATION_CONTENT_TYPE_SOCIAL_LINK" then
                    return 8;
                elseif v3 == "HYDRATION_CONTENT_TYPE_GAME_DEVELOPER_PRODUCT" then
                    return 9;
                elseif v3 == "HYDRATION_CONTENT_TYPE_GAME_SUBSCRIPTION" then
                    return 10;
                elseif v3 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_ASSET" then
                    return 11;
                elseif v3 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_BUNDLE" then
                    return 12;
                elseif v3 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_LOOK" then
                    return 13;
                elseif v3 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_CATEGORY" then
                    return 14;
                elseif v3 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_SORT" then
                    return 15;
                elseif v3 == "HYDRATION_CONTENT_TYPE_AGE_RECOMMENDATION" then
                    return 16;
                elseif v3 == "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FOLLOW" then
                    return 17;
                elseif v3 == "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_VOTE" then
                    return 18;
                elseif v3 == "HYDRATION_CONTENT_TYPE_USER" then
                    return 19;
                elseif v3 == "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FAVORITE" then
                    return 20;
                else
                    return v3;
                end;
            end, 
            fromName = function(v4) --[[ Line: 136 ]] --[[ Name: fromName ]]
                if v4 == "HYDRATION_CONTENT_TYPE_INVALID" then
                    return "HYDRATION_CONTENT_TYPE_INVALID";
                elseif v4 == "HYDRATION_CONTENT_TYPE_BADGE" then
                    return "HYDRATION_CONTENT_TYPE_BADGE";
                elseif v4 == "HYDRATION_CONTENT_TYPE_UNIVERSE" then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE";
                elseif v4 == "HYDRATION_CONTENT_TYPE_CREATOR" then
                    return "HYDRATION_CONTENT_TYPE_CREATOR";
                elseif v4 == "HYDRATION_CONTENT_TYPE_EVENT" then
                    return "HYDRATION_CONTENT_TYPE_EVENT";
                elseif v4 == "HYDRATION_CONTENT_TYPE_SONG" then
                    return "HYDRATION_CONTENT_TYPE_SONG";
                elseif v4 == "HYDRATION_CONTENT_TYPE_GAME_PASS" then
                    return "HYDRATION_CONTENT_TYPE_GAME_PASS";
                elseif v4 == "HYDRATION_CONTENT_TYPE_MEDIA_ASSET" then
                    return "HYDRATION_CONTENT_TYPE_MEDIA_ASSET";
                elseif v4 == "HYDRATION_CONTENT_TYPE_SOCIAL_LINK" then
                    return "HYDRATION_CONTENT_TYPE_SOCIAL_LINK";
                elseif v4 == "HYDRATION_CONTENT_TYPE_GAME_DEVELOPER_PRODUCT" then
                    return "HYDRATION_CONTENT_TYPE_GAME_DEVELOPER_PRODUCT";
                elseif v4 == "HYDRATION_CONTENT_TYPE_GAME_SUBSCRIPTION" then
                    return "HYDRATION_CONTENT_TYPE_GAME_SUBSCRIPTION";
                elseif v4 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_ASSET" then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_ASSET";
                elseif v4 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_BUNDLE" then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_BUNDLE";
                elseif v4 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_LOOK" then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_LOOK";
                elseif v4 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_CATEGORY" then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_CATEGORY";
                elseif v4 == "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_SORT" then
                    return "HYDRATION_CONTENT_TYPE_MARKETPLACE_CATALOG_SORT";
                elseif v4 == "HYDRATION_CONTENT_TYPE_AGE_RECOMMENDATION" then
                    return "HYDRATION_CONTENT_TYPE_AGE_RECOMMENDATION";
                elseif v4 == "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FOLLOW" then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FOLLOW";
                elseif v4 == "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_VOTE" then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_VOTE";
                elseif v4 == "HYDRATION_CONTENT_TYPE_USER" then
                    return "HYDRATION_CONTENT_TYPE_USER";
                elseif v4 == "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FAVORITE" then
                    return "HYDRATION_CONTENT_TYPE_UNIVERSE_USER_FAVORITE";
                else
                    return nil;
                end;
            end
        }
    }).HydrationContentType
};