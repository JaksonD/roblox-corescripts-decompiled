local l_Parent_0 = script.Parent;
local _ = require(l_Parent_0.util.Types);
local l_RunService_0 = game:GetService("RunService");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local v4 = if l_RunService_0:IsStudio() then game:GetService("StudioService") else nil;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v6 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationReportScriptTime);
local v7 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidationIECTelemetry);
local v8 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateRigidNonSkinned);
local v9 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidateFACSJointTransformsWithinBounds);
local v10 = require(l_Parent_0.flags.getEngineUGCValidateRelativeSkinningTransfer);
local v11 = require(l_Parent_0.flags.getEngineFeatureEngineUGCValidatePropertiesSensible);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateHSRMeshIds);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local v14 = require(l_Parent_0.flags.getFFlagUGCValidationMakeupSupport);
local v15 = require(l_Parent_0.flags.getFFlagUGCValidateCurveAnimRotationSpeed);
local v16 = require(l_Parent_0.flags.getFFlagUGCValidateTexturePack);
local function v21(...) --[[ Line: 32 ]] --[[ Name: joinTables ]]
    local v17 = {};
    for v18 = 1, select("#", ...) do
        for v19, v20 in select(v18, ...) do
            v17[v19] = v20;
        end;
    end;
    return v17;
