include "AdvertiserModel.thrift"
include "AdvertiserDTO.thrift"
include "AdvertiserException.thrift"
include "DemandModel.thrift"

namespace java com.inmobi.advertiser.thrift.service

service AdvertiserService {

	// Method to get the list of campaign summary, for the given search params.
	list<AdvertiserDTO.AdvCampaignSummary> getCampaigns(1: AdvertiserDTO.AdvCampaignSearchRequest campaignSearch, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e,  2: AdvertiserException.InternalServerError ise);


	// Method to get the details of single campaign.
	// throws no data found exception, if no campaign found for given campaign id in account. This method doesn't consider the 
	// status of the campaign. 'accountId' param is to validate the account is valid and active, and has permission to access the
	// campaign.
	AdvertiserDTO.AdvCampaignDetail getCampaign(1: string campaignId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	
	// Method to get the total count of campaigns for given search. 
	i32 getTotalCampaignCount(1: AdvertiserDTO.AdvCampaignSearchRequest campaignSearch, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	
	// Method to get the list of ad group summary, for the given search params.
	list<AdvertiserDTO.AdvAdGroupSummary> getAdGroups(1: AdvertiserDTO.AdvAdGroupSearchRequest adGroupSearch, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	
	// Method to get the total count of ad group for given search.
	i32 getTotalAdGroupCount(1: AdvertiserDTO.AdvAdGroupSearchRequest adGroupSearch, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	
	// Method to get the details of ad group for given ad group id.
	// throws no data found exception, if no ad group found for given ad group id and account id. This method deosn't consider the 
	// status of the ad group. 'accountId' param is to validate the account is valid and active, and has permission to access the ad group.
	AdvertiserDTO.AdvAdGroupDetail getAdGroup(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);

	// Method to get the basic details of ad group for given ad group id.
	AdvertiserModel.AdvAdGroupBasic getAdGroupBasic(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	// Method to get the ad group targeting details. This is a convienient method to get only ad group targeting details. 
	// 'accountId' param is to validate the account is valid and active, and has permission to access the ad group.
	AdvertiserDTO.AdvAdGroupTargeting getAdGroupTargeting(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	
	// Method to get the geo targeting details of an ad group. 'accountId' param is to validate the account is valid and active, 
	// and has permission to access the ad group.
	AdvertiserDTO.AdvGeoCarrierTargeting getAdGroupGeoCarrierTargeting(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	
	// Method to get the device targeting details of an ad group. 'accountId' param is to validate the account is valid and active, 
	// and has permission to access the ad group.
	AdvertiserDTO.AdvDeviceTargeting getAdGroupDeviceTargeting(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);

	// Method to get the browser targeting details of given ad group.
	AdvertiserDTO.AdvBrowserTargeting getBrowserTargeting(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	// Method to get the schedule targeting details of the ad group. 'accountId' param is to validate the account is valid and active, 
	// and has permission to access the ad group.
	AdvertiserDTO.AdvScheduleTargeting getScheduleTargeting(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);


	// Method to get the demog targeting details of the ad group.
	AdvertiserDTO.AdvDemogTargeting getDemogTargeting(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	
	// Method to get the ad group price details. 'accountId' param is to validate the account is valid and active, and has permission to access the ad group.
	AdvertiserModel.AdvAdGroupPricing getAdGroupPricing(1: string adGroupId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);


	// Method to get all device presets fro given account id.
	list<AdvertiserModel.AdvPreset> getAllDevicePreset(1: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	AdvertiserModel.AdvDeviceDetail getDevicePresetDetail(1: i32 presetId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	// Method to get all geo presets for given account id
	list<AdvertiserModel.AdvPreset> getAllGeoCarrierPreset(1: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	list<AdvertiserModel.AdvGeoCarrierTargetingDetail> getGeoCarrierPresetDetail(1: i32 presetId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	// Method to get the list of all ads for given search conditions
	list<AdvertiserDTO.AdvAdSummary> getAds(1: AdvertiserDTO.AdvAdSearchRequest adSearch, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to get the details of an for given account id and ad id. 'accountId' param is to validate the account is valid and active, 
	// and has permission to access the ad group.
	AdvertiserDTO.AdvAdDetail getAdDetail(1: string adId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);

	
	// Method to get the total count of ad for given search.
	i32 getTotalAdCount(1: AdvertiserDTO.AdvAdSearchRequest adSearch, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	
	/**
	
		convenience methods for UI
	*/
	
	double getRecommendBid(1: list<i32> countryIds, 2: i32 ctaId, 3: DemandModel.PriceType priceType) throws (1: AdvertiserException.InternalServerError ise);
	
	
	
	/**
		End of convenience methods
	*/
	
	/**
		WRITE METHODS
	*/
	
	// Method to create campaign. Campaign will be created in draft state, if the account does not have enough fund
	// or account is not burning from account. Otherwise campaign is created in active state
	AdvertiserDTO.AdvCampaignSummary createCampaign(1: AdvertiserModel.AdvCampaign campaign, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to update the details of single campaign.	
	void updateCampaign(1: string campaignId, 2: AdvertiserModel.AdvCampaign campaign, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise); 

	
	// Method to activate a campaign. Activating a campaign puts all draft ad group into pendind state and move draft ad to pending ads.
	// Activating campaign will allocate the budget from account to campaign if the burn source is Dedicated Budget.
	// Campaign can be activated only if the account is active.
	AdvertiserDTO.AdvCampaignSummary activateCampaign(1: string campaignId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	
	// Method to pause an active campaign. Pausing a campaign will not deallocate the budget to account.
	// pausing a campaign cause all active ad groups and ad in the campaign to be paused. Campaign can be paused only if the account
	// is active.
	AdvertiserDTO.AdvCampaignSummary pauseCampaign(1: string campaignId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	// Method to expire a campaign. Expiring a campaign will not deallocate the budget to account.
	// Expiring a campaign cause all active ad groups and ad in the campaign to be expired. Campaign can be expired only if the account
	// is active.
	//AdvertiserModel.AdvCampaignSummary expireCampaign(1: string campaignId, 2: AdvertiserModel.AdvWriteContext contextInfo)
	//	throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	// Method to resume a paused campagin. Resuming a campaign will also resume all paused ad groups and ad in the campaign, which 
	// has inherited the state from the campaign. Campaign can be resumed only if the account is active.
	AdvertiserDTO.AdvCampaignSummary resumeCampaign(1: string campaignId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	
	// Method to re activate an expired campaign. Re activating an expired campaign cause all expired ad group /ad to be reactivated.
	// Campaign can be re activated only if account is active.
	AdvertiserDTO.AdvCampaignSummary reactivateCampaign(1: string campaignId,  2: DemandModel.DateTime newEndDate, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		

	// Method to archive a campaign. Archiving is a soft delete. Archiving campaign archives the ad group and ad also. Once archived
	// nothing can be done with the campaign. Archiving campaign deallocate the remaining budget in the campaign back to account.
	AdvertiserDTO.AdvCampaignSummary archiveCampaign(1: string campaignId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	
	// Method to create ad group. Status of ad group is based account type. If account type is 'managed' the status of ad group will
	// be in 'pending [approval]' regardless the status of campaign. If account type is 'self served' the status of ad group will be 
	// depend on the status of campaign. If campaign status is 'active', ad group will be in pending state, else the ad group will be 
	// also in draft state. 
	AdvertiserDTO.AdvAdGroupSummary createAdGroup(1: AdvertiserDTO.AdvAdGroup adGroup, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to update the ad group. updating ad group landing url or objective or click action, will put h
	void updateAdGroup(1: string adGroupId, 2: AdvertiserDTO.AdvAdGroup adGroup, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	// Method to update the ad group basic information
	void updateAdGroupBasic(1: string adGroupId, 2: AdvertiserModel.AdvAdGroupBasic adGroupBasic, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	// Method to update the targeting details of ad group.
	void updateAdGroupTargeting(1: string adGroupId, 2: AdvertiserDTO.AdvAdGroupTargeting adGroupTargeting, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to update the geo targeting details of ad group.
	void updateAdGroupGeoCarrierTargeting(1: string adGroupId, 2: AdvertiserDTO.AdvGeoCarrierTargeting geoCarrierTargeting, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to update the device targeting of ad group.
	void updateAdGroupDeviceTargeting(1: string adGroupId, 2: AdvertiserDTO.AdvDeviceTargeting deviceTargeting, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	
	// Method to update the demog targeting of the ad group.
	void updateDemogTargeting(1: string adGroupId, 2: AdvertiserDTO.AdvDemogTargeting demogTargeting, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	void updateBrowserTargeting(1: string adGroupId, 2: AdvertiserDTO.AdvBrowserTargeting browserTargeting, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise)

	// Method to update the schedule targeting
	void updateScheduleTargeting(1: string adGroupId, 2: AdvertiserDTO.AdvScheduleTargeting scheduleTargeting, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	
	// Method to update the ad group pricing details
	void updateAdGroupPricing(1: string adGroupId, 2: AdvertiserModel.AdvAdGroupPricing adGroupPricing, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	
	// Method to copy ad group from one campaign to another campaign or to same campaign.
	AdvertiserDTO.AdvAdGroupSummary copyAdGroup(1: AdvertiserDTO.AdvCopyAdGroupDetail copyAdGroupDetail, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	AdvertiserModel.AdvPreset saveDevicePreset(1: string presetName, 2: AdvertiserModel.AdvDeviceDetail deviceDetail, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	AdvertiserModel.AdvPreset saveGeoCarrierPreset(1: string presetName, 2: list<AdvertiserModel.AdvGeoCarrierTargetingDetail> geoTargetingDetails, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	// Method to activate an ad group from 'draft' state.
	AdvertiserDTO.AdvAdGroupSummary activateAdGroup(1: string adGroupId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to pause an ad group. Ad group will be in paused state.
	AdvertiserDTO.AdvAdGroupSummary pauseAdGroup(1: string adGroupId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to resume paused ad group.
	AdvertiserDTO.AdvAdGroupSummary resumeAdGroup(1: string adGroupId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise, 3: AdvertiserException.NoDataFoundException ndfe);

	
	// Method to reactivate and expired ad group.
	AdvertiserDTO.AdvAdGroupSummary reactivateAdGroup(1: string adGroupId, 2: DemandModel.DateTime newEndDate, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	
	// Method to archive ad group.
	AdvertiserDTO.AdvAdGroupSummary archiveAdGroup(1: string adGroupId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	

	// Method to upload the brand image for the ad group.
	// returns the URL of the uploaded brand image.
	string uploadBrandImage(1: string adGroupId, 2: binary brandImage, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);

	// Method to create ad.
	AdvertiserDTO.AdvAdSummary createSimpleAd(1: AdvertiserModel.AdvSimpleAd simpleAd, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	AdvertiserDTO.AdvAdSummary createBannerAd(1: AdvertiserModel.AdvBannerAd bannerAd, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	AdvertiserDTO.AdvAdSummary createRichMediaAd(1: AdvertiserModel.AdvRichMediaAd richMediaAd, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	// Method to upload image content of ad. 
	// returns the content id of the upload content, and preview URL of the uploaded contents
	AdvertiserDTO.AdvBannerContentDetail uploadImageContent(1: string adGroupId, 2: AdvertiserModel.AdvBannerContent imgContent, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise); 
	
	AdvertiserDTO.AdvBannerContentDetail addImageContent(1: string adGroupId, 2: string contentId, 3: AdvertiserModel.AdvBannerContent imgContent, 4: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise); 
	
	//AdvertiserDTO.AdvBannerContentDetail removeImageContent(1: string contentId, 2: string imageName, 3: AdvertiserModel.AdvWriteContext contextInfo)
	//	throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise); 
	
	// Method to upload the rich media content 
	// return the content id of the rich media content and preview URL.	
	AdvertiserDTO.AdvRMContentDetail uploadRichMediaContent(1: string adGroupId, 2: AdvertiserModel.AdvRMContent rmContent, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	
	AdvertiserDTO.AdvBannerContentDetail getBannerContentDetail(1: string contentId, 2: AdvertiserModel.AdvReadContext requestContext) 
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	AdvertiserDTO.AdvRMContentDetail getRMContentDetail(1: i32 contentId, 2: AdvertiserModel.AdvReadContext requestContext) 
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.NoDataFoundException ndfe, 3: AdvertiserException.InternalServerError ise);
	
	
	// Method to update the details of an ad.
	void updateAd(1: string adId, 2: AdvertiserModel.AdvAdBasic ad, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	
	// Method to copy / import ad from another campaign / ad group. User can copy the ad from thier account only.
	AdvertiserDTO.AdvAdSummary copyAd(1: string adGroupId, 2: string adIdFrom, 3: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise); 

	
	// Method to pause an ad.
	AdvertiserDTO.AdvAdSummary pauseAd(1: string adId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to resume an ad from paused state.
	AdvertiserDTO.AdvAdSummary resumeAd(1: string adId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);


	// Method to archive an ad.
	AdvertiserDTO.AdvAdSummary archiveAd(1: string adId, 2: AdvertiserModel.AdvWriteContext contextInfo)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	//Method to get the App Id and MarketId if present for a landing url
	AdvertiserDTO.AdvLandingUrlDetail getLandingUrlDetail(1: string landingURL, 2: AdvertiserModel.AdvReadContext requestContext)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	string getJsonOfOSManuf(1: i32 platformId, 2: AdvertiserModel.AdvReadContext requestContext)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	// Method to get the supported browsers based on manuf, os , device, device type and platform id
	string getSupportedBrowsers(1: AdvertiserDTO.AdvSupportedBrowserQueryParam supportedBrowserQueryParam, 2: AdvertiserModel.AdvReadContext requestContext)
		throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
		
	list<AdvertiserDTO.AdvIdNamePair> getAllPlatforms(1: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.InternalServerError ise);
	
	//Method to search handsets for handset specific targeting
	list<AdvertiserDTO.AdvHandsetDTO> searchHandset(1: string searchString, 2: i32 platformId, 3: AdvertiserModel.AdvReadContext requestContext)throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	//Method to get AdSummary
	AdvertiserDTO.AdvAdSummary getAdSummary(1: string adId, 2: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.ServiceException e, 2: AdvertiserException.InternalServerError ise);
	
	
	// Method to get Image Content from Cache. This is used to generate preview of banner image, before it is uploaded to demand client
	binary getImageContent(1: string contentId, 2: string imageName, 3: AdvertiserModel.AdvReadContext requestContext) throws (1: AdvertiserException.NoDataFoundException e, 2: AdvertiserException.InternalServerError ise);
}
