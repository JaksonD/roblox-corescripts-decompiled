local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent;
local l_charCodeAt_0 = require(l_Parent_0.String).charCodeAt;
local v3 = require(script.Parent.Error);
return function(v4) --[[ Line: 25 ]] --[[ Name: encodeURIComponent ]]
    -- upvalues: l_charCodeAt_0 (copy), v3 (copy), l_HttpService_0 (copy)
    local v5 = utf8.len(v4);
    if v5 == 0 or v5 == nil then
        return "";
    else
        local v6 = l_charCodeAt_0(v4, 1);
        if v5 == 1 then
            if v6 == 55296 then
                error(v3.new("URI malformed"));
            end;
            if v6 == 57343 then
                error(v3.new("URI malformed"));
            end;
        end;
        if v6 >= 56320 and v6 < 57343 then
            error(v3.new("URI malformed"));
        end;
        return (l_HttpService_0:UrlEncode(v4):gsub("%%2D", "-"):gsub("%%5F", "_"):gsub("%%2E", "."):gsub("%%21", "!"):gsub("%%7E", "~"):gsub("%%2A", "*"):gsub("%%27", "'"):gsub("%%28", "("):gsub("%%29", ")"));
    end;
end;