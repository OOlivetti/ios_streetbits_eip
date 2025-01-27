//
//  AnnotationView.swift
//  CustomCalloutView
//
//  Created by Malek Trabelsi on 12/17/17.
//  Copyright © 2017 Medigarage Studios LTD. All rights reserved.
//

import MapKit

class AnnotationView: MKAnnotationView
{
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        if (hitView != nil)
        {
            self.superview?.bringSubview(toFront: self)
        }
        return hitView
    }
	
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = self.bounds
        var isInside: Bool = rect.contains(point)
        if(!isInside)
        {
            for view in self.subviews
            {
                isInside = view.frame.contains(point)
                if isInside
                {
                    break
                }
            }
        }
        return isInside
    }
}

class CustomAnnotation: NSObject, MKAnnotation {
	
	var coordinate: CLLocationCoordinate2D
	var name: String!
	var image: UIImage!
	
	var ID: String!
	var image_link: String!
	
	init(coordinate: CLLocationCoordinate2D) {
		self.coordinate = coordinate
	}
}

