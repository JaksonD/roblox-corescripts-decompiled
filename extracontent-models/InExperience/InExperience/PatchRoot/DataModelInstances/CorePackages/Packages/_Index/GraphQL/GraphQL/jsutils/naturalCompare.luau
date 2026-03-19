local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Number_0 = v1.Number;
local l_String_0 = v1.String;
local l_isNaN_0 = l_Number_0.isNaN;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local function v16(v8, v9) --[[ Line: 23 ]] --[[ Name: naturalCompare ]]
    -- upvalues: l_String_0 (copy), v5 (ref), v6 (ref)
    local v10 = 1;
    local v11 = 1;
    while true do
        if v10 <= #v8 and v11 <= #v9 then
            local v12 = l_String_0.charCodeAt(v8, v10);
            local v13 = l_String_0.charCodeAt(v9, v11);
            if v5(v12) and v5(v13) then
                local v14 = 0;
                repeat
                    v10 = v10 + 1;
                    v14 = v14 * 10 + v12 - v6;
                    v12 = l_String_0.charCodeAt(v8, v10);
                until not v5(v12) or v14 <= 0;
                local v15 = 0;
                repeat
                    v11 = v11 + 1;
                    v15 = v15 * 10 + v13 - v6;
                    v13 = l_String_0.charCodeAt(v9, v11);
                until not v5(v13) or v15 <= 0;
                if v14 < v15 then
                    return -1;
                elseif v15 < v14 then
                    return 1;
                end;
            elseif v12 < v13 then
                return -1;
            elseif v13 < v12 then
                return 1;
            else
                v10 = v10 + 1;
                v11 = v11 + 1;
            end;
        else
            return #v8 - #v9;
        end;
    end;
end;
v6 = 48;
v7 = 57;
v5 = function(v17) --[[ Line: 71 ]]
    -- upvalues: l_isNaN_0 (copy), v6 (ref), v7 (ref)
    return not l_isNaN_0(v17) and v6 <= v17 and v17 <= v7;
end;
return {
    naturalCompare = v16
};