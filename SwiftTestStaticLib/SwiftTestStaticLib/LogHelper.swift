//
//  LogHelper.swift
//  iOS_FS_Commons
//
//  Created by Ashish Awasthi on 02/04/2019.
//  Copyright © 2019 Ashish Awasthi. All rights reserved.
//

import Foundation

public func pretty_print(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
	FSLogInfo(message, file: file, function: function, line: line)
}

public func pretty_print_error(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
	FSLogError(message, file: file, function: function, line: line)
}

fileprivate class FSLoggerDate {
	static var dateFormatter: DateFormatter?

	class func dateNow() -> String {
		if FSLoggerDate.dateFormatter == nil {
			FSLoggerDate.dateFormatter = DateFormatter()
#if DEBUG
			FSLoggerDate.dateFormatter!.dateFormat = "HH:mm:ss.SSS"
#else
			FSLoggerDate.dateFormatter!.dateFormat = "yyyy-MM-dd HH:mm:ss"
#endif
		}
		return FSLoggerDate.dateFormatter!.string(from: Date())
	}
}

#if DEBUG
public func FSLogDebug(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    let f = (file as NSString).lastPathComponent
	let d = FSLoggerDate.dateNow()
    print("\(d) 📘 \(f) \(function) \(message)")
}
#endif

public func FSLogInfo(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
	let f = (file as NSString).lastPathComponent
	let d = FSLoggerDate.dateNow()
#if DEBUG
	print("\(d) 📒 \(f) \(function) \(message)")
#else
	print("\(d) INFO \(f) \(function) \(message)")
#endif
}

public func FSLogWarning(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
	let f = (file as NSString).lastPathComponent
	let d = FSLoggerDate.dateNow()
#if DEBUG
	print("\(d) 📙 \(f) \(function) \(message)")
#else
	print("\(d) WARNING \(f) \(function) \(message)")
#endif
}

public func FSLogError(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
	let f = (file as NSString).lastPathComponent
	let d = FSLoggerDate.dateNow()
#if DEBUG
	print("\(d) 📕 \(f) \(function) \(message)")
#else
	print("\(d) ERROR \(f) \(function) \(message)")
#endif
}
