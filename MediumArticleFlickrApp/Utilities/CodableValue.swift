//
//  CodableValue.swift
//  MyFlickrFavorites
//
//  Created by Jody Abney on 9/11/20.
//
// Allows for more flexible coding/decoding of JSON data where an API returns mixed data types for some elements
//

import Foundation

// MARK: LosslessStringCodable
public typealias LosslessStringCodable = LosslessStringConvertible & Codable

// MARK: DynamicDecoder
public struct DynamicCoder<T: LosslessStringCodable> {
    public static func decode(from decoder: Decoder) throws -> T? {
        do {
            return try T(from: decoder)
        } catch {
            // Handle different types for the same key error
            func decode<T: LosslessStringCodable>(_: T.Type) -> (Decoder) -> LosslessStringCodable? {
                return { try? T.init(from: $0) }
            }
            let types: [(Decoder) -> LosslessStringCodable?] = [
                decode(String.self),
                decode(Bool.self),
                decode(Int.self),
                decode(Double.self)
            ]

            guard let rawValue = types.lazy.compactMap({ $0(decoder) }).first,
                let value = T.init("\(rawValue)") else {
                    return nil
            }

            return value
        }
    }
}

// MARK: CodableValue
@propertyWrapper
public struct CodableValue<T: LosslessStringCodable>: Codable {
    public let wrappedValue: T

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }

    public init(from decoder: Decoder) throws {
        let value: T = try DynamicCoder.decode(from: decoder)!
        self.init(wrappedValue: value)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue)
    }
}

