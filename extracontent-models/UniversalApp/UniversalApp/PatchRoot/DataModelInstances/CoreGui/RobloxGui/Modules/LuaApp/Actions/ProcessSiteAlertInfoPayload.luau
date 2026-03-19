local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = {
    "%s(www%.[^%s]+)", 
    "%shttps?://([^%s]+)"
};
return v1(script.Name, function(v3) --[[ Line: 10 ]]
    -- upvalues: v2 (copy)
    assert(type(v3) == "table", string.format("UpdateSiteMessageBannerText action expects data to be a table, was %s", (type(v3))));
    local l_LinkUrl_0 = v3.LinkUrl;
    if l_LinkUrl_0 and #l_LinkUrl_0 == 0 then
        l_LinkUrl_0 = nil;
    end;
    if v3.Text and not l_LinkUrl_0 then
        for _, v6 in ipairs(v2) do
            local v7, _, v9 = string.find(v3.Text, v6);
            if v7 then
                l_LinkUrl_0 = "https://" .. v9;
            end;
        end;
    end;
    return {
        text = v3.Text, 
        visible = v3.IsVisible or false, 
        link = l_LinkUrl_0, 
        timestamp = v3.timestamp or nil
    };
end);