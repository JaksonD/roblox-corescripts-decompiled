local l_script_FirstAncestor_0 = script:FindFirstAncestor("InGameAssetReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Analysis.Types);
local l_FFlagReportIPInfringement_0 = require(l_Parent_0.SharedFlags).FFlagReportIPInfringement;
extractAssetIdsFromInstance = function(v4) --[[ Line: 7 ]] --[[ Name: extractAssetIdsFromInstance ]]
    -- upvalues: l_FFlagReportIPInfringement_0 (copy)
    local v5 = {
        Package = {}, 
        Model = {}, 
        Image = {}, 
        Mesh = {}, 
        Text = {}, 
        Video = {}
    };
    if v4:IsA("PackageLink") and v4.PackageId ~= "" and v4.VersionNumber > 0 then
        table.insert(v5.Package, {
            id = v4.PackageId, 
            version = v4.VersionNumber
        });
        return v5;
    elseif v4:IsA("Model") and v4.SourceAssetId > 0 then
        table.insert(v5.Model, (tostring(v4.SourceAssetId)));
        return v5;
    else
        if v4:IsA("MeshPart") and v4.MeshId ~= "" then
            table.insert(v5.Mesh, v4.MeshId);
            if v4.TextureID ~= "" then
                table.insert(v5.Image, v4.TextureID);
                return v5;
            end;
        elseif (v4.ClassName == "FileMesh" or v4.ClassName == "SpecialMesh" and v4.MeshType == Enum.MeshType.FileMesh) and v4.MeshId ~= "" then
            table.insert(v5.Mesh, v4.MeshId);
            if v4.TextureId ~= "" then
                table.insert(v5.Image, v4.TextureId);
                return v5;
            end;
        elseif v4:IsA("ImageLabel") and v4.Image ~= "" then
            table.insert(v5.Image, v4.Image);
            return v5;
        elseif v4:IsA("ImageButton") then
            if v4.Image ~= "" then
                table.insert(v5.Image, v4.Image);
            end;
            if v4.HoverImage ~= "" then
                table.insert(v5.Image, v4.HoverImage);
            end;
            if v4.PressedImage ~= "" then
                table.insert(v5.Image, v4.PressedImage);
                return v5;
            end;
        elseif v4:IsA("Decal") and v4.Texture ~= "" then
            table.insert(v5.Image, v4.Texture);
            return v5;
        elseif v4:IsA("SurfaceAppearance") and v4.ColorMap ~= "" then
            table.insert(v5.Image, v4.ColorMap);
            return v5;
        elseif v4:IsA("TextLabel") and v4.Text ~= "" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
            table.insert(v5.Text, v4.Text);
            return v5;
        elseif v4:IsA("TextButton") and v4.Text ~= "" and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
            table.insert(v5.Text, v4.Text);
            return v5;
        elseif v4:IsA("TextBox") and game:GetEngineFeature("ExperienceStateCaptureExperienceChatSupport") then
            if v4.Text ~= "" then
                table.insert(v5.Text, v4.Text);
                return v5;
            elseif v4.PlaceholderText ~= "" then
                table.insert(v5.Text, v4.PlaceholderText);
                return v5;
            end;
        elseif l_FFlagReportIPInfringement_0 and v4:IsA("VideoFrame") then
            if v4.Video ~= "" then
                table.insert(v5.Video, v4.Video);
                return v5;
            end;
        else
            return nil;
        end;
        return v5;
    end;
end;
return extractAssetIdsFromInstance;