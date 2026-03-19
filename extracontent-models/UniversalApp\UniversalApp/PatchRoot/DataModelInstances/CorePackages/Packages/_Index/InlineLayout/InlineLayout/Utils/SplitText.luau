local l_Parent_0 = script:FindFirstAncestor("Utils").Parent;
local v1 = require(l_Parent_0.Enums.TextSplitBy);
local function _(v2) --[[ Line: 9 ]] --[[ Name: isWhitespace ]]
    return v2:match("%s") ~= nil;
end;
local function _(v4, v5) --[[ Line: 14 ]] --[[ Name: codepointEnd ]]
    local v6 = utf8.offset(v4, v5 + 1);
    if v6 ~= nil then
        return v6 - 1;
    else
        return #v4;
    end;
end;
local v8 = {};
v8.__index = v8;
v8.new = function(v9, v10, v11, v12) --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v8 (copy)
    local v13 = setmetatable({}, v8);
    v13._text = v9;
    v13._initialGuess = v13:_guessInitialBreak(v10, v11, v12);
    v13._index = v13._initialGuess;
    v13:setDirection(1);
    return v13;
end;
v8._guessInitialBreak = function(v14, _, v16, v17) --[[ Line: 44 ]] --[[ Name: _guessInitialBreak ]]
    return (math.max(math.floor(#v14._text * v17 / v16), 1));
end;
v8.findPossibleBreak = function(v18) --[[ Line: 48 ]] --[[ Name: findPossibleBreak ]]
    local l__index_0 = v18._index;
    while true do
        if v18.direction == 1 and l__index_0 <= #v18._text or v18.direction == -1 and l__index_0 > 0 then
            if v18._text:sub(l__index_0, l__index_0):match("%s") ~= nil then
                v18._index = l__index_0 + v18._step;
                return l__index_0 - 1;
            else
                l__index_0 = l__index_0 + v18._step;
            end;
        else
            return l__index_0;
        end;
    end;
end;
v8.setDirection = function(v20, v21) --[[ Line: 63 ]] --[[ Name: setDirection ]]
    v20.direction = v21;
    if v21 ~= 1 then
        v20._index = v20._initialGuess;
    end;
    v20._step = v21 == 1 and 1 or -1;
end;
local v22 = {};
v22.__index = v22;
v22.new = function(v23, v24, v25, v26) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v22 (copy)
    local v27 = setmetatable({}, v22);
    v27._text = v23;
    v27._initialGuess = v27:_guessInitialBreak(v24, v25, v26);
    v27._codepointIndex = v27._initialGuess;
    v27._step = 0;
    return v27;
end;
v22._guessInitialBreak = function(_, v29, v30, v31) --[[ Line: 84 ]] --[[ Name: _guessInitialBreak ]]
    return (math.max(math.floor(v29 * v31 / v30), 1));
end;
v22.findPossibleBreak = function(v32) --[[ Line: 88 ]] --[[ Name: findPossibleBreak ]]
    v32._codepointIndex = v32._codepointIndex + v32._step;
    local l__text_0 = v32._text;
    local l__codepointIndex_0 = v32._codepointIndex;
    local v35 = utf8.offset(l__text_0, l__codepointIndex_0 + 1);
    if v35 ~= nil then
        return v35 - 1;
    else
        return #l__text_0;
    end;
end;
v22.setDirection = function(v36, v37) --[[ Line: 93 ]] --[[ Name: setDirection ]]
    v36.direction = v37;
    v36._step = v37 == 1 and 1 or -1;
end;
local function v51(v38, v39, v40, v41, v42, v43) --[[ Line: 98 ]] --[[ Name: splitWith ]]
    local v44 = v38.new(v40, v41, v42, v43);
    local v45 = nil;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    local v49 = nil;
    v46 = v44:findPossibleBreak();
    v45 = v40:sub(1, v46);
    v47 = v43 < v39(v45) and -1 or 1;
    v49 = v46;
    v44:setDirection(v47);
    local v50 = 0;
    while v50 < v41 do
        v46 = v44:findPossibleBreak();
        v45 = v40:sub(1, v46);
        v48 = v43 < v39(v45) and -1 or 1;
        if v47 ~= v48 then
            if v47 == 1 then
                v46 = v49;
                return v40:sub(1, v46), v46;
            else
                break;
            end;
        else
            v47 = v48;
            v49 = v46;
            v50 = v50 + 1;
        end;
    end;
    return v45, v46;
end;
return function(v52, v53, v54, v55) --[[ Line: 174 ]] --[[ Name: split ]]
    -- upvalues: v1 (copy), v8 (copy), v22 (copy), v51 (copy)
    local v56 = utf8.len(v54);
    if v56 == nil then
        warn("Failed to get string length, it is probably malformed or non utf8");
        return v54;
    else
        local v57 = v53(v54);
        if v57 <= v55 then
            return v54;
        else
            local v58 = nil;
            v58 = if v52 == v1.Word then v8 else v22;
            local v59, v60 = v51(v58, v53, v54, v56, v57, v55);
            if v60 == 0 or v60 == #v54 then
                return v54;
            else
                return v59, (v54:sub(v60 + 1));
            end;
        end;
    end;
end;