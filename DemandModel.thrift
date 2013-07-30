namespace java com.inmobi.demand.thrift.model
namespace py inmobi_demand_core_rpc.model

enum ClickToAction {
	URL = 1,
	SMS = 2,
	CALL = 3
}

enum Gender {
	MALE = 1,
	FEMALE = 2
}

enum DayOfWeek {
	MON = 0,
	TUE = 1,
	WED = 2,
	THU = 3,
	FRI = 4,
	SAT = 5,
	SUN = 6
}

enum DomainTraffic {

	// Targeting APP
	APP = 1,
	
	// Targeting WEB
	BROWSER = 2
}


enum SelectionMode {
	INCLUDE = 1,
	EXCLUDE = 2
}


enum DemandStatus {
	DRAFT = 1,
	ACTIVE = 3,
	PAUSED = 4,
	EXPIRED = 5,
	PENDING = 6,
	REJECTED = 7,
	ARCHIVED = 9
}

enum DemandSource {
	NETWORK = 1,
	TPAN = 2, 
	IFD = 3,
	IN_HOUSE = 4,
	HOSTED = 5
}

enum BudgetType {
	ACCOUNT = 1,
	CAMPAIGN = 2
}

enum PriceType {
	CPC = 1,
	CPM = 2
}

enum AdRatingType {
	PERFORMANCE = 0,
	MATURE = 1,
	FAMILY_SAFE = 2
}

enum TrackingCodeType {
	URL = 1,
	SCRIPT = 2
}

enum BusinessClassification {
	AFFILIATES = 1,
	CONTENT = 2,
	APPS = 3,
	BRAND_PERFORMANCE = 4,
	BRAND = 5
}

enum TargetingType {
	// Target by inmobi defined preset
	INMOBI_PRESET = 1,
	
	// Target by saved preset
	ACCOUNT_PRESET = 2, //ACCOUNT_
	
	// Target by custom specific selection
	CUSTOM = 3,
}

enum DeviceSelectionMode {
	ALL = 1,
	GROUP = 2,
	SPECIFIC = 3
}

enum AdFormat  {
	TEXT = 0,
	BANNER = 1,
	BANNER_URL = 3,
	THREED = 4,
	EXPANDABLE = 5,
	INTERSTITIAL = 6,
	TWO_PIECE = 7,
	RICH_BANNER = 8
}

enum CreativeContentProvider {
	SPROUT,
	OTHERS
}

enum RMContentType {
	URL = 1,
	HTML = 2,
	JS = 3
}

struct AgeRange {
	1: required i32 ageStart,
	2: required i32 ageEnd
}

struct DateTime {
	//date in format yyyy-MM-dd [year-month-day]
	1: required string date,
	//time in format HH:mm:ss [hour-minute-seconds], default to 00:00:00
	2: optional string time,
	//timezone code from http://en.wikipedia.org/wiki/List_of_time_zone_abbreviations
	3: optional string timeZoneCode //DEFAULT to UTC
}

struct WriteContext {
	// Application which create/modifies the demand.
	1: required i32 appSourceId,
	
	// User who modifies/create the demand.
	2: required string modifiedBy,
	
	// Transaction id for request.
	3: optional string correlationId
}

//########################################################
//
//       CAMPAIGN MODELS
//
//#######################################################
	
struct CampaignBudgetConstraint {
	// maximum budget which will be spend each day. this is mandatory if campaign is burning from account.
	1: required double dailyLimit,
	
	// flag to mark the campaign has dynamic daily limit enabled
	2: required bool dynamicDailyLimit,
	
	// % value for allowed dynamic setting of daily limit
	3: optional double dailyLeewayPercentage,

	// flag to mark the campaign daily limit is inherited from campaign budget
	4: optional bool dailyLimitInherited
	
}

struct Campaign {

	// Source of demand. Once created cannot modify the demand source.
	1: required DemandSource demandSource, 
	
	// account id for which demand being created. Once created cannot modify the account id.
	2: required string accountId,

	// name of the campaign. should be unique per account.
	3: required string name,
	
	// start time of the campaign. should be greater than or equal to current day
	4: required DateTime startTime,
	
