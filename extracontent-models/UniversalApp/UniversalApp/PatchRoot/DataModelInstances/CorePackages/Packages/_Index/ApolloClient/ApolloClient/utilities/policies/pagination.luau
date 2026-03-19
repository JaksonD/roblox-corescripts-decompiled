local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local function v10(v6, v7) --[[ Line: 21 ]] --[[ Name: __rest ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy)
    local v8 = {};
    l_Array_0.forEach(v7, function(v9) --[[ Line: 23 ]]
        -- upvalues: v8 (copy), l_Object_0 (ref)
        v8[v9] = l_Object_0.None;
    end);
    return l_Object_0.assign({}, v6, v8);
end;
local _ = require(script.Parent.Parent.Parent.cache.inmemory.policies_types);
local _ = require(script.Parent.Parent.graphql.storeUtils);
local l_mergeDeep_0 = require(script.Parent.Parent.common.mergeDeep).mergeDeep;
local v14 = nil;
local v15 = nil;
local v16 = nil;
v0.concatPagination = function(v17) --[[ Line: 47 ]] --[[ Name: concatPagination ]]
    -- upvalues: l_Array_0 (copy)
    if v17 == nil then
        v17 = false;
    end;
    return {
        keyArgs = v17, 
        merge = function(_, v19, v20) --[[ Line: 53 ]] --[[ Name: merge ]]
            -- upvalues: l_Array_0 (ref)
            if v19 then
                return (l_Array_0.concat(v19, v20));
            else
                return v20;
            end;
        end
    };
end;
v0.offsetLimitPagination = function(v21) --[[ Line: 65 ]] --[[ Name: offsetLimitPagination ]]
    -- upvalues: l_Array_0 (copy)
    if v21 == nil then
        v21 = false;
    end;
    return {
        keyArgs = v21, 
        merge = function(_, v23, v24, v25) --[[ Line: 72 ]] --[[ Name: merge ]]
            -- upvalues: l_Array_0 (ref)
            local l_args_0 = v25.args;
            local v27 = nil;
            v27 = if v23 ~= nil then l_Array_0.slice(v23, 1) else {};
            if l_args_0 ~= nil then
                local v28 = nil;
                v28 = l_args_0.offset == nil and 0 or l_args_0.offset;
                for v29 = 1, #v24 do
                    v27[v28 + v29] = v24[v29];
                end;
                return v27;
            else
                return (l_Array_0.concat(v27, v24));
            end;
        end
    };
end;
v0.relayStylePagination = function(v30) --[[ Line: 139 ]] --[[ Name: relayStylePagination ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), l_Object_0 (copy), v14 (ref), v15 (ref), l_mergeDeep_0 (copy)
    if v30 == nil then
        v30 = false;
    end;
    return {
        keyArgs = v30, 
        read = function(_, v32, v33) --[[ Line: 146 ]] --[[ Name: read ]]
            -- upvalues: l_Array_0 (ref), l_Boolean_0 (ref), l_Object_0 (ref), v14 (ref)
            if not v32 then
                return;
            else
                local v34 = {};
                local v35 = "";
                local v36 = "";
                l_Array_0.forEach(v32.edges, function(v37) --[[ Line: 158 ]]
                    -- upvalues: v33 (copy), v34 (copy), v35 (ref), l_Boolean_0 (ref), v36 (ref)
                    if v33:canRead(v33:readField("node", v37)) then
                        table.insert(v34, v37);
                        if v37.cursor then
                            v35 = l_Boolean_0.toJSBoolean(v35) and v35 or v37.cursor or "";
                            v36 = l_Boolean_0.toJSBoolean(v37.cursor) and v37.cursor or v36;
                        end;
                    end;
                end);
                local l_pageInfo_0 = v32.pageInfo;
                local v39 = l_pageInfo_0 and l_pageInfo_0.startCursor;
                local v40 = l_pageInfo_0 and l_pageInfo_0.endCursor;
                return l_Object_0.assign({}, v14(v32), {
                    edges = v34, 
                    pageInfo = l_Object_0.assign({}, v32.pageInfo, {
                        startCursor = l_Boolean_0.toJSBoolean(v39) and v39 or v35, 
                        endCursor = l_Boolean_0.toJSBoolean(v40) and v40 or v36
                    })
                });
            end;
        end, 
        merge = function(_, v42, v43, v44) --[[ Line: 199 ]] --[[ Name: merge ]]
            -- upvalues: v15 (ref), l_Array_0 (ref), l_Object_0 (ref), l_mergeDeep_0 (ref), l_Boolean_0 (ref), v14 (ref)
            if v42 == nil then
                v42 = v15();
            end;
            local l_v42_0 = v42;
            local l_args_1 = v44.args;
            local v47 = nil;
            v47 = if v43.edges then l_Array_0.map(v43.edges, function(v48) --[[ Line: 210 ]]
                -- upvalues: l_Object_0 (ref), v44 (copy)
                local v49 = l_Object_0.assign({
                    cursor = ""
                }, v48);
                if v44:isReference(v49) then
                    v49.cursor = v44:readField("cursor", v49);
                end;
                return v49;
            end) else {};
            if v43.pageInfo then
                local l_pageInfo_1 = v43.pageInfo;
                local l_startCursor_0 = l_pageInfo_1.startCursor;
                local l_endCursor_0 = l_pageInfo_1.endCursor;
                local v53 = v47[1];
                local v54 = v47[#v47];
                if v53 and l_startCursor_0 then
                    v53.cursor = l_startCursor_0;
                end;
                if v54 and l_endCursor_0 then
                    v54.cursor = l_endCursor_0;
                end;
                local v55 = v53 and v53.cursor;
                if v55 and not l_startCursor_0 then
                    v43 = l_mergeDeep_0(v43, {
                        pageInfo = {
                            startCursor = v55
                        }
                    });
                end;
                local v56 = v54 and v54.cursor;
                if v56 and not l_endCursor_0 then
                    v43 = l_mergeDeep_0(v43, {
                        pageInfo = {
                            endCursor = v56
                        }
                    });
                end;
            end;
            local l_edges_0 = l_v42_0.edges;
            local v58 = {};
            if l_args_1 ~= nil and l_args_1.after then
                local v60 = l_Array_0.findIndex(l_edges_0, function(v59) --[[ Line: 262 ]]
                    -- upvalues: l_args_1 (copy)
                    return v59.cursor == l_args_1.after;
                end);
                if v60 >= 1 then
                    l_edges_0 = l_Array_0.slice(l_edges_0, 1, v60 + 1);
                end;
            elseif l_args_1 ~= nil and l_Boolean_0.toJSBoolean(l_args_1.before) then
                local v62 = l_Array_0.findIndex(l_edges_0, function(v61) --[[ Line: 273 ]]
                    -- upvalues: l_args_1 (copy)
                    return v61.cursor == l_args_1.before;
                end);
                v58 = if v62 < 0 then l_edges_0 else l_Array_0.slice(l_edges_0, v62);
                l_edges_0 = {};
            elseif l_Boolean_0.toJSBoolean(v43.edges) then
                l_edges_0 = {};
            end;
            local v63 = l_Array_0.concat(l_edges_0, v47, v58);
            local v64 = l_Object_0.assign({}, v43.pageInfo, l_v42_0.pageInfo);
            if v43.pageInfo then
                local v65 = nil;
                local v66 = nil;
                local v67 = nil;
                local v68 = nil;
                local v69 = nil;
                local l_pageInfo_2 = v43.pageInfo;
                v65 = l_pageInfo_2.hasPreviousPage;
                v66 = l_pageInfo_2.hasNextPage;
                v67 = l_pageInfo_2.startCursor;
                v68 = l_pageInfo_2.endCursor;
                v69 = l_Object_0.assign({}, l_pageInfo_2, {
                    hasPreviousPage = l_Object_0.None, 
                    hasNextPage = l_Object_0.None, 
                    startCursor = l_Object_0.None, 
                    endCursor = l_Object_0.None
                });
                l_Object_0.assign(v64, v69);
                if not l_Boolean_0.toJSBoolean(#l_edges_0) then
                    if v65 ~= nil then
                        v64.hasPreviousPage = v65;
                    end;
                    if v67 ~= nil then
                        v64.startCursor = v67;
                    end;
                end;
                if not l_Boolean_0.toJSBoolean(#v58) then
                    if v66 ~= nil then
                        v64.hasNextPage = v66;
                    end;
                    if v68 ~= nil then
                        v64.endCursor = v68;
                    end;
                end;
            end;
            return l_Object_0.assign({}, v14(l_v42_0), v14(v43), {
                edges = v63, 
                pageInfo = v64
            });
        end
    };
end;
v14 = function(v71) --[[ Line: 358 ]] --[[ Name: getExtras ]]
    -- upvalues: v10 (copy), v16 (ref)
    return v10(v71, v16);
end;
v16 = {
    "edges", 
    "pageInfo"
};
v15 = function() --[[ Line: 363 ]] --[[ Name: makeEmptyData ]]
    return {
        edges = {}, 
        pageInfo = {
            hasPreviousPage = false, 
            hasNextPage = true, 
            startCursor = "", 
            endCursor = ""
        }
    };
end;
return v0;