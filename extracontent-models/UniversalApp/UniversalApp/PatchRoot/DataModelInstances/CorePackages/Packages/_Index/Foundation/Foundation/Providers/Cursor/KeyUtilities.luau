local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.ColorMode);
local v2 = require(l_script_FirstAncestor_0.Enums.CursorType);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local _ = require(l_script_FirstAncestor_0.Components.Types);
return {
    encodeKey = function(v5, v6, v7, v8, v9) --[[ Line: 11 ]] --[[ Name: encodeKey ]]
        -- upvalues: v1 (copy)
        local v10 = v6 or UDim.new(0, 0);
        local l_Thicker_0 = v5.Stroke.Thicker;
        local v12 = v8 or l_Thicker_0;
        local v13 = (v7 or v5.Size.Size_150) - v12;
        local v14 = v9 or v1.Color;
        return v10.Scale .. " " .. v10.Offset .. " " .. v13 .. " " .. v12 .. " " .. v14;
    end, 
    decodeKey = function(v15) --[[ Line: 27 ]]
        local v16 = if typeof(v15) == "string" then string.split(v15, " ") else v15;
        local v17 = tonumber(v16[1]);
        local v18 = tonumber(v16[2]);
        local v19 = tonumber(v16[3]);
        local v20 = tonumber(v16[4]);
        local v21 = v16[5];
        return UDim.new(v17, (math.max(0, v18 + v19))), v19, v20, v21;
    end, 
    encodeCursorTypeKey = function(v22, v23) --[[ Line: 40 ]] --[[ Name: encodeCursorTypeKey ]]
        -- upvalues: v1 (copy)
        return v22 .. " " .. (v23 or v1.Color);
    end, 
    decodeCursorTypeKey = function(v24) --[[ Line: 45 ]] --[[ Name: decodeCursorTypeKey ]]
        local v25 = if typeof(v24) == "string" then string.split(v24, " ") else v24;
        return v25[1], v25[2];
    end, 
    migrateCursorType = function(v26) --[[ Line: 52 ]] --[[ Name: migrateCursorType ]]
        -- upvalues: v2 (copy)
        local v27 = tostring(v26);
        return v2[string.gsub(v27, v27:find("Kind") and "CursorKind%." or "CursorType%.", "")];
    end, 
    mapCursorToKey = function(v28, v29) --[[ Line: 58 ]] --[[ Name: mapCursorToKey ]]
        -- upvalues: v1 (copy), v2 (copy)
        local _ = nil;
        if typeof(v28) == "table" then
            local l_radius_0 = v28.radius;
            local l_offset_0 = v28.offset;
            local l_borderWidth_0 = v28.borderWidth;
            local v34 = l_radius_0 or UDim.new(0, 0);
            local l_Thicker_1 = v29.Stroke.Thicker;
            local v36 = l_borderWidth_0 or l_Thicker_1;
            local v37 = (l_offset_0 or v29.Size.Size_150) - v36;
            local l_Color_0 = v1.Color;
            return v34.Scale .. " " .. v34.Offset .. " " .. v37 .. " " .. v36 .. " " .. l_Color_0;
        elseif v28 == nil then
            local v39 = UDim.new(0, 0);
            local l_Thicker_2 = v29.Stroke.Thicker;
            local v41 = v29.Size.Size_150 - l_Thicker_2;
            local l_Color_1 = v1.Color;
            return v39.Scale .. " " .. v39.Offset .. " " .. v41 .. " " .. l_Thicker_2 .. " " .. l_Color_1;
        elseif typeof(v28) == "userdata" then
            local v43 = tostring(v28);
            return v2[string.gsub(v43, v43:find("Kind") and "CursorKind%." or "CursorType%.", "")] .. " " .. v1.Color;
        else
            return v28 .. " " .. v1.Color;
        end;
    end
};