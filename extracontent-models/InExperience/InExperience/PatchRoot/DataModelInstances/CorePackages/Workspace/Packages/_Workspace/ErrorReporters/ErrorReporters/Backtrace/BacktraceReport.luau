local l_Parent_0 = script:FindFirstAncestor("ErrorReporters").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(script.Parent.Parent.ProcessErrorStack);
local v5 = require(script.Parent.Flags.GetFFlagBacktraceMainSourcePathEnabled);
local v6 = v3.strictInterface({
    guessed_frame = v3.optional(v3.boolean), 
    funcName = v3.optional(v3.string), 
    address = v3.optional(v3.string), 
    line = v3.optional(v3.string), 
    column = v3.optional(v3.string), 
    sourceCode = v3.optional(v3.string), 
    library = v3.optional(v3.string), 
    debug_identifier = v3.optional(v3.string), 
    faulted = v3.optional(v3.boolean), 
    registers = v3.optional(v3.map(v3.string, v3.some(v3.string, v3.number)))
});
local v7 = v3.strictInterface({
    name = v3.optional(v3.string), 
    fault = v3.optional(v3.boolean), 
    stack = v3.optional(v3.array(v6))
});
local v8 = v3.strictInterface({
    name = v3.string, 
    registers = v3.map(v3.string, v3.string)
});
local v9 = v3.strictInterface({
    text = v3.optional(v3.string), 
    startLine = v3.optional(v3.number), 
    startColumn = v3.optional(v3.number), 
    startPos = v3.optional(v3.number), 
    path = v3.optional(v3.string), 
    tabWidth = v3.optional(v3.number)
});
local v10 = v3.strictInterface({
    read = v3.boolean, 
    write = v3.boolean, 
    exec = v3.boolean
});
local v11 = v3.strictInterface({
    start = v3.string, 
    size = v3.optional(v3.number), 
    data = v3.optional(v3.string), 
    perms = v3.optional(v10)
});
local v12 = v3.strictInterface({
    start = v3.string, 
    size = v3.number, 
    code_file = v3.optional(v3.string), 
    version = v3.optional(v3.string), 
    debug_file = v3.optional(v3.string), 
    debug_identifier = v3.optional(v3.string), 
    debug_file_exists = v3.optional(v3.boolean)
});
local v13 = v3.optional(v3.map(v3.string, v3.some(v3.string, v3.number, v3.boolean)));
local v21 = v3.optional(v3.map(v3.string, function(v14) --[[ Line: 77 ]]
    -- upvalues: v3 (copy)
    local function v15(v16) --[[ Line: 78 ]] --[[ Name: checkTypeRecursive ]]
        -- upvalues: v15 (copy), v3 (ref)
        if type(v16) == "table" then
            for v17, v18 in pairs(v16) do
                local v19, v20 = v15(v18);
                if not v19 then
                    return false, string.format("error when checking key: %s - %s", v17, v20);
                end;
            end;
            return true;
        else
            return v3.some(v3.string, v3.number, v3.boolean)(v16);
        end;
    end;
    return v15(v14);
end));
local v30 = v3.intersection(v3.strictInterface({
    uuid = v3.string, 
    timestamp = v3.number, 
    lang = v3.string, 
    langVersion = v3.string, 
    agent = v3.string, 
    agentVersion = v3.string, 
    threads = v3.map(v3.string, v7), 
    mainThread = v3.string, 
    attributes = v13, 
    annotations = v21, 
    symbolication = v3.optional(v3.literal("minidump")), 
    entryThread = v3.optional(v3.string), 
    arch = v3.optional(v8), 
    fingerprint = v3.optional(v3.string), 
    classifiers = v3.optional(v3.array(v3.string)), 
    sourceCode = v3.optional(v3.map(v3.string, v9)), 
    memory = v3.optional(v3.array(v11)), 
    modules = v3.optional(v3.array(v12))
}), function(v22) --[[ Line: 122 ]]
    local v23 = false;
    local l_threads_0 = v22.threads;
    for _, v26 in pairs(l_threads_0) do
        local l_stack_0 = v26.stack;
        if l_stack_0 ~= nil then
            for _, v29 in ipairs(l_stack_0) do
                if v29.registers ~= nil then
                    v23 = true;
                    break;
                end;
            end;
        end;
        if v23 then
            break;
        end;
    end;
    if v23 and v22.arch == nil then
        return false, "arch must exist if you want to have registers in the stack";
    else
        return true;
    end;
end);
local v31 = {
    IAttributes = v13, 
    IAnnotations = v21
};
v31.__index = v31;
local function _(v32) --[[ Line: 155 ]]
    -- upvalues: v2 (copy)
    if v32 and type(v32) == "table" then
        local v33 = v2.Dictionary.keys(v32);
        if #v33 > 0 then
            local v34 = v32[v33[1]];
            if v34 and v34.path ~= nil then
                return v34.path;
            end;
        end;
    end;
    return "";
