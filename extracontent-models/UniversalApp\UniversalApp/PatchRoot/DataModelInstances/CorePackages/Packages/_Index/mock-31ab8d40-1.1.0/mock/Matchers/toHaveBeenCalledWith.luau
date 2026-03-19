local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.MagicMock);
local v2 = require(l_Parent_0.Spy);
local v3 = require(l_Parent_0.AnyCallMatches);
local v4 = require(l_Parent_0.fmtArgs);
local v5 = require(l_Parent_0.symbols);
local function _(v6) --[[ Line: 8 ]] --[[ Name: getLiteralPredicate ]]
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v6 (copy)
        return v7 == v6;
    end;
end;
local function _(v9) --[[ Line: 14 ]] --[[ Name: isPredicate ]]
    -- upvalues: v5 (copy), v1 (copy)
    if type(v9) == "table" and v9[v5.isPredicate] then
        return not v1.is(v9);
    else
        return;
    end;
end;
return function(v11, ...) --[[ Line: 20 ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy), v3 (copy), v4 (copy)
    if not (v1.is(v11) or v2.is(v11)) then
        return {
            pass = false, 
            message = string.format("expect(mock) must be a MagicMock or Spy when .toHaveBeenCalledWith is used. Given %s instead", (tostring(v11)))
        };
    else
        local v12 = table.pack(...);
        local v13 = {};
        for _, v15 in ipairs(v12) do
            if if type(v15) == "table" and v15[v5.isPredicate] then not v1.is(v15) else nil then
                table.insert(v13, v15.predicate);
            else
                table.insert(v13, function(v16) --[[ Line: 9 ]]
                    -- upvalues: v15 (copy)
                    return v16 == v15;
                end);
            end;
        end;
        local v17, v18 = v3.predicates(v11, table.unpack(v13));
        return {
            pass = v17, 
            message = v17 and string.format("Expected %s to never have been called with args: %s", tostring(v11), v4(v12)) or string.format("Expected %s to have been called with args: %s", tostring(v11), v18)
        };
    end;
end;