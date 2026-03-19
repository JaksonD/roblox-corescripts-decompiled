local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local _ = require(l_script_FirstAncestor_0.Models.WidgetListInfo);
return function(v2) --[[ Line: 11 ]] --[[ Name: getFooterVisibilityFromItemFooters ]]
    local v3 = {
        isCreatorNameVisible = false, 
        isTitleVisible = false, 
        isPriceVisible = false
    };
    if not v2 then
        return v3;
    else
        for _, v5 in v2 do
            if v5.contentType == "AgentName" then
                v3.isCreatorNameVisible = true;
            elseif v5.contentType == "Price" then
                v3.isPriceVisible = true;
            elseif v5.contentType == "ItemName" then
                v3.isTitleVisible = true;
            end;
        end;
        return v3;
    end;
end;