	// end time of the campaign. should be greater than or equal to start time.
	5: required DateTime endTime,
	
	6: required BudgetType budgetType,
	
	7: optional double totalBugdet,
	
	8: optional i32 currencyId, //DEFAULT USD
	
	// campaign budget details
	9: required CampaignBudgetConstraint budgetConstraint
}

//############################################
//
//	AD GROUP MODELS
//
//############################################


struct Preset {
	// Preset id
	1: required i32 id,
	// Name of the preset
	2: required string name
}

// ***************
//   GEO MODELS
// *******************


// Lat-long details of GEO
struct LatLongDetail {
	// name for the lat-long
	1: required string name,
	2: required double latitude,
	3: required double longitude,
	
	// Radius to use in geo fencing.
	4: required double radius
}

struct CarrierTargetingDetail {
	//Targeted country id
	1: required i32 countryId,
	// list of ccid to be targeted.
	2: required list<i64> ccIds
}

struct GeoTargetingDetail {
	
	// Geo enabled country id.
	1: required i32 countryId,
	
	// list of states to be targeted on above mentioned country id.
	2: optional list<i32> stateIds,
	
	// list of cities to be targeted on the above mentioned country id.
	3: optional list<i32> cityIds,
	
	// list of zip to be targeted, if not present, all zip are included. 
	4: optional list<i32> zipIds,
	
	// list of lat-long details to be targeted for geo fencing.
	5: optional list<LatLongDetail> latLongDetails,
	
}


// **************************************
//  DEVICE MODELS
// **************************************

struct OSDetail {

	// platform os id.
	1: required i32 osId,
	
	// maximum major os version. empty means no maximum major version limit (inclusive). 
	2: optional double maximumMajorVersion,
	
	// minimum major os version. empty means no minimum version limit (inclusive)
	3: optional double minimumMajorVersion,
	
	// SelectionMode.INCLUDE
	//	if os version is present, then only versions in range is included for targeting.
	//	if os version is not present, then os is included for targeting
	// SelectionMode.EXCLUDE
	//	if os version is present, then only versions in range is excluded.
	//	if os version is not present, then entire os is excluded
	4: required SelectionMode selectionMode
}

// HandsetDetail
struct ManufacturerDetail {

	// Manufacturer id
	1: required i32 manufacturerId,
	
	// list of handset to targeted for the manufactuer. empty means no specific handset selection.
	2: optional list<i32> handsetIds,
	
	// SelectionMode.INCLUDE
	//	if handsetIds is present, then only handsets in the list is included for targeting.
	//	if handsetIds is not present, then entire manufacturer is included for targeting
	// SelectionMode.EXCLUDE
	//	if handsetIds is present, then only handsets in the list is excluded.
	//	if handsetIds is not present, then entire manufacturer is excluded
	3: required SelectionMode selectionMode
}

struct DeviceDetail {
	// list of targeted os details. empty means all os version.
	1: optional list<OSDetail> osDetails,
	
	// list of targeted manufacturer details. empty means all manufacturers
	2: optional list<ManufacturerDetail> manufacturerDetails
	
	// list of device types like smart phone, tablet. For example All Samsung Tablet, 
	3: optional list<i32> deviceTypes,
	
	// device selection type
	4: optional DeviceSelectionMode deviceSelectionMode=DeviceSelectionMode.ALL
}


struct Browser {
	// browser version id
	1: required i32 browserId,
	// maximum major browser version. empty means no maximum major version limit (inclusive). 
	2: optional double maximumMajorVersion,
	// minimum major browser version. empty means no minimum version limit (inclusive)
	3: optional double minimumMajorVersion,
	// SelectionMode.INCLUDE
	//	if browser version is present, then only versions in range is included for targeting.
	//	if browser version is not present, then browser is included for targeting
	// SelectionMode.EXCLUDE
	//	if browser version is present, then only versions in range is excluded.
	//	if browser version is not present, then entire browser is excluded
	4: required SelectionMode selectionMode
	
}


struct TimeWindow {
	// starting hour for targeting with respect to ad group timezone. 
	// 0 means 00:00 - 00:59
	// 1 means 01:00 - 01:59
	// to target first hour: -> 0 - 0
	// to target last hour -> 23 - 23
	// to target full day -> 0 - 23
	1: required byte startHour,
	
