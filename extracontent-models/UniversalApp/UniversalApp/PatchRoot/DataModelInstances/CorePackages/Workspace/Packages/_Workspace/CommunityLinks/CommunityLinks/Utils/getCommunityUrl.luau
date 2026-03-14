local l_Parent_0 = script:FindFirstAncestor("CommunityLinks").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local v3 = game:DefineFastFlag("LuaAppEnableCommunityLinksRedirect", false);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v3 (copy), l_UrlBuilder_0 (copy), l_Url_0 (copy)
    local _ = nil;
    if v3 then
        return (l_UrlBuilder_0.new({
            base = l_Url_0.APIS_URL, 
            path = "community-links/v1/guilded/{communityId}/join", 
            query = {
                a = "red"
            }
        })({
            communityId = v4
        }));
    else
        return "https://guilded.gg/teams/" .. v4 .. "?a=red";
    end;
end;