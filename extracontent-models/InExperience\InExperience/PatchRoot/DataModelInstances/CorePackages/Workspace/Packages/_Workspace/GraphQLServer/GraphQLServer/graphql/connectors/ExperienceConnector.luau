local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v3 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local v5 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBase;
local v10 = {};
local v11 = l_UrlBuilder_0.fromString("games:games?universeIds={universeIds}");
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.new("games", 2), 
    path = "games/{universeId}/media"
});
v10.findExperienceDetailsByUniverseId = function(v13, v14) --[[ Line: 27 ]] --[[ Name: findExperienceDetailsByUniverseId ]]
    -- upvalues: l_fetch_0 (copy), v3 (copy), v11 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v15 = v14 or l_fetch_0;
    return v3.new(function(v16, v17) --[[ Line: 30 ]]
        -- upvalues: v11 (ref), v13 (copy), v15 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v18 = v11({
            universeIds = v13
        });
        local v19 = v15(v18, {
            method = "GET"
        }):catch(function() --[[ Line: 33 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v19.ok then
            v17(l_GraphQLError_0.new(string.format("Failed to find experience for universeId: %s.", v13)));
            return;
        else
            local v20 = v19:json():catch(function() --[[ Line: 44 ]]
                return nil;
            end):expect();
            if not v20 then
                v17(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for experience with universeId: %s.", v13)));
                return;
            else
                v16(v20.data[1]);
                return;
            end;
        end;
    end);
end;
v10.findExperienceMediaByUniverseId = function(v21, v22) --[[ Line: 67 ]] --[[ Name: findExperienceMediaByUniverseId ]]
    -- upvalues: l_fetch_0 (copy), v3 (copy), v12 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v23 = v22 or l_fetch_0;
    return v3.new(function(v24, v25) --[[ Line: 70 ]]
        -- upvalues: v12 (ref), v21 (copy), v23 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v26 = v12({
            universeId = v21
        });
        local v27 = v23(v26, {
            method = "GET"
        }):catch(function() --[[ Line: 73 ]]
            -- upvalues: l_Response_0 (ref)
            return l_Response_0.error();
        end):expect();
        if not v27.ok then
            v25(l_GraphQLError_0.new(string.format("Failed to find experience media for universeId: %s.", v21)));
            return;
        else
            local v28 = v27:json():catch(function() --[[ Line: 84 ]]
                return nil;
            end):expect();
            if not v28 then
                v25(l_GraphQLError_0.new(string.format("Failed to decode HTTP response as JSON for experience media for universeId: %s.", v21)));
                return;
            else
                v24(v28.data);
                return;
            end;
        end;
    end);
end;
return v10;