local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.WidgetEventImpressionsReporter);
local l_ScreenSizeImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsDetector;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v8 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_Grid_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_FFlagAXFixSeeAllSpacing_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixSeeAllSpacing;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v13 = {};
return function(v14) --[[ Line: 47 ]] --[[ Name: WidgetLoadableGridView ]]
    -- upvalues: v8 (copy), v4 (copy), v2 (copy), l_Signal_0 (copy), l_useTokens_0 (copy), l_ScreenSizeImpressionsDetector_0 (copy), v13 (copy), l_UnifiedEventLogEnums_0 (copy), v5 (copy), l_Grid_0 (copy), l_FFlagAXFixSeeAllSpacing_0 (copy)
    local l_widgetInfo_0 = v14.widgetInfo;
    local v16 = v8(v4);
    local v17 = v2.useRef(l_Signal_0.new());
    local v18 = v2.useRef(nil);
    local v19 = l_useTokens_0();
    v2.useEffect(function() --[[ Line: 55 ]]
        -- upvalues: v18 (copy), v17 (copy)
        local v20 = nil;
        if v18.current then
            v20 = v18.current:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 59 ]]
                -- upvalues: v17 (ref)
                v17.current:fire();
            end);
        end;
        v17.current:fire();
        return function() --[[ Line: 66 ]]
            -- upvalues: v20 (ref)
            if v20 then
                v20:Disconnect();
            end;
        end;
    end, {});
    local v27 = v2.createElement(l_ScreenSizeImpressionsDetector_0, {
        onRequestImpressionsSignal = v17.current, 
        onImpressionsDetected = function(v21) --[[ Line: 75 ]] --[[ Name: onImpressionsDetected ]]
            -- upvalues: v14 (copy), v13 (ref), l_widgetInfo_0 (copy), l_UnifiedEventLogEnums_0 (ref), v5 (ref), v16 (copy)
            for _, v23 in v21 do
                local v24 = v14.widgetInfo.id .. "_" .. v23;
                if not v13[v24] then
                    local v25 = l_widgetInfo_0.content and l_widgetInfo_0.content[v23] or {};
                    local v26 = {
                        widgetId = v14.widgetInfo.id, 
                        itemPosition = v23, 
                        itemId = v25.id, 
                        itemType = v25.type, 
                        uiTreatmentType = l_UnifiedEventLogEnums_0.WidgetUiTreatment.WIDGET_SEE_ALL
                    };
                    v5(v16, v26);
                    v13[v24] = true;
                end;
            end;
        end, 
        impressionsTag = v14.impressionsTag
    });
    local v31 = v2.createElement(l_Grid_0, {
        itemsPerRow = v14.itemsPerRow or 1, 
        renderItem = function(v28) --[[ Line: 97 ]] --[[ Name: renderItem ]]
            -- upvalues: v14 (copy)
            local l_item_0 = v28.item;
            return v14.renderItem({
                id = l_item_0.id, 
                type = l_item_0.type, 
                gridInformation = v28.gridInformation
            }, v28.index);
        end, 
        getItemId = function(v30) --[[ Line: 104 ]] --[[ Name: getItemId ]]
            -- upvalues: v14 (copy)
            return v30.id .. v14.itemsPerRow;
        end, 
        items = v14.items or {}, 
        gapVertical = if l_FFlagAXFixSeeAllSpacing_0 then v19.Gap.Medium else v19.Gap.Large, 
        gapHorizontal = if l_FFlagAXFixSeeAllSpacing_0 then v19.Gap.Medium else v19.Gap.Small, 
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        ref = v18
    });
    return v2.createElement(v2.Fragment, {}, {
        GridView = v31, 
        ImpressionsDetector = v27
    });
end;