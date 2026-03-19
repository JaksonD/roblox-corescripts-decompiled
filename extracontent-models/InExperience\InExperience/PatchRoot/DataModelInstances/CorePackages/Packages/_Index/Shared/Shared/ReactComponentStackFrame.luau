local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local _ = require(script.Parent.ReactElementType);
local _ = require(script.Parent["flowtypes.roblox"]);
local v4 = require(script.Parent.ReactSymbols);
local l_REACT_SUSPENSE_TYPE_0 = v4.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = v4.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = v4.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = v4.REACT_MEMO_TYPE;
local l_REACT_BLOCK_TYPE_0 = v4.REACT_BLOCK_TYPE;
local l_REACT_LAZY_TYPE_0 = v4.REACT_LAZY_TYPE;
local v11 = require(script.Parent["ConsolePatchingDev.roblox"]);
local l_disableLogs_0 = v11.disableLogs;
local l_reenableLogs_0 = v11.reenableLogs;
local l_ReactCurrentDispatcher_0 = require(script.Parent.ReactSharedInternals).ReactCurrentDispatcher;
local v15 = nil;
local v16 = nil;
local function _(v17) --[[ Line: 60 ]] --[[ Name: describeOwner ]]
    if type(v17) == "function" then
        return debug.info(v17, "n");
    elseif type(v17) == "table" then
        return (tostring(v17));
    else
        return nil;
    end;
end;
local function v23(v19, v20, v21) --[[ Line: 69 ]] --[[ Name: describeBuiltInComponentFrame ]]
    -- upvalues: v1 (copy), v15 (ref)
    local v22 = nil;
    if v1.__DEV__ and v21 then
        v22 = if type(v21) == "function" then debug.info(v21, "n") else if type(v21) == "table" then tostring(v21) else nil;
    end;
    return v15(v19, v20, v22);
end;
local v24 = false;
local v25 = nil;
if v1.__DEV__ then
    v25 = setmetatable({}, {
        __mode = "k"
    });
end;
local function v48(v26, v27) --[[ Line: 116 ]] --[[ Name: describeNativeComponentFrame ]]
    -- upvalues: v24 (ref), v1 (copy), v25 (ref), l_ReactCurrentDispatcher_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), v15 (ref)
    local v28 = false;
    if not v26 or v24 then
        return "";
    else
        if v1.__DEV__ then
            local v29 = v25[v26];
            if v29 ~= nil then
                return v29;
            end;
        end;
        local v30 = nil;
        v24 = true;
        local v31 = nil;
        if v1.__DEV__ then
            v31 = l_ReactCurrentDispatcher_0.current;
            l_ReactCurrentDispatcher_0.current = nil;
            l_disableLogs_0();
        end;
        local v32 = nil;
        local _, v37 = xpcall(function() --[[ Line: 156 ]]
            -- upvalues: v27 (copy), v32 (ref), v30 (ref), v26 (copy)
            if v27 then
                return;
            else
                local _, l_result_0 = pcall(function() --[[ Line: 162 ]]
                    -- upvalues: v32 (ref)
                    v32 = debug.traceback();
                    error({
                        stack = v32
                    });
                end);
                v30 = l_result_0;
                v26();
                return;
            end;
        end, function(v35) --[[ Line: 172 ]]
            -- upvalues: v32 (ref)
            return {
                message = v35, 
                stack = v32
            };
        end);
        local v38 = nil;
        if v37 and v30 and type(v37.stack) == "string" then
            local v39 = string.split(v37.stack, "\n");
            local v40 = string.split(v30.stack, "\n");
            local v41 = #v39 - 1;
            local v42 = #v40 - 1;
            while v41 >= 2 and v42 >= 0 and v39[v41] ~= v40[v42] do
                v42 = v42 - 1;
            end;
            while v41 >= 3 and v42 >= 1 do
                v41 = v41 - 1;
                v42 = v42 - 1;
                if v39[v41] ~= v40[v42] then
                    if v41 ~= 1 or v42 ~= 1 then
                        repeat
                            v41 = v41 - 1;
                            v42 = v42 - 1;
                            if v42 < 0 or v39[v41] ~= v40[v42] then
                                local v43 = "\n" .. "    in " .. v39[v41];
                                if v1.__DEV__ then
                                    v25[v26] = v43;
                                end;
                                v38 = v43;
                            end;
                            v28 = v41 < 3 or v42 < 1;
                        until v28;
                    else
                        break;
                    end;
                end;
                if v28 then
                    break;
                end;
            end;
        end;
        v28 = false;
        v24 = false;
        if v1.__DEV__ then
            l_ReactCurrentDispatcher_0.current = v31;
            l_reenableLogs_0();
        end;
        if v38 ~= nil then
            return v38;
        else
            local v44 = if type(v26) == "function" then debug.info(v26, "n") else if type(v26) == "table" then tostring(v26) else "";
            local v45 = "";
            if v44 ~= nil and v44 ~= "" then
                local v46 = nil;
                local _ = v1.__DEV__;
                v45 = v15(v44, nil, v46);
            end;
            if v1.__DEV__ then
                v25[v26] = v45;
            end;
            return v45;
        end;
    end;
