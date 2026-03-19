local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_GuiService_0 = game:GetService("GuiService");
local l_Roact_0 = v1.Roact;
local l_AppCommonLib_0 = v1.AppCommonLib;
local l_RobloxAppAssets_0 = v1.RobloxAppAssets;
local l_Cryo_0 = v1.Cryo;
local l_Immutable_0 = l_AppCommonLib_0.Immutable;
local l_GetImageSetData_0 = l_RobloxAppAssets_0.GetImageSetData;
local l_GetImageSetPathPattern_0 = l_RobloxAppAssets_0.GetImageSetPathPattern;
local v10 = l_Roact_0.PureComponent:extend("ImageSetLabel");
v10.render = function(v11) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: l_GetImageSetData_0 (copy), l_GuiService_0 (copy), l_Immutable_0 (copy), l_Roact_0 (copy), l_GetImageSetPathPattern_0 (copy)
    local v12, v13 = l_GetImageSetData_0(l_GuiService_0:GetResolutionScale());
    local v14 = v12[v11.props.Image];
    if not v14 then
        local l_forwardRef_0 = v11.props.forwardRef;
        local v16 = l_Immutable_0.RemoveFromDictionary(v11.props, "forwardRef");
        v16[l_Roact_0.Ref] = l_forwardRef_0;
        return l_Roact_0.createElement("ImageLabel", v16);
    else
        local l_forwardRef_1 = v11.props.forwardRef;
        local v18 = l_Immutable_0.RemoveFromDictionary(v11.props, "Image", "ImageRectOffset", "ImageRectSize", "SliceCenter", "forwardRef");
        v18[l_Roact_0.Ref] = l_forwardRef_1;
        if v11.props.Image then
            v18.Image = l_GetImageSetPathPattern_0(v14.ImageSet);
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
        return l_Roact_0.createElement("ImageLabel", v18);
    end;
end;
return l_Roact_0.forwardRef(function(v19, v20) --[[ Line: 77 ]]
    -- upvalues: l_Roact_0 (copy), v10 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v10, l_Cryo_0.Dictionary.join(v19, {
        forwardRef = v20
    }));
end);