local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v1.Error;
local l_inspect_0 = v1.util.inspect;
local l_filterInternalStackFrames_0 = require(script.Parent.ReactFeatureFlags).filterInternalStackFrames;
local v5 = {
    "React", 
    "ReactDevtoolsShared", 
    "ReactNoopRenderer", 
    "ReactReconciler", 
    "ReactRefresh", 
    "ReactRoblox", 
    "RoactCompat", 
    "Scheduler", 
    "Shared"
};
local v6 = nil;
local function v11() --[[ Line: 52 ]] --[[ Name: getReactPackagePrefixes ]]
    -- upvalues: v6 (ref), v5 (copy), l_Parent_0 (copy)
    if v6 then
        return v6;
    else
        local v7 = {};
        for _, v9 in v5 do
            local l_FirstChild_0 = l_Parent_0.Parent:FindFirstChild(v9);
            if l_FirstChild_0 then
                table.insert(v7, (l_FirstChild_0:GetFullName():gsub("^game%.", "")));
            end;
        end;
        v6 = v7;
        return v7;
    end;
end;
local _ = function(v12) --[[ Line: 79 ]] --[[ Name: isInternalFrame ]]
    -- upvalues: v11 (copy)
    for _, v14 in (v11()) do
        if string.sub(v12, 1, #v14) == v14 then
            return true;
        end;
    end;
    return false;
end;
local function v32(v16) --[[ Line: 98 ]] --[[ Name: buildStackString ]]
    -- upvalues: v11 (copy)
    local v17 = false;
    local v18 = false;
    local v19 = "";
    local v20 = false;
    local v21 = false;
    for v22 = v16 + 1, 1e999 do
        local v23, v24, v25 = debug.info(v22, "sln");
        if v23 then
            if v23 ~= "[C]" then
                if not v20 then
                    local v26;
                    for _, v28 in (v11()) do
                        if string.sub(v23, 1, #v28) == v28 then
                            v26 = true;
                            v17 = true;
                        end;
                        if v17 then
                            break;
                        end;
                    end;
                    if not v17 then
                        v26 = false;
                    end;
                    v17 = false;
                    v21 = not v26;
                    v20 = true;
                end;
                if v21 then
                    local v29;
                    for _, v31 in (v11()) do
                        if string.sub(v23, 1, #v31) == v31 then
                            v29 = true;
                            v18 = true;
                        end;
                        if v18 then
                            break;
                        end;
                    end;
                    if not v18 then
                        v29 = false;
                    end;
                    v18 = false;
                    if v29 then
                        continue;
                    end;
                end;
                v19 = v19 .. ("%*:%* function %*\n"):format(v23, v24, v25 or "?");
            end;
        else
            break;
        end;
    end;
    return (string.gsub(v19, "\n$", ""));
end;
return {
    describeError = function(v33) --[[ Line: 141 ]] --[[ Name: describeError ]]
        -- upvalues: v1 (copy), l_filterInternalStackFrames_0 (copy), v32 (copy)
        if typeof(v33) == "string" then
            local _, v35 = string.find(v33, ":[%d]+: ");
            local v36 = if v35 then string.sub(v33, v35 + 1) else v33;
            local v37 = v1.Error.new(v36);
            if l_filterInternalStackFrames_0 then
                v37.stack = v32(2);
                return v37;
            else
                v37.stack = debug.traceback(nil, 2);
                return v37;
            end;
        else
            return v33;
        end;
    end, 
    errorToString = function(v38) --[[ Line: 165 ]] --[[ Name: errorToString ]]
        -- upvalues: l_inspect_0 (copy)
        local _ = nil;
        if typeof(v38) == "table" then
            if v38.message and v38.stack then
                return "\n------ Error caught by React ------\n" .. v38.message .. "\n------ Error caught by React ------\n" .. tostring(v38.stack);
            else
                return (l_inspect_0(v38));
            end;
        else
            return (l_inspect_0(v38));
        end;
    end, 
    parseReactError = function(v40) --[[ Line: 191 ]] --[[ Name: parseReactError ]]
        -- upvalues: l_Error_0 (copy)
        local v41 = string.split(v40, "\n------ Error caught by React ------\n");
        if #v41 == 3 then
            local v42, v43, v44 = table.unpack(v41);
            local v45 = l_Error_0.new(v43);
            v45.stack = v44;
            return v45, v42;
        else
            local v46 = l_Error_0.new(v40);
            v46.stack = nil;
            return v46, "";
        end;
    end, 
    __ERROR_DIVIDER = "\n------ Error caught by React ------\n"
};