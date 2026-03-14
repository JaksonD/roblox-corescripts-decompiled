local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local v4 = v2.Map.new(nil);
local v5 = {
    "0", 
    "1", 
    "2", 
    "3", 
    "4", 
    "5", 
    "6", 
    "7", 
    "8", 
    "9", 
    "a", 
    "b", 
    "c", 
    "d", 
    "e", 
    "f", 
    "g", 
    "h", 
    "i", 
    "j", 
    "k", 
    "l", 
    "m", 
    "n", 
    "o", 
    "p", 
    "q", 
    "r", 
    "s", 
    "t", 
    "u", 
    "v", 
    "w", 
    "x", 
    "y", 
    "z"
};
math.randomseed(os.clock());
local function v8() --[[ Line: 59 ]] --[[ Name: uuid ]]
    -- upvalues: v5 (copy)
    local v6 = "";
    for _ = 1, 11 do
        v6 = v6 .. v5[math.random(1, 36)];
    end;
    return v6;
end;
local function v12(v9) --[[ Line: 68 ]] --[[ Name: makeUniqueId ]]
    -- upvalues: v8 (copy), l_Boolean_0 (copy), v4 (copy)
    local v10 = v8();
    local v11 = l_Boolean_0.toJSBoolean(v4:get(v9)) and v4:get(v9) or 1;
    v4:set(v9, v11 + 1);
    return ("%s:%s:%s"):format(v9, tostring(v11), v10);
end;
v0.uuid = v8;
v0.makeUniqueId = v12;
return v0;