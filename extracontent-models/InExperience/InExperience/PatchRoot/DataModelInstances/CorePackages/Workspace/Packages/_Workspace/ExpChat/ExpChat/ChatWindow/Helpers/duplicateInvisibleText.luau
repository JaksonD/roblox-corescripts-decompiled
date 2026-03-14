local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.Config);
local v2 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatTcIndicator);
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: v1 (copy), v2 (copy)
    v4 = v4 or v1.ChatWindowFont;
    v5 = v5 or v1.ChatWindowTextSize;
    local l_v3_0 = v3;
    if v2 then
        l_v3_0 = string.gsub(l_v3_0, "transparency=[\"']%d%.?%d*[\"']", "transparency='1.0'");
    end;
    l_v3_0 = string.format("<font transparency='1.0' family='%s' weight='%s' size='%s'><stroke transparency='1.0'>%s</stroke></font>", v4.Family, string.gsub(tostring(v4.Weight), "Enum.FontWeight.", ""), v5, l_v3_0);
    if v4.Style == Enum.FontStyle.Italic then
        l_v3_0 = "<i>" .. l_v3_0 .. "</i>";
    end;
    return l_v3_0;
end;