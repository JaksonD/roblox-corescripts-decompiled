local l_Parent_0 = script.Parent.Parent;
local l_lib_0 = l_Parent_0.lib;
local l_src_0 = l_Parent_0.src;
local v3 = require(l_src_0.json);
local v4 = require(l_lib_0.url);
local function _(v5) --[[ Line: 12 ]] --[[ Name: maybe_number ]]
    return tonumber(v5) or v5;
end;
local function v8(v7) --[[ Line: 20 ]] --[[ Name: trim ]]
    v7 = v7 or "";
    while v7:sub(1, 1) == " " do
        v7 = v7:sub(2);
    end;
    while v7:sub(-1, -1) == " " do
        v7 = v7:sub(1, -2);
    end;
    return v7;
end;
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11, v12) --[[ Line: 38 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy)
    local v13 = setmetatable({}, v9);
    v12 = v12 or {};
    v13.name = v10;
    v13.value = v11;
    v13.domain = v12.domain or "";
    v13.path = v12.path or "";
    return v13;
end;
v9.fromSet = function(v14) --[[ Line: 52 ]] --[[ Name: fromSet ]]
    -- upvalues: v8 (copy), v9 (copy)
    local v15 = {};
    local v16 = v14:split(";");
    local v17 = v16[1]:split("=");
    local v18 = v8(v17[1]);
    local v19 = v8(v17[2]);
    for v20 = 2, #v16 do
        local v21 = v16[v20]:split("=");
        v15[v8(v21[1]):lower()] = v8(v21[2]);
    end;
    return v9.new(v18, v19, v15);
end;
v9.matches = function(v22, v23) --[[ Line: 72 ]] --[[ Name: matches ]]
    -- upvalues: v4 (copy)
    if not v22.domain then
        return true;
    else
        local v24 = v4.parse(v23);
        if v22.domain:sub(1, 1) == "." then
            if v24.host:sub(-#v22.domain, -1) ~= v22.domain and v24.host ~= v22.domain:sub(2) then
                return false;
            end;
        elseif v24.host ~= v22.domain then
            return false;
        end;
        if v22.path and not v24.path:sub(1, #v22.path) == v22.path then
            return false;
        else
            return true;
        end;
    end;
end;
local v25 = {};
v25.__index = v25;
v25.new = function() --[[ Line: 104 ]] --[[ Name: new ]]
    -- upvalues: v25 (copy)
    local v26 = setmetatable({}, v25);
    v26.__cookiejar = true;
    v26.cookies = {};
    return v26;
end;
v25.insert = function(v27, v28, v29, v30) --[[ Line: 114 ]] --[[ Name: insert ]]
    -- upvalues: v9 (copy)
    v27.cookies[v28] = v9.new(v28, v29, v30);
    return v27;
end;
v25.SetCookie = function(v31, v32) --[[ Line: 122 ]] --[[ Name: SetCookie ]]
    -- upvalues: v9 (copy)
    local v33 = v9.fromSet(v32);
    v31.cookies[v33.name] = v33;
end;
v25.delete = function(v34, v35) --[[ Line: 130 ]] --[[ Name: delete ]]
    v34.cookies[v35] = nil;
end;
v25.string = function(v36, _) --[[ Line: 134 ]] --[[ Name: string ]]
    local v38 = "";
    for _, v40 in pairs(v36.cookies) do
        if v38 then
            v38 = v38 .. "; ";
        end;
        v38 = v38 .. ("%s=%s"):format(v40.name, v40.value);
    end;
    return v38;
end;
v25.__tostring = function(v41) --[[ Line: 149 ]] --[[ Name: __tostring ]]
    -- upvalues: v3 (copy)
    return v3.enc(v41.domains);
end;
return v25;