end;
local v22 = {
    ErrorType = {
        resetPhysicsData_FailedToLoadMesh = "resetPhysicsData_FailedToLoadMesh", 
        validateAccurateBoundingBox = "validateAccurateBoundingBox", 
        validateAssetBounds_AssetSizeTooBig = "validateAssetBounds_AssetSizeTooBig", 
        validateAssetBounds_AssetSizeTooSmall = "validateAssetBounds_AssetSizeTooSmall", 
        validateAssetBounds_InconsistentAvatarPartScaleType = "validateAssetBounds_InconsistentAvatarPartScaleType", 
        validateScaleType_InvalidAvatarPartScaleType = "validateScaleType_InvalidAvatarPartScaleType", 
        validateAssetCreator_DependencyNotOwnedByCreator = "validateAssetCreator_DependencyNotOwnedByCreator", 
        validateAssetCreator_FailedToLoad = "validateAssetCreator_FailedToLoad", 
        validateAssetCreator_TooManyDependencies = "validateAssetCreator_TooManyDependencies", 
        validateAssetTransparency_AssetTransparencyThresholds = "validateAssetTransparency_AssetTransparencyThresholds", 
        validateAttributes = "validateAttributes", 
        validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition = "validateBodyPartChildAttachmentBounds_InvalidAttachmentPosition", 
        validateBodyPartCollisionFidelity = "validateBodyPartCollisionFidelity", 
        validateBodyPartMeshBounds_FailedToLoadMesh = "validateBodyPartMeshBounds_FailedToLoadMesh", 
        validateCageUVs_TestExecutedSuccessfully = "validateCageUVs_TestExecutedSuccessfully", 
        validateCageUVs_TestPassed = "validateCageUVs_TestPassed", 
        validateCageUVTriangleArea_FailedToLoadMesh = "validateCageUVTriangleArea_FailedToLoadMesh", 
        validateCageUVTriangleArea_ZeroAreaTriangle = "validateCageUVTriangleArea_ZeroAreaTriangle", 
        validateCageUVValues_FailedToLoadMesh = "validateCageUVValues_FailedToLoadMesh", 
        validateCageUVValues_UnexpectedUVValue = "validateCageUVValues_UnexpectedUVValue", 
        validateCanLoad = "validateCanLoad", 
        validateDependencies_IsNotApproved = "validateDependencies_IsNotApproved", 
        validateDependencies_IsRestrictedUserId = "validateDependencies_IsRestrictedUserId", 
        validateDependencies_IsReviewing = "validateDependencies_IsReviewing", 
        validateDependencies_ParseFailure = "validateDependencies_ParseFailure", 
        validateDescendantMeshMetrics_FailedToCalculateTriangles = "validateDescendantMeshMetrics_FailedToCalculateTriangles", 
        validateDescendantMeshMetrics_FailedToLoadMesh = "validateDescendantMeshMetrics_FailedToLoadMesh", 
        validateDescendantMeshMetrics_HasSkinnedMeshMismatch = "validateDescendantMeshMetrics_HasSkinnedMeshMismatch", 
        validateDescendantMeshMetrics_NoSkinningInfo = "validateDescendantMeshMetrics_NoSkinningInfo", 
        validateDescendantMeshMetrics_TooFarFromOrigin = "validateDescendantMeshMetrics_TooFarFromOrigin", 
        validateDescendantMeshMetrics_TooManyTriangles = "validateDescendantMeshMetrics_TooManyTriangles", 
        validateDynamicHeadMeshPartFormat_FailedToLoadMesh = "validateDynamicHeadMeshPartFormat_FailedToLoadMesh", 
        validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMesh", 
        validateFullBody_IncorrectAssetTypeSet = "validateFullBody_IncorrectAssetTypeSet", 
        validateFullBody_InstancesMissing = "validateFullBody_InstancesMissing", 
        validateFullBody_MeshIdsMissing = "validateFullBody_MeshIdsMissing", 
        validateHSR_HSRDataNotReady = "validateHSR_HSRDataNotReady", 
        validateHSR_NoWrapLayer = "validateHSR_NoWrapLayer", 
        validateInstanceTree = "validateInstanceTree", 
        validateInstanceTree_InvalidDescendants = "validateInstanceTree_InvalidDescendants", 
        validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing = "validateLayeredClothingAccessory_AssetTypeNotAllowedAsLayeredClothing", 
        validateLayeredClothingAccessory_FailedToLoadMesh = "validateLayeredClothingAccessory_FailedToLoadMesh", 
        validateLayeredClothingAccessory_NoInnerCageId = "validateLayeredClothingAccessory_NoInnerCageId", 
        validateLayeredClothingAccessory_NoMeshId = "validateLayeredClothingAccessory_NoMeshId", 
        validateLayeredClothingAccessory_NoOuterCageId = "validateLayeredClothingAccessory_NoOuterCageId", 
        validateLayeredClothingAccessory_NoWrapLayer = "validateLayeredClothingAccessory_NoWrapLayer", 
        validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_MeshIdMismatch", 
        validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLayeredClothingAccessoryMeshPartAssetFormatMatch_TextureIdMismatch", 
        validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory = "validateLegacyAccessory_AssetTypeNotAllowedAsRigidAccessory", 
        validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_MeshIdMismatch", 
        validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch = "validateLegacyAccessoryMeshPartAssetFormatMatch_TextureIdMismatch", 
        validateLimbsAndTorso_FolderInfoMismatch = "validateLimbsAndTorso_FolderInfoMismatch", 
        validateLimbsAndTorso_R6FolderHasChildren = "validateLimbsAndTorso_R6FolderHasChildren", 
        validateLimbsAndTorso_TopLevelFolders = "validateLimbsAndTorso_TopLevelFolders", 
        validateMaterials = "validateMaterials", 
        validateMeshBounds_FailedToExecute = "validateMeshBounds_FailedToExecute", 
        validateMeshBounds_FailedToLoadMesh = "validateMeshBounds_FailedToLoadMesh", 
        validateMeshBounds_TooLarge = "validateMeshBounds_TooLarge", 
        validateMeshComparison = "validateMeshComparison", 
        validateMeshPartAccessory_DoubleSided = "validateMeshPartAccessory_DoubleSided", 
        validateMeshPartAccessory_FailedToLoadMesh = "validateMeshPartAccessory_FailedToLoadMesh", 
        validateMeshPartAccessory_NoMeshId = "validateMeshPartAccessory_NoMeshId", 
        validateMeshPartBodyPart_ValidateWithSchema = "validateMeshPartBodyPart_ValidateWithSchema", 
        validateMeshTriangleArea_FailedToLoadMesh = "validateMeshTriangleArea_FailedToLoadMesh", 
        validateMeshTriangleArea_NoArea = "validateMeshTriangleArea_NoArea", 
        validateMeshTriangles_FailedToExecute = "validateMeshTriangles_FailedToExecute", 
        validateMeshTriangles_FailedToLoadMesh = "validateMeshTriangles_FailedToLoadMesh", 
        validateMeshTriangles_TooManyTriangles = "validateMeshTriangles_TooManyTriangles", 
        validateMeshVertexColors_FailedToLoadMesh = "validateMeshVertexColors_FailedToLoadMesh", 
        validateMeshVertexColors_NonNeutralVertexColors = "validateMeshVertexColors_NonNeutralVertexColors", 
        validateModeration_AssetsHaveNotPassedModeration = "validateModeration_AssetsHaveNotPassedModeration", 
        validateModeration_CouldNotFetchModerationDetails = "validateModeration_CouldNotFetchModerationDetails", 
        validateModeration_FailedToParse = "validateModeration_FailedToParse", 
        validateModeration_ValidateUser = "validateModeration_ValidateUser", 
        validatePackage_FailedToParse = "validatePackage_FailedToParse", 
        validateProperties_PropertyDoesNotExist = "validateProperties_PropertyDoesNotExist", 
        validateProperties_PropertyMismatch = "validateProperties_PropertyMismatch", 
        validateSingleInstance_MultipleInstances = "validateSingleInstance_MultipleInstances", 
        validateSingleInstance_ZeroInstances = "validateSingleInstance_ZeroInstances", 
        validateSurfaceAppearances_InvalidAlphaMode = "validateSurfaceAppearances_InvalidAlphaMode", 
        validateSurfaceAppearances_MeshPartHasTexture = "validateSurfaceAppearances_MeshPartHasTexture", 
        validateSurfaceAppearances_MissingSurfaceAppearance = "validateSurfaceAppearances_MissingSurfaceAppearance", 
        validateTags = "validateTags", 
        validateTextureSize_FailedToExecute = "validateTextureSize_FailedToExecute", 
        validateTextureSize_FailedToLoadTexture = "validateTextureSize_FailedToLoadTexture", 
        validateTextureSize_InvalidTextureId = "validateTextureSize_InvalidTextureId", 
        validateTextureSize_TextureTooBig = "validateTextureSize_TextureTooBig", 
        validateTextureTransparency_InvalidTextureId = "validateTextureTransparency_InvalidTextureId", 
        validateTextureTransparency_TransparentTexture = "validateTextureTransparency_TransparentTexture", 
        validateThumbnailConfiguration_InvalidTarget = "validateThumbnailConfiguration_InvalidTarget", 
        validateThumbnailConfiguration_OutsideView = "validateThumbnailConfiguration_OutsideView", 
        validateVertexDensity_FailedToExecute = "validateVertexDensity_FailedToExecute", 
        validateVertexDensity_MaxDensityExceeded = "validateVertexDensity_MaxDensityExceeded", 
        validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls = "validateDynamicHeadMeshPartFormat_ValidateDynamicHeadMeshControls", 
        validateRenderMeshInsideOuterCageMesh_FailedToExecute = "validateRenderMeshInsideOuterCageMesh_FailedToExecute", 
        validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded = "validateRenderMeshInsideOuterCageMesh_MaxOutsideCageMeshExceeded", 
        validateLayeredClothingAccessory_CageOriginOutOfBounds = "validateLayeredClothingAccessory_CageOriginOutOfBounds", 
        validateBodyPart_CageOriginOutOfBounds = "validateBodyPart_CageOriginOutOfBounds", 
        validateTotalSurfaceArea_FailedToExecute = "validateTotalSurfaceArea_FailedToExecute", 
        validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded = "validateTotalSurfaceArea_maxTotalSurfaceAreaExceeded", 
        validateCoplanarIntersection_FailedToExecute = "validateCoplanarIntersection_FailedToExecute", 
        validateCoplanarIntersection_CoplanarIntersection = "validateCoplanarIntersection_CoplanarIntersection", 
        validateExcludedModifiedCageUVs_FailedToExecute = "validateExcludedModifiedCageUVs_FailedToExecute", 
        validateExcludedModifiedCageUVs_UnexpectedUVValue = "validateExcludedModifiedCageUVs_UnexpectedUVValue", 
        validateMainModifiedCageUVs_FailedToExecute = "validateMainModifiedCageUVs_FailedToExecute", 
        validateMainModifiedCageUVs_TooFewModifiedUVsFound = "validateMainModifiedCageUVs_TooFewModifiedUVsFound", 
        validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute = "validateRenderMeshInsideModifiedOuterCageArea_FailedToExecute", 
        validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly = "validateRenderMeshInsideModifiedOuterCageArea_RenderMeshNotPositionedCorrectly", 
        validateBodyPartCage_FailedToExecute = "validateBodyPartCage_FailedToExecute", 
        validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh = "validateBodyPartCage_VertsAreTooFarInFrontOfRenderMesh", 
        validateCurveAnimation_IncorrectNumericalData = "validateCurveAnimation_IncorrectNumericalData", 
        validateCurveAnimation_PositionalMovement = "validateCurveAnimation_PositionalMovement", 
        validateVerticesSimilarity_FailedToExecute = "validateVerticesSimilarity_FailedToExecute", 
        validateVerticesSimilarity_MaxSimilarityExceeded = "validateVerticesSimilarity_MaxSimilarityExceeded", 
        validateCagingRelevancy_FailedToExecute = "validateCagingRelevancy_FailedToExecute", 
        validateCagingRelevancy_IrrelevantCaging = "validateCagingRelevancy_IrrelevantCaging", 
        validateCageMeshDistance_FailedToExecute = "validateCageMeshDistance_FailedToExecute", 
        validateCageMeshDistance_OuterCageToMeshDistance = "validateCageMeshDistance_OuterCageToMeshDistance", 
        validateCageUVDuplicate_FailedToExecute = "validateCageUVDuplicate_FailedToExecute", 
        validateCageUVDuplicate_UnexpectedUVValue = "validateCageUVDuplicate_UnexpectedUVValue", 
        validatePartSizeWithinRenderSizeLimits_SizeExceeded = "validatePartSizeWithinRenderSizeLimits_SizeExceeded", 
        validateLayeredClothingAccessory_HandleIsScaled = "validateLayeredClothingAccessory_HandleIsScaled", 
        resetPhysicsData_LargeMass = "resetPhysicsData_LargeMass", 
        validateBodyAttPosRelativeToParent_PartAboveParent = "validateBodyAttPosRelativeToParent_PartAboveParent", 
        validateBodyAttPosRelativeToParent_ParentBelowPart = "validateBodyAttPosRelativeToParent_ParentBelowPart", 
        validateBodyBlockingTests_ZeroMeshSize = "validateBodyBlockingTests_ZeroMeshSize", 
        validateFullBody_ZeroMeshSize = "validateFullBody_ZeroMeshSize", 
        validateMeshBounds_Shifted = "validateMeshBounds_Shifted", 
        validateBodyPartChildAttachmentOrientations_RotatedRig = "validateBodyPartChildAttachmentOrientations_RotatedRig", 
        validateBodyPartChildAttachmentOrientations_RotatedGrip = "validateBodyPartChildAttachmentOrientations_RotatedGrip", 
        validateBodyPartChildAttachmentOrientations_RotatedBasic = "validateBodyPartChildAttachmentOrientations_RotatedBasic", 
        validateDeformedLayeredClothingInRenderBounds_FailedToExecute = "validateDeformedLayeredClothingInRenderBounds_FailedToExecute", 
        validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds = "validateDeformedLayeredClothingInRenderBounds_ClothingOutOfBounds", 
        validateEmoteAnimation_FailedToDownloadCurveAnimation = "validateEmoteAnimation_FailedToDownloadCurveAnimation", 
        validateCurveAnimation_AnimationHierarchyIsIncorrect = "validateCurveAnimation_AnimationHierarchyIsIncorrect", 
        validateCurveAnimation_AnimationContainsNoJointManipulation = "validateCurveAnimation_AnimationContainsNoJointManipulation", 
        validateCurveAnimation_UnacceptableLength = "validateCurveAnimation_UnacceptableLength", 
        validateCurveAnimation_UnacceptableSizeBounds = "validateCurveAnimation_UnacceptableSizeBounds", 
        validateCurveAnimation_UnacceptableFrameDelta = "validateCurveAnimation_UnacceptableFrameDelta"
    }
};
if v16() then
    v22.ErrorType.validateTexturePack_InvalidTexturePackURL = "validateTexturePack_InvalidTexturePackURL";
    v22.ErrorType.validateTexturePack_FailedToDownloadTexturePack = "validateTexturePack_FailedToDownloadTexturePack";
    v22.ErrorType.validateTexturePack_TexturePackMismatch = "validateTexturePack_TexturePackMismatch";
