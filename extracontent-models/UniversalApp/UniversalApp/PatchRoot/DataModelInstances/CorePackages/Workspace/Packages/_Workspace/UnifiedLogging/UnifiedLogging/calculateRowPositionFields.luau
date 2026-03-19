local function _(v0, v1) --[[ Line: 1 ]] --[[ Name: calculateRowOnPage ]]
    if not v1 or typeof(v1) ~= "number" then
        return -1;
    else
        return v1 + v0 - 1;
    end;
end;
return function(v3, v4, v5) --[[ Line: 15 ]] --[[ Name: calculateRowPositionFields ]]
    if not v3 or typeof(v3) ~= "number" or v3 <= 0 or not v4 or typeof(v4) ~= "number" or v4 <= 0 then
        return {
            positionInRow = -1, 
            rowInSort = -1, 
            rowOnPage = -1
        };
    else
        local v6 = (v3 - 1) % v4 + 1;
        local v7 = math.ceil(v3 / v4);
        local v8 = (not v5 or typeof(v5) ~= "number") and -1 or v5 + v7 - 1;
        return {
            positionInRow = v6, 
            rowInSort = v7, 
            rowOnPage = v8
        };
    end;
end;