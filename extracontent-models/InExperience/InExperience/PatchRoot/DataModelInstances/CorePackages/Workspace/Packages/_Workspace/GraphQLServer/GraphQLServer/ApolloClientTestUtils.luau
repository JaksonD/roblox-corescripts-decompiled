local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local v2 = require(l_Parent_0.ApolloClient);
local l_ApolloClient_0 = v2.ApolloClient;
local l_HttpLink_0 = v2.HttpLink;
local l_InMemoryCache_0 = v2.InMemoryCache;
local l_typePolicies_0 = require(l_Parent_0.ApolloLocalState).typePolicies;
local v7 = require(script.Parent.Server);
local l_buildFetch_0 = require(l_Parent_0.Fetch).buildFetch;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local _ = require(script.ApolloClientTestUtilsTypes);
return {
    mockApolloClient = function(v11) --[[ Line: 53 ]] --[[ Name: mockApolloClient ]]
        -- upvalues: l_HttpService_0 (copy), v7 (copy), l_buildFetch_0 (copy), l_ApolloClient_0 (copy), l_InMemoryCache_0 (copy), l_typePolicies_0 (copy), l_HttpLink_0 (copy)
        local v17 = {
            RequestInternal = function(_, v13) --[[ Line: 25 ]] --[[ Name: RequestInternal ]]
                -- upvalues: v11 (copy), l_HttpService_0 (ref)
                return {
                    Start = function(_, v15) --[[ Line: 27 ]] --[[ Name: Start ]]
                        -- upvalues: v11 (ref), v13 (copy), l_HttpService_0 (ref)
                        local v16 = nil;
                        v16 = if v11.responseMap and v11.responseMap[v13.Url] then v11.responseMap[v13.Url] else v11.defaultResponse or {};
                        v15(true, {
                            Body = l_HttpService_0:JSONEncode(v16.Body), 
                            Success = v16.Success == nil or v16.Success, 
                            StatusCode = if v16.StatusCode then v16.StatusCode else 200, 
                            StatusMessage = if v16.StatusMessage then v16.StatusMessage else "OK", 
                            Headers = if v16.Headers then v16.Headers else {}
                        });
                        if v11.responseSpy then
                            v11.responseSpy(v13);
                        end;
                    end
                };
            end
        };
        local v18 = v7.new({
            mockResolvers = v11.mockResolvers, 
            fetchImpl = l_buildFetch_0(v17)
        });
        return (l_ApolloClient_0.new({
            cache = l_InMemoryCache_0.new({
                typePolicies = l_typePolicies_0
            }), 
            link = l_HttpLink_0.new({
                uri = "/api", 
                fetch = function(_, v20) --[[ Line: 65 ]] --[[ Name: fetch ]]
                    -- upvalues: v18 (copy)
                    return v18:fetchLocal(v20);
                end
            })
        }));
    end, 
    mockHttpService = function(v21) --[[ Line: 23 ]] --[[ Name: mockHttpService ]]
        -- upvalues: l_HttpService_0 (copy)
        return {
            RequestInternal = function(_, v23) --[[ Line: 25 ]] --[[ Name: RequestInternal ]]
                -- upvalues: v21 (copy), l_HttpService_0 (ref)
                return {
                    Start = function(_, v25) --[[ Line: 27 ]] --[[ Name: Start ]]
                        -- upvalues: v21 (ref), v23 (copy), l_HttpService_0 (ref)
                        local v26 = nil;
                        v26 = if v21.responseMap and v21.responseMap[v23.Url] then v21.responseMap[v23.Url] else v21.defaultResponse or {};
                        v25(true, {
                            Body = l_HttpService_0:JSONEncode(v26.Body), 
                            Success = v26.Success == nil or v26.Success, 
                            StatusCode = if v26.StatusCode then v26.StatusCode else 200, 
                            StatusMessage = if v26.StatusMessage then v26.StatusMessage else "OK", 
                            Headers = if v26.Headers then v26.Headers else {}
                        });
                        if v21.responseSpy then
                            v21.responseSpy(v23);
                        end;
                    end
                };
            end
        };
    end, 
    appendApolloClientToReducer = function(v27, v28) --[[ Line: 74 ]] --[[ Name: appendApolloClientToReducer ]]
        -- upvalues: l_Object_0 (copy)
        return function(v29, v30) --[[ Line: 75 ]]
            -- upvalues: v27 (copy), l_Object_0 (ref), v28 (copy)
            v29 = v27(v29 or {}, v30);
            return (l_Object_0.assign(table.clone(v29), {
                ApolloClient = {
                    apolloClient = v28
                }
            }));
        end;
    end
};