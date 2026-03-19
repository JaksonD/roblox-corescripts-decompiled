local function _(v0) --[[ Line: 3 ]]
    local v1 = false;
    if v0.order ~= nil then
        v1 = not v0.moderated and not v0.failed;
    end;
    return v1;
end;
return function(v3, v4) --[[ Line: 7 ]]
    if v3.order and v4.order then
        return v3.order < v4.order;
    else
        local v5 = false;
        if v3.order ~= nil then
            v5 = not v3.moderated and not v3.failed;
        end;
        if not v5 then
            v5 = false;
            if v4.order ~= nil then
                v5 = not v4.moderated and not v4.failed;
            end;
            if not v5 then
                v5 = v3.sent and v3.sent:GetUnixTimestamp();
                local v6 = v4.sent and v4.sent:GetUnixTimestamp();
                if v5 and v6 and v5 ~= v6 then
                    return v5 < v6;
                elseif v3.id and v4.id and v3.id ~= v4.id then
                    return v3.id > v4.id;
                else
                    local v7 = true;
                    if v4.moderated ~= true then
                        v7 = v4.failed == true;
                    end;
                    return v7;
                end;
            end;
        end;
        v5 = false;
        if v4.order ~= nil then
            v5 = not v4.moderated and not v4.failed;
        end;
        return v5;
    end;
end;