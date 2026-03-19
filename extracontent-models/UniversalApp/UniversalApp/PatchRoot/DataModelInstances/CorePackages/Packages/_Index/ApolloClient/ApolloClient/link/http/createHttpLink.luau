local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Object_0 = v1.Object;
local l_Set_0 = v1.Set;
local v6 = {};
local l_visit_0 = require(l_Parent_0.GraphQL).visit;
local l_ApolloLink_0 = require(script.Parent.Parent.core).ApolloLink;
local l_Observable_0 = require(script.Parent.Parent.Parent.utilities).Observable;
local l_serializeFetchParameter_0 = require(script.Parent.serializeFetchParameter).serializeFetchParameter;
local l_selectURI_0 = require(script.Parent.selectURI).selectURI;
local l_parseAndCheckHttpResponse_0 = require(script.Parent.parseAndCheckHttpResponse).parseAndCheckHttpResponse;
local l_checkFetcher_0 = require(script.Parent.checkFetcher).checkFetcher;
local v14 = require(script.Parent.selectHttpOptionsAndBody);
local l_selectHttpOptionsAndBody_0 = v14.selectHttpOptionsAndBody;
local l_fallbackHttpConfig_0 = v14.fallbackHttpConfig;
local l_createSignalIfSupported_0 = require(script.Parent.createSignalIfSupported).createSignalIfSupported;
local l_rewriteURIForGET_0 = require(script.Parent.rewriteURIForGET).rewriteURIForGET;
local l_fromError_0 = require(script.Parent.Parent.utils).fromError;
v6.createHttpLink = function(v20) --[[ Line: 41 ]] --[[ Name: createHttpLink ]]
    -- upvalues: l_Object_0 (copy), l_checkFetcher_0 (copy), l_Boolean_0 (copy), l_ApolloLink_0 (copy), l_selectURI_0 (copy), l_selectHttpOptionsAndBody_0 (copy), l_fallbackHttpConfig_0 (copy), l_Set_0 (copy), l_visit_0 (copy), l_createSignalIfSupported_0 (copy), l_Array_0 (copy), l_rewriteURIForGET_0 (copy), l_fromError_0 (copy), l_serializeFetchParameter_0 (copy), l_Observable_0 (copy), l_parseAndCheckHttpResponse_0 (copy)
    local l_v20_0 = v20;
    if l_v20_0 == nil then
        l_v20_0 = {};
    end;
    local v22 = l_v20_0.uri ~= nil and l_v20_0.uri or "/graphql";
    local l_fetch_0 = l_v20_0.fetch;
    local l_includeExtensions_0 = l_v20_0.includeExtensions;
    local l_useGETForQueries_0 = l_v20_0.useGETForQueries;
    local v26 = l_v20_0.includeUnusedVariables ~= nil and (l_v20_0.includeUnusedVariables or false);
    local v27 = l_Object_0.assign({}, l_v20_0, {
        uri = l_Object_0.None, 
        fetch = l_Object_0.None, 
        includeExtensions = l_Object_0.None, 
        useGETForQueries = l_Object_0.None, 
        includeUnusedVariables = l_Object_0.None
    });
    l_checkFetcher_0(l_fetch_0);
    if not l_Boolean_0.toJSBoolean(l_fetch_0) then
        l_fetch_0 = _G.fetch;
    end;
    local v28 = {
        http = {
            includeExtensions = l_includeExtensions_0
        }, 
        options = v27.fetchOptions, 
        credentials = v27.credentials, 
        headers = v27.headers
    };
    return l_ApolloLink_0.new(function(_, v30) --[[ Line: 78 ]]
        -- upvalues: l_selectURI_0 (ref), v22 (copy), l_Boolean_0 (ref), l_Object_0 (ref), l_selectHttpOptionsAndBody_0 (ref), l_fallbackHttpConfig_0 (ref), v28 (copy), v26 (copy), l_Set_0 (ref), l_visit_0 (ref), l_createSignalIfSupported_0 (ref), l_useGETForQueries_0 (copy), l_Array_0 (ref), l_rewriteURIForGET_0 (ref), l_fromError_0 (ref), l_serializeFetchParameter_0 (ref), l_Observable_0 (ref), l_fetch_0 (ref), l_parseAndCheckHttpResponse_0 (ref)
        local v31 = l_selectURI_0(v30, v22);
        local v32 = v30:getContext();
        local v33 = {};
        if l_Boolean_0.toJSBoolean(v32.clientAwareness) then
            local l_name_0 = v32.clientAwareness.name;
            local l_version_0 = v32.clientAwareness.version;
            if l_Boolean_0.toJSBoolean(l_name_0) then
                v33["apollographql-client-name"] = l_name_0;
            end;
            if l_Boolean_0.toJSBoolean(l_version_0) then
                v33["apollographql-client-version"] = l_version_0;
            end;
        end;
        local v36 = l_Object_0.assign({}, v33, v32.headers);
        local v37 = {
            http = v32.http, 
            options = v32.fetchOptions, 
            credentials = v32.credentials, 
            headers = v36
        };
        local v38 = l_selectHttpOptionsAndBody_0(v30, l_fallbackHttpConfig_0, v28, v37);
        local l_options_0 = v38.options;
        local l_body_0 = v38.body;
        if l_body_0.variables ~= nil and not v26 then
            local v41 = l_Set_0.new(l_Object_0.keys(l_body_0.variables));
            local l_v41_0 = v41 --[[ copy: 10 -> 15 ]];
            l_visit_0(v30.query, {
                Variable = function(_, v44, _, v46) --[[ Line: 122 ]] --[[ Name: Variable ]]
                    -- upvalues: l_Boolean_0 (ref), l_v41_0 (copy)
                    if l_Boolean_0.toJSBoolean(v46) and v46.kind ~= "VariableDefinition" then
                        l_v41_0:delete(v44.name.value);
                    end;
                end
            });
            if l_Boolean_0.toJSBoolean(v41.size) then
                l_body_0.variables = l_Object_0.assign({}, l_body_0.variables);
                v41:forEach(function(v47) --[[ Line: 139 ]]
                    -- upvalues: l_body_0 (copy)
                    l_body_0.variables[v47] = nil;
                end);
            end;
        end;
        local v48 = nil;
        if not l_Boolean_0.toJSBoolean(l_options_0.signal) then
            local v49 = l_createSignalIfSupported_0();
            local l_controller_0 = v49.controller;
            local l_signal_0 = v49.signal;
            v48 = l_controller_0;
            if l_Boolean_0.toJSBoolean(v48) then
                l_options_0.signal = l_signal_0;
            end;
        end;
        local function v54(v52) --[[ Line: 156 ]] --[[ Name: definitionIsMutation ]]
            local v53 = false;
            if v52.kind == "OperationDefinition" then
                v53 = v52.operation == "mutation";
            end;
            return v53;
        end;
        if l_Boolean_0.toJSBoolean(l_useGETForQueries_0) and not l_Array_0.some(v30.query.definitions, v54) then
            l_options_0.method = "GET";
        end;
        if l_options_0.method == "GET" then
            local v55 = l_rewriteURIForGET_0(v31, l_body_0);
            local l_newURI_0 = v55.newURI;
            local l_parseError_0 = v55.parseError;
            if l_Boolean_0.toJSBoolean(l_parseError_0) then
                return l_fromError_0(l_parseError_0);
            else
                v31 = l_newURI_0;
            end;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 174 ]]
                -- upvalues: l_options_0 (copy), l_serializeFetchParameter_0 (ref), l_body_0 (copy)
                l_options_0.body = l_serializeFetchParameter_0(l_body_0, "Payload");
            end);
            if not l_status_0 then
                return l_fromError_0(l_result_0);
            end;
        end;
        return l_Observable_0.new(function(v60) --[[ Line: 181 ]]
            -- upvalues: l_fetch_0 (ref), v31 (ref), l_options_0 (copy), v30 (copy), l_parseAndCheckHttpResponse_0 (ref), l_Boolean_0 (ref), v48 (ref)
            l_fetch_0(v31, l_options_0):andThen(function(v61) --[[ Line: 183 ]]
                -- upvalues: v30 (ref)
                v30:setContext({
                    response = v61
                });
                return v61;
            end):andThen(l_parseAndCheckHttpResponse_0(v30)):andThen(function(v62) --[[ Line: 188 ]]
                -- upvalues: v60 (copy)
                v60:next(v62);
                v60:complete();
                return v62;
            end):catch(function(v63) --[[ Line: 194 ]]
                -- upvalues: l_Boolean_0 (ref), v60 (copy)
                if v63.name == "AbortError" then
                    return;
                else
                    if l_Boolean_0.toJSBoolean(v63.result) and l_Boolean_0.toJSBoolean(v63.result.errors) and l_Boolean_0.toJSBoolean(v63.result.data) then
                        v60:next(v63.result);
                    end;
                    v60:error(v63);
                    return;
                end;
            end);
            return function() --[[ Line: 241 ]]
                -- upvalues: l_Boolean_0 (ref), v48 (ref)
                if l_Boolean_0.toJSBoolean(v48) then
                    v48:abort();
                end;
            end;
        end);
    end);
end;
return v6;