//
//  ViewController.m
//  FourPaneDemo
//
//  Created by Ricardo Maduro on 17/01/16.
//  Copyright © 2016 Ricardo Maduro. All rights reserved.
//

#import "MapKit/MapKit.h"
#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapview;
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *webURL = @"https://www.facebook.com/Past%C3%A9is-de-Bel%C3%A9m-P%C3%A1gina-Oficial-259064930776155/";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    
    [self.webview loadRequest:request];
    
    //center the map
    double latitude = 38.6991238; //34.448795;
    double longitude = -9.2014899; //-119.6646337;
    
    MKPointAnnotation *wiclAnno = [[MKPointAnnotation alloc] init];
    wiclAnno.coordinate = CLLocationCoordinate2DMake(latitude,longitude);
    wiclAnno.title = @"Pasteis de Belem - Lisbon Portugal";
    
    [self.mapview addAnnotation:wiclAnno];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(wiclAnno.coordinate, 10000, 10000);
    MKCoordinateRegion adjusted = [self.mapview regionThatFits:region];
    [self.mapview setRegion:adjusted animated:YES];
    
    
}


@end
