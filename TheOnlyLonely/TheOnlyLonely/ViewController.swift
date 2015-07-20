//
//  ViewController.swift
//  TheOnlyLonely
//
//  Created by yangyi on 15/7/13.
//  Copyright (c) 2015年 yangyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, MAMapViewDelegate, AMapSearchDelegate{
    
    var mapView: MAMapView?
    var search: AMapSearchAPI?
    var currentLocation:CLLocation?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         
        initMapView()
        initSearch()
        ZhengGeocoding()
    }
    
    func initMapView() {
        
        mapView = MAMapView(frame: self.view.bounds)
        
        mapView!.delegate = self
        
        self.view.addSubview(mapView!)
        
        let compassX = mapView?.compassOrigin.x
        
        let scaleX = mapView?.scaleOrigin.x
        
        //设置指南针和比例尺的位置
        mapView?.compassOrigin = CGPointMake(compassX!, 21)
        
        mapView?.scaleOrigin = CGPointMake(scaleX!, 21)
        
        // 开启定位
        mapView!.showsUserLocation = true
        
        // 设置跟随定位模式，将定位点设置成地图中心点
        mapView!.userTrackingMode = MAUserTrackingModeFollow
        mapView!.setZoomLevel(15.1, animated: true)
    }
    
    func initSearch() {
        search = AMapSearchAPI(searchKey: APIKey, delegate: self)
    }
    
  
    func ZhengGeocoding(){
        let regeoo: AMapGeocodeSearchRequest = AMapGeocodeSearchRequest()
//        regeoo.searchType = AMapSearchType_Geocode
        regeoo.address = "北京天安门"
        self.search!.AMapGeocodeSearch(regeoo)
    }
    
    func onGeocodeSearchDone(request: AMapGeocodeSearchRequest!, response: AMapGeocodeSearchResponse!) {
        
        println("田安")
    }
    
    // 逆地理编码
    func reverseGeocoding(){
        
        let coordinate = currentLocation?.coordinate
        
        // 构造 AMapReGeocodeSearchRequest 对象，配置查询参数（中心点坐标）
        let regeo: AMapReGeocodeSearchRequest = AMapReGeocodeSearchRequest()
        
        regeo.location = AMapGeoPoint.locationWithLatitude(CGFloat(coordinate!.latitude), longitude: CGFloat(coordinate!.longitude))
        
        println("regeo :\(regeo)")
        
        // 进行逆地理编码查询
        self.search!.AMapReGoecodeSearch(regeo)
        
    }
    
    // 定位回调
    func mapView(mapView: MAMapView!, didUpdateUserLocation userLocation: MAUserLocation!, updatingLocation: Bool) {
        if updatingLocation {
            currentLocation = userLocation.location
        }
    }
    // 点击Annoation回调
    func mapView(mapView: MAMapView!, didSelectAnnotationView view: MAAnnotationView!) {
        // 若点击的是定位标注，则执行逆地理编码
        if view.annotation.isKindOfClass(MAUserLocation){
            reverseGeocoding()
        }
    }
    
    // 逆地理编码回调
    func onReGeocodeSearchDone(request: AMapReGeocodeSearchRequest!, response: AMapReGeocodeSearchResponse!) {
        println("request :\(request)")
        println("response :\(response)")
        
        if (response.regeocode != nil) {
            
            var title = response.regeocode.addressComponent.city
            
            var length: Int{
                return count(title)
            }
            
            if (length == 0){
                title = response.regeocode.addressComponent.province
            }
            //给定位标注的title和subtitle赋值，在气泡中显示定位点的地址信息
            mapView?.userLocation.title = title
            mapView?.userLocation.subtitle = response.regeocode.formattedAddress
        }
        
    }
    
}


