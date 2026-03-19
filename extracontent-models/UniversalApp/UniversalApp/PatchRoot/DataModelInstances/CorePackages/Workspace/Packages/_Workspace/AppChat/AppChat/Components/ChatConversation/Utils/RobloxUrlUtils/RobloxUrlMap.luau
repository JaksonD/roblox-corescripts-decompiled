local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_Regex_0 = require(l_Parent_0.UrlMatching).Regex;
return {
    ["/games"] = {
        pathParams = {
            {
                name = "path", 
                pattern = "games"
            }, 
            {
                name = "id", 
                pattern = "[0-9]+"
            }, 
            {
                name = "name", 
                pattern = "[a-zA-Z0-9_-]+", 
                optional = true
            }
        }, 
        paramCallback = function(v2) --[[ Line: 10 ]] --[[ Name: createGameLinkMessage ]]
            return {
                placeId = v2.id
            };
        end
    }, 
    ["/share"] = {
        queryParams = {
            {
                name = "code", 
                pattern = "[a-fA-F0-9]+"
            }, 
            {
                name = "type", 
                pattern = l_Regex_0.oneOf({
                    "ExperienceDetails"
                })
            }
        }, 
        paramCallback = function(v3) --[[ Line: 16 ]] --[[ Name: createShareLinkMessage ]]
            return {
                shareLink = {
                    linkId = v3.code, 
                    linkType = v3.type
                }
            };
        end
    }
};