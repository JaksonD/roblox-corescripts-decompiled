local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Boolean_0 = v2.Boolean;
local v5 = {};
local _ = require(l_Parent_1.GraphQL);
local l_wrap_0 = require(l_Parent_0.optimism).wrap;
local l_getFragmentQueryDocument_0 = require(script.Parent.Parent.Parent.utilities).getFragmentQueryDocument;
local _ = require(script.Parent.types.DataProxy);
local _ = require(script.Parent.types.Cache);
local v11 = {};
v11.__index = v11;
v11.new = function() --[[ Line: 207 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy), l_wrap_0 (copy), l_getFragmentQueryDocument_0 (copy)
    local v12 = setmetatable({}, v11);
    v12.getFragmentDoc = l_wrap_0(l_getFragmentQueryDocument_0);
    return v12;
end;
v11.read = function(_, _) --[[ Line: 217 ]] --[[ Name: read ]]
    error("not implemented abstract method");
end;
v11.write = function(_, _) --[[ Line: 220 ]] --[[ Name: write ]]
    error("not implemented abstract method");
end;
v11.diff = function(_, _) --[[ Line: 223 ]] --[[ Name: diff ]]
    error("not implemented abstract method");
end;
v11.watch = function(_, _) --[[ Line: 226 ]] --[[ Name: watch ]]
    error("not implemented abstract method");
end;
v11.reset = function(_) --[[ Line: 229 ]] --[[ Name: reset ]]
    error("not implemented abstract method");
end;
v11.evict = function(_, _) --[[ Line: 233 ]] --[[ Name: evict ]]
    error("not implemented abstract method");
end;
v11.restore = function(_, _) --[[ Line: 237 ]] --[[ Name: restore ]]
    error("not implemented abstract method");
end;
v11.extract = function(_, _) --[[ Line: 241 ]] --[[ Name: extract ]]
    error("not implemented abstract method");
end;
v11.removeOptimistic = function(_, _) --[[ Line: 245 ]] --[[ Name: removeOptimistic ]]
    error("not implemented abstract method");
end;
v11.batch = function(v30, v31) --[[ Line: 249 ]] --[[ Name: batch ]]
    local v32 = nil;
    v32 = if typeof(v31.optimistic) == "string" then v31.optimistic else if v31.optimistic == false then nil else nil;
    v30:performTransaction(v31.update, v32);
end;
v11.performTransaction = function(_, _, _) --[[ Line: 263 ]] --[[ Name: performTransaction ]]
    error("not implemented abstract method");
end;
v11.recordOptimisticTransaction = function(v36, v37, v38) --[[ Line: 277 ]] --[[ Name: recordOptimisticTransaction ]]
    v36:performTransaction(v37, v38);
end;
v11.transformDocument = function(_, v40) --[[ Line: 281 ]] --[[ Name: transformDocument ]]
    return v40;
end;
v11.identify = function(_, _) --[[ Line: 285 ]] --[[ Name: identify ]]

end;
v11.gc = function(_) --[[ Line: 289 ]] --[[ Name: gc ]]
    return {};
end;
v11.modify = function(_, _) --[[ Line: 293 ]] --[[ Name: modify ]]
    return false;
end;
v11.transformForLink = function(_, v47) --[[ Line: 297 ]] --[[ Name: transformForLink ]]
    return v47;
end;
v11.readQuery = function(v48, v49, v50) --[[ Line: 301 ]] --[[ Name: readQuery ]]
    -- upvalues: l_Object_0 (copy), l_Boolean_0 (copy)
    if v50 == nil then
        v50 = not not v49.optimistic;
    end;
    return v48:read(l_Object_0.assign(table.clone(v49), {
        rootId = l_Boolean_0.toJSBoolean(v49.id) and v49.id or "ROOT_QUERY", 
        optimistic = v50
    }));
end;
v11.readFragment = function(v51, v52, v53) --[[ Line: 320 ]] --[[ Name: readFragment ]]
    -- upvalues: l_Object_0 (copy)
    if v53 == nil then
        v53 = not not v52.optimistic;
    end;
    return v51:read(l_Object_0.assign({}, v52, {
        query = v51.getFragmentDoc(v52.fragment, v52.fragmentName), 
        rootId = v52.id, 
        optimistic = v53
    }));
end;
v11.writeQuery = function(v54, v55) --[[ Line: 338 ]] --[[ Name: writeQuery ]]
    -- upvalues: l_Object_0 (copy)
    local l_id_0 = v55.id;
    local l_data_0 = v55.data;
    local v58 = l_Object_0.assign(table.clone(v55), {
        id = l_Object_0.None, 
        data = l_Object_0.None
    });
    return v54:write(l_Object_0.assign(v58, {
        dataId = l_id_0 or "ROOT_QUERY", 
        result = l_data_0
    }));
end;
v11.writeFragment = function(v59, v60) --[[ Line: 350 ]] --[[ Name: writeFragment ]]
    -- upvalues: l_Object_0 (copy)
    local l_id_1 = v60.id;
    local l_data_1 = v60.data;
    local l_fragment_0 = v60.fragment;
    local l_fragmentName_0 = v60.fragmentName;
    local v65 = l_Object_0.assign(table.clone(v60), {
        id = l_Object_0.None, 
        data = l_Object_0.None, 
        fragment = l_Object_0.None, 
        fragmentName = l_Object_0.None
    });
    return v59:write(l_Object_0.assign(v65, {
        query = v59.getFragmentDoc(l_fragment_0, l_fragmentName_0), 
        dataId = l_id_1, 
        result = l_data_1
    }));
end;
v5.ApolloCache = v11;
return v5;