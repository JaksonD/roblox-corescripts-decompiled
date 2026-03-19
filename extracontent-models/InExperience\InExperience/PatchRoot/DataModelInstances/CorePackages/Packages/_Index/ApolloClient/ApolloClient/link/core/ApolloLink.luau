local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_Error_0 = v3.Error;
local v7 = require(l_Parent_0.jsutils.invariant);
local l_InvariantError_0 = v7.InvariantError;
local l_invariant_0 = v7.invariant;
local l_Observable_0 = require(l_Parent_0.utilities).Observable;
local _ = require(script.Parent.types);
local v12 = require(script.Parent.Parent.utils);
local l_validateOperation_0 = v12.validateOperation;
local l_createOperation_0 = v12.createOperation;
local l_transformOperation_0 = v12.transformOperation;
local v16 = {};
v16.__index = v16;
local function v20(_, v18, v19) --[[ Line: 53 ]] --[[ Name: passthrough ]]
    -- upvalues: l_Boolean_0 (copy), l_Observable_0 (copy)
    if l_Boolean_0.toJSBoolean(v19) then
        return (v19(v18));
    else
        return l_Observable_0.of();
    end;
end;
local function v22(v21) --[[ Line: 61 ]] --[[ Name: toLink ]]
    -- upvalues: v16 (copy)
    if typeof(v21) == "function" then
        return v16.new(v21);
    else
        return v21;
    end;
end;
local _ = function(v23) --[[ Line: 69 ]] --[[ Name: isTerminating ]]
    local v24, _ = debug.info(v23.request, "a");
    return v24 <= 2;
