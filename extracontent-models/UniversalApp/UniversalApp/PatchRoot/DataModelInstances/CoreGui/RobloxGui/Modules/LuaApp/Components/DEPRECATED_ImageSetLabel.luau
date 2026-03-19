local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.Immutable);
local l_GetImageSetData_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageSetData;
local l_GetImageSetPathPattern_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageSetPathPattern;
local v7 = require(l_CorePackages_0.Packages.BuilderIcons);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_Modules_0.LuaApp.Components.BuilderIconMigration);
local v10 = v3.PureComponent:extend("ImageSetLabel");
local l_luaApps_0 = v7.Migration.luaApps;
v10.render = function(v12) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_GetImageSetData_0 (copy), l_GuiService_0 (copy), v4 (copy), v3 (copy), l_GetImageSetPathPattern_0 (copy)
    local v13, v14 = l_GetImageSetData_0(l_GuiService_0:GetResolutionScale());
    local v15 = v13[v12.props.Image];
    if not v15 then
        local l_forwardRef_0 = v12.props.forwardRef;
        local v17 = v4.RemoveFromDictionary(v12.props, "forwardRef");
        v17[v3.Ref] = l_forwardRef_0;
        return v3.createElement("ImageLabel", v17);
    else
        local l_forwardRef_1 = v12.props.forwardRef;
        local v19 = v4.RemoveFromDictionary(v12.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef");
        v19[v3.Ref] = l_forwardRef_1;
        if v12.props.Image then
            v19.Image = l_GetImageSetPathPattern_0(v15.ImageSet);
        end;
        if v12.props.ImageRectOffset then
            v19.ImageRectOffset = Vector2.new(v15.ImageRectOffset.X + v12.props.ImageRectOffset.X * v14, v15.ImageRectOffset.Y + v12.props.ImageRectOffset.Y * v14);
        else
            v19.ImageRectOffset = v15.ImageRectOffset;
        end;
        if v12.props.ImageRectSize then
            v19.ImageRectSize = Vector2.new(v12.props.ImageRectSize.X * v14, v12.props.ImageRectSize.Y * v14);
        else
            v19.ImageRectSize = v15.ImageRectSize;
        end;
        if v12.props.SliceCenter then
            v19.SliceCenter = Rect.new(v12.props.SliceCenter.Min.X * v14, v12.props.SliceCenter.Min.Y * v14, v12.props.SliceCenter.Max.X * v14, v12.props.SliceCenter.Max.Y * v14);
            if v12.props.SliceScale then
                v19.SliceScale = v12.props.SliceScale / v14;
            else
                v19.SliceScale = 1 / v14;
            end;
        end;
        return v3.createElement("ImageLabel", v19);
    end;
end;
return v3.forwardRef(function(v20, v21) --[[ Line: 78 ]]
    -- upvalues: l_luaApps_0 (copy), v3 (copy), v9 (copy), v10 (copy), v8 (copy)
    if l_luaApps_0[v20.Image] then
        return v3.createElement(v9, {
            fullProps = v20, 
            migrationLookup = l_luaApps_0[v20.Image], 
            elementType = "TextLabel"
        });
    else
        return v3.createElement(v10, v8.Dictionary.join(v20, {
            forwardRef = v21
        }));
    end;
end);