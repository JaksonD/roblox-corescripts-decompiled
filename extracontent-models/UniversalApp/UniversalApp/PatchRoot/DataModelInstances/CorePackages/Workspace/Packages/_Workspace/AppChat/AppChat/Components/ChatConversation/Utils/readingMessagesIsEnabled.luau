return function(v0) --[[ Line: 1 ]]
    if not v0 then
        return false;
    else
        return v0.getScreenProps("isVisible", false) or not v0.getScreenProps("wideMode", false);
    end;
end;