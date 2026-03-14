local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("PlayWithRewardState").Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v3 = require(l_Parent_0.t);
local v4 = v3.interface({
    layoutOrder = v3.number, 
    titleText = v3.string, 
    subtitleText = v3.string, 
    buttonText = v3.string
});
local v5 = {};
local v6 = {
    layoutOrder = 0, 
    titleText = "", 
    subtitleText = "", 
    buttonText = ""
};
v5.fromJsonData = function(v7) --[[ Line: 30 ]] --[[ Name: fromJsonData ]]
    -- upvalues: v6 (copy), l_HttpService_0 (copy), v4 (copy), l_mutedError_0 (copy)
    local v8 = table.clone(v6);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 33 ]]
        -- upvalues: l_HttpService_0 (ref), v7 (copy)
        return l_HttpService_0:JSONDecode(v7);
    end);
    if l_status_0 then
        local v11, v12 = v4(l_result_0);
        if not v11 then
            l_mutedError_0((("PlayWithRewardExperimentData invalid: %*"):format((tostring(v12)))));
            return v8;
        else
            v8.layoutOrder = l_result_0.layoutOrder;
            v8.titleText = l_result_0.titleText;
            v8.subtitleText = l_result_0.subtitleText;
            v8.buttonText = l_result_0.buttonText;
        end;
    end;
    return v8;
end;
return v5;