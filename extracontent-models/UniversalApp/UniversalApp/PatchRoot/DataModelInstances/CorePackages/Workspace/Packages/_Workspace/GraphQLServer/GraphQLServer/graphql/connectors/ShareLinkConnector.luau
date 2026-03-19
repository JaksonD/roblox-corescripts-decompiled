local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v3 = require(l_Parent_0.UrlBuilder);
local v4 = require(l_Parent_0.Promise);
local v5 = require(l_Parent_0.Fetch);
local l_UrlBuilder_0 = v3.UrlBuilder;
local l_UrlBase_0 = v3.UrlBase;
local l_GraphQLError_0 = require(l_Parent_0.GraphQL).GraphQLError;
local l_fetch_0 = v5.fetch;
local l_Response_0 = v5.Response;
local _ = require(script.Parent.Parent.generatedTypes);
local v12 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.APIS, 
    path = "sharelinks/v1/get-or-create-link"
})();
return {
    fetchShareLink = function(v13, v14) --[[ Line: 40 ]] --[[ Name: fetchShareLink ]]
        -- upvalues: l_fetch_0 (copy), l_HttpService_0 (copy), v4 (copy), v12 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
        local v15 = v14 or l_fetch_0;
        local v16 = l_HttpService_0:JSONEncode(v13.data);
        local v17 = l_HttpService_0:JSONEncode({
            linkType = v13.linkType, 
            data = v16
        });
        return v4.new(function(v18, v19) --[[ Line: 50 ]]
            -- upvalues: v15 (copy), v12 (ref), v17 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
            local v22 = v15(v12, {
                body = v17, 
                method = "POST", 
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json"
                }
            }):catch(function(v20) --[[ Line: 59 ]]
                -- upvalues: l_Response_0 (ref)
                local v21 = l_Response_0.error();
                v21.statusText = v20.message;
                return v21;
            end):expect();
            if not v22.ok then
                print(v22.statusText .. " " .. v22.status);
                v19(l_GraphQLError_0.new(v22.statusText, nil, nil, nil, nil, {
                    extensions = {
                        status = v22.status, 
                        statusText = v22.statusText
                    }
                }));
                return;
            else
                local v23 = v22:json():catch(function() --[[ Line: 83 ]]
                    return nil;
                end):expect();
                if not v22 then
                    v19(l_GraphQLError_0.new((("Failed to decode HTTP response as JSON for share link matching type: %*"):format(type))));
                    return;
                else
                    v18(v23);
                    return;
                end;
            end;
        end);
    end
};