getIconSrc = function(v0, v1) --[[ Line: 4 ]] --[[ Name: getIconSrc ]]
    return "rbxasset://textures/ui/VoiceChat/" .. (v1 and v1 .. "/" or "") .. v0 .. ".png";
end;
return function(v2, v3, v4) --[[ Line: 9 ]]
    if v2 == "Unmuted" then
        local v5 = math.floor(0.5 + 5 * (v4 or math.random())) * 20;
        return v4 and getIconSrc("Unmuted" .. tostring(v5), v3) or getIconSrc("Blank", v3);
    else
        return getIconSrc(v2, v3);
    end;
end;