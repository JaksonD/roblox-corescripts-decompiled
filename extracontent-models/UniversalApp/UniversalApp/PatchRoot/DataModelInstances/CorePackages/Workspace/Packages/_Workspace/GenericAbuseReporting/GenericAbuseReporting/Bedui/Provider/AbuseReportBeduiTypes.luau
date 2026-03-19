local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.SharedFlags);
local v2 = require(l_Parent_0.t);
local l_FFlagAddThumbnailSelectorReport_0 = v1.FFlagAddThumbnailSelectorReport;
local v4 = {
    componentType = v2.literal("dropdown"), 
    isOptional = v2.boolean, 
    formDataKey = v2.string, 
    requirementMessage = v2.string, 
    dropdown = v2.interface({
        prompt = v2.string, 
        placeholder = v2.string, 
        items = v2.array(v2.interface({
            label = v2.string, 
            formDataValue = v2.union(v2.number, v2.string)
        }))
    })
};
local v5 = {
    componentType = v2.literal("freeComment"), 
    isOptional = v2.boolean, 
    formDataKey = v2.string, 
    requirementMessage = v2.string, 
    freeComment = v2.interface({
        prompt = v2.string, 
        placeholder = v2.string
    })
};
local v6 = {
    componentType = v2.literal("paragraph"), 
    isOptional = v2.boolean, 
    formDataKey = v2.optional(v2.string), 
    paragraph = v2.interface({
        text = v2.string, 
        links = v2.optional(v2.map(v2.string, v2.interface({
            label = v2.string, 
            linkButtonLabel = v2.string, 
            url = v2.string
        })))
    })
};
local v7 = {
    componentType = v2.literal("selector"), 
    isOptional = v2.boolean, 
    formDataKey = v2.string, 
    requirementMessage = v2.string, 
    selector = v2.interface({
        prompt = v2.string
    })
};
local v8 = {
    componentType = v2.literal("link"), 
    isOptional = v2.boolean, 
    formDataKey = v2.optional(v2.string), 
    link = v2.interface({
        label = v2.string, 
        linkButtonLabel = v2.string, 
        url = v2.string
    })
};
local v9 = {
    type = v2.literal("configurableComponentList"), 
    configurableComponentList = v2.interface({
        components = if l_FFlagAddThumbnailSelectorReport_0 then v2.array(v2.union(v2.interface(v4), v2.interface(v5), v2.interface(v6), v2.interface(v7), v2.interface(v8))) else v2.array(v2.union(v2.interface(v4), v2.interface(v5), v2.interface(v6), v2.interface(v8)))
    })
};
local v10 = v2.union(v2.interface(v9));
local v11 = {
    title = v2.string, 
    subtitle = v2.string, 
    actionInfo = v2.interface({
        actionLabel = v2.optional(v2.string), 
        predefinedNextStepId = v2.number, 
        shouldSubmit = v2.optional(v2.boolean)
    }), 
    stepId = v2.number, 
    internalStepName = v2.string, 
    isCompletionStep = v2.optional(v2.boolean), 
    innerContentConfig = v2.optional(v10), 
    footerContentConfig = v2.optional(v10)
};
local v12 = {
    rootStepId = v2.number, 
    nodes = v2.array(v2.interface(v11))
};
return {
    AbuseReportBeduiContextStatus = {
        Loading = "Loading", 
        Success = "Success", 
        Error = "Error"
    }, 
    BeduiDataTypeInterface = v12, 
    ComponentType = {
        Dropdown = "dropdown", 
        FreeComment = "freeComment", 
        Paragraph = "paragraph", 
        Selector = l_FFlagAddThumbnailSelectorReport_0 and "selector" or nil, 
        WebViewLink = "link"
    }, 
    ContentConfigType = {
        InnerContentConfig = "innerContentConfig", 
        FooterContentConfig = "footerContentConfig"
    }, 
    InnerContentConfigType = {
        ConfigurableComponentList = "configurableComponentList"
    }, 
    NotificationType = {
        OpenCustomWebView = 20
    }
};