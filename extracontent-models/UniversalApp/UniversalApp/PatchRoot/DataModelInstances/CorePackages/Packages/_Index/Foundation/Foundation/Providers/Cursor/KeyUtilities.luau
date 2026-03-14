local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v2 = require(l_script_FirstAncestor_0.Enums.CursorType);
local v3 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v16(v6, v7, v8, v9, v10) --[[ Line: 12 ]] --[[ Name: encodeKey ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v11 = v7 or UDim.new(0, 0);
    local l_Thicker_0 = v6.Stroke.Thicker;
    local v13 = v9 or l_Thicker_0;
    local v14 = (v8 or v6.Size.Size_150) - v13;
    local v15 = v10 or v1.Color;
    if v3.FoundationSupportPresentationContextInSelectionCursor then
        return v11.Scale .. " " .. v11.Offset .. " " .. v14 .. " " .. v13 .. " " .. v15;
    else
        return v11.Scale .. " " .. v11.Offset .. " " .. v14 .. " " .. v13;
    end;
end;
return {
    encodeKey = v16, 
    decodeKey = function(v17) --[[ Line: 30 ]]
        local v18 = if typeof(v17) == "string" then string.split(v17, " ") else v17;
        local v19 = tonumber(v18[1]);
        local v20 = tonumber(v18[2]);
        local v21 = tonumber(v18[3]);
        local v22 = tonumber(v18[4]);
        local v23 = v18[5];
        return UDim.new(v19, (math.max(0, v20 + v21))), v21, v22, v23;
    end, 
    encodeCursorTypeKey = function(v24, v25) --[[ Line: 43 ]] --[[ Name: encodeCursorTypeKey ]]
        -- upvalues: v1 (copy)
        return v24 .. " " .. (v25 or v1.Color);
    end, 
    decodeCursorTypeKey = function(v26) --[[ Line: 48 ]] --[[ Name: decodeCursorTypeKey ]]
        local v27 = if typeof(v26) == "string" then string.split(v26, " ") else v26;
        return v27[1], v27[2];
    end, 
    migrateCursorType = function(v28) --[[ Line: 55 ]] --[[ Name: migrateCursorType ]]
        -- upvalues: v2 (copy)
        local v29 = tostring(v28);
        return v2[string.gsub(v29, v29:find("Kind") and "CursorKind%." or "CursorType%.", "")];
    end, 
    mapCursorToKey = function(v30, v31) --[[ Line: 61 ]] --[[ Name: mapCursorToKey ]]
        -- upvalues: v16 (copy), v3 (copy), v2 (copy), v1 (copy)
        local _ = nil;
        if typeof(v30) == "table" then
            return (v16(v31, v30.radius, v30.offset, v30.borderWidth));
        elseif v30 == nil then
            return (v16(v31));
        elseif typeof(v30) == "userdata" then
            if v3.FoundationSupportPresentationContextInSelectionCursor then
                local v33 = tostring(v30);
                return v2[string.gsub(v33, v33:find("Kind") and "CursorKind%." or "CursorType%.", "")] .. " " .. v1.Color;
            else
                local v34 = tostring(v30);
                return v2[string.gsub(v34, v34:find("Kind") and "CursorKind%." or "CursorType%.", "")];
            end;
        elseif v3.FoundationSupportPresentationContextInSelectionCursor then
            return v30 .. " " .. v1.Color;
        else
            return v30;
        end;
    end
};