end;
v22.ErrorType.validateLegsSeparation_InvalidAttachmentPosition = "validateLegsSeparation_InvalidAttachmentPosition";
v22.ErrorType.validateLegsSeparation_LegsOverlap = "validateLegsSeparation_LegsOverlap";
if v8() then
    v22.ErrorType.validateRigidMeshSkinning_FailedToDownload = "validateRigidMeshSkinning_FailedToDownload";
    v22.ErrorType.validateRigidMeshSkinning_BonesFoundInMesh = "validateRigidMeshSkinning_BonesFoundInMesh";
end;
if v15() then
    v22.ErrorType.validateCurveAnimation_UnacceptableFrameRotationDelta = "validateCurveAnimation_UnacceptableFrameRotationDelta";
end;
v22.ErrorType.validateCurveAnimation_IncorrectAnimationRigData = "validateCurveAnimation_IncorrectAnimationRigData";
v22.ErrorType.validateMeshSizeProperty_FailedToLoadMesh = "validateMeshSizeProperty_FailedToLoadMesh";
v22.ErrorType.validateMeshSizeProperty_Mismatch = "validateMeshSizeProperty_Mismatch";
v22.ErrorType.validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning = "validateBodyPartVertsSkinnedToR15_FailedToFetchSkinning";
v22.ErrorType.validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints = "validateBodyPartVertsSkinnedToR15_BodyIsSkinnedToFakeJoints";
if v10() then
    v22.ErrorType.validateSkinningTransfer_FailedToExecute = "validateSkinningTransfer_FailedToExecute";
    v22.ErrorType.validateSkinningTransfer_BodyPartsWithSpecialJoints = "validateSkinningTransfer_BodyPartsWithSpecialJoints";
    v22.ErrorType.validateSkinningTransfer_SkinningTransferOverride = "validateSkinningTransfer_SkinningTransferOverride";
    v22.ErrorType.validateSkinningTransfer_Weights = "validateSkinningTransfer_Weights";
