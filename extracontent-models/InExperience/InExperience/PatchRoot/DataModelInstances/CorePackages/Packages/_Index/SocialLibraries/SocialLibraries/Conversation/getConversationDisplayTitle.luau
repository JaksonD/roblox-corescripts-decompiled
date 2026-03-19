return function(v0) --[[ Line: 1 ]]
    if v0 then
        local v1 = v0.title or v0.titleForViewer;
        if v1 then
            local v2 = tostring(v1);
            return string.gsub(v2, "\n", "");
        end;
    end;
    return "";
end;