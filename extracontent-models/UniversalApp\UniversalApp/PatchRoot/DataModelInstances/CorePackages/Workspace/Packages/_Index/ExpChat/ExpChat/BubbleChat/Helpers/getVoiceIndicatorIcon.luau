return function(v0, v1, v2, v3) --[[ Line: 1 ]]
    if v0 then
        if v1 == "Muted" or v1 == "LOCAL_MUTED" then
            return v0("Muted", v3);
        elseif v1 == "Connecting" then
            return v0("Connecting", v3);
        elseif v1 == "Inactive" then
            return v0("Unmuted0", v3);
        elseif v1 == "Talking" then
            return v0("Unmuted" .. tostring(math.floor(0.5 + 5 * v2) * 20), v3);
        else
            return v0("Error", v3);
        end;
    else
        return "";
    end;
end;