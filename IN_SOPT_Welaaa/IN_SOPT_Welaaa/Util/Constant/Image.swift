//
//  Image.swift
//  IN_SOPT_Welaaa
//
//  Created by 김승찬 on 2022/11/12.
//

import UIKit

public enum Image {
    
    static let alert = UIImage(named: "ic_alert")!
    static let backRound = UIImage(named: "ic_back-round")!
    static let back = UIImage(named: "ic_back")!
    static let bookPlay = UIImage(named: "ic_book_play")!
    static let bookReplay = UIImage(named: "ic_book_replay")!
    static let bookDetailDown = UIImage(named: "ic_bookdetail_down")!
    static let bookDetailLink = UIImage(named: "ic_bookdetail_link")!
    static let bookDetailPlay = UIImage(named: "ic_bookdetail_play")!
    static let bookDetailPlus = UIImage(named: "ic_bookdetail_plus")!
    static let bookDetailStar = UIImage(named: "ic_bookdetail_star")!
    static let homeActive = UIImage(named: "ic_home_active")!
    static let homeInactive = UIImage(named: "ic_home_inactive")!
    static let info = UIImage(named: "ic_info")!
    static let searchActive = UIImage(named: "ic_search_active")!
    static let searchInactive = UIImage(named: "ic_search_inactive")!
    static let shareRound = UIImage(named: "ic_share-round")!
    static let shelfActive = UIImage(named: "ic_shelf_active")!
    static let shelfInactive = UIImage(named: "ic_shelf_inactive")!
    static let settingActive = UIImage(named: "ic_setting_active")!
    static let settingInactive = UIImage(named: "ic_setting_inactive")!
    static let logo = UIImage(named: "logo")!
    static let play = UIImage(named: "play")!.preparingThumbnail(of: CGSize(width: 150, height: 30))!
    static let homeAdsLarge = UIImage(named: "home_ad_large")!
    static let homeAdsSmall = UIImage(named: "home_ad_small")!
    static let homeAdsFooter = UIImage(named: "home_ad_footer")!
    static let homePagerTabAudioBookPart = UIImage(named: "home_pagerTab_audioBookPart")
    static let homePagerTabWebNovelPart = UIImage(named: "home_pagerTab_webNovelPart")
    static let homePagerTabClassPart = UIImage(named: "home_pagerTab_classPart")
    // Home
    
    // Search
    static let audioAds = UIImage(named: "audio_ads")!.preparingThumbnail(of: CGSize(width: 100, height: 30))!
    static let indicator = UIImage(named: "indicator")!
    static let bookImage = UIImage(named: "bookImage")!
    static let searchRank = UIImage(named: "searchRank")!
    
    // Shelf
    
    // Setting
}
