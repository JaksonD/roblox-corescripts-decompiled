local l_AppStorageService_0 = game:GetService("AppStorageService");
local v1 = require(script.Parent.CsatSurveyConstants);
local v2 = {
    BASELINE = "v10.1", 
    CLOSED_SELF_VIEW = "v10.2"
};
canShowChromeSurvey = function(v3) --[[ Line: 14 ]] --[[ Name: canShowChromeSurvey ]]
    -- upvalues: v2 (copy)
    if v3 == "" or v3 == nil then
        return false;
    else
        local v4 = getCurrentMenuVersion();
        local v5 = false;
        for _, v7 in v2 do
            if v3 == v7 and v3 == v4 then
                v5 = true;
                break;
            end;
        end;
        local v8 = false;
        if v3 == "v10.0" then
            v8 = v3 == v4;
        end;
        return v5 or v8;
    end;
end;
getCurrentMenuVersion = function() --[[ Line: 36 ]] --[[ Name: getCurrentMenuVersion ]]
    -- upvalues: l_AppStorageService_0 (copy), v1 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 38 ]]
        -- upvalues: l_AppStorageService_0 (ref), v1 (ref)
        return l_AppStorageService_0:GetItem(v1.LOCAL_STORAGE_KEY_EXPERIENCE_MENU_VERSION);
    end);
    if l_status_0 and l_result_0 ~= "" then
        return l_result_0;
    else
        return "";
    end;
end;
return {
    canShowChromeSurvey = canShowChromeSurvey
};