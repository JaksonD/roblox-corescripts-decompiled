local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local v6 = require(l_Parent_0.luaUtils.encodeURIComponent);
local v7 = {};
local l_serializeFetchParameter_0 = require(script.Parent.serializeFetchParameter).serializeFetchParameter;
local _ = require(script.Parent.selectHttpOptionsAndBody);
v7.rewriteURIForGET = function(v10, v11) --[[ Line: 29 ]] --[[ Name: rewriteURIForGET ]]
    -- upvalues: v6 (copy), l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_serializeFetchParameter_0 (copy)
    local v12 = {};
    local function _(v13, v14) --[[ Line: 39 ]] --[[ Name: addQueryParam ]]
        -- upvalues: v12 (copy), v6 (ref)
        table.insert(v12, ("%s=%s"):format(v13, v6(v14)));
    end;
    if l_Array_0.indexOf(l_Object_0.keys(v11), "query") ~= -1 then
        local l_query_0 = v11.query;
        table.insert(v12, ("%s=%s"):format("query", v6(l_query_0)));
    end;
    if l_Boolean_0.toJSBoolean(v11.operationName) then
        local l_operationName_0 = v11.operationName;
        table.insert(v12, ("%s=%s"):format("operationName", v6(l_operationName_0)));
    end;
    if l_Boolean_0.toJSBoolean(v11.variables) then
        local v18 = nil;
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 51 ]]
            -- upvalues: v18 (ref), l_serializeFetchParameter_0 (ref), v11 (copy)
            v18 = l_serializeFetchParameter_0(v11.variables, "Variables map", true);
        end);
        if not l_status_0 then
            return {
                parseError = l_result_0
            };
        else
            table.insert(v12, ("%s=%s"):format("variables", v6(v18)));
            --[[ close >= 4 ]]
        end;
    end;
    if l_Boolean_0.toJSBoolean(v11.extensions) then
        local v21 = nil;
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 62 ]]
            -- upvalues: v21 (ref), l_serializeFetchParameter_0 (ref), v11 (copy)
            v21 = l_serializeFetchParameter_0(v11.extensions, "Extensions map");
        end);
        if not l_status_1 then
            return {
                parseError = l_result_1
            };
        else
            table.insert(v12, ("%s=%s"):format("extensions", v6(v21)));
            --[[ close >= 4 ]]
        end;
    end;
    local v24 = "";
    local l_v10_0 = v10;
    local v26 = string.find(v10, "#");
    if v26 ~= nil then
        v24 = string.sub(v10, v26);
        l_v10_0 = string.sub(v10, 1, v26 - 1);
    end;
    return {
        newURI = l_v10_0 .. (string.find(l_v10_0, "?") == nil and "?" or "&") .. l_Array_0.join(v12, "&") .. v24
    };
end;
return v7;