end;
if v13() then
    v22.ErrorType.validateSkinningTransfer_RequiredAssetTypes = "validateSkinningTransfer_RequiredAssetTypes";
end;
if v11() then
    v22.ErrorType.validatePropertiesSensible_IncorrectPropertiesFound = "validatePropertiesSensible_IncorrectPropertiesFound";
end;
v22.ErrorType.validateHSR_FileDataInvalid = "validateHSR_FileDataInvalid";
if v12() then
    v22.ErrorType.validataHSR_HSRMeshIdsMismatch = "validataHSR_HSRMeshIdsMismatch";
end;
if v14() then
    v22.ErrorType.validateMakeupDecal_FailedToLoadTexture = "validateMakeupDecal_FailedToLoadTexture";
    v22.ErrorType.validateMakeupDecal_NoColorMap = "validateMakeupDecal_NoColorMap";
    v22.ErrorType.validateMakeupDecal_UVZoneError = "validateMakeupDecal_UVZoneError";
    v22.ErrorType.validateWrapTextureTransfer_FailedToLoadCage = "validateWrapTextureTransfer_FailedToLoadCage";
    v22.ErrorType.validateWrapTextureTransfer_NoCage = "validateWrapTextureTransfer_NoCage";
    v22.ErrorType.validateWrapTextureTransfer_FailedToLoadUV = "validateWrapTextureTransfer_FailedToLoadUV";
    v22.ErrorType.validateWrapTextureTransfer_InvalidUV = "validateWrapTextureTransfer_InvalidUV";
    v22.ErrorType.validateWrapTextureTransfer_InvalidMinBound = "validateWrapTextureTransfer_InvalidMinBound";
    v22.ErrorType.validateWrapTextureTransfer_InvalidMaxBound = "validateWrapTextureTransfer_InvalidMaxBound";
