local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Roact;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Resources.Controls);
local v4 = require(script.Parent.Parent.ControlLayoutContainer);
local v5 = require(l_Parent_0.Components.PaddedScrollFrame);
local v6 = require(script.Parent.Parent.ControlEntry);
local v7 = require(script.Parent.Parent.ControlEntryHeader);
return function(_) --[[ Line: 26 ]] --[[ Name: KeyboardControls ]]
    -- upvalues: l_Roact_0 (copy), v3 (copy), v7 (copy), v6 (copy), v4 (copy), v5 (copy)
    local v9 = {
        ListLayout = l_Roact_0.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 95), 
            PaddingRight = UDim.new(0, 95)
        }), 
        SizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(1090, 1e999), 
            MinSize = Vector2.new(150, 0)
        })
    };
    local v10 = 0;
    local v11 = 0;
    local v12 = 1;
    for _, v14 in ipairs(v3.keybinds) do
        local l_title_0 = v14.title;
        v10 = v10 + 1;
        v9[l_title_0 .. "_header"] = l_Roact_0.createElement(v7, {
            title = l_title_0, 
            LayoutOrder = v12
        });
        v12 = v12 + 1;
        for v16, v17 in ipairs(v14.controls) do
            v11 = v11 + 1;
            v9[l_title_0 .. "_" .. v16] = l_Roact_0.createElement(v6, {
                LayoutOrder = v12, 
                actionDescription = v17.desc, 
                inputs = v17.inputs, 
                isList = v17.list, 
                hasDivider = v16 ~= #v14.controls
            });
            v12 = v12 + 1;
        end;
    end;
    local v18 = v10 * 45 + v11 * 50;
    return l_Roact_0.createElement(v4, {
        titleText = "CoreScripts.InGameMenu.Controls.KeyboardAndMouseTitle"
    }, {
        ScrollContent = l_Roact_0.createElement(v5, {
            CanvasSize = UDim2.new(0, 0, 0, v18), 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            Size = UDim2.new(1, 0, 1, -130)
        }, {
            ListContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0)
            }, v9)
        })
    });
end;