local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v2 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_SendGameImpressions_0 = require(l_CorePackages_0.Workspace.Packages.GameCollections).SendGameImpressions;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Foundation);
local v6 = require(l_CorePackages_0.Workspace.Packages.Localization);
local v7 = require(script.Parent.useNextUpSort);
local v8 = require(script.Parent.NextUpTile);
local v9 = require(script.Parent.NextUpState);
local v10 = require(script.Parent.Flags.FFlagEnableNextUpImageLatencyTelemetry);
local v11 = require(script.Parent.Flags.FFlagEnableInGameExitModalNextUpUiRequestCache);
local v12 = require(script.Parent.Flags.FFlagInGameExitModalFixModalPadding);
local l_useRoactService_0 = v1.useRoactService;
local l_AppEventIngestService_0 = v2.AppEventIngestService;
local l_RoactAnalytics_0 = v2.RoactAnalytics;
local l_View_0 = v5.View;
local l_Text_0 = v5.Text;
local l_Divider_0 = v5.Divider;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_useLocalization_0 = v6.Hooks.useLocalization;
local function v22(v21) --[[ Line: 32 ]] --[[ Name: tilePairComponent ]]
    -- upvalues: v4 (copy), l_View_0 (copy)
    return v4.createElement(l_View_0, {
        tag = "row flex-x-fill auto-y gap-medium no-wrap align-x-center", 
        Size = UDim2.fromOffset(v21.tilePairWidth, 0), 
        LayoutOrder = v21.LayoutOrder
    }, v21.children);
end;
local function v26(v23) --[[ Line: 40 ]] --[[ Name: getImpressionIndices ]]
    local v24 = {};
    for v25 = 1, math.min(4, #v23) do
        table.insert(v24, v23[v25].uiIndex);
    end;
    return v24;
end;
return v4.memo(function(v27) --[[ Line: 58 ]] --[[ Name: NextUpComponent ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v11 (copy), v7 (copy), v4 (copy), l_SendGameImpressions_0 (copy), v10 (copy), v9 (copy), v26 (copy), v8 (copy), l_Divider_0 (copy), l_View_0 (copy), v12 (copy), l_Text_0 (copy), v22 (copy)
    local v28 = l_useRoactService_0(l_AppEventIngestService_0);
    local v29 = l_useRoactService_0(l_RoactAnalytics_0);
    local v30 = l_useTokens_0();
    local v31 = l_useLocalization_0({
        NextUpHeader = "CoreScripts.InGameMenu.NextUpExitMenu.Title"
    });
    local v32 = if v11 then v27.nextUpSort else v7();
    local l_data_0 = v32.data;
    local l_loading_0 = v32.loading;
    local v38 = v4.useCallback(function(v35, v36, v37) --[[ Line: 73 ]]
        -- upvalues: l_SendGameImpressions_0 (ref), v28 (copy), v29 (copy)
        l_SendGameImpressions_0.sendFromInGameExitModal(v28, v29, v37, v35, v36);
    end, {
        v28, 
        v29
    });
    if v10 then
        v4.useEffect(function() --[[ Line: 86 ]]
            -- upvalues: v9 (ref)
            v9.nextUpComponentShown();
            return function() --[[ Line: 89 ]]
                -- upvalues: v9 (ref)
                v9.resetNextUpLatencyTelemetry();
            end;
        end, {});
    end;
    local v39, v40 = v4.useState(false);
    local v41, v42 = v4.useState(nil);
    v4.useEffect(function() --[[ Line: 98 ]]
        -- upvalues: l_data_0 (copy), v42 (copy), v26 (ref), v40 (copy), v10 (ref), v9 (ref)
        if not l_data_0 then
            return;
        else
            v42((v26(l_data_0.entries)));
            v40(false);
            if v10 then
                v9.nextUpComponentSortDataLoaded();
            else
                v9.setNextUpTilesLoaded(true);
            end;
            return function() --[[ Line: 111 ]]
                -- upvalues: v42 (ref), v10 (ref), v9 (ref)
                v42(nil);
                if not v10 then
                    v9.setNextUpTilesLoaded(false);
                end;
            end;
        end;
    end, {
        l_data_0
    });
    v4.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: l_data_0 (copy), v41 (copy), v39 (copy), v40 (copy), v38 (copy)
        if not l_data_0 or not v41 then
            return;
        elseif v39 then
            return;
        else
            v40(true);
            v38(v41, l_data_0.entries, l_data_0.topicId);
            return;
        end;
    end, {
        l_data_0, 
        v41, 
        v39, 
        v38
    });
    local v45 = v4.useCallback(function(v43) --[[ Line: 140 ]]
        -- upvalues: l_data_0 (copy), v4 (ref), v8 (ref), v10 (ref), v9 (ref)
        local v44 = if l_data_0 then l_data_0.entries[v43] else nil;
        return v4.createElement(v8, {
            entryData = v44, 
            topicId = if l_data_0 then l_data_0.topicId else "", 
            positionIndex = v43, 
            onTileImageLoaded = v10 and v44 and function() --[[ Line: 147 ]]
                -- upvalues: v9 (ref), v43 (copy)
                v9.nextUpTileImageTextureLoaded(v43);
            end or nil
        });
    end, {
        l_data_0
    });
    if not l_data_0 and not l_loading_0 then
        return v4.None;
    else
        return v4.createElement(v4.Fragment, nil, {
            divider = v4.createElement(l_Divider_0, {
                LayoutOrder = 2
            }), 
            nextUpSection = v4.createElement(l_View_0, {
                tag = v12 and "size-full-0 auto-y col gap-large" or "size-full-0 auto-y col gap-xxlarge", 
                LayoutOrder = 3
            }, {
                header = v4.createElement(l_View_0, {
                    tag = "size-full-0 auto-y row align-x-left gap-small", 
                    LayoutOrder = 1
                }, {
                    text = v4.createElement(l_Text_0, {
                        tag = "text-heading-small text-wrap auto-xy shrink", 
                        Text = v31.NextUpHeader, 
                        textStyle = v30.Color.Extended.White.White_100
                    })
                }), 
                rowContainer = v4.createElement(l_View_0, {
                    tag = "size-full-0 auto-y row gap-medium wrap align-x-center flex-x-fill", 
                    LayoutOrder = 2
                }, {
                    tilesSection1 = v4.createElement(v22, {
                        LayoutOrder = 1, 
                        tilePairWidth = v27.tilePairWidth
                    }, {
                        tile1 = v45(1), 
                        tile2 = v45(2)
                    }), 
                    tilesSection2 = v4.createElement(v22, {
                        LayoutOrder = 2, 
                        tilePairWidth = v27.tilePairWidth
                    }, {
                        tile3 = v45(3), 
                        tile4 = v45(4)
                    })
                })
            })
        });
    end;
end);