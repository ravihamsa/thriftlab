include "DemandModel.thrift"
include "DemandDTO.thrift"
include "AdvertiserModel.thrift"

namespace java com.inmobi.advertiser.thrift.dto

struct AdvCampaignSummary {
	// id of the account (advertiser), who owns the campaign.
	1: required string accountId, 
	
	// id of the campaign
	2: required string campaignId,
	
	// name of the campaign
	3: required string campaignName,
		
	// status of the campaign
	4: required DemandModel.DemandStatus status
}

struct AdvCampaignDetail {

	1: required AdvertiserModel.AdvCampaign campaign,

	// Id of the campaign.
	2: required string campaignId,
	
	// Status of the campaign
	3: required DemandModel.DemandStatus status,
	
	// creation date of campaign in epoch time.
	4: required DemandModel.DateTime createdOn,
	
	// no of ad groups (excluding the archived)
	5: required i32 adGroupCount,
	
	// remaining budget in this campaign, if campaign has dedicated budget.
	6: optional double balance
}



struct AdvCampaignSearchRequest {
	1: required DemandDTO.BaseSearchParam baseSearchParam
}

struct AdvGeoCarrierTargeting {
        
        // Type of geo targeting. 
        // ACCOUNT_PRESET = targeting based on saved preset
        // CUSTOM = targeting based on specific selection
        // INMOBI_PRESET = targeting based on inmobi custom region
        1: optional DemandModel.TargetingType targetingType,
        
        // Mandatory for TargetingType = ACCOUNT_PRESET/INMOBI_PRESET
        2: optional i32 presetId,
        
        // Mandatory for TargetingType = CUSTOM
        3: optional list<AdvertiserModel.AdvGeoCarrierTargetingDetail> targetingDetails
}

struct AdvDeviceTargeting {
	
	// type of device targeting.
	1: optional DemandModel.TargetingType targetingType,
	
	// saved device targeting preset id. Mandatory if type is DeviceTargetingType.PRESET
	2: optional i32 presetId,
	
	3: optional AdvertiserModel.AdvDeviceDetail deviceDetail
	
}


struct AdvBrowserTargeting {
	1: required list<AdvertiserModel.AdvBrowser> browsers	
}

struct AdvDemogTargeting {
	1: optional DemandModel.Gender gender,
    2: optional list<i32> ageRangeIds
}

struct AdvScheduleTargeting {
	1: optional list<AdvertiserModel.AdvSchedule> schedules
}


struct AdvAdGroupTargeting {
	
	// geo targeting details of the ad group.
	1: optional AdvGeoCarrierTargeting geoTargeting,
	
	// device targeting details of the ad group
	2: optional AdvDeviceTargeting deviceTargeting,
	
	// demographic targeting details of the ad group
	3: optional AdvDemogTargeting demogTargeting,
	
	// time of day targeting details of the ad group
	4: optional AdvScheduleTargeting scheduleTargeting,
	
	// list of browsers to be targeted. empty means no specific selection
	5: optional AdvBrowserTargeting browserTargeting
	
	// targeting domains
	6: optional list<DemandModel.DomainTraffic> domains
}

struct AdvAdGroup {

	// owning account's id
	1: required string accountId,
	
	// The id of campaign for which ad group is being created/modified.
	// It's not possible to change the campaign of ad group.
	2: required string campaignId, 
	
	// Ad group basic details
	3: required AdvertiserModel.AdvAdGroupBasic adGroupBasic,
	
	// targeting details of this ad group
	4: optional AdvAdGroupTargeting adGroupTargeting,
	
	// pricing details of this ad group
	5: optional AdvertiserModel.AdvAdGroupPricing adGroupPricing
	
}

struct AdvAdGroupSummary {
	// account id of owning account
	1: required string accountId,
	
	// id of owning campaign
	2: required string campaignId,
	
	// ad group id
	3: required string adGroupId,
	
	// name of the ad group
	4: required string adGroupName,
	
	// status of the ad group
	5: required DemandModel.DemandStatus status
}


