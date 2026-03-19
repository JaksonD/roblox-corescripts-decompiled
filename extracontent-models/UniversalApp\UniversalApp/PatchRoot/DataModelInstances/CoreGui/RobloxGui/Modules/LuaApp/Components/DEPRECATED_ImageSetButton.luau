local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Immutable);
local l_GetImageSetData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageSetData;
local v6 = require(l_CorePackages_0.Packages.BuilderIcons);
local v7 = require(l_Modules_0.LuaApp.Components.BuilderIconMigration);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = v3.PureComponent:extend("ImageSetButton");
local l_luaApps_0 = v6.Migration.luaApps;
v9.render = function(v11) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_GetImageSetData_0 (copy), l_GuiService_0 (copy), v4 (copy), v3 (copy)
    local v12, v13 = l_GetImageSetData_0(l_GuiService_0:GetResolutionScale());
    local v14 = v12[v11.props.Image];
    if not v14 then
        local l_forwardRef_0 = v11.props.forwardRef;
        local v16 = v4.RemoveFromDictionary(v11.props, "forwardRef");
        v16[v3.Ref] = l_forwardRef_0;
        return v3.createElement("ImageButton", v16);
    else
        local l_forwardRef_1 = v11.props.forwardRef;
        local v18 = v4.RemoveFromDictionary(v11.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef");
        v18[v3.Ref] = l_forwardRef_1;
        if v11.props.Image then
            v18.Image = "rbxasset://textures/ui/ImageSet/" .. v14.ImageSet .. ".png";
        end;
        if v11.props.ImageRectOffset then
            v18.ImageRectOffset = Vector2.new(v14.ImageRectOffset.X + v11.props.ImageRectOffset.X * v13, v14.ImageRectOffset.Y + v11.props.ImageRectOffset.Y * v13);
        else
            v18.ImageRectOffset = v14.ImageRectOffset;
        end;
        if v11.props.ImageRectSize then
            v18.ImageRectSize = Vector2.new(v11.props.ImageRectSize.X * v13, v11.props.ImageRectSize.Y * v13);
        else
            v18.ImageRectSize = v14.ImageRectSize;
        end;
        if v11.props.SliceCenter then
            v18.SliceCenter = Rect.new(v11.props.SliceCenter.Min.X * v13, v11.props.SliceCenter.Min.Y * v13, v11.props.SliceCenter.Max.X * v13, v11.props.SliceCenter.Max.Y * v13);
            if v11.props.SliceScale then
                v18.SliceScale = v11.props.SliceScale / v13;
            else
                v18.SliceScale = 1 / v13;
            end;
        end;
        return v3.createElement("ImageButton", v18);
    end;
end;
return v3.forwardRef(function(v19, v20) --[[ Line: 76 ]]
    -- upvalues: l_luaApps_0 (copy), v3 (copy), v7 (copy), v9 (copy), v8 (copy)
    if l_luaApps_0[v19.Image] then
        return v3.createElement(v7, {
            fullProps = v19, 
            migrationLookup = l_luaApps_0[v19.Image], 
            elementType = "TextButton"
        });
    else
        return v3.createElement(v9, v8.Dictionary.join(v19, {
            forwardRef = v20
        }));
    end;
end);