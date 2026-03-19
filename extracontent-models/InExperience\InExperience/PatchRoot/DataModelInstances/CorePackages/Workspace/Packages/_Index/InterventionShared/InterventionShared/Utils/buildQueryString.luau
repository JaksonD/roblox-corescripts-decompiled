local l_HttpService_0 = game:GetService("HttpService");
return function(v1) --[[ Line: 10 ]] --[[ Name: buildQueryString ]]
    -- upvalues: l_HttpService_0 (copy)
    local v2 = {};
    for v3, v4 in pairs(v1) do
        table.insert(v2, string.format("%s=%s", l_HttpService_0:UrlEncode((tostring(v3))), l_HttpService_0:UrlEncode((tostring(v4)))));
    end;
    if #v2 == 0 then
        return "";
    else
        return "?" .. table.concat(v2, "&");
    end;
end;