struct AdvAdGroupDetail {
	1: required AdvAdGroup adGroup,

	// Id of the ad group.
	2: required string adGroupId,
	
	// Status of the ad group
	3: required DemandModel.DemandStatus status,
	
	// creation date of ad group in epoch time.
	4: required DemandModel.DateTime createdOn,
	
	// no of creatives (excluding the archived)
	5: required i32 adCount,
	
	// brand image URL if uploaded
	6: optional string brandImageURL
	
}

struct AdvAdGroupSearchRequest {

	1: required DemandDTO.BaseSearchParam baseSearchParam,
        
    // list of campaign ids.
    2: optional list<string> campaignIds,
    
    //if true, returns the ad groups whose searched statuses are derived from parent (campaign)
    3: optional bool statusInherited
}


struct AdvCopyAdGroupDetail {
	
	// id of the account, where copy need to be done.
        1: required string accountId,
        
        // Id of the campaign, where the ad group need to be copied.
        2: required string destinationCampaignId,
        
        // Id of the ad group which need to be copied.
        3: required string sourceAdGroupId,
        
        4: required string newAdGroupName,
        
        // list of ad ids to be copied from the ad group.
        5: optional list<string> adIds,
        
        // ClickToAction for new ad group.
        6: optional DemandModel.ClickToAction clickToAction,
        
        // landing destination for new ad group.
        7: optional string ctaProposition
}


struct AdvAdSummary {
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
	
	6: required DemandModel.AdFormat adFormat,
	
	7: optional string contentId,
	
	// status of the ad
	8: required DemandModel.DemandStatus status
	
}

struct AdvBannerDetail {
	1: required string altText,
	2: required map<i32, string> previewURLs
}

struct AdvRMDetail {
	1: required string altText,
	2: required AdvertiserModel.AdvRMContent rmContent
}

struct AdvBanner {
	1: required string fileName,
	2: optional string previewURL,
	3: required i32 slotId
}

struct AdvBannerContentDetail {
	1: required string contentId,
	2: required list<AdvBanner> bannerDetails
}

struct AdvRMContentDetail {
	1: required string contentId,
	2: required AdvertiserModel.AdvRMContent rmContent,
	3: optional string adGroupLandingURL
} 

struct AdvAdSearchRequest {
	
    1: required DemandDTO.BaseSearchParam baseSearchParam,
    
    // list of campaign ids
    2: optional list<string> campaignIds,
    
    // list of ad group ids.
    3: optional list<string> adGroupIds,
    
    //if true, returns the ad groups whose searched statuses are derived from parent (ad group/campaign)
    4: optional bool statusInherited        

}	


struct AdvAdDetail {
	1: required AdvertiserModel.AdvAdBasic adBasic,

	// owning account's id
	2: required string accountId,
	
	// owning campaign's id
	3: required string campaignId,
	
	// Id of the ad.
	4: required string adId,
	
	// Status of the ad group
	5: required DemandModel.DemandStatus status,
	
	// creation date of ad group in epoch time.
	6: required DemandModel.DateTime createdOn,
	
	// will be populated for AdFormat.TEXT, AdFormat.BANNER_URL.
	7: optional string simpleAdValue,

	// will be populated for AdFormat.BANNER
	8: optional AdvBannerDetail bannerDetail,
	
	// will be populated for all rich media formats
	9: optional AdvRMDetail rmDetail

}

struct AdvLandingUrlDetail{
	1: required string landingUrl;
	
	2: optional string appId;
	
	3: optional i32 platformId;
}

struct AdvSupportedBrowserQueryParam{
	1: optional list<i32> osIds,
	
	2: optional list<i32> manufIds,
	
	3: optional list<i32> deviceIds,
	
	4: optional list<i32> deviceTypeIds,
	
	5: optional i32 platformId
}

struct AdvIdNamePair {
	1: required i32 id,
	2: required string name
}

struct AdvHandsetDTO {
	1: required i32 id, 
	2: required string name,
	3: optional string description,
	4: optional string marketingName,
	5: optional string modelName,
	6: required i64 manufacturerId
}
