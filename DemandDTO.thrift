include "DemandModel.thrift"

namespace java com.inmobi.demand.thrift.service.dto
namespace py inmobi_demand_core_rpc.service_dto

enum SortOrder {
	ASC = 1,
	DESC = 2
}

enum SortField {
	NAME = 1,
	STATUS = 2,
	LAST_MODIFIED_TIME = 3
}

enum MatchMode {
	EXACT = 1,
	ENDS_WITH = 2,
	STARTS_WITH = 3,
	ANY_WHERE = 4
}

struct DateRange {
	1: required DemandModel.DateTime startDate,
	2: optional DemandModel.DateTime endDate //DEFAULT to current time
}

struct CampaignDetail {
	
	// details of the campaign
	1: required DemandModel.Campaign campaign,

	// Id of the campaign.
	2: required string campaignId,
	
	// campaign inc id.
	3: required i32 incId,
	
	// current Status of the campaign
	4: required DemandModel.DemandStatus status,
	
	// creation date of campaign in epoch time.
	5: required DemandModel.DateTime createdOn,
	
	// last modified date of campaign in epoch time.
	6: required DemandModel.DateTime lastModifiedOn,
	
	// remaining budget in this campaign, if campaign has dedicated budget.
	7: optional double balance,
	
	// previous state of the campaign. Initially will be same as campaign's current state.
	8: optional DemandModel.DemandStatus previousStatus
}

struct CampaignSummary {
	// id of the account who owns the campaign.
	1: required string accountId, 
	
	// id of the campaign
	2: required string campaignId,

	// campaign inc id.
	3: required i32 incId,
		
	// name of the campaign
	4: required string campaignName,
		
	// current status of the campaign
	5: required DemandModel.DemandStatus status,
	
	// demand source of the campaign
	6: required DemandModel.DemandSource demandSource,
	
	// previous state of the campaign.
	7: optional DemandModel.DemandStatus previousStatus
}


struct BaseSearchParam {
	
	// account id to filter
	1: optional string accountId,
	
	// starting index of the records to be included in the result 
	2: optional i32 rangeStart = 0,
	
	// max number of records to be included in the result. The allowed maximum range length is 100. 
	// any value greater than 100 is reset to 100.
	3: optional i32 rangeLength = 100, 
	
	// search text to filter on name. empty means no filtering by the name.
	4: optional string searchText,
	
	// Matchmode to search the name. if search name is empty, then this attribute is ignored
	5: optional MatchMode matchMode = MatchMode.ANY_WHERE,
		
	// statuses to be filtered.
	// All unsupported status are ignored. 
	// defaulted to all status
	6: optional list<DemandModel.DemandStatus> statuses,
	
	// Sort order field.
	// defaulted to the last modified time
	7: optional SortField sortBy = SortField.LAST_MODIFIED_TIME,
	
	8: optional SortOrder sortOrder = SortOrder.ASC 
}


struct CampaignSearchRequest {
	
	1: required BaseSearchParam baseSearchParam
}




//###############################################################################
//
//  AD GROUP SERVICE DTO
//
//###############################################################################

struct GeoTargeting {
	
	// Type of geo targeting. 
	// ACCOUNT_PRESET = targeting based on saved preset
	// SPECIFIC = targeting based on specific selection
	// INMOBI_PRESET = targeting based on inmobi custom region
	1: optional DemandModel.TargetingType targetingType,
	
	// Mandatory for TargetingType = PRESET/INMOBI_PRESET
	2: optional i32 presetId,
	
	// Mandatory for TargetingType = SPECIFIC
	3: optional list<DemandModel.GeoTargetingDetail> targetingDetails
}

struct CarrierTargeting {
	1: required list<DemandModel.CarrierTargetingDetail> carrierTargetings
}

struct GeoCarrierPresetDetail {
	1: optional list<DemandModel.GeoTargetingDetail> geoTargetingDetails,
	2: optional list<DemandModel.CarrierTargetingDetail> carrierTargetings
}

struct DeviceTargeting {
	
	// Type of device targeting. 
	// ACCOUNT_PRESET = targeting based on saved preset
	// SPECIFIC = targeting based on specific selection
	// INMOBI_PRESET = targeting based on inmobi defined device groups
	1: optional DemandModel.TargetingType targetingType,
	
	// id of the saved preset. Mandatory for TargetingType = PRESET/INMOBI_PRESET
	2: optional i32 presetId,
	
	// Device details 
	3: optional DemandModel.DeviceDetail deviceDetail
}

struct BrowserTargeting {
	1: required list<DemandModel.Browser> browsers	
}

struct DemogTargeting {
	1: optional DemandModel.Gender gender,
	2: optional list<DemandModel.AgeRange> ageRanges
}

struct ScheduleTargeting {
	1: required list<DemandModel.Schedule> schedules
}

struct AdGroupTargetingDetail {

        // geo targeting details of the ad group. empty means no specific selection
        1: optional GeoTargeting geoTargeting,

		// carrier targeting details of the ad group. empty means no specific selection. target all.
		2: optional CarrierTargeting carrierTargeting,
		
        // device targeting details of the ad group. empty means no specific selection
        3: optional DeviceTargeting deviceTargeting,

        // demographic targeting details of the ad group. empty means no specific selection
        4: optional DemogTargeting demogTargeting,

        // time of day targeting details of the ad group. empty means no specific selection
        5: optional ScheduleTargeting scheduleTargetings,

        // list of browsers to be targeted. empty means no specific selection
        6: optional BrowserTargeting browserTargeting

        // targeting domains. empty means no specific selection
        7: optional list<DemandModel.DomainTraffic> domainTraffic
        
        
}