	// end hour for targeting with respect to ad group timezone. endHour is inclusive
	2: required byte endHour
}

struct Schedule {
	// day wise time targeting.
	1: required DayOfWeek dayOfWeek,
	2: required list<TimeWindow> timeSlots
}


struct AdGroupPricing {
	
	// price type of the ad group.
	1: required PriceType priceType,
	
	// bid value
	2: required double bidValue,
	
	// recommended bid value at the time of bidding.	
	3: optional double recommendedBidValue,

	// maximum amount spend by ad group per day.
	// defaulted to daily budget of the campaign on creation
	4: optional double dailySpendLimit,
	
	5: optional bool dynamicBidEnabled,
	
	6: optional bool slackEnabled
}

struct AdGroupConstraint {
	// maximum impression per frequency duration per user-site
	1: optional i32 frequencyCap,
	
	// frequency duration in minutes.
	2: optional i32 frequencyDurationInMinutes
	
	// guaranteed delivery flag. 
	3: optional bool guaranteedDeliveryEnabled,
	4: optional bool deliveryPacingEnabled,
	5: optional bool minDailyGuaranteedImpression,
	
	6: optional double targetCPA,
	
	7: optional bool appFeedbackEnabled,
	
	8: optional bool targetBillableUsersOnly
}

struct AdGroupBasic {
	//name of the ad group
	1: required string name,
	
	// Ad group objective. 
	2: required i32 objectiveId,
	
	// flag to denote the rich media ad group.
	3: required bool richMediaEnabled,
	
	// action to be performed for this ad group. 
	4: optional ClickToAction clickToAction,
	
	// the destination of click to action. 
	5: optional string ctaDestination,
	
	// final landing url
	6: optional string finalLandingURL,
	
	// app id to be used for tracking
	7: optional string appId,
	
	// start date of the ad group.
	8: required DateTime startTime,
	
	// end date of the ad group. 
	9: required DateTime endTime,
	
	10: optional i32 trackingPartnerId,

	11: optional i32 appMarketPlaceId
}

struct AdGroupMeta {
	1: optional BusinessClassification businessClassification,
	2: optional list<i32> categoryIds,
	3: optional list<i32> tagIds
}
		

/* Ad Related */
struct TrackingCode {

	1: required TrackingCodeType trackingCodeType,

	2: required string trackingCodeValue
}


struct AdBasic {
	// The id of ad group for which creative is being created.
    // It's not possible to change the ad group of creative.
    1: required string adGroupId,
	
	// name of the creative, updateable at any time.
    2: required string name,

	// It's not possible to change the ad group of creative.
	3: required AdFormat adFormat,

    // creative tracking codes
    4: optional list<TrackingCode> trackingCodes,

    // custom header to track the performance of each creative by adding a unique code to the landing page URL
    5: optional string customHeader,
}

struct SimpleAd {

	1: required AdBasic adBasic,
	
	// Used for Text or Banner URL as no additional content upload required for these use cases
	2: required string adValue

}

struct BannerAd {
	1: required AdBasic adBasic,
	
	2: required i32 contentId,

	3: required string altText
}

struct RichMediaAd {
	1: required AdBasic adBasic,
	
	2: required i32 contentId,

	3: required string altText,
	
	4: optional list<i32> sdkCapabilities
}

struct RichMediaCreative {
	// Content provider for the RichMedia Creative.
	1: required CreativeContentProvider contentProvider,
	// Content. For Sprout, this will be a sprout URL, for TPAT the value will be entire content
	2: required string rmValue,
	// rm value content type
	3: required RMContentType contentType,
	// rm content format type
	4: required AdFormat rmFormat,
	// external id of the content
	5: optional string externalId,
	// Initital slot dimension id.
	6: required i32 initialSlotId
	
}

struct Image {
	// Required Slot dimension id
	1: required i32 slotId,
	// image binary content
	2: required binary content,
	// mime type of the content
	3: required string mimeType
}

struct BannerCreative {

	1: required string altText,
	
	2: required list<Image> images
	
}


	
	





