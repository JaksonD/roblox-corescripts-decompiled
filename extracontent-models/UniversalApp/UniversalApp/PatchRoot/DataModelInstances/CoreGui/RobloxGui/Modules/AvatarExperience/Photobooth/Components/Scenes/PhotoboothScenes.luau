local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Foundation);
local l_Grid_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).GridComponents.Grid;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_Modules_0.AvatarExperience.Photobooth.Components.Scenes.usePhotoboothScenesProps);
return function(v7) --[[ Line: 14 ]] --[[ Name: PhotoboothScenes ]]
    -- upvalues: l_useLocalization_0 (copy), v2 (copy), v3 (copy), l_Grid_0 (copy)
    local v8 = l_useLocalization_0({
        Scenes = "Feature.Avatar.Label.Scenes"
    });
    local v14 = v2.useMemo(function() --[[ Line: 19 ]]
        -- upvalues: v7 (copy)
        local v9 = {};
        for _, v11 in v7.scenes do
            table.insert(v9, v11);
        end;
        table.sort(v9, function(v12, v13) --[[ Line: 24 ]]
            return v12.order < v13.order;
        end);
        return v9;
    end, {
        v7.scenes
    });
    return v2.createElement(v3.View, {
        tag = "col gap-small", 
        backgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = v7.position, 
        LayoutOrder = 1, 
        onAbsoluteSizeChanged = v7.onContainerSizeChanged
    }, {
        Heading = v2.createElement(v3.Text, {
            tag = "text-color-primary text-heading-medium text-align-x-left text-align-y-top auto-xy", 
            Text = v8.Scenes, 
            LayoutOrder = 1
        }), 
        ScrollViewContainer = v2.createElement(v3.View, {
            tag = "grow-1 size-full-0", 
            LayoutOrder = 2
        }, {
            ScenesScrollContainer = v2.createElement("ScrollingFrame", {
                Size = UDim2.new(1, 0, 1, 0), 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                ScrollBarThickness = 0, 
                VerticalScrollBarInset = Enum.ScrollBarInset.None, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0
            }, {
                ScenesGrid = v2.createElement(l_Grid_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    items = v14, 
                    itemsPerRow = v7.itemsPerRow, 
                    renderItem = v7.renderSceneItem, 
                    getItemId = v7.getSceneId, 
                    gapVertical = v7.tokens.Gap.Medium, 
                    gapHorizontal = v7.tokens.Gap.Medium
                })
            })
        })
    });
end;