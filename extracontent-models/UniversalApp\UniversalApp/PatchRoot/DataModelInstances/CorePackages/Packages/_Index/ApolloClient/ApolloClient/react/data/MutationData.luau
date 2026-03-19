local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v3.Boolean;
local l_Object_0 = v3.Object;
local v6 = require(l_Parent_0.jsutils.equal);
local l_DocumentType_0 = require(script.Parent.Parent.parser).DocumentType;
local l_ApolloError_0 = require(l_Parent_0.errors).ApolloError;
local _ = require(script.Parent.Parent.types.types);
local l_OperationData_0 = require(script.Parent.OperationData).OperationData;
local l_mergeOptions_0 = require(l_Parent_0.core).mergeOptions;
local _ = require(l_Parent_0.link.core);
local v13 = setmetatable({}, {
    __index = l_OperationData_0
});
v13.__index = v13;
v13.new = function(v14) --[[ Line: 83 ]] --[[ Name: new ]]
    -- upvalues: l_OperationData_0 (copy), l_Boolean_0 (copy), l_DocumentType_0 (copy), v13 (copy)
    local v15 = l_OperationData_0.new(v14.options, v14.context);
    v15.runMutation = function(v16) --[[ Line: 92 ]]
        -- upvalues: v15 (copy), l_Boolean_0 (ref)
        if v16 == nil then
            v16 = {};
        end;
        v15:onMutationStart();
        local v17 = v15:generateNewMutationId();
        return v15:mutate(v16):andThen(function(v18) --[[ Line: 100 ]]
            -- upvalues: v15 (ref), v17 (copy)
            v15:onMutationCompleted(v18, v17);
            return v18;
        end):catch(function(v19) --[[ Line: 104 ]]
            -- upvalues: v15 (ref), v17 (copy), l_Boolean_0 (ref)
            local v20 = v15:getOptions();
            local l_onError_0 = v20.onError;
            v15:onMutationError(v19, v17);
            if l_Boolean_0.toJSBoolean(l_onError_0) then
                l_onError_0(v20, v19);
                return {
                    data = nil, 
                    errors = v19
                };
            else
                error(v19);
                return;
            end;
        end);
    end;
    v15:verifyDocumentType(v14.options.mutation, l_DocumentType_0.Mutation);
    v15.result = v14.result;
    v15.setResult = v14.setResult;
    v15.mostRecentMutationId = 0;
    return (setmetatable(v15, v13));
end;
v13.execute = function(v22, v23) --[[ Line: 127 ]] --[[ Name: execute ]]
    -- upvalues: l_DocumentType_0 (copy), l_Object_0 (copy)
    v22.isMounted = true;
    v22:verifyDocumentType(v22:getOptions().mutation, l_DocumentType_0.Mutation);
    return {
        v22.runMutation, 
        l_Object_0.assign({}, v23, {
            client = v22:refreshClient().client
        })
    };
end;
v13.afterExecute = function(v24) --[[ Line: 133 ]] --[[ Name: afterExecute ]]
    v24.isMounted = true;
    return function(...) --[[ Line: 135 ]]
        -- upvalues: v24 (copy)
        return v24:unmount(...);
    end;
end;
v13.cleanup = function(_) --[[ Line: 140 ]] --[[ Name: cleanup ]]

end;
v13.mutate = function(v26, v27) --[[ Line: 144 ]] --[[ Name: mutate ]]
    -- upvalues: l_mergeOptions_0 (copy)
    return v26:refreshClient().client:mutate(l_mergeOptions_0(v26:getOptions(), v27));
end;
v13.onMutationStart = function(v28) --[[ Line: 148 ]] --[[ Name: onMutationStart ]]
    if not v28.result.loading and not v28:getOptions().ignoreResults then
        v28:updateResult({
            loading = true, 
            error = nil, 
            data = nil, 
            called = true
        });
    end;
end;
v13.onMutationCompleted = function(v29, v30, v31) --[[ Line: 160 ]] --[[ Name: onMutationCompleted ]]
    -- upvalues: l_ApolloError_0 (copy), l_Boolean_0 (copy)
    local v32 = v29:getOptions();
    local l_onCompleted_0 = v32.onCompleted;
    local l_ignoreResults_0 = v32.ignoreResults;
    local l_data_0 = v30.data;
    local l_errors_0 = v30.errors;
    local v37 = if l_errors_0 and #l_errors_0 > 0 then l_ApolloError_0.new({
        graphQLErrors = l_errors_0
    }) else nil;
    local function _() --[[ Line: 172 ]] --[[ Name: callOncomplete ]]
        -- upvalues: l_Boolean_0 (ref), l_onCompleted_0 (copy), l_data_0 (copy)
        if l_Boolean_0.toJSBoolean(l_onCompleted_0) then
            return l_onCompleted_0(l_data_0);
        else
            return nil;
        end;
    end;
    if v29:isMostRecentMutation(v31) and not l_ignoreResults_0 then
        v29:updateResult({
            called = true, 
            loading = false, 
            data = l_data_0, 
            error = v37
        });
    end;
    if l_Boolean_0.toJSBoolean(l_onCompleted_0) then
        local _ = l_onCompleted_0(l_data_0);
        return;
    else
        return;
    end;
end;
v13.onMutationError = function(v40, v41, v42) --[[ Line: 191 ]] --[[ Name: onMutationError ]]
    if v40:isMostRecentMutation(v42) then
        v40:updateResult({
            loading = false, 
            error = v41, 
            data = nil, 
            called = true
        });
    end;
end;
v13.generateNewMutationId = function(v43) --[[ Line: 202 ]] --[[ Name: generateNewMutationId ]]
    v43.mostRecentMutationId = v43.mostRecentMutationId + 1;
    return v43.mostRecentMutationId;
end;
v13.isMostRecentMutation = function(v44, v45) --[[ Line: 207 ]] --[[ Name: isMostRecentMutation ]]
    return v44.mostRecentMutationId == v45;
end;
v13.updateResult = function(v46, v47) --[[ Line: 211 ]] --[[ Name: updateResult ]]
    -- upvalues: v6 (copy)
    if v46.isMounted and (not v46.previousResult or not v6(v46.previousResult, v47)) then
        v46:setResult(v47);
        v46.previousResult = v47;
        return v47;
    else
        return nil;
    end;
end;
v0.MutationData = v13;
return v0;