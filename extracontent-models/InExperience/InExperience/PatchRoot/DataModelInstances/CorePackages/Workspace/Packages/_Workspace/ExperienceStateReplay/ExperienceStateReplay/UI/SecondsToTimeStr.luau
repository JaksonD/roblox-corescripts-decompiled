return {
    convertSecondsToTimeStr = function(v0) --[[ Line: 3 ]] --[[ Name: convertSecondsToTimeStr ]]
        local v1 = math.round(v0) % 60;
        local v2 = math.round(v0) // 60 % 60;
        local v3 = math.round(v0) // 60 // 60 // 24;
        return string.format("%02d", v3) .. ":" .. string.format("%02d", v2) .. ":" .. string.format("%02d", v1);
    end
};