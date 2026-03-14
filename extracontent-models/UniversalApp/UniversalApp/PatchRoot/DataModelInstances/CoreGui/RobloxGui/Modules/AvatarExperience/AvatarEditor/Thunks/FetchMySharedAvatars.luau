local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v4 = require(l_CorePackages_0.Packages.Dash);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v6 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v7 = require(l_CorePackages_0.Packages.Promise);
local _ = require(l_CorePackages_0.Packages.LuauPolyfill);
local v9 = require(l_Modules_0.LuaApp.mutedError);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local v13 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v14 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v17 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWidgetInfo);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetResultsListFocusedWidget);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local l_MySharedAvatars_0 = v14.ContextWidgets.MySharedAvatars;
local function v21(v22, v23, v24, v25, v26, v27) --[[ Line: 39 ]] --[[ Name: makeGetMySharedAvatarsApiCall ]]
    -- upvalues: v12 (copy), v4 (copy), l_sendAXCounterV2_0 (copy), v15 (copy), v7 (copy), v14 (copy), v21 (copy), l_Logging_0 (copy)
    return v12.GetMySharedAvatars(v22, v23, v24 or ""):andThen(function(v28) --[[ Line: 47 ]]
        -- upvalues: v4 (ref), v25 (copy), v26 (copy), l_sendAXCounterV2_0 (ref), v15 (ref), v7 (ref), v14 (ref), v27 (copy), v21 (ref), v22 (copy), v23 (copy)
        local l_responseBody_0 = v28.responseBody;
        if not l_responseBody_0 or not l_responseBody_0.data or type(l_responseBody_0.data) ~= "table" then
            if #v4.keys(v25) > 0 or #v4.keys(v26) > 0 then
                l_sendAXCounterV2_0(v15.Counter.MySharedAvatars.FetchMySharedAvatarsError, {
                    StatusCode = "-206"
                });
                return v7.resolve(v25, v26);
            else
                l_sendAXCounterV2_0(v15.Counter.MySharedAvatars.FetchMySharedAvatarsError, {
                    StatusCode = "-204"
                });
                return v7.reject("No data returned from GetMySharedAvatars");
            end;
        else
            local l_data_0 = l_responseBody_0.data;
            if #l_data_0 < 1 then
                return v7.resolve(v25, v26);
            else
                for _, v32 in l_data_0 do
                    table.insert(v25, {
                        id = v32.lookId, 
                        type = v14.ContentType.Look
                    });
                    v26[v32.lookId] = {
                        assets = v32.assets, 
                        bundles = v32.bundles, 
                        id = v32.lookId, 
                        owned = true, 
                        lookType = v32.lookType, 
                        moderationStatus = v32.moderationStatus, 
                        displayProperties = v32.displayProperties, 
                        type = v14.ContentType.Look
                    };
                end;
                if l_responseBody_0.nextCursor then
                    l_sendAXCounterV2_0(v15.Counter.MySharedAvatars.FetchMySharedAvatarsNewPage, {
                        pageNum = tostring(v27)
                    });
                    return (v21(v22, v23, l_responseBody_0.nextCursor, v25, v26, v27 + 1));
                else
                    return v7.resolve(v25, v26);
                end;
            end;
        end;
    end, function(v33) --[[ Line: 100 ]]
        -- upvalues: l_Logging_0 (ref), l_sendAXCounterV2_0 (ref), v15 (ref), v4 (ref), v25 (copy), v26 (copy), v7 (ref)
        l_Logging_0.warn("WebApi failure in FetchMySharedAvatars: " .. tostring(v33));
        if v33 then
            l_sendAXCounterV2_0(v15.Counter.MySharedAvatars.FetchMySharedAvatarsError, {
                StatusCode = tostring(v33.StatusCode or -1)
            });
        end;
        if #v4.keys(v25) > 0 or #v4.keys(v26) > 0 then
            l_sendAXCounterV2_0(v15.Counter.MySharedAvatars.FetchMySharedAvatarsError, {
                StatusCode = "-207"
            });
            return v7.resolve(v25, v26);
        else
            return v7.reject(v33);
        end;
    end);
end;
return function(v34) --[[ Line: 120 ]] --[[ Name: FetchMySharedAvatars ]]
    -- upvalues: v6 (copy), l_PerformFetch_0 (copy), v11 (copy), v13 (copy), l_sendAXCounterV2_0 (copy), v15 (copy), v7 (copy), l_MySharedAvatars_0 (copy), v18 (copy), v21 (copy), v14 (copy), v17 (copy), v19 (copy), v9 (copy)
    v6.isType(v34, "function", "FetchMySharedAvatars thunk expects networkImpl to be a function");
    return l_PerformFetch_0.Single(v11.GetMySharedAvatarsKey, function(v35) --[[ Line: 123 ]]
        -- upvalues: v13 (ref), l_sendAXCounterV2_0 (ref), v15 (ref), v7 (ref), l_MySharedAvatars_0 (ref), v18 (ref), v21 (ref), v34 (copy), v14 (ref), v17 (ref), v19 (ref), v9 (ref)
        local v36 = v35:getState();
        local v37 = v13.getUserId(v36);
        if not v37 then
            l_sendAXCounterV2_0(v15.Counter.MySharedAvatars.FetchMySharedAvatarsError, {
                StatusCode = "-403"
            });
            return v7.reject("No userId found");
        else
            local v38 = nil;
            v38 = {
                title = l_MySharedAvatars_0.Title, 
                tooltip = l_MySharedAvatars_0.Tooltip
            };
            v35:dispatch(v18(l_MySharedAvatars_0.RequestId, l_MySharedAvatars_0.WidgetId, v38));
            return v21(v34, v37, nil, {}, {}, 1):andThen(function(v39, v40) --[[ Line: 150 ]]
                -- upvalues: l_MySharedAvatars_0 (ref), v14 (ref), v35 (copy), v17 (ref), v19 (ref)
                local v41 = {
                    [l_MySharedAvatars_0.Context] = {
                        content = v39, 
                        template = {
                            title = l_MySharedAvatars_0.Title, 
                            type = v14.Templates.ItemGroup
                        }, 
                        id = l_MySharedAvatars_0.WidgetId, 
                        requestId = l_MySharedAvatars_0.RequestId, 
                        type = v14.Types.MySharedAvatarsWidget
                    }
                };
                v35:dispatch(v17(v41, l_MySharedAvatars_0.RequestId, nil, l_MySharedAvatars_0.Context));
                v35:dispatch(v19({
                    [v14.ContentType.Look] = v40
                }));
            end):catch(function(v42) --[[ Line: 179 ]]
                -- upvalues: v9 (ref), v37 (copy), l_sendAXCounterV2_0 (ref), v15 (ref)
                v9(string.format("[AvatarExperience] Failed to fetch MySharedAvatars for user %s with error: %s", tostring(v37), (tostring(v42))));
                l_sendAXCounterV2_0(v15.Counter.MySharedAvatars.FetchMySharedAvatarsError, {
                    StatusCode = "-500"
                });
            end);
        end;
    end);
end;