struct AdGroupTargeting {
	
	// Type of device targeting. 
	// ALL = no device specific selection, 
	// PRESET = targeting based on saved preset
	// SPECIFIC = targeting based on specific selection
	1: optional DemandModel.TargetingType targetingType,
	
	// id of the saved preset. Mandatory for TargetingType = PRESET.
	2: optional i32 presetId,
	
	3: optional AdGroupTargetingDetail adGroupTargetingDetail
}

struct AdGroup {

	// The id of campaign for which ad group is being created/modified.
	// It's not possible to change the campaign of ad group.
	1: required string campaignId, 
	
	// Ad group basic details
	2: required DemandModel.AdGroupBasic adGroupBasic,
	
	// targeting details of this ad group
	3: required AdGroupTargeting adGroupTargeting,
	
	// pricing details of this ad group
	4: required DemandModel.AdGroupPricing adGroupPricing,
	
	5: optional DemandModel.AdGroupConstraint adGroupConstraint,
	
	6: optional DemandModel.AdGroupMeta adGroupMeta
	
}

struct AdGroupSummary {
	// account id of owning account
	1: required string accountId,
	
	// id of owning campaign
	2: required string campaignId,
	
	// ad group id
	3: required string adGroupId,
	
	// name of the ad group
	4: required string adGroupName,
	
	// status of the ad group
	5: required DemandModel.DemandStatus status,
	
	6: optional DemandModel.DemandStatus previousStatus
} 

struct AdGroupDetail {

	1: required AdGroup adGroup,

	// Id of the ad group.
	2: required string adGroupId,

	// account id of owning account
	3: required string accountId,
	
	// id of owning campaign
	4: required string campaignId,
		
	// Status of the ad group
	5: required DemandModel.DemandStatus status,
	
	// creation date of ad group in epoch time.
	6: required DemandModel.DateTime createdOn,
	
	// brand image URL if uploaded
	7: optional string brandImageURL,
	
	8: optional DemandModel.DemandStatus previousStatus
	
}

struct AdGroupSearchRequest {

	1: required BaseSearchParam baseSearchParam,
	
	// list of campaign ids.
	2: optional list<string> campaignIds,
	
	//if true, returns the ad groups whose searched statuses are derived from parent (campaign)
	3: required bool statusInherited
}


struct CopyAdGroupDetail {
	
	// id of the account, where copy need to be done.
	1: required string accountId,
	
	// Id of the campaign, where the ad group need to be copied.
	2: required string destinationCampaignId,
	
	// Id of the ad group which need to be copied.
	3: required string sourceAdGroupId,
	
	4: required string newAdGroupName,
	
	// flag to enable the rich media capability of the ad group. 
	// 	if true and source ad group is rich media, then creative copying is allowed.
	//	if true and source ad group is not rich media, creative copying is not allowed. (will throw validation exception if adIds is not empty)
	//  if false and source ad group is rich media, creative copying is not allowed (will throw validation exception if adIds is not empty)
	//  if false and source ad group is not rich media, creative copying is allowed.
	5: required bool enableRichMedia,
	
	// list of ad ids to be copied from the ad group.
	6: optional list<string> adIds,
	
	// ClickToAction for new ad group.
	7: optional DemandModel.ClickToAction clickToAction,
	
	// landing destination for new ad group.
	8: optional string ctaProposition
}

struct SlotDetail {
	1: required i32 id,
	2: required i32 height,
	3: required i32 width,
	4: required bool rmCapable
}

struct AdSummary {
	// owning account's id
	1: required string accountId,
	
	// owning campaign's id
	2: required string campaignId,
	
	// owning ad group's id
	3: required string adGroupId,
	
	// id of the ad
	4: required string adId,
	
	// name of the ad
	5: required string adName,
	
	6: optional i32 contentId,
	
	7: required DemandModel.AdFormat adFormat,
	
	// status of the ad
	8: required DemandModel.DemandStatus status,
	
	9: optional DemandModel.DemandStatus previousStatus
}

struct AdSearchRequest {
	
	1: required BaseSearchParam baseSearchParam,
	
	// list of campaign ids
	2: optional list<string> campaignIds,
	
	// list of ad group ids.
	3: optional list<string> adGroupIds,
	
	//if true, returns the ad groups whose searched statuses are derived from parent (ad group/campaign)
	4: optional bool statusInherited	
}	

struct BannerDetail {
	1: required string altText,
	2: required map<i32, string> previewURLs
}

struct RMDetail {
	1: required string altText,
	2: required DemandModel.RichMediaCreative rmCreative,
	3: optional list<i32> sdkCapabilities
}
	

struct AdDetail {

	1: required DemandModel.AdBasic adBasic,

	// Id of the ad.
	2: required string adId,
	
	3: required string accountId,
	
	4: required string campaignId,
	
	// Status of the ad group
	5: required DemandModel.DemandStatus status,
	
	6: optional DemandModel.DemandStatus previousStatus,
	
	// creation date of ad group in epoch time.
	7: required DemandModel.DateTime createdOn,
	
	// will be populated for AdFormat.TEXT, AdFormat.BANNER_URL.
	8: optional string simpleAdValue,

	// will be populated for AdFormat.BANNER
	9: optional BannerDetail bannerDetail,
	
	// will be populated for all rich media formats
	10: optional RMDetail rmDetail
}

struct CreativeDetail {
	1: required i32 contentId,
	2: optional map<i32, string> previewURLs
}

struct RMCreativeDetail {
	1: required i32 contentId,
	2: required DemandModel.RichMediaCreative rmCreative 
} 
