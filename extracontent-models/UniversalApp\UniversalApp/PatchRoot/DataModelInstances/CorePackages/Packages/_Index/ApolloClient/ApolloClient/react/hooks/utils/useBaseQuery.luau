local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Promise);
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v4.Boolean;
local l_Object_0 = v4.Object;
local v7 = require(l_Parent_1.React);
local l_useContext_0 = v7.useContext;
local l_useEffect_0 = v7.useEffect;
local l_useReducer_0 = v7.useReducer;
local l_useRef_0 = v7.useRef;
local _ = require(l_Parent_1.GraphQL);
local _ = require(l_Parent_0.jsutils.typedDocumentNode);
local _ = require(script.Parent.Parent.Parent.types.types);
local l_QueryData_0 = require(script.Parent.Parent.Parent.data).QueryData;
local l_useDeepMemo_0 = require(script.Parent.useDeepMemo).useDeepMemo;
local _ = require(script.Parent.Parent.Parent.Parent.core);
local l_getApolloContext_0 = require(script.Parent.Parent.Parent.context).getApolloContext;
local l_useAfterFastRefresh_0 = require(script.Parent.useAfterFastRefresh).useAfterFastRefresh;
local v20 = {
    __value = "nil placeholder"
};
v0.useBaseQuery = function(v21, v22, v23) --[[ Line: 48 ]] --[[ Name: useBaseQuery ]]
    -- upvalues: l_useContext_0 (copy), l_getApolloContext_0 (copy), l_useReducer_0 (copy), l_Boolean_0 (copy), l_Object_0 (copy), l_useRef_0 (copy), l_QueryData_0 (copy), v3 (copy), l_useDeepMemo_0 (copy), l_useAfterFastRefresh_0 (copy), l_useEffect_0 (copy), v20 (copy)
    if v23 == nil then
        v23 = false;
    end;
    local v24 = l_useContext_0(l_getApolloContext_0());
    local v26, v27 = l_useReducer_0(function(v25) --[[ Line: 58 ]]
        return v25 + 1;
    end, 0);
    local v28 = l_Boolean_0.toJSBoolean(v22) and l_Object_0.assign({}, v22, {
        query = v21
    }) or {
        query = v21
    };
    local v29 = l_useRef_0(nil);
    local v30 = nil;
    v30 = v29.current or (function() --[[ Line: 66 ]]
        -- upvalues: v29 (copy), l_QueryData_0 (ref), v28 (copy), v24 (copy), l_Boolean_0 (ref), v30 (ref), v3 (ref), v27 (copy)
        v29.current = l_QueryData_0.new({
            options = v28, 
            context = v24, 
            onNewData = function(_) --[[ Line: 70 ]] --[[ Name: onNewData ]]
                -- upvalues: l_Boolean_0 (ref), v30 (ref), v3 (ref), v29 (ref), v27 (ref)
                if not l_Boolean_0.toJSBoolean(v30:ssrInitiated()) then
                    v3.delay(0):andThen(function() --[[ Line: 78 ]]
                        -- upvalues: v29 (ref), v27 (ref)
                        if v29.current ~= nil and v29.current.isMounted then
                            return v27(nil);
                        else
                            return;
                        end;
                    end);
                    return;
                else
                    v27(nil);
                    return;
                end;
            end
        });
        return v29.current;
    end)();
    v30:setOptions(v28);
    v30.context = v24;
    local v32 = {
        options = l_Object_0.assign({}, v28, {
            onError = l_Object_0.None, 
            onCompleted = l_Object_0.None
        }), 
        context = v24, 
        tick = v26
    };
    local v33 = l_useDeepMemo_0(function() --[[ Line: 114 ]]
        -- upvalues: v23 (ref), v30 (ref)
        if v23 then
            return v30:executeLazy();
        else
            return v30:execute();
        end;
    end, v32);
    local v34 = if v23 then v33[2] else v33;
    if _G.__DEV__ then
        l_useAfterFastRefresh_0(v27);
    end;
    l_useEffect_0(function() --[[ Line: 131 ]]
        -- upvalues: v30 (ref), v29 (copy)
        return function() --[[ Line: 132 ]]
            -- upvalues: v30 (ref), v29 (ref)
            v30:cleanup();
            v29.current = nil;
        end;
    end, {});
    l_useEffect_0(function() --[[ Line: 140 ]]
        -- upvalues: v30 (ref), v23 (ref)
        return v30:afterExecute({
            lazy = v23
        });
    end, {
        v34.loading ~= nil and v34.loading or v20, 
        v34.networkStatus ~= nil and v34.networkStatus or v20, 
        v34.error ~= nil and v34.error or v20, 
        v34.data ~= nil and v34.data or v20
    });
    return v33;
end;
return v0;