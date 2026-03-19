local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Colors);
local v7 = require(l_Parent_0.UtilityFunctions);
local v8 = v2.PureComponent:extend("DetailsDescription");
v8.setText = function(v9) --[[ Line: 18 ]] --[[ Name: setText ]]
    -- upvalues: v7 (copy)
    local v10 = v9.props.assetInfo or {};
    local v11 = v10.parentBundleId ~= nil;
    local v12 = v9.props.bundleInfo or {};
    if v11 then
        local v13 = v7.getBundleId(v10);
        if v12[v13] then
            v9.description = v12[v13].description or "";
            return;
        end;
    elseif v10 then
        v9.description = v10.description or "";
    end;
end;
v8.init = function(v14) --[[ Line: 34 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v14.description = "";
    v14.descriptionRef = v2.createRef();
end;
v8.render = function(v15) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_AppFonts_0 (copy), v6 (copy)
    v15:setText();
    local v16 = v15:calculateSize();
    return v2.createElement("TextLabel", {
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Size = UDim2.new(1, -20, 0, v16), 
        Text = v15.description or "", 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextSize = 16, 
        TextWrapped = true, 
        Font = l_AppFonts_0.default:getDefault(), 
        TextColor3 = v6.White, 
        [v2.Ref] = v15.descriptionRef
    });
end;
v8.calculateSize = function(v17) --[[ Line: 58 ]] --[[ Name: calculateSize ]]
    -- upvalues: l_TextService_0 (copy), l_AppFonts_0 (copy)
    if v17.descriptionRef.current and v17.props.assetInfo then
        return l_TextService_0:GetTextSize(v17.description, 16, l_AppFonts_0.default:getDefault(), Vector2.new(v17.descriptionRef.current.AbsoluteSize.X, 5000)).Y;
    else
        return;
    end;
end;
return v3.UNSTABLE_connect2(function(v18, _) --[[ Line: 70 ]]
    local l_assetId_0 = v18.detailsInformation.assetId;
    return {
        view = v18.view, 
        assetInfo = v18.assets[l_assetId_0], 
        detailsInformation = v18.detailsInformation, 
        bundleInfo = v18.bundles
    };
end)(v8);