end;
v15 = function(v49, v50, v51) --[[ Line: 286 ]] --[[ Name: describeComponentFrame ]]
    -- upvalues: v1 (copy)
    local v52 = "";
    if v1.__DEV__ and v50 then
        local l_fileName_0 = v50.fileName;
        local v54 = string.gsub(l_fileName_0, "^(.*)[\\/]", "");
        if string.match(v54, "^init%.") then
            local v55 = string.match(l_fileName_0, "^(.*)[\\/]");
            if v55 and #v55 ~= 0 then
                v54 = string.gsub(v55, "^(.*)[\\/]", "") .. "/" .. v54;
            end;
        end;
        v52 = " (at " .. v54 .. ":" .. v50.lineNumber .. ")";
    elseif v51 then
        v52 = " (created by " .. v51 .. ")";
    end;
    return "\n    in " .. (v49 or "Unknown") .. v52;
end;
local function v61(v56, v57, v58) --[[ Line: 319 ]] --[[ Name: describeClassComponentFrame ]]
    -- upvalues: v1 (copy), v15 (ref)
    local v59 = tostring(v56);
    local v60 = nil;
    if v1.__DEV__ and v58 then
        v60 = if type(v58) == "function" then debug.info(v58, "n") else if type(v58) == "table" then tostring(v58) else nil;
    end;
    return v15(v59, v57, v60);
end;
v16 = function(v62, v63, v64) --[[ Line: 343 ]] --[[ Name: describeFunctionComponentFrame ]]
    -- upvalues: v1 (copy), v15 (ref)
    if not v62 then
        return "";
    else
        local v65 = if type(v62) == "function" then debug.info(v62, "n") else tostring(v62);
        local v66 = nil;
        if v1.__DEV__ and v64 then
            v66 = if type(v64) == "function" then debug.info(v64, "n") else if type(v64) == "table" then tostring(v64) else nil;
        end;
        return v15(v65, v63, v66);
    end;
end;
local function v67(v68, v69, v70) --[[ Line: 390 ]] --[[ Name: describeUnknownElementTypeFrameInDEV ]]
    -- upvalues: v1 (copy), v61 (copy), v16 (ref), v23 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), v67 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy)
    if not v1.__DEV__ then
        return "";
    elseif v68 == nil then
        return "";
    elseif type(v68) == "table" and type(v68.__ctor) == "function" then
        return v61(v68, v69, v70);
    elseif type(v68) == "function" then
        return v16(v68, v69, v70);
    elseif type(v68) == "string" then
        return v23(v68, v69, v70);
    elseif v68 == l_REACT_SUSPENSE_TYPE_0 then
        return v23("Suspense", v69, v70);
    elseif v68 == l_REACT_SUSPENSE_LIST_TYPE_0 then
        return v23("SuspenseList", v69, v70);
    else
        if type(v68) == "table" then
            local v71 = v68["$$typeof"];
            if v71 == l_REACT_FORWARD_REF_TYPE_0 then
                return v16(v68.render, v69, v70);
            elseif v71 == l_REACT_MEMO_TYPE_0 then
                return v67(v68.type, v69, v70);
            elseif v71 == l_REACT_BLOCK_TYPE_0 then
                return v16(v68._render, v69, v70);
            elseif v71 == l_REACT_LAZY_TYPE_0 then
                local l__payload_0 = v68._payload;
                local l__init_0 = v68._init;
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 449 ]]
                    -- upvalues: v67 (ref), l__init_0 (copy), l__payload_0 (copy), v69 (copy), v70 (copy)
                    v67(l__init_0(l__payload_0), v69, v70);
                end);
                if l_status_1 then
                    return l_result_1;
                end;
            end;
        end;
        return "";
    end;
end;
return {
    describeComponentFrame = v15, 
    describeBuiltInComponentFrame = v23, 
    describeNativeComponentFrame = v48, 
    describeClassComponentFrame = v61, 
    describeFunctionComponentFrame = v16, 
    describeUnknownElementTypeFrameInDEV = v67
};