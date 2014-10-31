//
//  Order.swift
//  SMART-on-FHIR
//
//  Generated from FHIR 0.0.82.2943 (order.profile.json) on 2014-10-30.
//  2014, SMART Platforms.
//

import Foundation


/**
 *  A request to perform an action.
 *
 *  Scope and Usage An order resource describes a request that an action be performed. An order is expected to lead to
 *  one or more responses that describe the outcome of processing/handling the order. The order resource is focused on
 *  the process of actually requesting an action be performed; the actual action to be performed is detailed in a
 *  separate resource that contains the details. Note that orders are often called "requests", but this name is not used
 *  here since the word "request" is used differently elsewhere in this specification.
 *  
 *  Note that there are a variety of processes associated with making and processing orders. Some orders may be handled
 *  immediately by automated systems but most require real world actions by one or more humans. Some orders can only be
 *  processed when other real world actions happen, such as a patient actually presenting themselves so that the action
 *  to be performed can actually be performed. Often these real world dependencies are only implicit in the order
 *  details.
 */
public class Order: FHIRResource
{
	override public class var resourceName: String {
		get { return "Order" }
	}
	
	/// If required by policy
	public var authority: FHIRReference<FHIRResource>?
	
	/// When the order was made
	public var date: NSDate?
	
	/// What action is being ordered
	public var detail: [FHIRReference<FHIRResource>]?
	
	/// Identifiers assigned to this order by the orderer or by the receiver
	public var identifier: [Identifier]?
	
	/// Text - why the order was made
	public var reasonCodeableConcept: CodeableConcept?
	
	/// Text - why the order was made
	public var reasonResource: FHIRReference<FHIRResource>?
	
	/// Who initiated the order
	public var source: FHIRReference<Practitioner>?
	
	/// Patient this order is about
	public var subject: FHIRReference<Patient>?
	
	/// Who is intended to fulfill the order
	public var target: FHIRReference<Organization>?
	
	/// Text summary of the resource, for human interpretation
	public var text: Narrative?
	
	/// When order should be fulfilled
	public var when: OrderWhen?
	
	public convenience init(detail: [FHIRReference<FHIRResource>]?) {
		self.init(json: nil)
		if nil != detail {
			self.detail = detail
		}
	}	

	public required init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["authority"] as? NSDictionary {
				self.authority = FHIRReference(json: val, owner: self)
			}
			if let val = js["date"] as? String {
				self.date = NSDate(json: val)
			}
			if let val = js["detail"] as? [NSDictionary] {
				self.detail = FHIRReference.from(val, owner: self)
			}
			if let val = js["identifier"] as? [NSDictionary] {
				self.identifier = Identifier.from(val) as? [Identifier]
			}
			if let val = js["reasonCodeableConcept"] as? NSDictionary {
				self.reasonCodeableConcept = CodeableConcept(json: val)
			}
			if let val = js["reasonResource"] as? NSDictionary {
				self.reasonResource = FHIRReference(json: val, owner: self)
			}
			if let val = js["source"] as? NSDictionary {
				self.source = FHIRReference(json: val, owner: self)
			}
			if let val = js["subject"] as? NSDictionary {
				self.subject = FHIRReference(json: val, owner: self)
			}
			if let val = js["target"] as? NSDictionary {
				self.target = FHIRReference(json: val, owner: self)
			}
			if let val = js["text"] as? NSDictionary {
				self.text = Narrative(json: val)
			}
			if let val = js["when"] as? NSDictionary {
				self.when = OrderWhen(json: val)
			}
		}
	}
}


/**
 *  When order should be fulfilled.
 */
public class OrderWhen: FHIRElement
{	
	/// Code specifies when request should be done. The code may simply be a priority code
	public var code: CodeableConcept?
	
	/// A formal schedule
	public var schedule: Schedule?
	

	public required init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["code"] as? NSDictionary {
				self.code = CodeableConcept(json: val)
			}
			if let val = js["schedule"] as? NSDictionary {
				self.schedule = Schedule(json: val)
			}
		}
	}
}

