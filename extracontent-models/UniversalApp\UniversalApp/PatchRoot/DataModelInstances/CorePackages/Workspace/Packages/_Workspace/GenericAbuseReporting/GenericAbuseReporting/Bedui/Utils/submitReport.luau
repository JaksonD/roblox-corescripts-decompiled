local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local l_HttpService_0 = game:GetService("HttpService");
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_FFlagAddThumbnailSelectorReport_0 = require(l_Parent_0.SharedFlags).FFlagAddThumbnailSelectorReport;
return function(v4, v5) --[[ Line: 9 ]]
    -- upvalues: l_FFlagAddThumbnailSelectorReport_0 (copy), l_HttpService_0 (copy), l_Url_0 (copy)
    if l_FFlagAddThumbnailSelectorReport_0 and v5 == nil then
        v5 = {};
    end;
    local v6 = {
        tags = {}
    };
    for v7, v8 in v5 do
        if typeof(v8) ~= "table" then
            v8 = if l_FFlagAddThumbnailSelectorReport_0 then tostring(v8):split(",") else {
                (tostring(v8))
            };
        end;
        local v9 = {};
        for _, v11 in v8 do
            table.insert(v9, {
                data = tostring(v11)
            });
        end;
        v6.tags[v7] = {
            valueList = v9
        };
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 46 ]]
        -- upvalues: l_HttpService_0 (ref), v6 (copy)
        return l_HttpService_0:JSONEncode(v6);
    end);
    if not l_status_0 then
        warn("Failed to encode report data");
    end;
    return v4(l_Url_0.APIS_URL .. "abuse-reporting/v2/abuse-report", "POST", {
        postBody = l_result_0
    });
end;