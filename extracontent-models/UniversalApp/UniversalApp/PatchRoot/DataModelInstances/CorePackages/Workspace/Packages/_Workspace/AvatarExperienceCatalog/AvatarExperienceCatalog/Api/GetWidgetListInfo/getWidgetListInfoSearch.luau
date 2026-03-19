local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceCatalog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local _ = require(l_Parent_0.LuauPolyfill);
local v4 = require(script.Parent.normalizeWidgetListInfoResponseToWidgetListInfo);
local v5 = require(script.Parent.constants);
local _ = require(l_script_FirstAncestor_0.Models.WidgetListInfo);
local v7 = require(l_script_FirstAncestor_0.Utils.makeAXResponseHandler);
return function(v8, v9, v10) --[[ Line: 16 ]] --[[ Name: getWidgetListInfoSearch ]]
    -- upvalues: l_Url_0 (copy), v7 (copy), v4 (copy), v5 (copy)
    local v11 = l_Url_0:makeQueryString({
        requestId = v9, 
        query = v10
    });
    local v12, v13 = v8(("%*marketplace-widgets/v1/widgets/search?%*"):format(l_Url_0.APIS_URL, v11), "GET");
    return v7(v12, v4, {
        modelMismatchCounter = v5.FETCH_WIDGET_INFO_MODEL_MISMATCH_COUNTER_NAME, 
        latencyCounter = v5.FETCH_WIDGET_INFO_LATENCY_COUNTER_NAME
    }), v13;
end;