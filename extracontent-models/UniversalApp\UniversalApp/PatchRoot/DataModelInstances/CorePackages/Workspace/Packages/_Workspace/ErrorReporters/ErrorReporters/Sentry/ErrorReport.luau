local l_Parent_0 = script:FindFirstAncestor("ErrorReporters").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.t);
local v3 = require(script.Parent.Parent.ProcessErrorStack);
local v4 = require(script.Parent.Constants);
local v5 = v2.optional(v2.map(v2.string, v2.some(v2.string, v2.number, v2.boolean)));
local v15 = v2.optional(v2.map(v2.string, function(v6) --[[ Line: 47 ]]
    -- upvalues: v2 (copy)
    local function v7(v8) --[[ Line: 48 ]] --[[ Name: checkTypeRecursive ]]
        -- upvalues: v7 (copy), v2 (ref)
        if type(v8) == "table" then
            for v9, v10 in pairs(v8) do
                local v11, v12 = v7(v10);
                if not v11 then
                    return false, string.format("error when checking key: %s - %s", v9, v12 or "unknown error");
                end;
            end;
            return true, nil;
        else
            return v2.some(v2.string, v2.number, v2.boolean)(v8), nil;
        end;
    end;
    local v13, v14 = v7(v6);
    return v13, v14;
end));
local v16 = v2.strictInterface({
    guessed_frame = v2.optional(v2.boolean), 
    funcName = v2.optional(v2.string), 
    address = v2.optional(v2.string), 
    line = v2.optional(v2.string), 
    column = v2.optional(v2.string), 
    sourceCode = v2.optional(v2.string), 
    library = v2.optional(v2.string), 
    debug_identifier = v2.optional(v2.string), 
    faulted = v2.optional(v2.boolean), 
    registers = v2.optional(v2.map(v2.string, v2.some(v2.string, v2.number)))
});
local v17 = v2.strictInterface({
    name = v2.optional(v2.string), 
    fault = v2.optional(v2.boolean), 
    stack = v2.optional(v2.array(v16))
});
local v18 = v2.intersection(v2.strictInterface({
    threads = v2.map(v2.string, v17), 
    message = v2.optional(v2.string), 
    level = v2.optional(v2.string), 
    attributes = v5, 
    annotations = v15
}));
local v19 = {
    IAttributes = v5, 
    IAnnotations = v15
};
v19.__index = v19;
v19.validate = function(v20) --[[ Line: 127 ]] --[[ Name: validate ]]
    -- upvalues: v18 (copy)
    return v18(v20);
end;
v19.new = function() --[[ Line: 137 ]] --[[ Name: new ]]
    -- upvalues: v19 (copy)
    local v21 = {
        threads = {}, 
        attributes = {}, 
        annotations = {}
    };
    setmetatable(v21, v19);
    return v21;
end;
v19.addAttributes = function(v22, v23) --[[ Line: 154 ]] --[[ Name: addAttributes ]]
    -- upvalues: v1 (copy)
    if type(v23) ~= "table" then
        warn("Cannot add attributes of type: ", (type(v23)));
        return;
    else
        local l_attributes_0 = v22.attributes;
        v22.attributes = v1.Dictionary.join(l_attributes_0, v23);
        return;
    end;
end;
v19.addAnnotations = function(v25, v26) --[[ Line: 172 ]] --[[ Name: addAnnotations ]]
    -- upvalues: v1 (copy)
    if type(v26) ~= "table" then
        warn("Cannot add annotations of type: ", (type(v26)));
        return;
    else
        local l_annotations_0 = v25.annotations;
        v25.annotations = v1.Dictionary.join(l_annotations_0, v26);
        return;
    end;
end;
v19.fromMessageAndStack = function(v28, v29, v30) --[[ Line: 193 ]] --[[ Name: fromMessageAndStack ]]
    -- upvalues: v19 (copy), v4 (copy), v3 (copy)
    local v31 = v19.new();
    v31.message = v28;
    v31.level = v30 or v4.DEFAULT_ERROR_LEVEL;
    local v32, v33 = v3(v29);
    for _, v35 in v32 do
        if v35.sourceCode and v33[v35.sourceCode] then
            v35.sourceCode = v33[v35.sourceCode].path;
        end;
    end;
    v31.threads = {
        main = {
            name = "main", 
            stack = v32
        }
    };
    return v31;
end;
v19.fromDetails = function(v36) --[[ Line: 225 ]] --[[ Name: fromDetails ]]
    -- upvalues: v19 (copy), v4 (copy)
    local v37 = nil;
    if v36.stack then
        v37 = v19.fromMessageAndStack(v36.message, v36.stack, v36.level);
    else
        v37 = v19.new();
        v37.message = v36.message;
        v37.level = v36.level or v4.DEFAULT_ERROR_LEVEL;
    end;
    if v36.annotations then
        v37:addAnnotations(v36.annotations);
    end;
    return v37;
end;
return v19;