end;
if v9() then
    v22.ErrorType.validateFACSJointTransformsWithinBounds_Error = "validateFACSJointTransformsWithinBounds_Error";
    v22.ErrorType.validateFACSJointTransformsWithinBounds_OOB = "validateFACSJointTransformsWithinBounds_OOB";
end;
setmetatable(v22.ErrorType, {
    __index = function(_, v24) --[[ Line: 260 ]] --[[ Name: __index ]]
        return (("UNREGISTERED_%*"):format(v24));
    end
});
v22.metadata = {};
v22.setMetadata = function(v25) --[[ Line: 267 ]] --[[ Name: setMetadata ]]
    -- upvalues: v22 (copy)
    local v26 = {};
    for v27, v28 in v25 do
        v26[v27] = tostring(v28);
    end;
    v22.metadata = v26;
end;
v22.shouldReportIECTelemetry = function(v29) --[[ Line: 275 ]] --[[ Name: shouldReportIECTelemetry ]]
    -- upvalues: v7 (copy), l_RunService_0 (copy)
    if not v7() then
        return false;
    elseif not v29 then
        return false;
    elseif l_RunService_0:IsStudio() or not v29.allowEditableInstances or not v29.isServer then
        return false;
    else
        return true;
    end;
end;
v22.reportCounter = function(v30, v31, v32) --[[ Line: 291 ]] --[[ Name: reportCounter ]]
    -- upvalues: v22 (copy), l_UGCValidationService_0 (copy)
    if v22.shouldReportIECTelemetry(v32) then
        l_UGCValidationService_0:ReportUGCValidationCounter(v30, v31);
    end;
