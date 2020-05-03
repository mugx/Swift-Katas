//
//  LinkedListKataTests.swift
//  LinkedListKataTests
//
//  Created by mugx on 03/05/2020.
//  Copyright © 2020 mugx. All rights reserved.
//

import XCTest
@testable import LinkedListKata

class LinkedListKataTests: XCTestCase {
    class Node <T: Equatable>: Equatable {
        static func == (lhs: Node, rhs: Node) -> Bool {
            lhs.value == rhs.value && lhs.next == rhs.next
        }

        var next: Node<T>? = nil
        let value: T

        init(value: T) {
            self.value = value
        }
    }

    class List<T: Equatable>: Equatable {
        static func == (lhs: List, rhs: List) -> Bool {
            lhs.head == rhs.head
        }

        var head: Node<T>? = nil
        var count: Int = 0

        func add(_ node: Node<T>) {
            if head == nil {
                head = node
            } else {
                var current = head
                while current?.next != nil {
                    current = current?.next
                }
                current?.next = node
            }

            count += 1
        }

        func remove(at index: Int) -> Node<T>? {
            guard index >= 0, index < count else {
                return nil
            }

            var i = 0
            var current = head
            var previous = head
            while current?.next != nil {
                if i == index {
                    previous?.next = current?.next
                    count -= 1
                    return current
                }

                previous = current
                current = current?.next
                i += 1
            }

            return nil
        }

        func removeAll() {
            head = nil
            count = 0
        }
    }

    func testEquatable() throws {
        let list1 = List<String>()
        let list2 = List<String>()
        XCTAssertEqual(list1, list2)
    }

    func testNotEqualSingleNode() throws {
        let list1 = List<String>()
        let list2 = List<String>()
        list1.add(Node(value: "a"))
        XCTAssertNotEqual(list1, list2)
    }

    func testEqualSingleNode() throws {
        let list1 = List<String>()
        let list2 = List<String>()
        list1.add(Node(value: "a"))
        list2.add(Node(value: "a"))
        XCTAssertEqual(list1, list2)
    }

    func testNotEqualMultiNodes() throws {
        let list1 = List<String>()
        let list2 = List<String>()
        list1.add(Node(value: "a"))
        list2.add(Node(value: "a"))
        list2.add(Node(value: "b"))
        XCTAssertNotEqual(list1, list2)
    }

    func testEqualMultiNodes() throws {
        let list1 = List<String>()
        let list2 = List<String>()
        list1.add(Node(value: "a"))
        list1.add(Node(value: "b"))
        list1.add(Node(value: "b"))
        list1.add(Node(value: "b"))
        list2.add(Node(value: "a"))
        list2.add(Node(value: "b"))
        list2.add(Node(value: "b"))
        list2.add(Node(value: "b"))
        XCTAssertEqual(list1, list2)
    }

    func testRemoveByNegativeIndex() {
        let list1 = List<String>()
        list1.add(Node(value: "a"))
        list1.add(Node(value: "b"))
        let result = list1.remove(at: -1)?.value
        XCTAssertNil(result)
        XCTAssertEqual(list1.count, 2)
    }

    func testRemoveByNotExistentIndex() {
        let list1 = List<String>()
        list1.add(Node(value: "a"))
        list1.add(Node(value: "b"))
        let result = list1.remove(at: 10)?.value
        XCTAssertNil(result)
        XCTAssertEqual(list1.count, 2)
    }

    func testRemoveByValidIndex() {
        let list1 = List<String>()
        list1.add(Node(value: "a"))
        list1.add(Node(value: "b"))
        let result = list1.remove(at: 0)?.value
        let expectResult = Node(value: "a").value
        XCTAssertEqual(result, expectResult)
        XCTAssertEqual(list1.count, 1)
    }

    func testRemoveAll() {
        let list1 = List<String>()
        list1.add(Node(value: "a"))
        list1.add(Node(value: "b"))
        list1.removeAll()
        XCTAssertEqual(list1, List<String>())
    }
}
