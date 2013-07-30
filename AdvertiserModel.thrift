include "DemandModel.thrift"
namespace java com.inmobi.advertiser.thrift.model

//metadata table Objectives in CMS DB
enum AdvObjective {
	PROMOTE_APP = 1,
	GENERATE_LEADS = 2,
	PROMOTE_CONTENT = 3, 
	GENERATE_AWARENESS = 4
}

struct AdvReadContext {
	// Id of the account for which request being processed
	1: required string accountId,
	// id (email) of the user who initiated the request.
	2: required string userId,
}

struct AdvWriteContext {
        // Source application id.
        1: required i32 appSourceId
        // Id of the account for which request being processed
        2: required string accountId,
        // id (email) of the user who initiated the request.
        3: required string userId,
        // correlation id of the request.
        4: optional string correlationId
}

struct AdvBudgetConstraint {
        // maximum budget which will be spend each day. this is mandatory if campaign is burning from account.
        1: optional double dailyLimit,
        
        // flag to mark the campaign has dynamic daily limit enabled
        2: required bool dynamicDailyLimit,
        
        // % value for allowed dynamic setting of daily limit
        3: optional double dailyLeewayPercentage
        
        // flag to check whether daily limit is inherited or it is explictly set by user
		4: required bool dailyLimitInherited;
        
}

struct AdvCampaign {
	// The id of account (advertiser id), who owns the campaign
	1: required string accountId, 
	
	// demand source type for which campaign is being created. Used to classify the source the campaign. 
	// Cannot be modified once created
	2: required DemandModel.DemandSource demandSource, 
	
	// name of the campaign.
	3: required string name,
	
	// start date of the campaign in epoch time. Defaulted to current date on creation 
	4: required DemandModel.DateTime startDate,
	
	// end date of the campaign in epoch time. Defaulted to current date + 6 months on creation 
	5: optional DemandModel.DateTime endDate,
	
	6: required DemandModel.BudgetType budgetType,
	
	// maximum budget, which will spend over the life time of the campaign.
	7: optional double budget,
	
	// campaign budget details
    8: required AdvBudgetConstraint budgetConstraint
}

struct AdvLatLongDetail {
	// name for the lat-long
    1: required string name,
    2: required double latitude,
    3: required double longitude,
    
    // Radius to use in geo fencing.
    4: required double radius

}

struct AdvGeoCarrierTargetingDetail {
	
	// Geo enabled country id.
	1: required i32 countryId,
	
	// list of states to be targeted on above mentioned country id.
	2: optional list<i32> stateIds,
	
	// list of cities to be targeted on the above mentioned country id.
	// if state and city are mentioned, the targeting will be based on (?)
	3: optional list<i32> cityIds,
	
	// list of carrier to be targeted. if not present, all carriers are included.
	4: optional list<i64> carrierIds,
	
	// list of zip to be targeted, if not present, all zip are included. 
	5: optional list<i32> zipIds,
	
	// list of lat-long details to be targeted for geo fencing.
	6: optional list<AdvLatLongDetail> latLongDetails
}

struct AdvOSDetail {

        // platform os id.
        1: required i32 osId,
        
        // maximum major os version. empty means no maximum major version limit (inclusive). 
        2: optional double maximumMajorVersion,
        
        // minimum major os version. empty means no minimum version limit (inclusive)
        3: optional double minimumMajorVersion,
        
        // SelectionMode.INCLUDE
        //      if os version is present, then only versions in range is included for targeting.
        //      if os version is not present, then os is included for targeting
        // SelectionMode.EXCLUDE
        //      if os version is present, then only versions in range is excluded.
        //      if os version is not present, then entire os is excluded
        4: required DemandModel.SelectionMode selectionMode
}

struct AdvManufacturerDetail {

	// Manufacturer id
        1: required i32 manufacturerId,
        
        // list of handset to targeted for the manufactuer. empty means no specific handset selection.
        2: optional list<i32> handsetIds,
        
        // SelectionMode.INCLUDE
        //      if handsetIds is present, then only handsets in the list is included for targeting.
        //      if handsetIds is not present, then entire manufacturer is included for targeting
        // SelectionMode.EXCLUDE
        //      if handsetIds is present, then only handsets in the list is excluded.
        //      if handsetIds is not present, then entire manufacturer is excluded
        3: required DemandModel.SelectionMode selectionMode
}

struct AdvDeviceDetail {
	// list of targeted os details. empty means all os version. will not be considered for DeviceTargetingType.PRESET
	1: optional list<AdvOSDetail> osDetails,
	
