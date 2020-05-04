//
//  HashMapKataTests.swift
//  HashMapKataTests
//
//  Created by mugx on 03/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import HashMapKata

class HashMapKataTests: XCTestCase {

    class HashMap<K: Hashable, V> {
        typealias Element = (key: K, value: V)
        typealias Bucket = [Element]
        var buckets: [Bucket] = []
        var count: Int = 0

        init(with capacity: Int = 10) {
            self.buckets = [Bucket](repeating: [], count: capacity)
        }

        subscript(_ key: K) -> V? {
            get {
                buckets[index(for: key)].first?.value
            }

            set {
                guard let value = newValue else {
                    return
                }

                let i = index(for: key)
                if let foundIndex = buckets[i].firstIndex(where: { $0.key == key }) {
                    buckets[i][foundIndex] = (key, value)
                } else {
                    buckets[i].append((key, value))
                    count += 1
                }
            }
        }

        public func remove(_ key: K) -> V? {
            let i = index(for: key)
            if let foundIndex = buckets[i].firstIndex(where: { $0.key == key }) {
                let removedValue = buckets[i].remove(at: foundIndex).value
                count -= 1
                return removedValue
            } else {
                return nil
            }
        }

        public func value(for key: K) -> V? {
            let i = index(for: key)
            let bucket = buckets[i]
            return bucket.first { $0.key == key }?.value
        }

        private func index(for key: K) -> Int {
            return abs(key.hashValue) % buckets.count
        }
    }

    func testCount0() {
        let map = HashMap<String, String>()
        XCTAssertEqual(map.count, 0)
    }

    func testCountNot0() {
        let map = HashMap<String, String>()
        map["address"] = "my address"
        XCTAssertEqual(map["address"], "my address")
        XCTAssertEqual(map.count, 1)
    }

    func testValue() throws {
        let map = HashMap<String, String>()
        map["address"] = "my address"
        XCTAssertEqual(map.value(for: "address"), "my address")
    }

    func testSingleInsert() throws {
        let map = HashMap<String, String>()
        map["address"] = "my address"
        XCTAssertEqual(map["address"], "my address")
        XCTAssertEqual(map.count, 1)
    }

    func testMultipleInsertNoCollision() throws {
        let map = HashMap<String, String>()
        map["address"] = "my address"
        map["address2"] = "my address2"
        XCTAssertEqual(map["address"], "my address")
        XCTAssertEqual(map["address2"], "my address2")
        XCTAssertEqual(map.count, 2)
    }

    func testMultipleInsertWithCollision() throws {
        let map = HashMap<String, String>()
        map["address"] = "my address"
        map["address"] = "my address2"
        XCTAssertEqual(map["address"], "my address2")
        XCTAssertEqual(map.count, 1)
    }

    func testRemoveNotExistingKey() {
        let map = HashMap<String, String>()
        map["address"] = "my address"
        let result = map.remove("address2")
        XCTAssertNil(result)
        XCTAssertEqual(map.count, 1)
    }

    func testRemoveExistingKey() {
        let map = HashMap<String, String>()
        map["address"] = "my address"
        map["address2"] = "my address2"
        let result = map.remove("address2")
        XCTAssertEqual(result, "my address2")
        XCTAssertEqual(map.count, 1)
    }
}