end;
v31.validate = function(v36) --[[ Line: 168 ]] --[[ Name: validate ]]
    -- upvalues: v30 (copy)
    return v30(v36);
end;
v31.new = function() --[[ Line: 173 ]] --[[ Name: new ]]
    -- upvalues: l_HttpService_0 (copy), v31 (copy)
    local v37 = {
        uuid = l_HttpService_0:GenerateGUID(false):lower(), 
        timestamp = os.time(), 
        lang = "lua", 
        langVersion = "Roblox", 
        agent = "backtrace-Lua", 
        agentVersion = "0.1.0", 
        threads = {}, 
        mainThread = "default"
    };
    setmetatable(v37, v31);
    return v37;
end;
v31.addAttributes = function(v38, v39) --[[ Line: 190 ]] --[[ Name: addAttributes ]]
    -- upvalues: v2 (copy)
    if type(v39) ~= "table" then
        warn("Cannot add attributes of type: ", (type(v39)));
        return;
    else
        local v40 = v38.attributes or {};
        v38.attributes = v2.Dictionary.join(v40, v39);
        return;
    end;
end;
v31.addAnnotations = function(v41, v42) --[[ Line: 203 ]] --[[ Name: addAnnotations ]]
    -- upvalues: v2 (copy)
    if type(v42) ~= "table" then
        warn("Cannot add annotations of type: ", (type(v42)));
        return;
    else
        local v43 = v41.annotations or {};
        v41.annotations = v2.Dictionary.join(v43, v42);
        return;
    end;
end;
v31.addStackToThread = function(v44, v45, v46) --[[ Line: 216 ]] --[[ Name: addStackToThread ]]
    -- upvalues: v2 (copy)
    local l_threads_1 = v44.threads;
    v44.threads = v2.Dictionary.join(l_threads_1, {
        [v46] = {
            name = v46, 
            stack = v45
        }
    });
end;
v31.addStackToMainThread = function(v48, v49) --[[ Line: 229 ]] --[[ Name: addStackToMainThread ]]
    v48:addStackToThread(v49, v48.mainThread);
end;
v31.fromMessageAndStack = function(v50, v51) --[[ Line: 233 ]] --[[ Name: fromMessageAndStack ]]
    -- upvalues: v31 (copy), v4 (copy), v5 (copy), v2 (copy)
    local v52 = false;
    local v53 = v31.new();
    v53:addAttributes({
        ["error.message"] = v50
    });
    local v54, v55 = v4(v51);
    v53:addStackToMainThread(v54);
    v53.sourceCode = v55;
    if v5() then
        local v56 = {};
        local l_sourceCode_0 = v53.sourceCode;
        local v58;
        if l_sourceCode_0 and type(l_sourceCode_0) == "table" then
            local v59 = v2.Dictionary.keys(l_sourceCode_0);
            if #v59 > 0 then
                local v60 = l_sourceCode_0[v59[1]];
                if v60 and v60.path ~= nil then
                    v58 = v60.path;
                    v52 = true;
                end;
            end;
        end;
        if not v52 then
            v58 = "";
        end;
        v52 = false;
        v56.MainSourcePath = v58;
        v53:addAttributes(v56);
    end;
    return v53;
end;
v31.fromDetails = function(v61) --[[ Line: 253 ]] --[[ Name: fromDetails ]]
    -- upvalues: v31 (copy), v4 (copy), v2 (copy), v5 (copy)
    local v62 = false;
    local v63 = v31.new();
    v63:addAttributes({
        ["error.message"] = v61.message
    });
    v63.sourceCode = {};
    local v64 = 0;
    for v65, v66 in ipairs(v61.stacks) do
        local v67, v68, v69 = v4(v66, v64);
        if v65 == 1 then
            v63:addStackToMainThread(v67);
        else
            v63:addStackToThread(v67, "stack" .. v65);
        end;
        v63.sourceCode = v2.Dictionary.join(v63.sourceCode, v68);
        v64 = v69;
    end;
    v63:addAnnotations(v61.annotations);
    if v5() then
        local v70 = {};
        local l_sourceCode_1 = v63.sourceCode;
        local v72;
        if l_sourceCode_1 and type(l_sourceCode_1) == "table" then
            local v73 = v2.Dictionary.keys(l_sourceCode_1);
            if #v73 > 0 then
                local v74 = l_sourceCode_1[v73[1]];
                if v74 and v74.path ~= nil then
                    v72 = v74.path;
                    v62 = true;
                end;
            end;
        end;
        if not v62 then
            v72 = "";
        end;
        v62 = false;
        v70.MainSourcePath = v72;
        v63:addAttributes(v70);
    end;
    return v63;
end;
return v31;