end;
local v27 = setmetatable({}, {
    __index = l_Error_0
});
v27.__index = v27;
v27.new = function(v28, v29) --[[ Line: 79 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v27 (copy)
    local v30 = l_Error_0.new(v28);
    v30.link = v29;
    return (setmetatable(v30, v27));
end;
v16.empty = function() --[[ Line: 86 ]] --[[ Name: empty ]]
    -- upvalues: v16 (copy), l_Observable_0 (copy)
    return v16.new(function(_) --[[ Line: 87 ]]
        -- upvalues: l_Observable_0 (ref)
        return l_Observable_0.of();
    end);
end;
v16.from = function(v32) --[[ Line: 92 ]] --[[ Name: from ]]
    -- upvalues: v16 (copy), l_Array_0 (copy), v22 (copy)
    if #v32 == 0 then
        return v16.empty();
    else
        return (l_Array_0.reduce(l_Array_0.map(v32, v22, nil), function(v33, v34) --[[ Line: 96 ]]
            return v33:concat(v34);
        end));
    end;
end;
v16.split_ = function(v35, v36, v37) --[[ Line: 101 ]] --[[ Name: split_ ]]
    -- upvalues: v16 (copy), l_Boolean_0 (copy), v20 (copy), l_Observable_0 (copy)
    local v38 = if typeof(v36) == "function" then v16.new(v36) else v36;
    local v39 = nil;
    if l_Boolean_0.toJSBoolean(v37) and v37 ~= nil then
        v39 = if typeof(v37) == "function" then v16.new(v37) else v37;
    else
        local v40 = v16.new(v20);
        v39 = if typeof(v40) == "function" then v16.new(v40) else v40;
    end;
    local v41, v42 = debug.info(v38.request, "a");
    if v41 <= 2 then
        local v43;
        v42, v43 = debug.info(v39.request, "a");
        if v42 <= 2 then
            return v16.new(function(_, v45) --[[ Line: 115 ]]
                -- upvalues: v35 (copy), v38 (copy), l_Boolean_0 (ref), l_Observable_0 (ref), v39 (ref)
                if v35(v45) then
                    local v46 = v38:request(v45);
                    return l_Boolean_0.toJSBoolean(v46) and v46 or l_Observable_0.of();
                else
                    local v47 = v39:request(v45);
                    return l_Boolean_0.toJSBoolean(v47) and v47 or l_Observable_0.of();
                end;
            end);
        end;
    end;
    return v16.new(function(_, v49, v50) --[[ Line: 125 ]]
        -- upvalues: v35 (copy), v38 (copy), l_Boolean_0 (ref), l_Observable_0 (ref), v39 (ref)
        if v35(v49) then
            local v51 = v38:request(v49, v50);
            return l_Boolean_0.toJSBoolean(v51) and v51 or l_Observable_0.of();
        else
            local v52 = v39:request(v49, v50);
            return l_Boolean_0.toJSBoolean(v52) and v52 or l_Observable_0.of();
        end;
    end);
end;
v16.execute = function(v53, v54) --[[ Line: 137 ]] --[[ Name: execute ]]
    -- upvalues: l_createOperation_0 (copy), l_transformOperation_0 (copy), l_validateOperation_0 (copy), l_Boolean_0 (copy), l_Observable_0 (copy)
    local v55 = v53:request(l_createOperation_0(v54.context, l_transformOperation_0(l_validateOperation_0(v54))));
    return l_Boolean_0.toJSBoolean(v55) and v55 or l_Observable_0.of();
end;
v16.concat_ = function(v56, v57) --[[ Line: 142 ]] --[[ Name: concat_ ]]
    -- upvalues: v16 (copy), l_invariant_0 (copy), v27 (copy), l_Boolean_0 (copy), l_Observable_0 (copy)
    local v58 = if typeof(v56) == "function" then v16.new(v56) else v56;
    local v59, v60 = debug.info(v58.request, "a");
    if v59 <= 2 then
        l_invariant_0.warn(v27.new("You are calling concat on a terminating link, which will have no effect", v58));
        return v58;
    else
        local v61 = if typeof(v57) == "function" then v16.new(v57) else v57;
        local v62;
        v60, v62 = debug.info(v61.request, "a");
        if v60 <= 2 then
            return v16.new(function(_, v64) --[[ Line: 153 ]]
                -- upvalues: v58 (copy), v61 (copy), l_Boolean_0 (ref), l_Observable_0 (ref)
                local v67 = v58:request(v64, function(v65) --[[ Line: 154 ]]
                    -- upvalues: v61 (ref), l_Boolean_0 (ref), l_Observable_0 (ref)
                    local v66 = v61:request(v65);
                    return l_Boolean_0.toJSBoolean(v66) and v66 or l_Observable_0.of();
                end);
                return l_Boolean_0.toJSBoolean(v67) and v67 or l_Observable_0.of();
            end);
        else
            return v16.new(function(_, v69, v70) --[[ Line: 161 ]]
                -- upvalues: v58 (copy), v61 (copy), l_Boolean_0 (ref), l_Observable_0 (ref)
                local v73 = v58:request(v69, function(v71) --[[ Line: 162 ]]
                    -- upvalues: v61 (ref), v70 (copy), l_Boolean_0 (ref), l_Observable_0 (ref)
                    local v72 = v61:request(v71, v70);
                    return l_Boolean_0.toJSBoolean(v72) and v72 or l_Observable_0.of();
                end);
                return l_Boolean_0.toJSBoolean(v73) and v73 or l_Observable_0.of();
            end);
        end;
    end;
end;
v16.new = function(v74) --[[ Line: 171 ]] --[[ Name: new ]]
    -- upvalues: l_Boolean_0 (copy), v16 (copy)
    local v75 = {};
    if l_Boolean_0.toJSBoolean(v74) then
        v75.request = v74;
    end;
    return (setmetatable(v75, v16));
end;
v16.split = function(v76, v77, v78, v79) --[[ Line: 179 ]] --[[ Name: split ]]
    -- upvalues: v16 (copy), l_Boolean_0 (copy), v20 (copy)
    return v76:concat(v16.split_(v77, v78, l_Boolean_0.toJSBoolean(v79) and v79 or v16.new(v20)));
end;
v16.concat = function(v80, v81) --[[ Line: 189 ]] --[[ Name: concat ]]
    -- upvalues: v16 (copy)
    return v16.concat_(v80, v81);
end;
v16.request = function(_, _, _) --[[ Line: 193 ]] --[[ Name: request ]]
    -- upvalues: l_InvariantError_0 (copy)
    error(l_InvariantError_0.new("request is not implemented"));
end;
v16.onError = function(_, v86, v87) --[[ Line: 197 ]] --[[ Name: onError ]]
    -- upvalues: l_Boolean_0 (copy)
    if l_Boolean_0.toJSBoolean(v87) and v87 ~= nil and l_Boolean_0.toJSBoolean(v87.error) then
        v87:error(v86);
        return false;
    else
        error(v86);
        return;
    end;
end;
v16.setOnError = function(v88, v89) --[[ Line: 213 ]] --[[ Name: setOnError ]]
    v88.onError = v89;
    return v88;
end;
v0.ApolloLink = v16;
return v0;