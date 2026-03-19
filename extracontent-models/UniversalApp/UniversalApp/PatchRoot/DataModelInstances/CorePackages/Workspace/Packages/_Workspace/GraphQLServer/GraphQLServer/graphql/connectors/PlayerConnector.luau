local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = require(l_Parent_0.Promise);
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local v7 = {};
local v8 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.new("thumbnails", 1), 
    path = "users/avatar-headshot", 
    query = {
        userIds = "{userIds}", 
        size = "48x48", 
        format = "Png", 
        isCircular = "true"
    }
});
v7.findAvatarHeadshotById = function(v9, v10) --[[ Line: 25 ]] --[[ Name: findAvatarHeadshotById ]]
    -- upvalues: l_fetch_0 (copy), v2 (copy), v8 (copy), l_GraphQLError_0 (copy)
    local v11 = v10 or l_fetch_0;
    return v2.new(function(v12, v13) --[[ Line: 28 ]]
        -- upvalues: v8 (ref), v9 (copy), v11 (copy), l_GraphQLError_0 (ref)
        local v14 = v8({
            userIds = v9
        });
        local v15 = v11(v14, {
            method = "GET"
        }):expect();
        if not v15.ok then
            v13(l_GraphQLError_0.new(string.format("Http error occurred while trying to fetch avatarHeadshot for user %s.", v9)));
            return;
        else
            local v16 = v15:json():catch(function() --[[ Line: 48 ]]
                return nil;
            end):expect();
            if not v16 then
                v13(l_GraphQLError_0.new(string.format("Failed to parse avatarHeadshot HttpResponse for user %s.", v9)));
                return;
            else
                v12(v16.data[1].imageUrl);
                return;
            end;
        end;
    end);
end;
return v7;