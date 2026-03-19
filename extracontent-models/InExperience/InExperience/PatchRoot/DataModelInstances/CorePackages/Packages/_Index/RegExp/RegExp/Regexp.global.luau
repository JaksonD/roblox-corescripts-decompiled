local v0 = require(script.Parent.RegEx);
local v1 = {};
local v3 = {
    __index = v1, 
    __tostring = function(v2) --[[ Line: 14 ]] --[[ Name: __tostring ]]
        return (tostring(v2._innerRegEx));
    end
};
v1.exec = function(v4, v5) --[[ Line: 19 ]] --[[ Name: exec ]]
    local v6 = v4._innerRegEx:match(v5);
    if not v6 then
        return nil;
    else
        local v7 = v6:span();
        local v8 = v6:grouparr();
        local v9 = {
            v8[0]
        };
        for v10 = 1, v8.n do
            v9[v10 + 1] = v8[v10];
        end;
        v9.n = v8.n + 1;
        v9.index = v7;
        v9.input = v5;
        return v9;
    end;
end;
v1.test = function(v11, v12) --[[ Line: 38 ]] --[[ Name: test ]]
    return v11:exec(v12) ~= nil;
end;
return (setmetatable(v1, {
    __call = function(_, v14, v15) --[[ Line: 42 ]] --[[ Name: new ]]
        -- upvalues: v0 (copy), v3 (copy)
        v15 = v15 or "";
        local v16 = v0.new(v14, v15);
        return (setmetatable({
            source = v14, 
            ignoreCase = v15:find("i") ~= nil, 
            global = v15:find("g") ~= nil, 
            multiline = v15:find("m") ~= nil, 
            _innerRegEx = v16
        }, v3));
    end
}));