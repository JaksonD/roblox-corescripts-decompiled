local l_Players_0 = game:GetService("Players");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_Parent_0.UrlBuilder).UrlBase;
local _ = require(script.Parent.Parent.generatedTypes);
local v6 = require(l_Parent_0.Promise);
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_fetch_0 = require(l_Parent_0.Fetch).fetch;
local l_Response_0 = require(l_Parent_0.Fetch).Response;
local v10 = {};
local v11 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.new("users", 1), 
    path = "users/{id}"
});
local function v20(v12, v13) --[[ Line: 23 ]] --[[ Name: findUserById ]]
    -- upvalues: l_fetch_0 (copy), v6 (copy), v11 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v14 = v13 or l_fetch_0;
    return v6.new(function(v15, v16) --[[ Line: 25 ]]
        -- upvalues: v11 (ref), v12 (copy), v14 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v17 = v11({
            id = v12
        });
        local v18 = v14(v17, {
            method = "GET"
        }):catch(function() --[[ Line: 33 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v18.ok then
            v16(l_GraphQLError_0.new(string.format("Failed to find user matching id: %s.", v12)));
            return;
        else
            local v19 = v18:json():catch(function() --[[ Line: 45 ]]
                return nil;
            end):expect();
            if not v19 then
                v16(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for user matching id: %s.", v12)));
                return;
            else
                v15({
                    id = tostring(v19.id), 
                    displayName = v19.displayName
                });
                return;
            end;
        end;
    end);
end;
v10.findUserById = v20;
v10.findMe = function(v21, v22) --[[ Line: 66 ]] --[[ Name: findMe ]]
    -- upvalues: l_Players_0 (copy), v6 (copy), l_GraphQLError_0 (copy), v20 (copy)
    local v23 = v22 or l_Players_0.LocalPlayer;
    if not v23 then
        return v6.reject(l_GraphQLError_0.new("LocalPlayer not found"));
    else
        local l_UserId_0 = v23.UserId;
        return v20(tostring(l_UserId_0), v21);
    end;
end;
return v10;