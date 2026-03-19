local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.ES7Types);
local v2 = {};
v2.__index = v2;
v2.__tostring = function(v3) --[[ Line: 29 ]]
    -- upvalues: v2 (copy)
    return getmetatable(v2).__tostring(v3);
end;
local function _(v4) --[[ Line: 35 ]] --[[ Name: __createError ]]
    -- upvalues: v2 (copy)
    local v5 = setmetatable({
        name = "Error", 
        message = v4 or ""
    }, v2);
    v2.__captureStackTrace(v5, 4);
    return v5;
end;
v2.new = function(v7) --[[ Line: 44 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    local v8 = setmetatable({
        name = "Error", 
        message = v7 or ""
    }, v2);
    v2.__captureStackTrace(v8, 4);
    return v8;
end;
v2.captureStackTrace = function(v9, v10) --[[ Line: 48 ]] --[[ Name: captureStackTrace ]]
    -- upvalues: v2 (copy)
    v2.__captureStackTrace(v9, 3, v10);
end;
v2.__captureStackTrace = function(v11, v12, v13) --[[ Line: 52 ]] --[[ Name: __captureStackTrace ]]
    -- upvalues: v2 (copy)
    if typeof(v13) == "function" then
        local v14 = debug.traceback(nil, v12);
        local v15 = debug.info(v13, "n");
        local v16 = debug.info(v13, "s");
        local v17 = string.gsub(v16, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. v15;
        local v18 = string.find(v14, v17);
        local v19 = nil;
        if v18 ~= nil then
            local v20, v21 = string.find(v14, "\n", v18 + 1);
            v18 = v20;
            v19 = v21;
        end;
        if v19 ~= nil then
            v14 = string.sub(v14, v19 + 1);
        end;
        v11.__stack = v14;
    else
        v11.__stack = debug.traceback(nil, v12);
    end;
    v2.__recalculateStacktrace(v11);
end;
v2.__recalculateStacktrace = function(v22) --[[ Line: 76 ]] --[[ Name: __recalculateStacktrace ]]
    local l_message_0 = v22.message;
    v22.stack = ((v22.name or "Error") .. if l_message_0 ~= nil and l_message_0 ~= "" then ": " .. l_message_0 else "") .. "\n" .. if v22.__stack then v22.__stack else "";
end;
return (setmetatable(v2, {
    __call = function(_, ...) --[[ Line: 88 ]] --[[ Name: __call ]]
        -- upvalues: v2 (copy)
        local v25 = setmetatable({
            name = "Error", 
            message = ... or ""
        }, v2);
        v2.__captureStackTrace(v25, 4);
        return v25;
    end, 
    __tostring = function(v26) --[[ Line: 91 ]] --[[ Name: __tostring ]]
        if v26.name ~= nil then
            if v26.message and v26.message ~= "" then
                return string.format("%s: %s", tostring(v26.name), (tostring(v26.message)));
            else
                return (tostring(v26.name));
            end;
        else
            return (tostring("Error"));
        end;
    end
}));