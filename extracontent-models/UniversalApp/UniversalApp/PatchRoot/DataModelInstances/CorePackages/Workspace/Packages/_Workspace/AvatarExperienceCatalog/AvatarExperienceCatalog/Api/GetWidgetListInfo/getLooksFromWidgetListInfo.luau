local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.LuauPolyfill);
local v4 = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo);
local v5 = require(script.Parent.constants);
local _ = require(l_script_FirstAncestor_0.Models.WidgetListInfo);
local v7 = require(l_script_FirstAncestor_0.Utils.makeAXResponseHandler);
local _ = require(l_Parent_0.AvatarExperienceCommon);
local l_FFlagAXLooksWidgetContextForOrganicContent_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXLooksWidgetContextForOrganicContent;
return function(v10, v11, v12, v13) --[[ Line: 21 ]] --[[ Name: getLooksFromWidgetListInfo ]]
    -- upvalues: l_FFlagAXLooksWidgetContextForOrganicContent_0 (copy), l_Url_0 (copy), v7 (copy), v4 (copy), v5 (copy)
    local v14 = "avatarTab";
    if l_FFlagAXLooksWidgetContextForOrganicContent_0 and v13 and v13.LooksWidgetContextForOrganicContent then
        v14 = v13.LooksWidgetContextForOrganicContent;
    end;
    local v15 = l_Url_0:makeQueryString({
        query = v12, 
        context = v14, 
        requestId = v11
    });
    local v16, v17 = v10(("%*marketplace-widgets/v1/widgets?%*"):format(l_Url_0.APIS_URL, v15), "GET");
    return v7(v16, v4, {
        modelMismatchCounter = v5.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME, 
        latencyCounter = v5.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
    }), v17;
end;