	// list of targeted manufacturer details. will not be considered for DeviceTargetingType.PRESET
	2: optional list<AdvManufacturerDetail> manufacturerDetails,
	
	3: optional list<i32> deviceTypes,
	
	4: optional DemandModel.DeviceSelectionMode selectionMode = DeviceSelectionMode.ALL
}

struct AdvBrowser {
	// browser version id
        1: required i32 browserId,
        // maximum major browser version. empty means no maximum major version limit (inclusive). 
        2: optional double maximumMajorVersion,
        // minimum major browser version. empty means no minimum version limit (inclusive)
        3: optional double minimumMajorVersion,
        // SelectionMode.INCLUDE
        //      if browser version is present, then only versions in range is included for targeting.
        //      if browser version is not present, then browser is included for targeting
        // SelectionMode.EXCLUDE
        //      if browser version is present, then only versions in range is excluded.
        //      if browser version is not present, then entire browser is excluded
        4: required DemandModel.SelectionMode selectionMode
}

struct AdvSchedule {
	// day wise time targeting.
	1: required DemandModel.DayOfWeek dayOfWeek,
	2: required list<DemandModel.TimeWindow> timeSlots
}

struct AdvAdGroupPricing {
	
	// price type of the ad group.
	1: required DemandModel.PriceType priceType,
	
	// bid value
	2: required double bidValue,
	
	// maximum amount spend by ad group per day.
	// defaulted to daily budget of the campaign on creation
	3: optional double dailySpend,
	
	4: optional bool dynamicBidEnabled,
	
	5: optional bool slackEnabled,
	
	6: optional double recommendedBid
}

struct AdvAdGroupBasic {
	//name of the ad group
	1: required string name,
	
	// Ad group objective. Ad groups are primarily classified by the objective. All workflow will 
	// be based on the objective
	2: required AdvObjective objective,
	
	// flag to denote the rich media ad group
	3: optional bool richmediaEnabled,
	
	// action to be performed for this ad group. Click to action filters the devices based on 
	// the required capabilities of the devices.
	4: optional DemandModel.ClickToAction clickToAction,
	
	// the content of click to action. 
	5: optional string ctaProposition,
	
	// app id to be used for adroit tracking
	6: optional string appId,
	
	// if present will be validated against the landing url
	7: optional i32 appMarketPlaceId,
	
	// start date of the ad group in epoch time. Defaulted to campaign start date on creation 
	8: required i64 startDate,
	
	// end date of the ad group in epoch time. Defaulted to campaign end date on creation 
	9: required i64 endDate,
	
	10: optional i32 trackingPartnerId,

	11: optional string finalLandingURL
}
		
struct AdvPreset {
	1: required string presetId,
	2: required string presetName
}

struct AdvTrackingCode {
	1: required DemandModel.TrackingCodeType trackingCodeType,
	2: required string trackingCodeValue
}

struct AdvAdBasic {

	// The id of ad group for which creative is being created.
	// It's not possible to change the ad group of creative.
	1: required string adGroupId,
	
	// name of the creative, updateable at any time.
	2: required string name,
	
	3: required DemandModel.AdFormat adFormat,
	
	// creative tracking codes
	4: optional list<AdvTrackingCode> trackingCodes,
	
	// custom header to track the performance of each creative by adding a unique code to the landing page URL
	5: optional string customHeader,
	
	//6: optional string simpleAdValue
}

struct AdvSimpleAd {
	
	1: required AdvAdBasic adBasic,
	2: required string adValue
}

struct AdvBannerAd {
	1: required AdvAdBasic adBasic,
	2: required string altText,
	3: required string contentId,
	4: required list<string> imageNames
}

struct AdvRMContent {
	
    // Content provider for the RichMedia Creative.
    1: required DemandModel.CreativeContentProvider contentProvider,
    // Content. For Sprout, this will be a sprout URL, for TPAT the value will be entire content
    2: required string rmValue,
    // rm value content type
    3: required DemandModel.RMContentType contentType,
    // Initital slot dimension id.
    4: optional i32 initialSlotId,
    // Rich media AdFormat
    5: optional DemandModel.AdFormat adFormat
}

struct AdvRichMediaAd {
	1: required AdvAdBasic adBasic,
	2: required string altText,
	3: optional string contentId,
	4: optional AdvRMContent rmContent,
	5: optional list<i32> sdkCapabilities,
	// ad group landing URL. (In sprout TWO-PIECE RM this is mandatory param) 
    6: optional string adGroupLandingURL
}

struct AdvImageDetail {
	1: required string filename,
	2: required binary imageContent
}

struct AdvBannerContent {
	1: required string altText,
	2: required list<AdvImageDetail> images
}
