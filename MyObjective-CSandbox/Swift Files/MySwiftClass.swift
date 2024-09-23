//
//  MySwiftClass.swift
//  MyObjective-CSandbox
//
//  Created by iodevblue on 23-09-2024.
//

import Foundation

@objc class MySwiftClass: NSObject {
	@objc var name: String

	@objc init(name: String) {
		self.name = name
	}

	@objc func greet() {
		print("Hello, \(name)!")
	}
}

