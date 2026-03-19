local l_Parent_0 = script.Parent.Parent;
local l_language_0 = l_Parent_0.language;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Error_0 = v3.Error;
local l_Object_0 = v3.Object;
local l_HttpService_0 = game:GetService("HttpService");
local l_isObjectLike_0 = require(l_Parent_0.jsutils.isObjectLike).isObjectLike;
local _ = require(l_language_0.ast);
local _ = require(l_language_0.source);
local l_getLocation_0 = require(l_language_0.location).getLocation;
local v12 = require(l_language_0.printLocation);
local l_printLocation_0 = v12.printLocation;
local l_printSourceLocation_0 = v12.printSourceLocation;
local v15 = nil;
local v16 = nil;
local v17 = setmetatable({}, {
    __index = l_Error_0
});
v17.__index = v17;
v17.__tostring = function(v18) --[[ Line: 45 ]]
    -- upvalues: v15 (ref)
    return v15(v18);
end;
v17.new = function(v19, v20, v21, v22, v23, v24, v25) --[[ Line: 124 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v16 (ref), l_Array_0 (copy), l_getLocation_0 (copy), l_isObjectLike_0 (copy), l_Object_0 (copy), v17 (copy)
    local v26 = l_Error_0.new(v19);
    v26.name = "GraphQLError";
    v26.originalError = v24;
    v26.nodes = v16(if l_Array_0.isArray(v20) then v20 else if v20 then {
        v20
    } else nil);
    local v27 = {};
    if v26.nodes then
        for _, v29 in ipairs(v26.nodes) do
            local l_loc_0 = v29.loc;
            if l_loc_0 ~= nil then
                table.insert(v27, l_loc_0);
            end;
        end;
    end;
    v27 = v16(v27);
    v26.source = if v21 then v21 else if v27 == nil then nil else v27[1].source;
    v26.positions = if v22 then v22 else if v27 then l_Array_0.map(v27, function(v31) --[[ Line: 165 ]]
        return v31.start;
    end) else nil;
    v26.locations = if v22 and v21 then l_Array_0.map(v22, function(v32) --[[ Line: 170 ]]
        -- upvalues: l_getLocation_0 (ref), v21 (copy)
        return l_getLocation_0(v21, v32);
    end) else if v27 then l_Array_0.map(v27, function(v33) --[[ Line: 174 ]]
        -- upvalues: l_getLocation_0 (ref)
        return l_getLocation_0(v33.source, v33.start);
    end) else nil;
    v26.path = v23 or nil;
    local v34 = if not v24 then nil else v24.extensions;
    if v25 == nil and l_isObjectLike_0(v34) then
        v26.extensions = l_Object_0.assign({}, v34);
    else
        v26.extensions = v25 or nil;
    end;
    if v24 and v24.stack then
        v26.stack = v24.stack;
    end;
    return (setmetatable(v26, v17));
end;
v17.toString = function(v35) --[[ Line: 209 ]] --[[ Name: toString ]]
    -- upvalues: v15 (ref)
    return v15(v35);
end;
v17.toJSON = function(v36) --[[ Line: 214 ]] --[[ Name: toJSON ]]
    -- upvalues: l_Array_0 (copy), l_HttpService_0 (copy)
    local v37 = {
        "message"
    };
    if v36.locations ~= nil then
        table.insert(v37, "locations");
    end;
    if v36.path ~= nil then
        table.insert(v37, "path");
    end;
    if v36.extensions ~= nil then
        table.insert(v37, "extensions");
    end;
    return "{" .. l_Array_0.join(l_Array_0.map(v37, function(v38) --[[ Line: 231 ]]
        -- upvalues: l_HttpService_0 (ref), v36 (copy)
        return l_HttpService_0:JSONEncode(v38) .. ":" .. l_HttpService_0:JSONEncode(v36[v38]);
    end), ",") .. "}";
end;
v16 = function(v39) --[[ Line: 239 ]] --[[ Name: undefinedIfEmpty ]]
    if v39 == nil or #v39 == 0 then
        return nil;
    else
        return v39;
    end;
end;
v15 = function(v40) --[[ Line: 243 ]] --[[ Name: printError ]]
    -- upvalues: l_printLocation_0 (copy), l_printSourceLocation_0 (copy)
    local l_message_0 = v40.message;
    if v40.nodes ~= nil then
        for v42 = 1, #v40.nodes do
            local v43 = v40.nodes[v42];
            if v43.loc ~= nil then
                l_message_0 = l_message_0 .. "\n\n" .. l_printLocation_0(v43.loc);
            end;
        end;
        return l_message_0;
    else
        if v40.source ~= nil and v40.locations ~= nil then
            for v44 = 1, #v40.locations do
                local v45 = v40.locations[v44];
                l_message_0 = l_message_0 .. "\n\n" .. l_printSourceLocation_0(v40.source, v45);
            end;
        end;
        return l_message_0;
    end;
end;
return {
    printError = v15, 
    GraphQLError = v17
};