end;
v22.reportFailure = function(v33, v34, v35) --[[ Line: 297 ]] --[[ Name: reportFailure ]]
    -- upvalues: l_RunService_0 (copy), v21 (copy), v22 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy), l_UGCValidationService_0 (copy)
    local v36 = l_RunService_0:IsStudio() and "studio" or "rcc";
    local v37 = v21(v22.metadata, v34 or {}, {
        errorType = v33, 
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId(), 
        placeId = game.PlaceId, 
        userId = if v4 then v4:GetUserId() else 0
    });
    l_RbxAnalyticsService_0:SendEventDeferred(v36, "ugcValidation", "failure", v37);
    if v22.shouldReportIECTelemetry(v35) then
        l_UGCValidationService_0:ReportUGCValidationFailureTelemetry(v33);
    end;
end;
v22.reportThumbnailing = function(v38, v39) --[[ Line: 317 ]] --[[ Name: reportThumbnailing ]]
    -- upvalues: l_RunService_0 (copy), v21 (copy), v22 (copy), l_RbxAnalyticsService_0 (copy), v4 (copy)
    local v40 = l_RunService_0:IsStudio() and "studio" or "rcc";
    local v41 = v21(v22.metadata, v39 or {}, {
        time = v38, 
        studioSid = l_RbxAnalyticsService_0:GetSessionId(), 
        clientId = l_RbxAnalyticsService_0:GetClientId(), 
        placeId = game.PlaceId, 
        userId = if v4 then v4:GetUserId() else 0
    });
    l_RbxAnalyticsService_0:SendEventDeferred(v40, "ugcValidation", "thumbnailing", v41);
end;
v22.recordScriptTime = function(v42, v43, v44) --[[ Line: 329 ]] --[[ Name: recordScriptTime ]]
    -- upvalues: v6 (copy)
    if not v6() then
        return;
    else
        if not v44.scriptTimes then
            v44.scriptTimes = {};
        end;
        local l_scriptTimes_0 = v44.scriptTimes;
        if not l_scriptTimes_0[v42] then
            l_scriptTimes_0[v42] = 0;
        end;
        local v46 = tick() - v43;
        l_scriptTimes_0[v42] = l_scriptTimes_0[v42] + v46;
        return;
    end;
end;
v22.reportScriptTimes = function(v47) --[[ Line: 347 ]] --[[ Name: reportScriptTimes ]]
    -- upvalues: v6 (copy), l_RunService_0 (copy), v22 (copy), l_UGCValidationService_0 (copy)
    if not v6() then
        return;
    else
        if v47.isServer and not l_RunService_0:IsStudio() and v47.scriptTimes then
            assert(v22.metadata, "Metadata is never nil");
            local l_entrypoint_0 = v22.metadata.entrypoint;
            local v49 = "FullBody";
            if v47.assetTypeEnum then
                v49 = v47.assetTypeEnum.Name;
            elseif l_entrypoint_0 and type(l_entrypoint_0) == "string" and #l_entrypoint_0 > 0 then
                v49 = l_entrypoint_0;
            end;
            l_UGCValidationService_0:ReportUGCValidationTelemetry(v49, v47.scriptTimes);
        end;
        return;
    end;
end;
return v22;